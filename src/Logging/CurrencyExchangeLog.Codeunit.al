codeunit 50102 "Demo Currency Exchange Log"
{
    procedure Log(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal)
    var
        ExchangeLog: Record "Demo Currency Exchange Log";
    begin
        ExchangeLog."Date and Time" := CurrentDateTime;
        ExchangeLog."User ID" := UserID;
        ExchangeLog."From Currency Code" := FromCurrencyCode;
        ExchangeLog."To Currency Code" := ToCurrencyCode;
        ExchangeLog."From Amount" := FromAmount;
        ExchangeLog."To Amount" := ToAmount;
        ExchangeLog.Insert();
    end;
}
