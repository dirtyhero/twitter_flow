# encoding: utf-8
require "selenium-webdriver"
require File.expand_path(File.dirname(__FILE__) + './twitter_flow/config.rb')

# ブラウザ定義
profile = Selenium::WebDriver::Firefox::Profile.new
@driver = Selenium::WebDriver.for :firefox, :profile => profile
@driver.manage.timeouts.implicit_wait = 5
@driver.manage.timeouts.page_load = 5 # seconds

# twitterを表示
@driver.navigate.to("https://twitter.com")

# configファイルの読み込み
@config = Config.new()

# login処理
@driver.find_element(:class, 'js-login').click
@driver.find_element(:css, 'div.LoginDialog-form input[type="text"]').send_keys @config.mail
@driver.find_element(:css, 'div.LoginDialog-form input[type="password"]').send_keys @config.pass
@driver.find_element(:class, 'submit').click
