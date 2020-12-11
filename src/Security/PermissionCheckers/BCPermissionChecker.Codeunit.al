codeunit 50101 "Demo BC Permission Checker" implements "Demo IPermissionChecker"
{
    procedure CanConvert(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Boolean
    var
        Permission: Record "Demo Currency Exch. Permission";
    begin
        Permission.SetRange("User ID", UserID);
        Permission.SetFilter("From Currency Code", '%1|%2', '', FromCurrencyCode);
        Permission.SetFilter("To Currency Code", '%1|%2', '', ToCurrencyCode);

        // No permission defined means Deny
        if not Permission.FindSet(false) then
            exit(false);

        // Explicit Deny is stronger than any explicit Allow
        repeat
            if Permission.Permission = Permission.Permission::Deny then
                exit(false);
        until Permission.Next() = 0;

        // No explicit Deny means that only Allow permissions exist
        exit(true);
    end;
}
