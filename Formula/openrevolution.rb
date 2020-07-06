class Openrevolution < Formula
  desc ""
  homepage "https://github.com/Extrasklep/openrevolution"
  url "https://github.com/Extrasklep/openrevolution/archive/v2.2.1.tar.gz"
  version "2.2.1"
  sha256 "487e06b6bdf39fcfb3595c1b5b3d4c022118490706d2ab7147206f78694f19e4"
  license ""

  depends_on "rt-audio" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    system "clang++", "-O2", "-std=c++0x", "./src/rt_player/main.cpp", "-o", "brstm_rt", "-lrtaudio"
    bin.install("brstm_rt")
    system "clang++", "-O2", "./src/converter.cpp", "-o", "brstm_converter", "-std=c++0x"
    bin.install("brstm_converter")
  end
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test brstm_rt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
