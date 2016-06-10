//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Max Tkach on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, strong, readwrite) NSString *sentence;

@end

@implementation FISSentence


////////// PRIVATE /////////////
-(void)assembleSentece {
    self.sentence = [[NSString alloc] init];
    for (NSString *word in self.words)
        self.sentence = [self.sentence stringByAppendingFormat:@"%@ ", word];
    self.sentence = [self.sentence substringToIndex:self.sentence.length - 1];
    if (self.punctuation.length != 0)
        self.sentence = [self.sentence stringByAppendingString:self.punctuation];
}

-(BOOL)validWord:(NSString *)word {
    if (word.length != 0)
    if (![word containsString:@" "])
    return true;
    return false;
}

-(BOOL)validPunctuation:(NSString *)punctuation {
    NSArray *validPunctuation = @[@"!", @"?", @"."];
    if ([validPunctuation containsObject:punctuation])
    return true;
    return false;
}

-(BOOL)validIndex:(NSUInteger)index {
    if (index < self.words.count)
    return true;
    return false;
}



////////// PUBLIC /////////////
-(void)addWord:(NSString *)word {
    if ([self validWord:word])
        [self.words addObject:word];
    [self assembleSentece];
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    BOOL addedNewWord = false;
    for (NSString *word in words) {
        if ([self validWord:word] && [self validPunctuation:punctuation]) {
            [self.words addObject:word];
            addedNewWord = true;
        }
    }
    if ([self validPunctuation:punctuation] && addedNewWord)
        self.punctuation = punctuation;
    [self assembleSentece];
}

-(void)removeWordAtIndex:(NSUInteger)index {
    if ([self validIndex:index])
        [self.words removeObjectAtIndex:index];
    [self assembleSentece];
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    if ([self validWord:word] && [self validIndex:index])
        [self.words insertObject:word atIndex:index];
    [self assembleSentece];
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ([self validPunctuation:punctuation])
        self.punctuation = punctuation;
    [self assembleSentece];
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentece];
}

@end
