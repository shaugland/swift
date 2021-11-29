% include("header.tpl")
% include("banner.tpl")

<script>
    

    function settingsSubmit(event) {
        var musicInclude = $("#includeMusic").is(":checked") ? 'true' : 'false';

        settings = {
            'name': 'includeMusic',
            'value': musicInclude
        };

        $.ajax({url:"api/settings", type:"POST", 
          data:JSON.stringify(settings), 
          contentType:"application/json; charset=utf-8",
          success:settingsSaved});
    }

    function settingsSaved() {
        alert("your settings have been successfully saved");
    }

    function setSettings() {
        var includeMusic = settings.find(setting => setting.name === "includeMusic").value == "true";
        if (includeMusic)
            $("#includeMusic").prop('checked', true);
        else 
            $("#includeMusic").prop('checked', false);
    }

    $(document).ready(function() {
        $("#submitButton").click(settingsSubmit);
        if (settings.length != 0) {
            setSettings();
        }
        else {
            get_settings();
            setSettings();
        }
    });
</script>

<p>Welcome to the settings page, more features coming soon</p>

<input type="checkbox" id="includeMusic" name="includeMusic" value="music" />
<label for="includeMusic">Have background music</label>

<button id="submitButton">Click me to Submit!</button>
<br />
% include("footer.tpl")