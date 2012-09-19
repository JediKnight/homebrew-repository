require 'formula'

class Libnet < Formula
  homepage 'https://http://libnet.sourceforge.net/'
  url 'http://www.bamboo-copter.com/homebrew/old/libnet/1.0.2a/libnet-1.0.2a.tar.gz'
  sha1 'dffff71c325584fdcf99b80567b60f8ad985e34c'

  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  def patches
    {:p0 =>
     "https://trac.macports.org/export/95336/trunk/dports/net/libnet11/files/patch-configure.in.diff"
    }
  end

  def install
    system "autoreconf --force --install"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    inreplace "src/libnet_link_bpf.c", "#include <net/bpf.h>", "" # Per MacPorts
    system "make install"
  end
end

