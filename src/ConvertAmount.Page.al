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
        DependencyFactory: Codeunit "Demo Dependency Factory";
        Converter: Interface "Demo IConverter";
        PermissionChecker: Interface "Demo IPermissionChecker";
        Logger: Interface "Demo ILogger";
    begin
        if (FromCurrencyCode = '') or (ToCurrencyCode = '') then begin
            ToAmount := 0;
            exit;
        end;

        DependencyFactory.CreateConverter(Converter);
        DependencyFactory.CreatePermissionChecker(PermissionChecker);
        DependencyFactory.CreateLogger(Logger);

        ToAmount := ExchRateMgt.Convert(FromAmount, FromCurrencyCode, ToCurrencyCode, Converter, PermissionChecker, Logger);
        CurrPage.Update(false);
    end;
}
