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

#### 2. _matome

プロダクトの各サムネイルをまとめたもの(部分テンプレート)の仕様(カッコ内はテーブル名)

紹介画像:main(thumbnails)／作品名:title(movies)／ユーザのニックネーム:nickname(users)／投稿月日:created_at(movies)

**遷移**：紹介画像mainから各moviesページへ／ニックネームnicknameから各usersページへ

### 3. tagsページ
タグ検索ができる、タグ一覧のページ。

**遷移**：各タブボタンから、そのタグを検索キーにした検索結果ページに遷移

### 4. moviesページ（プロダクトページ）


投稿ユーザ系usersテーブル･･･ユーザアイコン:icon／自己紹介文:introduce／ニックネーム:nickname
 
作品系moviesテーブル･･･お気に入り（不明）／キャッチコピー:copy／コンセプト:concept／タグ一覧:tagsテーブルとのアソシエーション／コメント：commentsテーブルとのアソシエーション
 
コメント系commentsテーブル（usersテーブルとアソシエーション：user対comments）･･･ユーザアイコン:icon／ニックネーム:nickname／コメント:comment
 
画像系thumbnailsテーブル･･･紹介画像(大):main／参考画像(小):sub
 
**フォーム(JSで実装・非ログイン時は非表示)**：commentsテーブルに保存･･･コメント内容:text／ユーザid:current_user.id(devise)
 
**遷移**：各ユーザアイコンから各usersページへ／投稿者のニックネームnicknameから投稿者usersページへ／タグボタンから各タグに紐づく作品一覧画面へ
 
### 5. usersページ（マイページ）
 
usersテーブル系：グループ？:member／プロフィール:profile／所属:works
 
moviesテーブル系：部分テンプレート_matome を一覧表示(created_at降順)
 
### 5. users/user.id/edit（プロフィール編集ページ）
 
**icon/nickname/email/password/menber?/profile** が編集可能。更新ボタンあり
  
***


## DB設計

### Users table (deviseを使用して生成)
>
*has_many  movies / thumbnails / comments*

email
/nickname
/member
/profile
/works
/introduce
/avatar（carrierwaveを使用）

+自動生成

### Movies table
>
*has_many comments / thumbnails / likes*
>
*belongs_to user*

title
/キャッチコピー:copy
/コンセプト:concept
/user_id

+自動生成

###Likes table（カウンターキャッシュ用）

>
*belongs_to movie / user*

movie_id
/user_id（likeしたユーザのid）

+自動生成

### Comments table
>
*belongs_to user / movie*

コメント内容:text
/user_id
/movie_id

+自動生成

### Thumbnails table
>
*belongs_to movie*

title
/movie_id
/status(main/sub --> enumを使用)

### Tags table（Gem:acts_as_taggable を使用）
