はてなブログの記事内容を取得するGem.


# Usage

```rb
hatenablog get http://reizist.hatenablog.com -c 10
=> [
     {
       'http://reizist.hatenablog.com/entry/2017/03/03/044202' => {
		 title: '',
		 categories: [].
		 text: '',
		 html: ''
	   }
	 },
	 {
	   ..
	 },
	 ..
   ]
```

## Options

* -c --count [Integer] count of getting article
* -m --markdown [Boolean] also output markdown
* -s --save [String] save dir
    

		
