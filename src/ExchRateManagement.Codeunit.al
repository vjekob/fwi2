codeunit 50100 "Exchange Rate Management"
{
    var
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';

    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
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
}
