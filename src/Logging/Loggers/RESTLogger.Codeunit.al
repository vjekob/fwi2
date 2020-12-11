codeunit 50105 "Demo REST Logger" implements "Demo ILogger"
{
    procedure Log(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal)
    begin
        // Here be dragons
    end;
}
