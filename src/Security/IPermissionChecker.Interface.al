interface "Demo IPermissionChecker"
{
    procedure CanConvert(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]): Boolean;
}
