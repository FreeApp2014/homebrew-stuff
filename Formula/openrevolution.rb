class Openrevolution < Formula
  desc "Command-line tools for Nintendo VGM formats"
  homepage "https://github.com/ic-scm/openrevolution"
  url "https://github.com/ic-scm/openrevolution/archive/v2.6.0.tar.gz"
  version "2.6.0"
  sha256 "dbde1e1f62f4f1da61653dc271446d0f4e9e0130cec005723af3052c7ddc774"
  license "GPLv3"

  depends_on "rt-audio" => :build

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
