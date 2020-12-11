codeunit 50100 "Exchange Rate Management"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Decimal
    var
        ExchRate: Record "Currency Exchange Rate";
    begin
        ExchRate.ExchangeAmtFCYToFCY(WorkDate(), FromCurrencyCode, ToCurrencyCode, Amount);
    end;
}
