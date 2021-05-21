# Shields

## Introduction

Customize the personalized badge effect with simple configuration.

 <a href="https://github.com/badges/shields/graphs/contributors" alt="Contributors">
        <img src="https://img.shields.io/github/contributors/badges/shields" /></a>
    <a href="#backers" alt="Backers on Open Collective">
        <img src="https://img.shields.io/opencollective/backers/shields" /></a>
    <a href="#sponsors" alt="Sponsors on Open Collective">
        <img src="https://img.shields.io/opencollective/sponsors/shields" /></a>
    <a href="https://github.com/badges/shields/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/badges/shields" /></a>
    <a href="https://circleci.com/gh/badges/shields/tree/master">
        <img src="https://img.shields.io/circleci/project/github/badges/shields/master" alt="build status"></a>
    <a href="https://circleci.com/gh/badges/daily-tests">
        <img src="https://img.shields.io/circleci/project/github/badges/daily-tests?label=service%20tests"
            alt="service-test status"></a>
    <a href="https://coveralls.io/github/badges/shields">
        <img src="https://img.shields.io/coveralls/github/badges/shields"
            alt="coverage"></a>
    <a href="https://lgtm.com/projects/g/badges/shields/alerts/">
        <img src="https://img.shields.io/lgtm/alerts/g/badges/shields"
            alt="Total alerts"/></a>
    <a href="https://discord.gg/HjJCwm5">
        <img src="https://img.shields.io/discord/308323056592486420?logo=discord"
            alt="chat on Discord"></a>

## Use

### 1. Config Label text and Message text -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0"];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 2. Config Label Font Color -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" labelColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 3. Config Message Font Color -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" messageColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 4.Config Label Background Color -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000]];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 5.Config Message Background Color -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" messageBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000]];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 6.Config Label And Message Background Color -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 7.Config Label And Message -- Default /  Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsDefault];
[shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] labelColor:UIColor.whiteColor messageColor:UIColor.whiteColor];
shields.center = self.view.center;
[self.view addSubview:shields];
```

### 8. Config Logo

```objective-c
Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsLogo];
[shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 193/255.0 green: 241/255.0 blue: 172/255.0 alpha:1.000] labelColor:[UIColor colorWithRed: 242/255.0 green: 242/255.0 blue: 246/255.0 alpha:1.000] messageColor:[UIColor colorWithRed: 242/255.0 green: 242/255.0 blue: 246/255.0 alpha:1.000] logo:[UIImage imageNamed:@"lanmei"] logoWidth:15 logoPosition:CGPointMake(10, 10)];
shields.center = self.view.center;
[self.view addSubview:shields];
```

## Contribute to this project

If you have a feature request or bug report, please feel free to send [863713745@qq.com](mailto:863713745@qq.com) to upload the problem, and we will provide you with revisions and help as soon as possible. Thank you very much for your support.

## Security Disclosure

If you have found the Shields security vulnerabilities and vulnerabilities that need to be modified, you should email them to [863713745@qq.com](mailto:863713745@qq.com) as soon as possible. thank you for your support.
