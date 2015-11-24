>
# MovieShow

## 概要
個人が制作した動画（撮影のみでなく、編集が加えられたもの／アニメーション）を投稿・閲覧できるスペース。

各プロダクトのページでは、動画プレビュー／動画ダウンロード／制作プロセス解説　等が閲覧できる。

## サイト設計


### 0. header_bar
全ページ共通のヘッダーバー ( position:fixed; )

**遷移**：トップページへのリンクアイコン（左）  
　　　新規登録ボタン／ログイン・ログアウトボタン／マイページボタン（プルタブでmypage,edit,logout）／新規投稿ボタン

### 1. index
トップページ。各プロダクトのサムネイルを表示。

**機能**：人気順表示／新着順表示、ページネーション（Gem）

**遷移**：タグ一覧へ（ボタン）

####１−１．_thumbnail

各サムネイル（部分テンプレート）の仕様

紹介画像:main(movies)／作品名:title(movies)／ユーザのニックネーム:nickname(users)／投稿月日:created_at(movies)

タグ:多対多のアソシエーション(movies_tagsテーブルを経由）

 **遷移**：紹介画像mainから各moviesページへ／ニックネームnicknameから各usersページへ

### 2. tags
タグ検索ができる、タグ一覧のページ。

**遷移**：各タブボタンから、そのタグを検索キーにした検索結果ページに遷移

### 3. moviesページ（プロダクトページ）

投稿ユーザ系usersテーブル･･･ユーザアイコン:icon／自己紹介文:introduce／ニックネーム:nickname

画像系moviesテーブル･･･紹介画像:main／参考画像:sub／お気に入り（不明）／キャッチコピー:copy／コンセプト:concept／タグ一覧:tagsテーブルとのアソシエーション／コメント：commentsテーブルとのアソシエーション

コメント系commentsテーブル（usersテーブルとアソシエーション：user対comments）･･･ユーザアイコン:icon／ニックネーム:nickname／コメント:comment

**フォーム(JSで実装・非ログイン時は非表示)**：commentsテーブルに保存･･･コメント内容:detail／ユーザid:current_user.id(devise)

**遷移**：各ユーザアイコンから各usersページへ／投稿者のニックネームnicknameから投稿者usersページへ／タグボタンから各タグに紐づく作品一覧画面へ

### 4. usersページ（マイページ）

usersテーブル系：グループ？:menber／プロフィール:profile／所属:works

moviesテーブル系：部分テンプレート_thumbnail を一覧表示(created_at降順)

### 5. users/user.id/edit（プロフィール編集ページ）

**icon/nickname/email/password/menber?/profile** が編集可能。更新ボタンあり
