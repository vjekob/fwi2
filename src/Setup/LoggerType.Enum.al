enum 50102 "Demo Logger Type" implements "Demo ILogger"
{
    Extensible = true;

    value(0; BC)
    {
        Caption = 'BC Logger';
        Implementation = "Demo ILogger" = "Demo BC Logger";
    }

    value(1; REST)
    {
        Caption = 'REST Logger';
        Implementation = "Demo ILogger" = "Demo REST Logger";
    }
}
