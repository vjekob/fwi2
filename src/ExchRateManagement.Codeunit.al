codeunit 50100 "Demo Exchange Rate Management"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; Converter: Interface "Demo IConverter"; PermissionChecker: Interface "Demo IPermissionChecker"; Logger: Interface "Demo ILogger") Result: Decimal
    var
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';
    begin
        if not PermissionChecker.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);
        Result := Converter.Convert(Amount, FromCurrencyCode, ToCurrencyCode);
        Logger.Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;
}
