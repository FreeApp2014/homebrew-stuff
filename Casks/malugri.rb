cask "malugri" do
    version "1.0-rewrite-b4"
    sha256 "df1ffcfacbc9aa3be136b434126fb4904ff72879555971f6d17b6afce45ca15f"
    
    url "https://github.com/FreeApp2014/Malugri/releases/download/v#{version}/Malugri.zip"
    name "Malugri"
    desc "OpenRevolution-based toolset for working with video game music"
    homepage "https://github.com/FreeApp2014/Malugri"

    app "Malugri.app"

end
