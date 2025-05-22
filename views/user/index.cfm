<cfoutput>
    <div class="container">
        <h1>User Define Injection</h1>
        <p>#prc.contactRenderService#</p>
        <p>#prc.userRenderService#</p>

        <br>

        <h1>Coldbox Define Injection - Custom Setting</h1>
        <p>#prc.customSetting#</p>
        <p>#prc.customSettingVersion#</p>

        <br>

        <h1>Coldbox Define Injection - Coldbox Setting</h1>
        <div class="container border">
        <h3>Coldbox</h3>
            <p>#prc.coldboxSettingsColdbox#</p>
        </div>
        <p><b>Coldbox Settings - AppName: </b> #prc.coldboxSettingsAppName#</p>

    </div>
</cfoutput>
