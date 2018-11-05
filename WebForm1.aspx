<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="validation_exercise.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div id="username">
            <asp:TextBox ID="ID" runat="server" placeholder="Enter ID" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ID" ErrorMessage="Must enter an ID" ValidationGroup="register" EnableClientScript="False" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="ID" OnServerValidate="CustomValidator3_ServerValidate" ErrorMessage="Id must be 9 numbers" Display="Dynamic" ValidationGroup="register" EnableClientScript="False">*</asp:CustomValidator>
            <br /> <br />
        <asp:TextBox ID="user" runat="server" placeholder="Enter username"  ></asp:TextBox>

               <asp:RequiredFieldValidator ID="Username"
            runat="server"  ErrorMessage="Enter a username" 
              ControlToValidate="user" EnableClientScript="False" 
            ValidationGroup="register">*</asp:RequiredFieldValidator>

           

        </div>

     
        
       <br /> 
            <asp:TextBox ID="firstname" placeholder="First name" runat="server"></asp:TextBox>
            
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Enter Your First Name" ControlToValidate="firstname" EnableClientScript="False" ValidationGroup="register" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="firstname" OnServerValidate="CustomValidator2_ServerValidate" runat="server" 
                ErrorMessage="First name must contain only alphabetical letters" ValidationGroup="register" EnableClientScript="False" Display="Dynamic">*</asp:CustomValidator>
            <br /><br />
            <asp:TextBox ID="lastname" placeholder="Last name" runat="server"></asp:TextBox>
        
        
            
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lastname" EnableClientScript="False" ErrorMessage="Enter Your Last Name" ValidationGroup="register">*</asp:RequiredFieldValidator>
        
        
            
       
        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="lastname"
            runat="server"  OnServerValidate="CustomValidator1_ServerValidate1"
            ErrorMessage="Last name must contain only alphabetical letters" Display="Dynamic" EnableClientScript="False" ValidationGroup="register">*</asp:CustomValidator>
        
        
            
       
        <p>
        
        
            <asp:TextBox ID="password" TextMode="Password"
                runat="server" placeholder="Enter Password"  ></asp:TextBox>

            <asp:TextBox ID="confirmPassword" TextMode="Password"
                runat="server" placeholder="Confirm Password" style="margin-bottom: 17px" Height="22px" Width="257px"></asp:TextBox>

            
            


            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToValidate="confirmPassword" Type="String" Operator="Equal"  ControlToCompare="password"
                ErrorMessage="Passwords didn't match" EnableClientScript="false"
                ValidationGroup="register" Display="Dynamic">*</asp:CompareValidator>

            
            


             <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            runat="server"  ErrorMessage="Enter A Password" 
              ControlToValidate="password" text="*" EnableClientScript="False"
                 ValidationGroup="register" Display="Dynamic">*</asp:RequiredFieldValidator>

            
            


        </p>
        <p>
        
        
             <asp:TextBox ID="Email" placeholder="Enter an email adress" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ErrorMessage="Must enter a valid email" EnableClientScript="False" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="register" ControlToValidate="Email" Display="Dynamic">*</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Must enter an email" ValidationGroup="register" ControlToValidate="Email" EnableClientScript="False"></asp:RequiredFieldValidator>
        </p>
        <p>


        <asp:TextBox ID="Birthday" runat="server" placeholder="Enter Birthdate" TextMode="Date" ></asp:TextBox> 

       


             <asp:RequiredFieldValidator ID="Birth"
            runat="server"  ErrorMessage="Enter A Birthday" 
              ControlToValidate="Birthday" EnableClientScript="False"
                 ValidationGroup="register" Display="Dynamic">*</asp:RequiredFieldValidator>

            
            


        </p>
      
        <asp:Button ID="Button2" runat="server" Text="clear" OnClick="Button2_Click" />
             

        <asp:Button ID="Button1" runat="server" Text="Click To Validate" ValidationGroup="register" OnClick="Button1_Click" />
             
            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="register" runat="server" Height="95px" style="margin-left: 5px" />


        


        <asp:Label ID="Label1" runat="server" ></asp:Label>

        <asp:Button ID="Button3" runat="server" Text="Button3theking" OnClick="Button3_Click" CausesValidation="False" />
        


    </form>
</body>
</html>
