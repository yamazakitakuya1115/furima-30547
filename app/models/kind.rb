class Kind < ActiveHash::Base
  self.data = [
    { id: 0, name: '通報理由を選択してください' },
    { id: 1, name: '出品が禁止されている商品である' },
    { id: 2, name: '法令に違反する又はそのおそれがある商品である' },
    { id: 3, name: '商品の画像・説明内容が不適切である' },
    { id: 4, name: 'カテゴリーが誤っている' },
    { id: 5, name: 'その他' }
  ]
end
