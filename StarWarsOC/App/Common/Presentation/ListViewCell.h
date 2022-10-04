//
//  ListViewCell.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewCell : UITableViewCell
- (void)updateData: (ListItem*) listItem;
@end

NS_ASSUME_NONNULL_END
