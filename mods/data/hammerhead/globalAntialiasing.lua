local anti = true;
function onCreate()
    if getPropertyFromClass('ClientPrefs', 'globalAntialiasing') == true then
        anti = true;
        setPropertyFromClass('ClientPrefs', 'globalAntialiasing', false);
    end
end
function onDestroy()
    if anti == true then
        setPropertyFromClass('ClientPrefs', 'globalAntialiasing', true);
    end
end