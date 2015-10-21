//
//  MOFileUtils.h
//  MOLib
//
//  Created by mo jun on 9/3/12.
//  Copyright (c) 2012年 mo jun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOFileUtils : NSObject
/*
 * @brief 根据文件名称获取资源文件路径
 * @param filename  文件名称
 * @return 返回资源文件路径
 */
+(NSString *)getResourcesFile:(NSString *)fileName;

+(NSString *)getResourcesFile:(NSString *)fileName type:(NSString *)type;

/*
 * @brief 根据文件名称获取Doc目录中文件路径
 * @param fileName  文件名称
 * @return 返回Doc目录中文件路径
 */
+(NSString *)getLocalFilePath:(NSString *)fileName;

/*
 * @brief 根据文件名称获取缓存目录中文件路径
 * @param fileName  文件名称
 * @return 返回Doc目录中文件路径
 */
+(NSString *)getCacheFilePath:(NSString *)fileName;
/*
 * @brief 根据文件名称获取Tmp目录中文件路径
 * @param fileName  文件名称
 * @return 返回Doc目录中文件路径
 */
+(NSString *)getTempFilePath:(NSString *)fileName;

/*
 * @brief 根据目录名称创建文件夹目录
 * @param dir 目录名称
 * @return 返回文件夹目录名称
 */
+(NSString *)createDir:(NSString *)dirName;

/*
 * @brief 根据目录路径创建文件夹目录
 * @param 文件夹目录绝对路径
 * @return N/A
 */
+(void)createDirWithDirPath:(NSString *)path;

/*
 * @brief 根据文件名判断Doc目录中是否存在
 * @param fileName 文件目录名称
 * @return 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsFileInDoc:(NSString *)fileName;

/*
 * @brief 根据文件名判断资源文件中是否存在
 * @param fileName 文件目录名称
 * @return 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsFileInRescource:(NSString *)fileName;

/*
 * @brief 根据文件路径判断是否存在
 * @param filePath 文件目录名称
 * @return 是否存在 BOOL  YES (存在) NO (不存在)
 */
+(BOOL)isExistsFile:(NSString *)filePath;

/*
 * @brief 根据文件路径获取文件名称
 * @param filepath  文件的绝对路径
 * @return 文件名称 (带文件类型的）
 */
+(NSString *)getFileNameByPath:(NSString *)filepath;

/*
 * @brief  根据文件路径删除目录
 * @param  filepath 文件路径
 * @return N/A
 */
+(void)removeDirByPath:(NSString *)filepath;

/*
 * @brief  根据文件名称删除目录
 * @param  fileName 文件目录名称
 * @return N/A
 */
+(void)removeDirByName:(NSString *)fileName;

/*
 * 函数名     getAllFileByName
 * @brief  获取文件目录下所有文件名称
 * @param  fileName 文件目录名称
 * @return 文件名arr
 */
+(NSArray *)getAllFileByName:(NSString *)path;

/*
 * @brief copy文件
 * @param srcPath--原始文件  dstPath--目标文件
 * @return 
 */
+(BOOL)copyFile:(NSString *)srcPath dstPath:(NSString *)dstPath;

/*
 * @brief 判断该路径下面的文件是否存在
 * 函数参数： 文件路径名
 * 函数返回值： BOOL
 */
+(BOOL)isExistsFileAtPath:(NSString *)filePath;

/*
 * 函数作用： 创建文件
 * 函数参数： 文件路径名
 * 函数返回值： N/A
 */
+(void) createFileAtPath:(NSString *)path;

/*
 * 函数作用： 获取当前文件夹下面的文件的路径
 * 函数参数： 文件夹路径
 * 函数返回值： 文件路径arr
 */
+ (NSMutableArray *)fileNamesInDirectory:(NSString *)dirPath;
@end
