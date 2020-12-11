codeunit 50100 "Demo Exchange Rate Management"
{
    procedure ConvertBySetup(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
    var
        ExchRate: Record "Currency Exchange Rate";
    begin
        CheckPermission(UserId, FromCurrencyCode, ToCurrencyCode);
        Result := ExchRate.ExchangeAmtFCYToFCY(WorkDate(), FromCurrencyCode, ToCurrencyCode, Amount);
        Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;

    procedure ConvertByREST(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Url: Label 'https://api.exchangeratesapi.io/latest?base=%1&symbols=%2', Locked = true;
        Content: JsonObject;
        Token: JsonToken;
        Body: Text;
    begin
        CheckPermission(UserId, FromCurrencyCode, ToCurrencyCode);

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
        Result := Amount * Token.AsValue().AsDecimal();

        Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;

    local procedure CheckPermission(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10])
    var
        Permission: Codeunit "Demo Curr. Exch. Permiss. Mgt.";
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';
    begin
        if not Permission.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);
    end;

    local procedure Log(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal)
    var
        Log: Codeunit "Demo Currency Exchange Log";
    begin
        Log.Log(UserId, FromCurrencyCode, ToCurrencyCode, FromAmount, ToAmount);
    end;
}
