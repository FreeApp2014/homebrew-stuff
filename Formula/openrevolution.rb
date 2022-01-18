class Openrevolution < Formula
  desc "Command-line tools for Nintendo VGM formats"
  homepage "https://github.com/ic-scm/openrevolution"
  url "https://github.com/ic-scm/openrevolution/archive/v2.7.0.tar.gz"
  version "2.7.0"
  sha256 "2f9416ab2606dcc6ed4d2328e4d44ca257c9a211e34ef55bfdca576d04911071"
  license "GPLv3"

  depends_on "rtaudio" => :build

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
end
