{
  lib,
  buildKodiAddon,
  fetchFromGitHub,
  requests,
  inputstream-adaptive,
  inputstreamhelper,
}:

buildKodiAddon rec {
  pname = "youtube";
  namespace = "plugin.video.youtube";
  version = "7.2.0+beta.5";

  src = fetchFromGitHub {
    owner = "anxdpanic";
    repo = "plugin.video.youtube";
    rev = "ee061bd30ff168c5541671845de254ec4ef34fdc";
    hash = "sha256-0RzMrkycQ6lVlLzbopqCO2UPeduo1aNdQBYF8g7AhXs=";
  };

  propagatedBuildInputs = [
    requests
    inputstream-adaptive
    inputstreamhelper
  ];

  passthru = {
    pythonPath = "resources/lib";
  };

  meta = with lib; {
    homepage = "https://github.com/anxdpanic/plugin.video.youtube";
    description = "YouTube is one of the biggest video-sharing websites of the world";
    license = licenses.gpl2Only;
    maintainers = teams.kodi.members;
  };
}
