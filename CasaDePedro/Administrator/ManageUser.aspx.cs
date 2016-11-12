using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Administrator
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUsers();
                allRoles();
            }
        }

        protected void GetUsers()
        {
            ddlDelUser.DataSource = Membership.GetAllUsers();
            ddlDelUser.DataBind();

            DropDownList1.DataSource = Membership.GetAllUsers();
            DropDownList1.DataBind();
            
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    //Create User
                    Membership.CreateUser(tbxUserName.Text, tbxPassword.Text, tbxEmail.Text);
                    lblFeedback.Text += "Successfully created user " + tbxUserName.Text + "</br>";

                    //Give Role
                    Roles.AddUserToRole(tbxUserName.Text, ddlRoles.SelectedItem.ToString());
                    lblFeedback.Text += "Successfully added user to " + ddlRoles.SelectedItem.ToString() + " Role";

                    //Update user list
                    GetUsers();
                }
                catch (MembershipCreateUserException ex)
                {
                    switch (ex.StatusCode)
                    {
                        case MembershipCreateStatus.DuplicateEmail:
                            lblFeedback.Text = "You have supplied a duplicate email address.";
                            break;
                        case MembershipCreateStatus.DuplicateUserName:
                            lblFeedback.Text = "You have supplied a duplicate User Name.";
                            break;
                        case MembershipCreateStatus.InvalidEmail:
                            lblFeedback.Text = "You have supplied an invalid email address.";
                            break;
                        default:
                            lblFeedback.Text = "Error: " + ex.Message.ToString();
                            break;
                    }
                }
            }
        }

        protected void btnDelUser_Click(object sender, EventArgs e)
        {
            try
            {
                Membership.DeleteUser(ddlDelUser.SelectedItem.ToString());
                GetUsers();
                lblDelUserFeedback.Text = ddlDelUser.SelectedItem.ToString() + " was successfully removed";
            }
            catch
            {
                lblDelUserFeedback.Text = "An error has occured. Reload the page and try deleting user again.";
                lblDelUserFeedback.CssClass = "text-danger";
            }
        }

        protected void btnUsersInRole_Click(object sender, EventArgs e)
        {
            getUsersInRole();
            //allRoles();
        }

        protected void allRoles()
        {
            ddlUserRoles.DataSource = Roles.GetAllRoles();
            ddlUserRoles.DataBind();

            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();

            ListBox2.DataSource = Roles.GetAllRoles();
            ListBox2.DataBind();
        }

        protected void getUsersInRole()
        {
            ListBox1.DataSource = Roles.GetUsersInRole(ddlUserRoles.SelectedValue);
            ListBox1.DataBind();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Roles.IsUserInRole(DropDownList1.SelectedValue, ListBox2.SelectedValue))
                {
                    Roles.AddUserToRole(DropDownList1.SelectedValue, ListBox2.SelectedValue);
                    lblAddRemoveFeedback.Text = "User was successfully added";
                    lblAddRemoveFeedback.CssClass = "text-success";
                }
                else
                {
                    lblAddRemoveFeedback.Text = "User is already in the selected role";
                    lblAddRemoveFeedback.CssClass = "text-danger";
                }
            }
            catch
            {
                lblAddRemoveFeedback.Text = "An error has occurred. Ensure to select a role and try again";
                lblAddRemoveFeedback.CssClass = "text-danger";
            }
        }

        protected void btnRemoveUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (Roles.IsUserInRole(DropDownList1.SelectedValue, ListBox2.SelectedValue))
                {
                    Roles.RemoveUserFromRole(DropDownList1.SelectedValue, ListBox2.SelectedValue);
                    lblAddRemoveFeedback.Text = "User was successfully removed";
                    lblAddRemoveFeedback.CssClass = "text-success";
                }
                else
                {
                    lblAddRemoveFeedback.Text = "User is not in the selected role";
                    lblAddRemoveFeedback.CssClass = "text-danger";
                }
            }
            catch
            {
                lblAddRemoveFeedback.Text = "An error has occurred. Ensure to select a role and try again";
                lblAddRemoveFeedback.CssClass = "text-danger";
            }
        }
    }
}