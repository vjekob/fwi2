codeunit 50101 "Demo BC Currency Converter" implements "Demo IConverter"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Decimal
    var
        ExchRate: Record "Currency Exchange Rate";
    begin
        exit(ExchRate.ExchangeAmtFCYToFCY(WorkDate(), FromCurrencyCode, ToCurrencyCode, Amount));
    end;
}
