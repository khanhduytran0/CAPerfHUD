/*
* This header is generated by classdump-dyld 1.0
* on Wednesday, November 15, 2023 at 5:46:46 PM Eastern European Standard Time
* Operating System: Version 17.1 (Build 21B74)
* Image Source: /System/Library/PrivateFrameworks/ControlCenterUIKit.framework/ControlCenterUIKit
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSString;

@interface CCUIMenuModuleItem : NSObject {

	BOOL _busy;
	BOOL _selected;
	BOOL _placeholder;
	NSString* _identifier;
	NSString* _title;
	NSString* _subtitle;
	/*^block*/id _handler;

}

@property (nonatomic,copy) NSString * identifier;                                //@synthesize identifier=_identifier - In the implementation block
@property (nonatomic,copy) NSString * title;                                     //@synthesize title=_title - In the implementation block
@property (nonatomic,copy) id handler;                                           //@synthesize handler=_handler - In the implementation block
@property (assign,getter=isPlaceholder,nonatomic) BOOL placeholder;              //@synthesize placeholder=_placeholder - In the implementation block
@property (nonatomic,copy) NSString * subtitle;                                  //@synthesize subtitle=_subtitle - In the implementation block
@property (assign,getter=isBusy,nonatomic) BOOL busy;                            //@synthesize busy=_busy - In the implementation block
@property (assign,getter=isSelected,nonatomic) BOOL selected;                    //@synthesize selected=_selected - In the implementation block
-(BOOL)isBusy;
-(BOOL)isSelected;
-(void)setSubtitle:(NSString *)arg1 ;
-(void)setHandler:(id)arg1 ;
-(BOOL)isPlaceholder;
-(BOOL)performAction;
-(NSString *)subtitle;
-(BOOL)isEqual:(id)arg1 ;
-(NSString *)title;
-(void)setPlaceholder:(BOOL)arg1 ;
-(NSString *)identifier;
-(void)setSelected:(BOOL)arg1 ;
-(unsigned long long)hash;
-(id)description;
-(void)setTitle:(NSString *)arg1 ;
-(id)handler;
-(void)setIdentifier:(NSString *)arg1 ;
-(void)setBusy:(BOOL)arg1 ;
-(id)initWithTitle:(id)arg1 identifier:(id)arg2 handler:(/*^block*/id)arg3 ;
@end

