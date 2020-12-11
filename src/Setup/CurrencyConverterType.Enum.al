enum 50101 "Demo Currency Converter Type" implements "Demo IConverter"
{
    Extensible = true;

    value(0; BC)
    {
        Caption = 'BC Converter';
        Implementation = "Demo IConverter" = "Demo BC Currency Converter";
    }

    value(1; REST)
    {
        Caption = 'REST Converter';
        Implementation = "Demo IConverter" = "Demo REST Currency Converter";
    }
}
