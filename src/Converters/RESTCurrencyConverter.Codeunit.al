codeunit 50104 "Demo REST Currency Converter" implements "Demo IConverter"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Decimal
    var
        Response: HttpResponseMessage;
        Url: Label 'https://api.apilayer.com/exchangerates_data/latest?base=%1&symbols=%2', Locked = true;
        Content: JsonObject;
        Token: JsonToken;
        Body: Text;
    begin
        if (FromCurrencyCode = '') or (ToCurrencyCode = '') then
            exit(Amount);

        SendRequest(StrSubstNo(Url, FromCurrencyCode, ToCurrencyCode), Response);
        Response.Content.ReadAs(Body);
        Content.ReadFrom(Body);

        if not Response.IsSuccessStatusCode then begin
            Content.Get('error', Token);
            Error('%2 (%1)', Response.HttpStatusCode, Token.AsValue().AsText());
        end;

        Content.SelectToken(StrSubstNo('rates.%1', ToCurrencyCode), Token);
        exit(Amount * Token.AsValue().AsDecimal());
    end;

    local procedure SendRequest(Url: Text; var Response: HttpResponseMessage)
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Headers: HttpHeaders;
        MyApiKey: Label 'a1NGBy0hU2BhXHvHMVh7CCKUN8n1B4rb';
    begin
        Request.SetRequestUri(Url);
        Request.Method := 'get';
        Request.GetHeaders(Headers);
        Headers.Add('apikey', MyApiKey);

        Client.Send(Request, Response);
    end;
}
