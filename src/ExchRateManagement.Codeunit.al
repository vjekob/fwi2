codeunit 50100 "Demo Exchange Rate Management"
{
    var
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';

    procedure ConvertBySetup(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
    var
        ExchRate: Record "Currency Exchange Rate";
        Permission: Codeunit "Demo Curr. Exch. Permiss. Mgt.";
        Log: Codeunit "Demo Currency Exchange Log";
    begin
        if not Permission.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);

        Result := ExchRate.ExchangeAmtFCYToFCY(WorkDate(), FromCurrencyCode, ToCurrencyCode, Amount);

        Log.Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;

    procedure ConvertByREST(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Url: Label 'https://api.exchangeratesapi.io/latest?base=%1&symbols=%2', Locked = true;
        Content: JsonObject;
        Token: JsonToken;
        Body: Text;
        Permission: Codeunit "Demo Curr. Exch. Permiss. Mgt.";
        Log: Codeunit "Demo Currency Exchange Log";
    begin
        if not Permission.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);

        if (FromCurrencyCode = '') or (ToCurrencyCode = '') then
            exit(Amount);

        Client.Get(StrSubstNo(Url, FromCurrencyCode, ToCurrencyCode), Response);
        Response.Content.ReadAs(Body);
        Content.ReadFrom(Body);

        if not Response.IsSuccessStatusCode then begin
            Content.Get('error', Token);
            Error('%2 (%1)', Response.HttpStatusCode, Token.AsValue().AsText());
        end;

        Content.SelectToken(StrSubstNo('rates.%1', ToCurrencyCode), Token);
        Result := Token.AsValue().AsDecimal();

        Log.Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;
}
