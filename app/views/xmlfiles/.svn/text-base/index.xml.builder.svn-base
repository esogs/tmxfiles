xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.declare! :DOCTYPE, :tmx, :SYSTEM, "http://www.lisa.org/fileadmin/standards/txm1.4/tmx14.dtd.txt"

xml.tmx("version"=>"1.4") {
  xml.header("creationtool"=>"gary", "creationtoolversion"=>"1.0", "o-tmf"=>"source", "datatype"=>"plaintext", "segtype"=>"sentence", "adminlang"=>"en-us", "srclang"=>"en", "o-encoding"=>"UTF-8")
  xml.body {
   count = 0
   @sendfile.each do |source, target| 
     xml.tu("tuid"=>count.to_s, "sourcelang"=>"en") {
       count += 1
       xml.tuv ("xml:lang"=>"en") {
         xml.seg(source.to_s)
       }
       xml.tuv("xml:lang"=>"de-DE") {
         xml.seg(target.to_s)
       }
     } 
   end
   }  
}
