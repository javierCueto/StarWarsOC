//
//  ListItem.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *opening;
@property (strong, nonatomic) NSString *director;
@property (strong, nonatomic) NSString *producer;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSString *urlPath;
@end

NS_ASSUME_NONNULL_END
