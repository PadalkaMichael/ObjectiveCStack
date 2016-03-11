//
//  main.m
//  MinValueConstTime
//
//  Created by Michael on 3/11/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Leaf
{
    int val;
    struct Leaf *next;
} Leaf;

@interface Stack : NSObject
{
Leaf *_head;
}

- (instancetype)initWithHead:(Leaf *)head;
- (instancetype)initWithValue:(int)value;
- (int)pop;
- (void)push:(int)val;

@end

@implementation Stack

- (instancetype)initWithHead:(Leaf *)head
{
    self = [super init];
    if(self)
    {
        _head = head;
    }
    return self;
}

- (instancetype)initWithValue:(int)value
{
    Leaf *head = malloc(sizeof(Leaf));
    head->val = value;
    head->next = NULL;
    return [self initWithHead:head];
}

- (instancetype)init
{
    return [self initWithHead:NULL];
}

-(void)dealloc
{
    NSLog(@"free _head");
    Leaf *current = _head;
    while (current) {
        NSLog(@"%d", current->val);
        Leaf *tmp = current->next;
        free(current);
        current = tmp;
    }
}

-(void)push:(int)val
{
    Leaf *newHead = malloc(sizeof(Leaf));
    newHead->val = val;
    newHead->next = _head;
    _head = newHead;
}

-(int)pop
{
    int tmpval = _head->val;
    Leaf *popLeaf = _head;
    _head = _head->next;
    free(popLeaf);
    return tmpval;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Leaf *f = malloc(sizeof(Leaf));
//        f->val = 4;
//        f->next = NULL;
//        Stack *st = [[Stack alloc] initWithHead:f];
//        Stack *st2 = [[Stack alloc] initWithValue:6];
        Stack *st3 = [[Stack alloc] init];
//        [st3 push:5];
//        [st3 push:6];
//        [st3 push:7];
//        [st3 push:8];
        [st3 pop];
    }
    return 0;
}
