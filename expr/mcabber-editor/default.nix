{ stdenv, fetchFromGitHub, mcabber, glib, pkgconfig, ncurses }:

stdenv.mkDerivation rec {
  pname = "mcabber-editor-plugin";
  version = "2.2";

  src = fetchFromGitHub {
    owner = "kovetskiy";
    repo = "mcabber-external-editor";
    rev = "2f34ecdabfb68dee82480ee99f5a64cc68d959be";
    sha256 = "13v8isw59dnahdgawiivikn3wypq4smpqc495hq3vxfqa1lzpdz9";
  };

  patches = [ ./fix-build.patch ];

  makeFlags = [ "PREFIX=$(out)/usr" ];

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ mcabber glib ncurses ];

  meta = with stdenv.lib; {
    description = "Say messages using external editor";
    homepage = "https://github.com/kovetskiy/mcabber-external-editor/";
    platforms = platforms.all;
  };
}
