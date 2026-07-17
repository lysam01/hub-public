# 姨妈助手 · 月经记录

一个基于日历的月经记录网页，数据通过 Supabase 实时同步，换浏览器也能看到历史记录。

## 在线访问

部署后，地址类似：

```
https://你的用户名.github.io/hub-public
```

## 功能

- 月历视图，经期日期用颜色标记
- 预测下次经期
- 记录体温、流量、症状、Love、Air/自定义、备注
- 数据自动同步到 Supabase
- 账号/用户名注册登录（支持任意用户名，系统自动拼接为内部邮箱；也可直接填真实邮箱）

## 使用前准备

1. 在 [Supabase](https://supabase.com) 创建项目。
2. 进入 **Authentication → Settings**，关闭 **Confirm email**（因为我们使用用户名映射的内部邮箱，无法收到验证邮件）。
3. 进入项目的 **SQL Editor**，执行 `index.html` 文件底部注释中的 SQL，创建 `daily_logs` 表和 Row Level Security 策略。
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
