class Auezabiv < Formula
    desc "Симулятор ❌оффника❌"
    homepage "http://yarick.ddns.net/offgame.html"
    url "http://yarick.ddns.net/code.tar.gz"
    version "1.2.0"
    sha256 "3b2e10aa62085f8ed22c856bd04eca9acc5a20f78e365e387a4408e8529e0033"
    license "GPLv3"
  
    depends_on "cmake" => :build

    def install
      ENV.deparallelize
      system "cmake", ".", "-DCMAKE_CXX_FLAGS=-std=gnu++11"
      system "make"
      bin.install("auezabiv")
    end
    test do
    end
    bottle do
      root_url "https://s.neofetch.win/hb-binary"
      sha256 cellar: :any_skip_relocation, high_sierra: "01bba9712478db442ddc476fdeb508d537c800a18c07e639686d7aabbc19780f"
    end
  end
  
