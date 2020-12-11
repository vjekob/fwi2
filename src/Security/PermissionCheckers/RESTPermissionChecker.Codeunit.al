codeunit 50106 "Demo REST Permission Checker" implements "Demo IPermissionChecker"
{
    procedure CanConvert(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Boolean
    begin
        // Here be dragons
        exit(true);
    end;
}
