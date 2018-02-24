# VierticalScrollView
仿照淘宝头条竖直滚动效果
====
使用方法：
-------
self.dataTypeArray = @[@"类型1",@"类型2",@"类型3",@"类型4",@"类型5"]; <br>
self.dataTitleArray = @[@"默认标题1",@"默认标题2",@"默认标题3",@"默认标题4",@"默认标题5"]; <br>
VierticalScrollView *rollView = [[VierticalScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame), 100, self.view.frame.size.width, 60)]; <br>
[rollView setDataWithArray:self.dataTypeArray AndTitleArray:self.dataTitleArray]; <br>
[self.view addSubview:rollView];\<br>
