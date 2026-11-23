; ModuleID = 'spike_sfence_vma_klee.bc'
source_filename = "spike_sfence_vma_klee.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.spike_state_t = type { i32, i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"ext_s\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [8 x i8] c"has_mmu\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [2 x i8] c"v\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [4 x i8] c"prv\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [13 x i8] c"hstatus_vtvm\00", align 1, !dbg !22
@.str.5 = private unnamed_addr constant [12 x i8] c"mstatus_tvm\00", align 1, !dbg !27
@.str.6 = private unnamed_addr constant [8 x i8] c"obs_exc\00", align 1, !dbg !32
@.str.7 = private unnamed_addr constant [16 x i8] c"obs_tlb_flushed\00", align 1, !dbg !34

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !49 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.spike_state_t, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %3, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %4, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %5, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata ptr %6, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %7, metadata !64, metadata !DIExpression()), !dbg !65
  call void @klee_make_symbolic(ptr noundef %2, i64 noundef 4, ptr noundef @.str), !dbg !66
  call void @klee_make_symbolic(ptr noundef %3, i64 noundef 4, ptr noundef @.str.1), !dbg !67
  call void @klee_make_symbolic(ptr noundef %4, i64 noundef 4, ptr noundef @.str.2), !dbg !68
  call void @klee_make_symbolic(ptr noundef %5, i64 noundef 4, ptr noundef @.str.3), !dbg !69
  call void @klee_make_symbolic(ptr noundef %6, i64 noundef 4, ptr noundef @.str.4), !dbg !70
  call void @klee_make_symbolic(ptr noundef %7, i64 noundef 4, ptr noundef @.str.5), !dbg !71
  %12 = load i32, ptr %2, align 4, !dbg !72
  %13 = icmp sge i32 %12, 0, !dbg !73
  %14 = zext i1 %13 to i32, !dbg !73
  %15 = sext i32 %14 to i64, !dbg !72
  call void @klee_assume(i64 noundef %15), !dbg !74
  %16 = load i32, ptr %2, align 4, !dbg !75
  %17 = icmp sle i32 %16, 1, !dbg !76
  %18 = zext i1 %17 to i32, !dbg !76
  %19 = sext i32 %18 to i64, !dbg !75
  call void @klee_assume(i64 noundef %19), !dbg !77
  %20 = load i32, ptr %3, align 4, !dbg !78
  %21 = icmp sge i32 %20, 0, !dbg !79
  %22 = zext i1 %21 to i32, !dbg !79
  %23 = sext i32 %22 to i64, !dbg !78
  call void @klee_assume(i64 noundef %23), !dbg !80
  %24 = load i32, ptr %3, align 4, !dbg !81
  %25 = icmp sle i32 %24, 1, !dbg !82
  %26 = zext i1 %25 to i32, !dbg !82
  %27 = sext i32 %26 to i64, !dbg !81
  call void @klee_assume(i64 noundef %27), !dbg !83
  %28 = load i32, ptr %4, align 4, !dbg !84
  %29 = icmp sge i32 %28, 0, !dbg !85
  %30 = zext i1 %29 to i32, !dbg !85
  %31 = sext i32 %30 to i64, !dbg !84
  call void @klee_assume(i64 noundef %31), !dbg !86
  %32 = load i32, ptr %4, align 4, !dbg !87
  %33 = icmp sle i32 %32, 1, !dbg !88
  %34 = zext i1 %33 to i32, !dbg !88
  %35 = sext i32 %34 to i64, !dbg !87
  call void @klee_assume(i64 noundef %35), !dbg !89
  %36 = load i32, ptr %5, align 4, !dbg !90
  %37 = icmp sge i32 %36, 0, !dbg !91
  %38 = zext i1 %37 to i32, !dbg !91
  %39 = sext i32 %38 to i64, !dbg !90
  call void @klee_assume(i64 noundef %39), !dbg !92
  %40 = load i32, ptr %5, align 4, !dbg !93
  %41 = icmp sle i32 %40, 3, !dbg !94
  %42 = zext i1 %41 to i32, !dbg !94
  %43 = sext i32 %42 to i64, !dbg !93
  call void @klee_assume(i64 noundef %43), !dbg !95
  %44 = load i32, ptr %5, align 4, !dbg !96
  %45 = icmp ne i32 %44, 2, !dbg !97
  %46 = zext i1 %45 to i32, !dbg !97
  %47 = sext i32 %46 to i64, !dbg !96
  call void @klee_assume(i64 noundef %47), !dbg !98
  %48 = load i32, ptr %6, align 4, !dbg !99
  %49 = icmp sge i32 %48, 0, !dbg !100
  %50 = zext i1 %49 to i32, !dbg !100
  %51 = sext i32 %50 to i64, !dbg !99
  call void @klee_assume(i64 noundef %51), !dbg !101
  %52 = load i32, ptr %6, align 4, !dbg !102
  %53 = icmp sle i32 %52, 1, !dbg !103
  %54 = zext i1 %53 to i32, !dbg !103
  %55 = sext i32 %54 to i64, !dbg !102
  call void @klee_assume(i64 noundef %55), !dbg !104
  %56 = load i32, ptr %7, align 4, !dbg !105
  %57 = icmp sge i32 %56, 0, !dbg !106
  %58 = zext i1 %57 to i32, !dbg !106
  %59 = sext i32 %58 to i64, !dbg !105
  call void @klee_assume(i64 noundef %59), !dbg !107
  %60 = load i32, ptr %7, align 4, !dbg !108
  %61 = icmp sle i32 %60, 1, !dbg !109
  %62 = zext i1 %61 to i32, !dbg !109
  %63 = sext i32 %62 to i64, !dbg !108
  call void @klee_assume(i64 noundef %63), !dbg !110
  call void @llvm.dbg.declare(metadata ptr %8, metadata !111, metadata !DIExpression()), !dbg !122
  %64 = load i32, ptr %2, align 4, !dbg !123
  %65 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 0, !dbg !124
  store i32 %64, ptr %65, align 4, !dbg !125
  %66 = load i32, ptr %3, align 4, !dbg !126
  %67 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 1, !dbg !127
  store i32 %66, ptr %67, align 4, !dbg !128
  %68 = load i32, ptr %4, align 4, !dbg !129
  %69 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 2, !dbg !130
  store i32 %68, ptr %69, align 4, !dbg !131
  %70 = load i32, ptr %5, align 4, !dbg !132
  %71 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 3, !dbg !133
  store i32 %70, ptr %71, align 4, !dbg !134
  %72 = load i32, ptr %6, align 4, !dbg !135
  %73 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 4, !dbg !136
  store i32 %72, ptr %73, align 4, !dbg !137
  %74 = load i32, ptr %7, align 4, !dbg !138
  %75 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 5, !dbg !139
  store i32 %74, ptr %75, align 4, !dbg !140
  %76 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 6, !dbg !141
  store i32 0, ptr %76, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata ptr %9, metadata !143, metadata !DIExpression()), !dbg !144
  %77 = call i32 @sfence_vma_spike_slice(ptr noundef %8), !dbg !145
  store i32 %77, ptr %9, align 4, !dbg !144
  call void @llvm.dbg.declare(metadata ptr %10, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata ptr %11, metadata !148, metadata !DIExpression()), !dbg !149
  call void @klee_make_symbolic(ptr noundef %10, i64 noundef 4, ptr noundef @.str.6), !dbg !150
  call void @klee_make_symbolic(ptr noundef %11, i64 noundef 4, ptr noundef @.str.7), !dbg !151
  %78 = load i32, ptr %10, align 4, !dbg !152
  %79 = load i32, ptr %9, align 4, !dbg !153
  %80 = icmp eq i32 %78, %79, !dbg !154
  %81 = zext i1 %80 to i32, !dbg !154
  %82 = sext i32 %81 to i64, !dbg !152
  call void @klee_assume(i64 noundef %82), !dbg !155
  %83 = load i32, ptr %11, align 4, !dbg !156
  %84 = getelementptr inbounds %struct.spike_state_t, ptr %8, i32 0, i32 6, !dbg !157
  %85 = load i32, ptr %84, align 4, !dbg !157
  %86 = icmp eq i32 %83, %85, !dbg !158
  %87 = zext i1 %86 to i32, !dbg !158
  %88 = sext i32 %87 to i64, !dbg !156
  call void @klee_assume(i64 noundef %88), !dbg !159
  ret i32 0, !dbg !160
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

