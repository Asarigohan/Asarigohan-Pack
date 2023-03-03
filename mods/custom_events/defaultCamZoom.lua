function onEvent(name,value1,value2)
  if name == 'defaultCamZoom' then
    if value1 == '' then
      setProperty("defaultCamZoom", 0.7)
    else
      setProperty("defaultCamZoom", value1) 

    end
  end
end