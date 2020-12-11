table 50102 "Demo Currency Exchange Setup"
{
    Caption = 'Currency Exchange Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(2; "Currency Converter"; Enum "Demo Currency Converter Type")
        {
            Caption = 'Currency Converter';
            DataClassification = CustomerContent;
        }

        field(3; "Logger"; Enum "Demo Logger Type")
        {
            Caption = 'Logger';
            DataClassification = CustomerContent;
        }

        field(4; "Permission Checker"; Enum "Demo Permission Checker Type")
        {
            Caption = 'Permission Checker';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Primary; "Primary Key") { }
    }
}
