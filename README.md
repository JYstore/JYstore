# JYstore 开发规范

## 开发前

1. 初始化项目，让其能在本地跑起来
2. 请在 https://app.clubhouse.io/jystore 找到ready for development 的任务
3. 挑选一张任务卡片，把任务执行者指向自己，比把卡片拉到 In development 的位置，开始你工作

## 开发时

#### 一、如何开新分支

1. 一张任务卡片对应一个分支，如果任务分支功能太大，可以自行分拆成为多个子任务卡片
2. 任务在 develop 主分支的基础上 checkout 一个新分支开始做
3. 新分支的命名规则：
   - t + 任务卡片数字
   - 如卡片 
   - <img width="613" alt="Screen Shot 2021-04-11 at 18 00 24" src="https://user-images.githubusercontent.com/20460334/114299802-dd901280-9aef-11eb-8a02-1e3055a3a088.png">
   - 则 git checkout -b t73

#### 二、如何使用卡片

1. 在任务进行时，请随时快速记录开发笔记放到卡片中。如：找到的参考代码、资料链接，问题截图贴等。
2. 如果任务比较困难，请将你的思考过程、你的实验方向、失败的代码，记录到卡片里，方便接手的同事不用重复实验，并能快速帮助你。
3. 笔记不要求工整，但请详尽具体 ———— 以同事不在旁边也能了解、接手你的项目的具体程度。

## 开发完成后

1. 在本地 Terminal 中输入 Git push origin txx 把 branch 推到到 github 上
2. 在 Github 里提交 new pull request
3. 标题：分支名 + 你在这个分支做了什么？
   - 标题范例：T34 实现登陆功能、T35 修改 navbar 样式；
4. 详细描述你在这个分支里做了什么
   - 填如该功能对应的任务卡片的可访问链接
   - 描述该分支完成了什么功能，比附上功能的截图/动图
   - **范例：**
   - <img width="957" alt="Screen Shot 2021-04-11 at 18 10 33" src="https://user-images.githubusercontent.com/20460334/114300132-45932880-9af1-11eb-8273-a1d336ce8656.png">

## 功能 review

1. 自检与测试功能的完整性、逻辑完整性，并没有明显的 bug
2. 把该功能的 github pull request 页面链接，贴在卡片里面，并将卡片转给项目主程 review

## 任务完成

1. 由项目主程将 branch merge 进入 develop 分支，测试后 deploy
2. 任务结束


## 注意事项
1. 不能在一个 pull request 下做多个不相关内容，如实现后台用户列表、实现用户可以登陆，应当分开两个分支开发与提交
2. 禁止非项目主程 merge 代码进入 develop
3. 禁止在 master 、develop 分支上直接修改代码
