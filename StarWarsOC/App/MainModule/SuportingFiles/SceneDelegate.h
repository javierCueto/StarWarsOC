//
//  SceneDelegate.h
//  PokeOC
//
//  Created by Jose Javier Cueto Mejia on 27/09/22.
//

#import <UIKit/UIKit.h>
#import "AppFactory.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) AppFactory * appFactory;

@end

