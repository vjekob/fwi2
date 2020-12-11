interface "Demo IConverter"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Decimal;
}
