codeunit 50102 "Demo REST Currency Converter" implements "Demo IConverter"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Decimal
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Url: Label 'https://api.exchangeratesapi.io/latest?base=%1&symbols=%2', Locked = true;
        Content: JsonObject;
        Token: JsonToken;
        Body: Text;
    begin
        // For simplicity purpose, igoring that '' means LCY
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
        exit(Token.AsValue().AsDecimal());
    end;
}
