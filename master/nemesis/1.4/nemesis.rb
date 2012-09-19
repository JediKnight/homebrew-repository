require 'formula'

class Nemesis < Formula
  homepage 'http://nemesis.sourceforge.net/'
  url 'http://www.bamboo-copter.com/homebrew/master/nemesis/1.4/nemesis-1.4.tar.gz'
  sha1 'a88e04145e5f379da4d50a9acfeaf62da68aaf94'

  depends_on 'libnet'

  skip_clean :all

  def install
    args = %W[
      --prefix=#{prefix}
      --with-libnet-includes=/usr/local/include
      --with-libnet-libraries=/usr/local/lib
    ]

    system "./configure", *args
    system "make install"
  end

  def test
    system "#{bin}/nemesis", "--version"
  end
end
