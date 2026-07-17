# 姨妈助手 · 月经记录

一个基于日历的月经记录网页，数据通过 Supabase 实时同步，换浏览器也能看到历史记录。

## 在线访问

```
https://lysam01.github.io/hub-public
```

## 功能

- 月历视图，经期日期用颜色标记（从开始日到结束日连续高亮）
- 预测下次经期、排卵日（下次经期前 14 天）
- 来潮天数滚轮（1–15 天，默认 7 天）
- 平均周期滚轮（1–90 天，默认 28 天）
- 体温滚轮（35.0–42.0℃，默认 36.5℃）
- 记录流量、症状
- Love 大心形按钮，Air 火箭按钮
- 账号/用户名注册登录（支持任意用户名）
- 数据自动同步到 Supabase

## 使用前准备

1. 在 [Supabase](https://supabase.com) 创建项目。
2. 进入 **Authentication → Settings**，关闭 **Confirm email**。
3. 进入项目的 **SQL Editor**，执行 `index.html` 文件里 `点击查看数据库初始化 SQL` 中的 SQL，创建 `daily_logs` 和 `user_settings` 表。
4. 打开网页，用任意用户名注册/登录。

## 隐私说明

- 数据存储在你自己的 Supabase 数据库中。
- `index.html` 中嵌入的是 Supabase 客户端公开 Key（anon / publishable key），可以安全放在前端代码中。
- **不要**把 Supabase `service role key` 泄露给他人或写进公开代码。
- 这是个人健康数据，请使用强密码。

## 本地预览

直接在浏览器中打开 `index.html` 即可。

## 技术栈

- HTML / CSS / JavaScript（无框架）
- Supabase Auth + PostgreSQL
- GitHub Pages 静态托管
