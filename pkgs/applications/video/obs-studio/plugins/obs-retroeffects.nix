{ lib
, stdenv
, fetchFromGitHub
, cmake
, obs-studio
,
}:

stdenv.mkDerivation rec {
  pname = "obs-move-transition";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "FiniteSingularity";
    repo = "obs-retro-effects";
    rev = version;
    sha256 = "sha256-6f1b85c630a2b952e0cf04cb71b441246254de66";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ obs-studio ];

  postInstall = ''
    rm -rf $out/obs-plugins $out/data
  '';

  meta = with lib; {
    description = "";
    homepage = "";
    maintainers = with maintainers; [ starcraft66 ];
    license = licenses.gpl2Plus;
    platforms = [
      "x86_64-linux"
    ];
  };
}
