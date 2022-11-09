codeunit 50100 "Demo Exchange Rate Management"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; Factory: Interface IFactory) Result: Decimal
    var
        Converter: Interface "Demo IConverter";
        PermissionChecker: Interface "Demo IPermissionChecker";
        Logger: Interface "Demo ILogger";
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';
    begin
        Factory.CreateConverter(Converter);
        Factory.CreatePermissionChecker(PermissionChecker);
        Factory.CreateLogger(Logger);

        if not PermissionChecker.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);
        Result := Converter.Convert(Amount, FromCurrencyCode, ToCurrencyCode);
        Logger.Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;
}
