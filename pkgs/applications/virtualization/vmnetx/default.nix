{ stdenv, fetchgit, autoreconfHook, python, pythonPackages, pylint, pkgconfig, libxml2, curl, fuse, glib, shared_mime_info, desktop_file_utils, buildPythonPackage, spice_gtk }:

stdenv.mkDerivation rec {
  name = "vmnetx-0.5.0";
  rev = "refs/tags/v0.5.0";
  src = fetchgit {
    url = "https://github.com/cmusatyalab/vmnetx.git";
    inherit rev;
    sha256 = "1010vlny2yzpga3pqm67sm0b853cx0na8wmwkxf2yvxqrgx94fyh";
  };

  pythonPath = [
    pythonPackages.argparse
    pythonPackages.dateutil
    pythonPackages.dbus
    pythonPackages.flask
    pythonPackages.libvirt
    pythonPackages.lxml
    pythonPackages.msgpack
    pythonPackages.pygtk
    pythonPackages.pyyaml
    pythonPackages.requests
    spice_gtk
  ];

  buildInputs = [
    autoreconfHook
    curl
    desktop_file_utils
    fuse
    glib
    libxml2
    pkgconfig
    pylint
    pythonPackages.wrapPython
    shared_mime_info
  ];

  postInstall = "wrapPythonPrograms";

  meta = {
    description = "VMNetX allows KVM-based virtual machines to be stored on a web server and executed on-demand on a client system.";
    homepage = "https://olivearchive.org/";
    maintainers = [ stdenv.lib.maintainers.vandenoever ];
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.gpl2;
  };
}
