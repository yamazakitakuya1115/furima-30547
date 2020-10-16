class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: "選択してください" },
    { id: 1, name: "Ｓ 新品、未使用" },
    { id: 2, name: "Ａ 未使用に近い" },
    { id: 3, name: "Ｂ 目立った傷や汚れなし" },
    { id: 4, name: "Ｃ やや傷や汚れあり" },
    { id: 5, name: "Ｄ 傷や汚れあり" },
    { id: 6, name: "Ｅ 全体的に状態が悪い" }
  ]
end
