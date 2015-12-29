>
# Moviespace

## サイト設計


### 0. header_bar
全ページ共通のヘッダーバー ( position:fixed; )

**遷移**：トップページへのリンクアイコン（左）  
　　　新規登録ボタン／ログイン・ログアウトボタン／マイページボタン（プルタブでmypage,edit,logout）／新規投稿ボタン

### 1. index
トップページ。各プロダクトのサムネイルを表示。

**機能**：人気順表示／新着順表示、ページネーション（Gem）

**遷移**：タグ一覧へ（ボタン）

#### 2. _thumbnail

各サムネイル(部分テンプレート)の仕様(カッコ内はテーブル名)

紹介画像:main(photos)／作品名:title(movies)／ユーザのニックネーム:nickname(users)／投稿月日:created_at(movies)

~~タグ:多対多のアソシエーション(movies_tagsテーブルを経由）~~

 **遷移**：紹介画像mainから各moviesページへ／ニックネームnicknameから各usersページへ

### 3. tagsページ
タグ検索ができる、タグ一覧のページ。

**遷移**：各タブボタンから、そのタグを検索キーにした検索結果ページに遷移

### 4. moviesページ（プロダクトページ）

投稿ユーザ系usersテーブル･･･ユーザアイコン:icon／自己紹介文:introduce／ニックネーム:nickname

作品系moviesテーブル･･･お気に入り（不明）／キャッチコピー:copy／コンセプト:concept／タグ一覧:tagsテーブルとのアソシエーション／コメント：commentsテーブルとのアソシエーション

コメント系commentsテーブル（usersテーブルとアソシエーション：user対comments）･･･ユーザアイコン:icon／ニックネーム:nickname／コメント:comment

画像系photosテーブル･･･紹介画像(大):main／参考画像(小):sub

**フォーム(JSで実装・非ログイン時は非表示)**：commentsテーブルに保存･･･コメント内容:detail／ユーザid:current_user.id(devise)

**遷移**：各ユーザアイコンから各usersページへ／投稿者のニックネームnicknameから投稿者usersページへ／タグボタンから各タグに紐づく作品一覧画面へ

### 5. usersページ（マイページ）

usersテーブル系：グループ？:member／プロフィール:profile／所属:works

moviesテーブル系：部分テンプレート_thumbnail を一覧表示(created_at降順)

### 5. users/user.id/edit（プロフィール編集ページ）

**icon/nickname/email/password/menber?/profile** が編集可能。更新ボタンあり

***

## DB設計

### Users table (deviseを使用して生成)
>
*has_many  movies / thumbnails / comments*

email
/nickname
/member **(protospace上でこのカラムが何を表しているのかがイマイチよくわかりません)**
/profile
/works
/introduce
/avatar関連（carrierwaveを使用）

+自動生成

### Movies table
>
*has_many comments / photos*
>
*has_one thumbnail*
>
*belongs_to user*

title
/キャッチコピー:copy
/コンセプト:concept
/user_id

**LIKE(お気に入り)機能の実装についてのカラムは検討中**

+自動生成

### thumbnails table
>
*has_many photos*
>
*belongs_to movie / user*

movie_id
/user_id

### Comments table
>
*belongs_to user / movie*

コメント内容:detail
/user_id
/movie_id

+自動生成

### Photos table
>
*belongs_to movie / thumbnail*

title
/movie_id
/thumbnail_id
/status(main/sub)
