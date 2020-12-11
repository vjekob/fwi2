enum 50103 "Demo Permission Checker Type" implements "Demo IPermissionChecker"
{
    Extensible = false;

    value(0; BC)
    {
        Caption = 'BC Permission Checker';
        Implementation = "Demo IPermissionChecker" = "Demo BC Permission Checker";
    }

    value(1; REST)
    {
        Caption = 'REST Permission Checker';
        Implementation = "Demo IPermissionChecker" = "Demo REST Permission Checker";
    }
}
