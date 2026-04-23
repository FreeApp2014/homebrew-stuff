class Openrevolution < Formula
  desc "Command-line tools for Nintendo VGM formats"
  homepage "https://github.com/ic-scm/openrevolution"
  url "https://github.com/ic-scm/openrevolution/archive/v2.9.0.tar.gz"
  version "2.9.0"
  sha256 "a6507927a9191bc9d2e56c0ab0ec5d22486a32e48181e79cf5d5a817b8ac84d1"
  license "GPLv3"

  depends_on "rtaudio"

  def install
    ENV.deparallelize
    system "clang++", "-O2", "-std=c++0x", "./src/rt_player/main.cpp", "-o", "brstm_rt", "-lrtaudio"
    bin.install("brstm_rt")
    system "clang++", "-O2", "./src/converter.cpp", "-o", "brstm_converter", "-std=c++0x"
    bin.install("brstm_converter")
  end
  test do
      output = shell_output("#{bin}/brstm_converter --version 2>&1")
      assert_match "v#{version}", output
      output2 = shell_output("#{bin}/brstm_rt --version 2>&1")
      assert_match "v#{version}", output2
  end
  bottle do
    root_url "http://bin.eol.pw/homebrew"
    sha256 cellar: :any, sonoma: "6d28fb75c1e18a4ab9c7513024b0b5958d0e5a44b17f965138fb8afd42d810c8"
    sha256 cellar: :any, arm64_sonoma: "3f0a2abddfb57f7749cbd8db97808db8cb500a3c83a15289fd08621fb5dc166e"
  end
end
