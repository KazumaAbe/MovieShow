# **Moviespace DB設計**

## **Users table** (deviseを使用して生成)

>**has_many :movies**

>**has_many :comments, :dependent => :destroy**

>**has_many :likes, :dependent => :destroy**

* email
* nickname
* member
* profile
* works
* introduce
* avatar（carrierwaveを使用）


## **Movies table**

>**has_many :comments, :dependent => :destroy**

>**has_many :thumbnails, :dependent => :destroy**

>**has_many :likes, :dependent => :destroy**

>**belongs_to :user**

* title
* copy (キャッチコピー)
* concept (コンセプト)
* user_id
* like_count
* comment_count


## **Likes table**（カウンターキャッシュ用）

>**belongs_to :movie**

>**belongs_to :user**

* movie_id
* user_id（likeしたユーザのid）


## **Comments table**

>**belongs_to :user**

>**belongs_to :movie**

* text (コメント内容)
* user_id
* movie_id


## **Thumbnails table**

>**belongs_to movie**

* title
* movie_id
* status(main/sub --> enumを使用)

## **Tags table**（Gem:acts_as_taggable を使用）

