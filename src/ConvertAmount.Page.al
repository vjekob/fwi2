page 50102 "Demo Convert Amount"
{
    Caption = 'Convert Amount';
    PageType = StandardDialog;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(FromCurrency)
            {
                Caption = 'Convert from...';

                field(FromAmount; FromAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';

                    trigger OnValidate()
                    begin
                        ConvertAmount();
                    end;
                }

                field(FromCurrencyCode; FromCurrencyCode)
                {
                    ApplicationArea = All;
                    Caption = 'Currency Code';
                    TableRelation = Currency;

                    trigger OnValidate()
                    begin
                        ConvertAmount();
                    end;
                }
            }

            group(ToCurrency)
            {
                field(ToAmount; ToAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    Editable = false;
                }

                field(ToCurrencyCode; ToCurrencyCode)
                {
                    ApplicationArea = All;
                    Caption = 'Currency Code';
                    TableRelation = Currency;

                    trigger OnValidate()
                    begin
                        ConvertAmount();
                    end;
                }
            }
        }
    }

    var
        FromCurrencyCode: Code[10];
        ToCurrencyCode: Code[10];
        FromAmount: Decimal;
        ToAmount: Decimal;

    local procedure ConvertAmount()
    var
        ExchRateMgt: Codeunit "Demo Exchange Rate Management";
    begin
        if (FromCurrencyCode = '') or (ToCurrencyCode = '') then begin
            ToAmount := 0;
            exit;
        end;

        ToAmount := ExchRateMgt.Convert(FromAmount, FromCurrencyCode, ToCurrencyCode);
        CurrPage.Update(false);
    end;
}
