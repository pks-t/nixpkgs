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
    rev = "8959edecaed4c44ca2ef5ccf93ace211ee591f24";
    hash = "sha256-LKJumScqi3S02pb70f60Ip2hzxX52bMNm93IdQxfIIg=";
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
