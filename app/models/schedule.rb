class Schedule < ActiveHash::Base
  self.data = [
    { id:0 , name: "選択してください" },
    { id:1 , name: "１〜２日で発送" },
    { id:2 , name: "２〜３日で発送" },
    { id:3 , name: "４〜７日で発送" }
  ]
end