declare void @klee_assume(i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @sfence_vma_spike_slice(ptr noundef %0) #0 !dbg !161 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata ptr %4, metadata !167, metadata !DIExpression()), !dbg !168
  %5 = load ptr, ptr %3, align 8, !dbg !169
  %6 = call i32 @require_extension_s(ptr noundef %5), !dbg !170
  store i32 %6, ptr %4, align 4, !dbg !171
  %7 = load i32, ptr %4, align 4, !dbg !172
  %8 = icmp ne i32 %7, 0, !dbg !174
  br i1 %8, label %9, label %11, !dbg !175

9:                                                ; preds = %1
  %10 = load i32, ptr %4, align 4, !dbg !176
  store i32 %10, ptr %2, align 4, !dbg !178
  br label %62, !dbg !178

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8, !dbg !179
  %13 = call i32 @require_has_mmu(ptr noundef %12), !dbg !180
  store i32 %13, ptr %4, align 4, !dbg !181
  %14 = load i32, ptr %4, align 4, !dbg !182
  %15 = icmp ne i32 %14, 0, !dbg !184
  br i1 %15, label %16, label %18, !dbg !185

16:                                               ; preds = %11
  %17 = load i32, ptr %4, align 4, !dbg !186
  store i32 %17, ptr %2, align 4, !dbg !188
  br label %62, !dbg !188

18:                                               ; preds = %11
  %19 = load ptr, ptr %3, align 8, !dbg !189
  %20 = getelementptr inbounds %struct.spike_state_t, ptr %19, i32 0, i32 2, !dbg !191
  %21 = load i32, ptr %20, align 4, !dbg !191
  %22 = icmp ne i32 %21, 0, !dbg !189
  br i1 %22, label %23, label %39, !dbg !192

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8, !dbg !193
  %25 = getelementptr inbounds %struct.spike_state_t, ptr %24, i32 0, i32 3, !dbg !196
  %26 = load i32, ptr %25, align 4, !dbg !196
  %27 = icmp eq i32 %26, 0, !dbg !197
  br i1 %27, label %28, label %30, !dbg !198

28:                                               ; preds = %23
  %29 = call i32 @require_novirt(), !dbg !199
  store i32 %29, ptr %2, align 4, !dbg !201
  br label %62, !dbg !201

30:                                               ; preds = %23
  %31 = load ptr, ptr %3, align 8, !dbg !202
  %32 = getelementptr inbounds %struct.spike_state_t, ptr %31, i32 0, i32 4, !dbg !204
  %33 = load i32, ptr %32, align 4, !dbg !204
  %34 = icmp ne i32 %33, 0, !dbg !202
  br i1 %34, label %35, label %37, !dbg !205

35:                                               ; preds = %30
  %36 = call i32 @require_novirt(), !dbg !206
  store i32 %36, ptr %2, align 4, !dbg !208
  br label %62, !dbg !208

37:                                               ; preds = %30
  %38 = load ptr, ptr %3, align 8, !dbg !209
  call void @flush_tlb(ptr noundef %38), !dbg !210
  store i32 0, ptr %2, align 4, !dbg !211
  br label %62, !dbg !211

39:                                               ; preds = %18
  %40 = load ptr, ptr %3, align 8, !dbg !212
  %41 = getelementptr inbounds %struct.spike_state_t, ptr %40, i32 0, i32 5, !dbg !214
  %42 = load i32, ptr %41, align 4, !dbg !214
  %43 = icmp ne i32 %42, 0, !dbg !212
  br i1 %43, label %44, label %53, !dbg !215

44:                                               ; preds = %39
  %45 = load ptr, ptr %3, align 8, !dbg !216
  %46 = call i32 @require_privilege(ptr noundef %45, i32 noundef 3), !dbg !218
  store i32 %46, ptr %4, align 4, !dbg !219
  %47 = load i32, ptr %4, align 4, !dbg !220
  %48 = icmp ne i32 %47, 0, !dbg !222
  br i1 %48, label %49, label %51, !dbg !223

49:                                               ; preds = %44
  %50 = load i32, ptr %4, align 4, !dbg !224
  store i32 %50, ptr %2, align 4, !dbg !226
  br label %62, !dbg !226

51:                                               ; preds = %44
  %52 = load ptr, ptr %3, align 8, !dbg !227
  call void @flush_tlb(ptr noundef %52), !dbg !228
  store i32 0, ptr %2, align 4, !dbg !229
  br label %62, !dbg !229

53:                                               ; preds = %39
  %54 = load ptr, ptr %3, align 8, !dbg !230
  %55 = call i32 @require_privilege(ptr noundef %54, i32 noundef 1), !dbg !231
  store i32 %55, ptr %4, align 4, !dbg !232
  %56 = load i32, ptr %4, align 4, !dbg !233
  %57 = icmp ne i32 %56, 0, !dbg !235
  br i1 %57, label %58, label %60, !dbg !236

58:                                               ; preds = %53
  %59 = load i32, ptr %4, align 4, !dbg !237
  store i32 %59, ptr %2, align 4, !dbg !239
  br label %62, !dbg !239

60:                                               ; preds = %53
  %61 = load ptr, ptr %3, align 8, !dbg !240
  call void @flush_tlb(ptr noundef %61), !dbg !241
  store i32 0, ptr %2, align 4, !dbg !242
  br label %62, !dbg !242

62:                                               ; preds = %60, %58, %51, %49, %37, %35, %28, %16, %9
  %63 = load i32, ptr %2, align 4, !dbg !243
  ret i32 %63, !dbg !243
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @require_extension_s(ptr noundef %0) #0 !dbg !244 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !245, metadata !DIExpression()), !dbg !246
  %4 = load ptr, ptr %3, align 8, !dbg !247
  %5 = getelementptr inbounds %struct.spike_state_t, ptr %4, i32 0, i32 0, !dbg !249
  %6 = load i32, ptr %5, align 4, !dbg !249
  %7 = icmp ne i32 %6, 0, !dbg !247
  br i1 %7, label %9, label %8, !dbg !250

8:                                                ; preds = %1
  store i32 2, ptr %2, align 4, !dbg !251
  br label %10, !dbg !251

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !253
  br label %10, !dbg !253

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4, !dbg !254
  ret i32 %11, !dbg !254
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @require_has_mmu(ptr noundef %0) #0 !dbg !255 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !256, metadata !DIExpression()), !dbg !257
  %4 = load ptr, ptr %3, align 8, !dbg !258
  %5 = getelementptr inbounds %struct.spike_state_t, ptr %4, i32 0, i32 1, !dbg !260
  %6 = load i32, ptr %5, align 4, !dbg !260
  %7 = icmp ne i32 %6, 0, !dbg !258
  br i1 %7, label %9, label %8, !dbg !261

8:                                                ; preds = %1
  store i32 2, ptr %2, align 4, !dbg !262
  br label %10, !dbg !262

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !264
  br label %10, !dbg !264

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4, !dbg !265
  ret i32 %11, !dbg !265
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @require_novirt() #0 !dbg !266 {
  ret i32 22, !dbg !267
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @flush_tlb(ptr noundef %0) #0 !dbg !268 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !271, metadata !DIExpression()), !dbg !272
  %3 = load ptr, ptr %2, align 8, !dbg !273
  %4 = getelementptr inbounds %struct.spike_state_t, ptr %3, i32 0, i32 6, !dbg !274
  store i32 1, ptr %4, align 4, !dbg !275
  ret void, !dbg !276
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @require_privilege(ptr noundef %0, i32 noundef %1) #0 !dbg !277 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !282, metadata !DIExpression()), !dbg !283
  %6 = load ptr, ptr %4, align 8, !dbg !284
  %7 = getelementptr inbounds %struct.spike_state_t, ptr %6, i32 0, i32 3, !dbg !286
  %8 = load i32, ptr %7, align 4, !dbg !286
  %9 = load i32, ptr %5, align 4, !dbg !287
  %10 = icmp slt i32 %8, %9, !dbg !288
  br i1 %10, label %11, label %12, !dbg !289

11:                                               ; preds = %2
  store i32 2, ptr %3, align 4, !dbg !290
  br label %13, !dbg !290

12:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !292
  br label %13, !dbg !292

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %3, align 4, !dbg !293
  ret i32 %14, !dbg !293
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!39}
!llvm.module.flags = !{!41, !42, !43, !44, !45, !46, !47}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 111, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "spike_sfence_vma_klee.c", directory: "/mnt/data2/februanto/charlie/framework/2/sysemu-testing/9_EXPERIMENT/33_experiment_case_study/1_derive/1_klee/sfence", checksumkind: CSK_MD5, checksum: "2207f20513400263c188b727b4640506")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 6)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 112, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 8)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 113, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 2)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 114, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 4)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 115, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 13)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 116, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 12)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(scope: null, file: !2, line: 152, type: !9, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !2, line: 153, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 16)
!39 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !40, splitDebugInlining: false, nameTableKind: None)
!40 = !{!0, !7, !12, !17, !22, !27, !32, !34}
!41 = !{i32 7, !"Dwarf Version", i32 5}
!42 = !{i32 2, !"Debug Info Version", i32 3}
!43 = !{i32 1, !"wchar_size", i32 4}
!44 = !{i32 8, !"PIC Level", i32 2}
!45 = !{i32 7, !"PIE Level", i32 2}
!46 = !{i32 7, !"uwtable", i32 2}
!47 = !{i32 7, !"frame-pointer", i32 2}
!48 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!49 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 102, type: !50, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !39, retainedNodes: !53)
!50 = !DISubroutineType(types: !51)
!51 = !{!52}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !{}
!54 = !DILocalVariable(name: "ext_s", scope: !49, file: !2, line: 104, type: !52)
!55 = !DILocation(line: 104, column: 9, scope: !49)
!56 = !DILocalVariable(name: "has_mmu", scope: !49, file: !2, line: 105, type: !52)
!57 = !DILocation(line: 105, column: 9, scope: !49)
!58 = !DILocalVariable(name: "v", scope: !49, file: !2, line: 106, type: !52)
!59 = !DILocation(line: 106, column: 9, scope: !49)
!60 = !DILocalVariable(name: "prv", scope: !49, file: !2, line: 107, type: !52)
!61 = !DILocation(line: 107, column: 9, scope: !49)
!62 = !DILocalVariable(name: "hstatus_vtvm", scope: !49, file: !2, line: 108, type: !52)
!63 = !DILocation(line: 108, column: 9, scope: !49)
!64 = !DILocalVariable(name: "mstatus_tvm", scope: !49, file: !2, line: 109, type: !52)
!65 = !DILocation(line: 109, column: 9, scope: !49)
!66 = !DILocation(line: 111, column: 5, scope: !49)
!67 = !DILocation(line: 112, column: 5, scope: !49)
!68 = !DILocation(line: 113, column: 5, scope: !49)
!69 = !DILocation(line: 114, column: 5, scope: !49)
!70 = !DILocation(line: 115, column: 5, scope: !49)
!71 = !DILocation(line: 116, column: 5, scope: !49)
!72 = !DILocation(line: 118, column: 17, scope: !49)
!73 = !DILocation(line: 118, column: 23, scope: !49)
!74 = !DILocation(line: 118, column: 5, scope: !49)
!75 = !DILocation(line: 119, column: 17, scope: !49)
!76 = !DILocation(line: 119, column: 23, scope: !49)
!77 = !DILocation(line: 119, column: 5, scope: !49)
!78 = !DILocation(line: 121, column: 17, scope: !49)
!79 = !DILocation(line: 121, column: 25, scope: !49)
!80 = !DILocation(line: 121, column: 5, scope: !49)
!81 = !DILocation(line: 122, column: 17, scope: !49)
!82 = !DILocation(line: 122, column: 25, scope: !49)
!83 = !DILocation(line: 122, column: 5, scope: !49)
!84 = !DILocation(line: 124, column: 17, scope: !49)
!85 = !DILocation(line: 124, column: 19, scope: !49)
!86 = !DILocation(line: 124, column: 5, scope: !49)
!87 = !DILocation(line: 125, column: 17, scope: !49)
!88 = !DILocation(line: 125, column: 19, scope: !49)
!89 = !DILocation(line: 125, column: 5, scope: !49)
!90 = !DILocation(line: 127, column: 17, scope: !49)
!91 = !DILocation(line: 127, column: 21, scope: !49)
!92 = !DILocation(line: 127, column: 5, scope: !49)
!93 = !DILocation(line: 128, column: 17, scope: !49)
!94 = !DILocation(line: 128, column: 21, scope: !49)
!95 = !DILocation(line: 128, column: 5, scope: !49)
!96 = !DILocation(line: 129, column: 17, scope: !49)
!97 = !DILocation(line: 129, column: 21, scope: !49)
!98 = !DILocation(line: 129, column: 5, scope: !49)
!99 = !DILocation(line: 131, column: 17, scope: !49)
!100 = !DILocation(line: 131, column: 30, scope: !49)
!101 = !DILocation(line: 131, column: 5, scope: !49)
!102 = !DILocation(line: 132, column: 17, scope: !49)
!103 = !DILocation(line: 132, column: 30, scope: !49)
!104 = !DILocation(line: 132, column: 5, scope: !49)
!105 = !DILocation(line: 134, column: 17, scope: !49)
!106 = !DILocation(line: 134, column: 29, scope: !49)
!107 = !DILocation(line: 134, column: 5, scope: !49)
!108 = !DILocation(line: 135, column: 17, scope: !49)
!109 = !DILocation(line: 135, column: 29, scope: !49)
!110 = !DILocation(line: 135, column: 5, scope: !49)
!111 = !DILocalVariable(name: "s", scope: !49, file: !2, line: 137, type: !112)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "spike_state_t", file: !2, line: 20, baseType: !113)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 12, size: 224, elements: !114)
!114 = !{!115, !116, !117, !118, !119, !120, !121}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ext_s", scope: !113, file: !2, line: 13, baseType: !52, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "has_mmu", scope: !113, file: !2, line: 14, baseType: !52, size: 32, offset: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !113, file: !2, line: 15, baseType: !52, size: 32, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "prv", scope: !113, file: !2, line: 16, baseType: !52, size: 32, offset: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "hstatus_vtvm", scope: !113, file: !2, line: 17, baseType: !52, size: 32, offset: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "mstatus_tvm", scope: !113, file: !2, line: 18, baseType: !52, size: 32, offset: 160)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tlb_flushed", scope: !113, file: !2, line: 19, baseType: !52, size: 32, offset: 192)
!122 = !DILocation(line: 137, column: 19, scope: !49)
!123 = !DILocation(line: 139, column: 15, scope: !49)
!124 = !DILocation(line: 139, column: 7, scope: !49)
!125 = !DILocation(line: 139, column: 13, scope: !49)
!126 = !DILocation(line: 140, column: 17, scope: !49)
!127 = !DILocation(line: 140, column: 7, scope: !49)
!128 = !DILocation(line: 140, column: 15, scope: !49)
!129 = !DILocation(line: 141, column: 11, scope: !49)
!130 = !DILocation(line: 141, column: 7, scope: !49)
!131 = !DILocation(line: 141, column: 9, scope: !49)
!132 = !DILocation(line: 142, column: 13, scope: !49)
!133 = !DILocation(line: 142, column: 7, scope: !49)
!134 = !DILocation(line: 142, column: 11, scope: !49)
!135 = !DILocation(line: 143, column: 22, scope: !49)
!136 = !DILocation(line: 143, column: 7, scope: !49)
!137 = !DILocation(line: 143, column: 20, scope: !49)
!138 = !DILocation(line: 144, column: 21, scope: !49)
!139 = !DILocation(line: 144, column: 7, scope: !49)
!140 = !DILocation(line: 144, column: 19, scope: !49)
!141 = !DILocation(line: 145, column: 7, scope: !49)
!142 = !DILocation(line: 145, column: 19, scope: !49)
!143 = !DILocalVariable(name: "exc", scope: !49, file: !2, line: 147, type: !52)
!144 = !DILocation(line: 147, column: 9, scope: !49)
!145 = !DILocation(line: 147, column: 15, scope: !49)
!146 = !DILocalVariable(name: "obs_exc", scope: !49, file: !2, line: 149, type: !52)
!147 = !DILocation(line: 149, column: 9, scope: !49)
!148 = !DILocalVariable(name: "obs_tlb_flushed", scope: !49, file: !2, line: 150, type: !52)
!149 = !DILocation(line: 150, column: 9, scope: !49)
!150 = !DILocation(line: 152, column: 5, scope: !49)
!151 = !DILocation(line: 153, column: 5, scope: !49)
!152 = !DILocation(line: 155, column: 17, scope: !49)
!153 = !DILocation(line: 155, column: 28, scope: !49)
!154 = !DILocation(line: 155, column: 25, scope: !49)
!155 = !DILocation(line: 155, column: 5, scope: !49)
!156 = !DILocation(line: 156, column: 17, scope: !49)
!157 = !DILocation(line: 156, column: 38, scope: !49)
!158 = !DILocation(line: 156, column: 33, scope: !49)
!159 = !DILocation(line: 156, column: 5, scope: !49)
!160 = !DILocation(line: 158, column: 5, scope: !49)
!161 = distinct !DISubprogram(name: "sfence_vma_spike_slice", scope: !2, file: !2, line: 56, type: !162, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39, retainedNodes: !53)
!162 = !DISubroutineType(types: !163)
!163 = !{!52, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!165 = !DILocalVariable(name: "s", arg: 1, scope: !161, file: !2, line: 56, type: !164)
!166 = !DILocation(line: 56, column: 50, scope: !161)
!167 = !DILocalVariable(name: "exc", scope: !161, file: !2, line: 58, type: !52)
!168 = !DILocation(line: 58, column: 9, scope: !161)
!169 = !DILocation(line: 60, column: 31, scope: !161)
!170 = !DILocation(line: 60, column: 11, scope: !161)
!171 = !DILocation(line: 60, column: 9, scope: !161)
!172 = !DILocation(line: 61, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !2, line: 61, column: 9)
!174 = !DILocation(line: 61, column: 13, scope: !173)
!175 = !DILocation(line: 61, column: 9, scope: !161)
!176 = !DILocation(line: 62, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !2, line: 61, column: 26)
!178 = !DILocation(line: 62, column: 9, scope: !177)
!179 = !DILocation(line: 65, column: 27, scope: !161)
!180 = !DILocation(line: 65, column: 11, scope: !161)
!181 = !DILocation(line: 65, column: 9, scope: !161)
!182 = !DILocation(line: 66, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !161, file: !2, line: 66, column: 9)
!184 = !DILocation(line: 66, column: 13, scope: !183)
!185 = !DILocation(line: 66, column: 9, scope: !161)
!186 = !DILocation(line: 67, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !2, line: 66, column: 26)
!188 = !DILocation(line: 67, column: 9, scope: !187)
!189 = !DILocation(line: 70, column: 9, scope: !190)
!190 = distinct !DILexicalBlock(scope: !161, file: !2, line: 70, column: 9)
!191 = !DILocation(line: 70, column: 12, scope: !190)
!192 = !DILocation(line: 70, column: 9, scope: !161)
!193 = !DILocation(line: 71, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !195, file: !2, line: 71, column: 13)
!195 = distinct !DILexicalBlock(scope: !190, file: !2, line: 70, column: 15)
!196 = !DILocation(line: 71, column: 16, scope: !194)
!197 = !DILocation(line: 71, column: 20, scope: !194)
!198 = !DILocation(line: 71, column: 13, scope: !195)
!199 = !DILocation(line: 72, column: 20, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !2, line: 71, column: 30)
!201 = !DILocation(line: 72, column: 13, scope: !200)
!202 = !DILocation(line: 75, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !195, file: !2, line: 75, column: 13)
!204 = !DILocation(line: 75, column: 16, scope: !203)
!205 = !DILocation(line: 75, column: 13, scope: !195)
!206 = !DILocation(line: 76, column: 20, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !2, line: 75, column: 30)
!208 = !DILocation(line: 76, column: 13, scope: !207)
!209 = !DILocation(line: 79, column: 19, scope: !195)
!210 = !DILocation(line: 79, column: 9, scope: !195)
!211 = !DILocation(line: 80, column: 9, scope: !195)
!212 = !DILocation(line: 83, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !161, file: !2, line: 83, column: 9)
!214 = !DILocation(line: 83, column: 12, scope: !213)
!215 = !DILocation(line: 83, column: 9, scope: !161)
!216 = !DILocation(line: 84, column: 33, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !2, line: 83, column: 25)
!218 = !DILocation(line: 84, column: 15, scope: !217)
!219 = !DILocation(line: 84, column: 13, scope: !217)
!220 = !DILocation(line: 85, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !2, line: 85, column: 13)
!222 = !DILocation(line: 85, column: 17, scope: !221)
!223 = !DILocation(line: 85, column: 13, scope: !217)
!224 = !DILocation(line: 86, column: 20, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !2, line: 85, column: 30)
!226 = !DILocation(line: 86, column: 13, scope: !225)
!227 = !DILocation(line: 89, column: 19, scope: !217)
!228 = !DILocation(line: 89, column: 9, scope: !217)
!229 = !DILocation(line: 90, column: 9, scope: !217)
!230 = !DILocation(line: 93, column: 29, scope: !161)
!231 = !DILocation(line: 93, column: 11, scope: !161)
!232 = !DILocation(line: 93, column: 9, scope: !161)
!233 = !DILocation(line: 94, column: 9, scope: !234)
!234 = distinct !DILexicalBlock(scope: !161, file: !2, line: 94, column: 9)
!235 = !DILocation(line: 94, column: 13, scope: !234)
!236 = !DILocation(line: 94, column: 9, scope: !161)
!237 = !DILocation(line: 95, column: 16, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !2, line: 94, column: 26)
!239 = !DILocation(line: 95, column: 9, scope: !238)
!240 = !DILocation(line: 98, column: 15, scope: !161)
!241 = !DILocation(line: 98, column: 5, scope: !161)
!242 = !DILocation(line: 99, column: 5, scope: !161)
!243 = !DILocation(line: 100, column: 1, scope: !161)
!244 = distinct !DISubprogram(name: "require_extension_s", scope: !2, file: !2, line: 22, type: !162, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39, retainedNodes: !53)
!245 = !DILocalVariable(name: "s", arg: 1, scope: !244, file: !2, line: 22, type: !164)
!246 = !DILocation(line: 22, column: 47, scope: !244)
!247 = !DILocation(line: 24, column: 10, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !2, line: 24, column: 9)
!249 = !DILocation(line: 24, column: 13, scope: !248)
!250 = !DILocation(line: 24, column: 9, scope: !244)
!251 = !DILocation(line: 25, column: 9, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !2, line: 24, column: 20)
!253 = !DILocation(line: 27, column: 5, scope: !244)
!254 = !DILocation(line: 28, column: 1, scope: !244)
!255 = distinct !DISubprogram(name: "require_has_mmu", scope: !2, file: !2, line: 30, type: !162, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39, retainedNodes: !53)
!256 = !DILocalVariable(name: "s", arg: 1, scope: !255, file: !2, line: 30, type: !164)
!257 = !DILocation(line: 30, column: 43, scope: !255)
!258 = !DILocation(line: 32, column: 10, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !2, line: 32, column: 9)
!260 = !DILocation(line: 32, column: 13, scope: !259)
!261 = !DILocation(line: 32, column: 9, scope: !255)
!262 = !DILocation(line: 33, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !2, line: 32, column: 22)
!264 = !DILocation(line: 35, column: 5, scope: !255)
!265 = !DILocation(line: 36, column: 1, scope: !255)
!266 = distinct !DISubprogram(name: "require_novirt", scope: !2, file: !2, line: 46, type: !50, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39)
!267 = !DILocation(line: 48, column: 5, scope: !266)
!268 = distinct !DISubprogram(name: "flush_tlb", scope: !2, file: !2, line: 51, type: !269, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39, retainedNodes: !53)
!269 = !DISubroutineType(types: !270)
!270 = !{null, !164}
!271 = !DILocalVariable(name: "s", arg: 1, scope: !268, file: !2, line: 51, type: !164)
!272 = !DILocation(line: 51, column: 38, scope: !268)
!273 = !DILocation(line: 53, column: 5, scope: !268)
!274 = !DILocation(line: 53, column: 8, scope: !268)
!275 = !DILocation(line: 53, column: 20, scope: !268)
!276 = !DILocation(line: 54, column: 1, scope: !268)
!277 = distinct !DISubprogram(name: "require_privilege", scope: !2, file: !2, line: 38, type: !278, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !39, retainedNodes: !53)
!278 = !DISubroutineType(types: !279)
!279 = !{!52, !164, !52}
!280 = !DILocalVariable(name: "s", arg: 1, scope: !277, file: !2, line: 38, type: !164)
!281 = !DILocation(line: 38, column: 45, scope: !277)
!282 = !DILocalVariable(name: "required", arg: 2, scope: !277, file: !2, line: 38, type: !52)
!283 = !DILocation(line: 38, column: 52, scope: !277)
!284 = !DILocation(line: 40, column: 9, scope: !285)
!285 = distinct !DILexicalBlock(scope: !277, file: !2, line: 40, column: 9)
!286 = !DILocation(line: 40, column: 12, scope: !285)
!287 = !DILocation(line: 40, column: 18, scope: !285)
!288 = !DILocation(line: 40, column: 16, scope: !285)
!289 = !DILocation(line: 40, column: 9, scope: !277)
!290 = !DILocation(line: 41, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !285, file: !2, line: 40, column: 28)
!292 = !DILocation(line: 43, column: 5, scope: !277)
!293 = !DILocation(line: 44, column: 1, scope: !277)
