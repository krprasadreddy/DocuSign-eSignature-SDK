<%@ page  session="true" import="net.docusign.sample.Utils" language="java" 
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/jquery.ui.all.css" />
        <link rel="stylesheet" type="text/css" href="css/SendDocument.css" />
        <script type="text/javascript" src="js/jquery-1.4.4.js"></script>
        <script type="text/javascript" src="js/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/Utils.js"></script>        
        <script type="text/javascript">
            function EnableDisableDiv() {
                if ($("#sendoption").attr("checked")) {
                    $("#files").hide();
                    $("#files").disableSelection();
                } else {
                    $("#files").show();
                    $("#files").enableSelection();
                }
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var today = new Date().getDate();
                $("#reminders").datepicker({
                    showOn: "button",
                    buttonImage: "images/calendar-blue.gif",
                    buttonImageOnly: true,
                    minDate: today
                });
                $("#expiration").datepicker({
                    showOn: "button",
                    buttonImage: "images/calendar-blue.gif",
                    buttonImageOnly: true,
                    minDate: today + 3
                });
                $(".switcher li").bind("click", function () {
                    var act = $(this);
                    $(act).parent().children('li').removeClass("active").end();
                    $(act).addClass("active");
                });
            });
        </script>
    </head>
    <body>
        <nav class="tabs">
            <a href="<%= Utils.CONTROLLER_SENDDOCUMENT %>" class="current">Send Document</a>
            <a href="<%= Utils.CONTROLLER_SENDTEMPLATE %>">Send a Template</a>
            <a href="<%= Utils.CONTROLLER_EMBEDDOCUSIGN %>">Embed Docusign</a>
            <a href="<%= Utils.CONTROLLER_GETSTATUS %>">Get Status and Docs</a>
        </nav>
        <form id="SendDocumentForm" action="SendDocument" method="post" >
            <input id="subject" name="subject" type="text" placeholder="<enter the subject>" autocomplete="off"/>
            <p>
            </p>
            <input id="emailBlurb" name="emailBlurb" type="text" placeholder="<enter e-mail blurb>" autocomplete="off" />
            <p>
            </p>
            <table id="recipientList" name="recipientList" class="recipientList">
                <tr class="recipientListHeader">
                    <th>
                        Recipient
                    </th>
                    <th>
                        E-mail
                    </th>
                    <th>
                        Security
                    </th>
                    <th>
                        Send E-mail Invite
                    </th>
                </tr>
            </table>
            <input type="button" onclick="addRecipientRowToTable()" value="Add Recipient"/>
            <div id="files">
                <p>
                    Document #1:
                    <input class="upload" id="file1" type="file" name="file1" /></p>
                <p>
                    Document #2:
                    <input class="upload" id="file2" type="file" name="file2"/></p>
            </div>
            <table class="optionlist">
                <tr>
                    <td>
                        <input id="sendoption" class="options" type="checkbox" value="stockdoc" name="stockdoc"  onclick="EnableDisableDiv()"/>
                        Use a stock doc
                    </td>
                    <td rowspan="3">
                        <input type="text" id="reminders" class="datepickers" name="reminders"/><br />
                        Add Daily Reminders
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="options" type="checkbox" value="addsig" name="addsigs" />
                        Add Signatures
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="options" type="checkbox" value="addformfield" name="formfields"/>
                        Add Form Fields
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="options" type="checkbox" value="addcondfield" name="conditionalfields"/>
                        Add Conditional Fields
                    </td>
                    <td rowspan="3">
                        <input type="text" id="expiration" class="datepickers" name="expiration"/><br />
                        Add Expiration
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="options" type="checkbox" name="collabfields" value="addcollfield" />
                        Add Collaborative Fields
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="options" type="checkbox" name="enablepaper" value="enablepaper" />
                        Enable Signing on Paper
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="options" type="checkbox" name="ma" value="reqattachment" />
                        Request a Signer to Add an Attachment
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="options" type="checkbox" name="markup" value="enablemarkup" />
                        Enable Signers to Mark Up the Documents
                    </td>
                </tr>
            </table>
            <p />
            <table class="submit">
                <tr>
                    <td>
                        <input type="submit" value="Send Now" name="SendNow"/>
                    </td>
                    <td>
                        <input type="submit" value="Edit Before Sending" name="EditFirst"/>
                    </td>
                </tr>
            </table>
        </form>
        <table align="center" style="padding-top: 20px;">
            <tr>
                <td align="center">
                    <span>Do you find this sample useful? Tell your friends!</span><br />
                    <div class="addthis_toolbox addthis_default_style" style="margin-right: auto; margin-left: auto;
                        width: 210px;">
                        <a class="addthis_button_email"></a><a class="addthis_button_tweet" tw:url="http://www.docusign.com/developers-center/"
                            tw:text="I just tried out the DocuSign API!" tw:via="DocuSignAPI" tw:count="none"
                            tw:related="DocuSign:DocuSign, Inc"></a><a class="addthis_button_delicious">
                        </a><a class="addthis_button_stumbleupon"></a><a class="addthis_button_facebook_like"
                            fb:href="http://www.docusign.com/devcenter/"></a>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <span>Keep up with new developments:</span><br />
                    <a class="addthis_email" href="http://www.docusign.com/blog">
                        <img src="images/blog.png" width="16" height="16" border="0" alt="Blog" /></a>
                    <a class="addthis_email" href="http://www.youtube.com/user/ESIGNwithDocuSign">
                        <img src="images/icon-youtube.png" width="16" height="16" border="0" alt="Youtube" /></a>
                    <a class="addthis_email" href="http://www.docusign.com/blog/feed/">
                        <img src="images/icon-rss.png" width="16" height="16" border="0" alt="RSS" /></a>
                    <a class="addthis_email" href="http://www.facebook.com/pages/DocuSign/71115427991">
                        <img src="images/icon-facebook.png" width="16" height="16" border="0" alt="Facebook" /></a>
                    <a class="addthis_email" href="http://www.twitter.com/DocuSign">
                        <img src="images/icon-twitter.png" width="16" height="16" border="0" alt="Twitter" /></a>
                    <a class="addthis_email" href="http://www.linkedin.com/company/19022?trk=saber_s000001e_1000">
                        <img src="images/icon-linkedin.png" width="16" height="16" border="0" alt="LinkedIn" /></a>
                </td>
            </tr>
        </table>
    </body>
</html>