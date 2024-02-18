@interface SBFButton : UIButton

- (bool)_drawingAsSelected;
- (void)_touchUpInside;
- (void)_updateForStateChange;
- (void)_updateSelected:(bool)arg1 highlighted:(bool)arg2;
- (id)initWithFrame:(CGRect)arg1;
- (void)setHighlighted:(bool)arg1;
- (void)setSelected:(bool)arg1;

@end
