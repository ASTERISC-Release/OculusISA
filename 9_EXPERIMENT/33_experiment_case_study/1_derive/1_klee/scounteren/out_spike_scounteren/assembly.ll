; ModuleID = 'spike_scounteren_klee.bc'
source_filename = "spike_scounteren_klee.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"op_idx\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"ext_s\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"ext_zicntr\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"ext_zihpm\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"prv_idx\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"counter_idx\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"old_scounteren\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"write_val\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"mcounteren\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"hcounteren\00", align 1
@.str.11 = private unnamed_addr constant [23 x i8] c"scounteren_for_counter\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"obs_op\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"obs_ext_s\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"obs_ext_zicntr\00", align 1
@.str.15 = private unnamed_addr constant [14 x i8] c"obs_ext_zihpm\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"obs_v\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"obs_prv\00", align 1
@.str.18 = private unnamed_addr constant [16 x i8] c"obs_counter_idx\00", align 1
@.str.19 = private unnamed_addr constant [19 x i8] c"obs_old_scounteren\00", align 1
@.str.20 = private unnamed_addr constant [14 x i8] c"obs_write_val\00", align 1
@.str.21 = private unnamed_addr constant [15 x i8] c"obs_mcounteren\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"obs_hcounteren\00", align 1
@.str.23 = private unnamed_addr constant [27 x i8] c"obs_scounteren_for_counter\00", align 1
@.str.24 = private unnamed_addr constant [19 x i8] c"obs_counteren_mask\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"obs_new_scounteren\00", align 1
@.str.26 = private unnamed_addr constant [15 x i8] c"obs_read_value\00", align 1
@.str.27 = private unnamed_addr constant [12 x i8] c"obs_mctr_ok\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"obs_hctr_ok\00", align 1
@.str.29 = private unnamed_addr constant [12 x i8] c"obs_sctr_ok\00", align 1
@.str.30 = private unnamed_addr constant [19 x i8] c"obs_counter_exists\00", align 1
@.str.31 = private unnamed_addr constant [8 x i8] c"obs_exc\00", align 1
@.str.32 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1, !dbg !0
@.str.1.33 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1, !dbg !8
@.str.2.34 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1, !dbg !13

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @klee_make_symbolic(ptr noundef %2, i64 noundef 4, ptr noundef @.str)
  call void @klee_make_symbolic(ptr noundef %3, i64 noundef 4, ptr noundef @.str.1)
  call void @klee_make_symbolic(ptr noundef %4, i64 noundef 4, ptr noundef @.str.2)
  call void @klee_make_symbolic(ptr noundef %5, i64 noundef 4, ptr noundef @.str.3)
  call void @klee_make_symbolic(ptr noundef %6, i64 noundef 4, ptr noundef @.str.4)
  call void @klee_make_symbolic(ptr noundef %7, i64 noundef 4, ptr noundef @.str.5)
  call void @klee_make_symbolic(ptr noundef %8, i64 noundef 4, ptr noundef @.str.6)
  call void @klee_make_symbolic(ptr noundef %9, i64 noundef 4, ptr noundef @.str.7)
  call void @klee_make_symbolic(ptr noundef %10, i64 noundef 4, ptr noundef @.str.8)
  call void @klee_make_symbolic(ptr noundef %11, i64 noundef 4, ptr noundef @.str.9)
  call void @klee_make_symbolic(ptr noundef %12, i64 noundef 4, ptr noundef @.str.10)
  call void @klee_make_symbolic(ptr noundef %13, i64 noundef 4, ptr noundef @.str.11)
  %44 = load i32, ptr %2, align 4
  %45 = icmp sge i32 %44, 0
  %46 = zext i1 %45 to i32
  %47 = sext i32 %46 to i64
  call void @klee_assume(i64 noundef %47)
  %48 = load i32, ptr %2, align 4
  %49 = icmp sle i32 %48, 2
  %50 = zext i1 %49 to i32
  %51 = sext i32 %50 to i64
  call void @klee_assume(i64 noundef %51)
  %52 = load i32, ptr %3, align 4
  %53 = icmp sge i32 %52, 0
  %54 = zext i1 %53 to i32
  %55 = sext i32 %54 to i64
  call void @klee_assume(i64 noundef %55)
  %56 = load i32, ptr %3, align 4
  %57 = icmp sle i32 %56, 1
  %58 = zext i1 %57 to i32
  %59 = sext i32 %58 to i64
  call void @klee_assume(i64 noundef %59)
  %60 = load i32, ptr %4, align 4
  %61 = icmp sge i32 %60, 0
  %62 = zext i1 %61 to i32
  %63 = sext i32 %62 to i64
  call void @klee_assume(i64 noundef %63)
  %64 = load i32, ptr %4, align 4
  %65 = icmp sle i32 %64, 1
  %66 = zext i1 %65 to i32
  %67 = sext i32 %66 to i64
  call void @klee_assume(i64 noundef %67)
  %68 = load i32, ptr %5, align 4
  %69 = icmp sge i32 %68, 0
  %70 = zext i1 %69 to i32
  %71 = sext i32 %70 to i64
  call void @klee_assume(i64 noundef %71)
  %72 = load i32, ptr %5, align 4
  %73 = icmp sle i32 %72, 1
  %74 = zext i1 %73 to i32
  %75 = sext i32 %74 to i64
  call void @klee_assume(i64 noundef %75)
  %76 = load i32, ptr %6, align 4
  %77 = icmp sge i32 %76, 0
  %78 = zext i1 %77 to i32
  %79 = sext i32 %78 to i64
  call void @klee_assume(i64 noundef %79)
  %80 = load i32, ptr %6, align 4
  %81 = icmp sle i32 %80, 1
  %82 = zext i1 %81 to i32
  %83 = sext i32 %82 to i64
  call void @klee_assume(i64 noundef %83)
  %84 = load i32, ptr %7, align 4
  %85 = icmp sge i32 %84, 0
  %86 = zext i1 %85 to i32
  %87 = sext i32 %86 to i64
  call void @klee_assume(i64 noundef %87)
  %88 = load i32, ptr %7, align 4
  %89 = icmp sle i32 %88, 2
  %90 = zext i1 %89 to i32
  %91 = sext i32 %90 to i64
  call void @klee_assume(i64 noundef %91)
  %92 = load i32, ptr %8, align 4
  %93 = icmp sge i32 %92, 0
  %94 = zext i1 %93 to i32
  %95 = sext i32 %94 to i64
  call void @klee_assume(i64 noundef %95)
  %96 = load i32, ptr %8, align 4
  %97 = icmp sle i32 %96, 31
  %98 = zext i1 %97 to i32
  %99 = sext i32 %98 to i64
  call void @klee_assume(i64 noundef %99)
  %100 = load i32, ptr %2, align 4
  %101 = call i32 @map_op(i32 noundef %100)
  store i32 %101, ptr %14, align 4
  %102 = load i32, ptr %7, align 4
  %103 = call i32 @map_prv(i32 noundef %102)
  store i32 %103, ptr %15, align 4
  %104 = load i32, ptr %9, align 4
  store i32 %104, ptr %16, align 4
  store i32 0, ptr %17, align 4
  %105 = load i32, ptr %4, align 4
  %106 = load i32, ptr %5, align 4
  %107 = call i32 @counteren_mask(i32 noundef %105, i32 noundef %106)
  store i32 %107, ptr %18, align 4
  store i32 1, ptr %19, align 4
  store i32 1, ptr %20, align 4
  store i32 1, ptr %21, align 4
  store i32 1, ptr %22, align 4
  store i32 0, ptr %23, align 4
  %108 = load i32, ptr %14, align 4
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %119

110:                                              ; preds = %0
  %111 = load i32, ptr %3, align 4
  %112 = load i32, ptr %4, align 4
  %113 = load i32, ptr %5, align 4
  %114 = load i32, ptr %6, align 4
  %115 = load i32, ptr %15, align 4
  %116 = load i32, ptr %9, align 4
  %117 = load i32, ptr %10, align 4
  %118 = call i32 @write_scounteren_slice(i32 noundef %111, i32 noundef %112, i32 noundef %113, i32 noundef %114, i32 noundef %115, i32 noundef %116, i32 noundef %117, ptr noundef %16, ptr noundef %18)
  store i32 %118, ptr %23, align 4
  br label %140

119:                                              ; preds = %0
  %120 = load i32, ptr %14, align 4
  %121 = icmp eq i32 %120, 1
  br i1 %121, label %122, label %128

122:                                              ; preds = %119
  %123 = load i32, ptr %3, align 4
  %124 = load i32, ptr %6, align 4
  %125 = load i32, ptr %15, align 4
  %126 = load i32, ptr %9, align 4
  %127 = call i32 @read_scounteren_slice(i32 noundef %123, i32 noundef %124, i32 noundef %125, i32 noundef %126, ptr noundef %17)
  store i32 %127, ptr %23, align 4
  br label %139

128:                                              ; preds = %119
  %129 = load i32, ptr %3, align 4
  %130 = load i32, ptr %4, align 4
  %131 = load i32, ptr %5, align 4
  %132 = load i32, ptr %6, align 4
  %133 = load i32, ptr %15, align 4
  %134 = load i32, ptr %8, align 4
  %135 = load i32, ptr %11, align 4
  %136 = load i32, ptr %12, align 4
  %137 = load i32, ptr %13, align 4
  %138 = call i32 @read_counter_proxy_slice(i32 noundef %129, i32 noundef %130, i32 noundef %131, i32 noundef %132, i32 noundef %133, i32 noundef %134, i32 noundef %135, i32 noundef %136, i32 noundef %137, ptr noundef %19, ptr noundef %20, ptr noundef %21, ptr noundef %22)
  store i32 %138, ptr %23, align 4
  br label %139

139:                                              ; preds = %128, %122
  br label %140

140:                                              ; preds = %139, %110
  call void @klee_make_symbolic(ptr noundef %24, i64 noundef 4, ptr noundef @.str.12)
  call void @klee_make_symbolic(ptr noundef %25, i64 noundef 4, ptr noundef @.str.13)
  call void @klee_make_symbolic(ptr noundef %26, i64 noundef 4, ptr noundef @.str.14)
  call void @klee_make_symbolic(ptr noundef %27, i64 noundef 4, ptr noundef @.str.15)
  call void @klee_make_symbolic(ptr noundef %28, i64 noundef 4, ptr noundef @.str.16)
  call void @klee_make_symbolic(ptr noundef %29, i64 noundef 4, ptr noundef @.str.17)
  call void @klee_make_symbolic(ptr noundef %30, i64 noundef 4, ptr noundef @.str.18)
  call void @klee_make_symbolic(ptr noundef %31, i64 noundef 4, ptr noundef @.str.19)
  call void @klee_make_symbolic(ptr noundef %32, i64 noundef 4, ptr noundef @.str.20)
  call void @klee_make_symbolic(ptr noundef %33, i64 noundef 4, ptr noundef @.str.21)
  call void @klee_make_symbolic(ptr noundef %34, i64 noundef 4, ptr noundef @.str.22)
  call void @klee_make_symbolic(ptr noundef %35, i64 noundef 4, ptr noundef @.str.23)
  call void @klee_make_symbolic(ptr noundef %36, i64 noundef 4, ptr noundef @.str.24)
  call void @klee_make_symbolic(ptr noundef %37, i64 noundef 4, ptr noundef @.str.25)
  call void @klee_make_symbolic(ptr noundef %38, i64 noundef 4, ptr noundef @.str.26)
  call void @klee_make_symbolic(ptr noundef %39, i64 noundef 4, ptr noundef @.str.27)
  call void @klee_make_symbolic(ptr noundef %40, i64 noundef 4, ptr noundef @.str.28)
  call void @klee_make_symbolic(ptr noundef %41, i64 noundef 4, ptr noundef @.str.29)
  call void @klee_make_symbolic(ptr noundef %42, i64 noundef 4, ptr noundef @.str.30)
  call void @klee_make_symbolic(ptr noundef %43, i64 noundef 4, ptr noundef @.str.31)
  %141 = load i32, ptr %24, align 4
  %142 = load i32, ptr %14, align 4
  %143 = icmp eq i32 %141, %142
  %144 = zext i1 %143 to i32
  %145 = sext i32 %144 to i64
  call void @klee_assume(i64 noundef %145)
  %146 = load i32, ptr %25, align 4
  %147 = load i32, ptr %3, align 4
  %148 = icmp eq i32 %146, %147
  %149 = zext i1 %148 to i32
  %150 = sext i32 %149 to i64
  call void @klee_assume(i64 noundef %150)
  %151 = load i32, ptr %26, align 4
  %152 = load i32, ptr %4, align 4
  %153 = icmp eq i32 %151, %152
  %154 = zext i1 %153 to i32
  %155 = sext i32 %154 to i64
  call void @klee_assume(i64 noundef %155)
  %156 = load i32, ptr %27, align 4
  %157 = load i32, ptr %5, align 4
  %158 = icmp eq i32 %156, %157
  %159 = zext i1 %158 to i32
  %160 = sext i32 %159 to i64
  call void @klee_assume(i64 noundef %160)
  %161 = load i32, ptr %28, align 4
  %162 = load i32, ptr %6, align 4
  %163 = icmp eq i32 %161, %162
  %164 = zext i1 %163 to i32
  %165 = sext i32 %164 to i64
  call void @klee_assume(i64 noundef %165)
  %166 = load i32, ptr %29, align 4
  %167 = load i32, ptr %15, align 4
  %168 = icmp eq i32 %166, %167
  %169 = zext i1 %168 to i32
  %170 = sext i32 %169 to i64
  call void @klee_assume(i64 noundef %170)
  %171 = load i32, ptr %30, align 4
  %172 = load i32, ptr %8, align 4
  %173 = icmp eq i32 %171, %172
  %174 = zext i1 %173 to i32
  %175 = sext i32 %174 to i64
  call void @klee_assume(i64 noundef %175)
  %176 = load i32, ptr %31, align 4
  %177 = load i32, ptr %9, align 4
  %178 = icmp eq i32 %176, %177
  %179 = zext i1 %178 to i32
  %180 = sext i32 %179 to i64
  call void @klee_assume(i64 noundef %180)
  %181 = load i32, ptr %32, align 4
  %182 = load i32, ptr %10, align 4
  %183 = icmp eq i32 %181, %182
  %184 = zext i1 %183 to i32
  %185 = sext i32 %184 to i64
  call void @klee_assume(i64 noundef %185)
  %186 = load i32, ptr %33, align 4
  %187 = load i32, ptr %11, align 4
  %188 = icmp eq i32 %186, %187
  %189 = zext i1 %188 to i32
  %190 = sext i32 %189 to i64
  call void @klee_assume(i64 noundef %190)
  %191 = load i32, ptr %34, align 4
  %192 = load i32, ptr %12, align 4
  %193 = icmp eq i32 %191, %192
  %194 = zext i1 %193 to i32
  %195 = sext i32 %194 to i64
  call void @klee_assume(i64 noundef %195)
  %196 = load i32, ptr %35, align 4
  %197 = load i32, ptr %13, align 4
  %198 = icmp eq i32 %196, %197
  %199 = zext i1 %198 to i32
  %200 = sext i32 %199 to i64
  call void @klee_assume(i64 noundef %200)
  %201 = load i32, ptr %36, align 4
  %202 = load i32, ptr %18, align 4
  %203 = icmp eq i32 %201, %202
  %204 = zext i1 %203 to i32
  %205 = sext i32 %204 to i64
  call void @klee_assume(i64 noundef %205)
  %206 = load i32, ptr %37, align 4
  %207 = load i32, ptr %16, align 4
  %208 = icmp eq i32 %206, %207
  %209 = zext i1 %208 to i32
  %210 = sext i32 %209 to i64
  call void @klee_assume(i64 noundef %210)
  %211 = load i32, ptr %38, align 4
  %212 = load i32, ptr %17, align 4
  %213 = icmp eq i32 %211, %212
  %214 = zext i1 %213 to i32
  %215 = sext i32 %214 to i64
  call void @klee_assume(i64 noundef %215)
  %216 = load i32, ptr %39, align 4
  %217 = load i32, ptr %19, align 4
  %218 = icmp eq i32 %216, %217
  %219 = zext i1 %218 to i32
  %220 = sext i32 %219 to i64
  call void @klee_assume(i64 noundef %220)
  %221 = load i32, ptr %40, align 4
  %222 = load i32, ptr %20, align 4
  %223 = icmp eq i32 %221, %222
  %224 = zext i1 %223 to i32
  %225 = sext i32 %224 to i64
  call void @klee_assume(i64 noundef %225)
  %226 = load i32, ptr %41, align 4
  %227 = load i32, ptr %21, align 4
  %228 = icmp eq i32 %226, %227
  %229 = zext i1 %228 to i32
  %230 = sext i32 %229 to i64
  call void @klee_assume(i64 noundef %230)
  %231 = load i32, ptr %42, align 4
  %232 = load i32, ptr %22, align 4
  %233 = icmp eq i32 %231, %232
  %234 = zext i1 %233 to i32
  %235 = sext i32 %234 to i64
  call void @klee_assume(i64 noundef %235)
  %236 = load i32, ptr %43, align 4
  %237 = load i32, ptr %23, align 4
  %238 = icmp eq i32 %236, %237
  %239 = zext i1 %238 to i32
  %240 = sext i32 %239 to i64
  call void @klee_assume(i64 noundef %240)
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

declare void @klee_assume(i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_op(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %2, align 4
  br label %12

11:                                               ; preds = %7
  store i32 2, ptr %2, align 4
  br label %12

12:                                               ; preds = %11, %10, %6
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_prv(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %2, align 4
  br label %12

11:                                               ; preds = %7
  store i32 3, ptr %2, align 4
  br label %12

12:                                               ; preds = %11, %10, %6
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @counteren_mask(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = or i32 %9, 7
  store i32 %10, ptr %5, align 4
  br label %11

11:                                               ; preds = %8, %2
  %12 = load i32, ptr %4, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = or i32 %15, -8
  store i32 %16, ptr %5, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %5, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @write_scounteren_slice(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, ptr noundef %7, ptr noundef %8) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %2, ptr %13, align 4
  store i32 %3, ptr %14, align 4
  store i32 %4, ptr %15, align 4
  store i32 %5, ptr %16, align 4
  store i32 %6, ptr %17, align 4
  store ptr %7, ptr %18, align 8
  store ptr %8, ptr %19, align 8
  %22 = load i32, ptr %11, align 4
  %23 = load i32, ptr %14, align 4
  %24 = load i32, ptr %15, align 4
  %25 = call i32 @direct_scounteren_permission(i32 noundef %22, i32 noundef %23, i32 noundef %24)
  store i32 %25, ptr %20, align 4
  %26 = load i32, ptr %12, align 4
  %27 = load i32, ptr %13, align 4
  %28 = call i32 @counteren_mask(i32 noundef %26, i32 noundef %27)
  store i32 %28, ptr %21, align 4
  %29 = load i32, ptr %21, align 4
  %30 = load ptr, ptr %19, align 8
  store i32 %29, ptr %30, align 4
  %31 = load i32, ptr %16, align 4
  %32 = load ptr, ptr %18, align 8
  store i32 %31, ptr %32, align 4
  %33 = load i32, ptr %20, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %9
  %36 = load i32, ptr %20, align 4
  store i32 %36, ptr %10, align 4
  br label %43

37:                                               ; preds = %9
  %38 = load i32, ptr %16, align 4
  %39 = load i32, ptr %17, align 4
  %40 = load i32, ptr %21, align 4
  %41 = call i32 @masked_scounteren_write(i32 noundef %38, i32 noundef %39, i32 noundef %40)
  %42 = load ptr, ptr %18, align 8
  store i32 %41, ptr %42, align 4
  store i32 0, ptr %10, align 4
  br label %43

43:                                               ; preds = %37, %35
  %44 = load i32, ptr %10, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @read_scounteren_slice(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %8, align 4
  %15 = load i32, ptr %9, align 4
  %16 = call i32 @direct_scounteren_permission(i32 noundef %13, i32 noundef %14, i32 noundef %15)
  store i32 %16, ptr %12, align 4
  %17 = load ptr, ptr %11, align 8
  store i32 0, ptr %17, align 4
  %18 = load i32, ptr %12, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %5
  %21 = load i32, ptr %12, align 4
  store i32 %21, ptr %6, align 4
  br label %25

22:                                               ; preds = %5
  %23 = load i32, ptr %10, align 4
  %24 = load ptr, ptr %11, align 8
  store i32 %23, ptr %24, align 4
  store i32 0, ptr %6, align 4
  br label %25

25:                                               ; preds = %22, %20
  %26 = load i32, ptr %6, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @read_counter_proxy_slice(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12) #0 {
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  store i32 %0, ptr %15, align 4
  store i32 %1, ptr %16, align 4
  store i32 %2, ptr %17, align 4
  store i32 %3, ptr %18, align 4
  store i32 %4, ptr %19, align 4
  store i32 %5, ptr %20, align 4
  store i32 %6, ptr %21, align 4
  store i32 %7, ptr %22, align 4
  store i32 %8, ptr %23, align 4
  store ptr %9, ptr %24, align 8
  store ptr %10, ptr %25, align 8
  store ptr %11, ptr %26, align 8
  store ptr %12, ptr %27, align 8
  %32 = load i32, ptr %20, align 4
  %33 = load i32, ptr %16, align 4
  %34 = load i32, ptr %17, align 4
  %35 = call i32 @counter_exists(i32 noundef %32, i32 noundef %33, i32 noundef %34)
  store i32 %35, ptr %28, align 4
  store i32 1, ptr %29, align 4
  store i32 1, ptr %30, align 4
  store i32 1, ptr %31, align 4
  %36 = load i32, ptr %28, align 4
  %37 = load ptr, ptr %27, align 8
  store i32 %36, ptr %37, align 4
  %38 = load ptr, ptr %24, align 8
  store i32 1, ptr %38, align 4
  %39 = load ptr, ptr %25, align 8
  store i32 1, ptr %39, align 4
  %40 = load ptr, ptr %26, align 8
  store i32 1, ptr %40, align 4
  %41 = load i32, ptr %28, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %44, label %43

43:                                               ; preds = %13
  store i32 2, ptr %14, align 4
  br label %87

44:                                               ; preds = %13
  %45 = load i32, ptr %19, align 4
  %46 = icmp slt i32 %45, 3
  br i1 %46, label %47, label %51

47:                                               ; preds = %44
  %48 = load i32, ptr %21, align 4
  %49 = load i32, ptr %20, align 4
  %50 = call i32 @bit_enabled(i32 noundef %48, i32 noundef %49)
  store i32 %50, ptr %29, align 4
  br label %51

51:                                               ; preds = %47, %44
  %52 = load i32, ptr %18, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %51
  %55 = load i32, ptr %22, align 4
  %56 = load i32, ptr %20, align 4
  %57 = call i32 @bit_enabled(i32 noundef %55, i32 noundef %56)
  store i32 %57, ptr %30, align 4
  br label %58

58:                                               ; preds = %54, %51
  %59 = load i32, ptr %15, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %68

61:                                               ; preds = %58
  %62 = load i32, ptr %19, align 4
  %63 = icmp slt i32 %62, 1
  br i1 %63, label %64, label %68

64:                                               ; preds = %61
  %65 = load i32, ptr %23, align 4
  %66 = load i32, ptr %20, align 4
  %67 = call i32 @bit_enabled(i32 noundef %65, i32 noundef %66)
  store i32 %67, ptr %31, align 4
  br label %68

68:                                               ; preds = %64, %61, %58
  %69 = load i32, ptr %29, align 4
  %70 = load ptr, ptr %24, align 8
  store i32 %69, ptr %70, align 4
  %71 = load i32, ptr %30, align 4
  %72 = load ptr, ptr %25, align 8
  store i32 %71, ptr %72, align 4
  %73 = load i32, ptr %31, align 4
  %74 = load ptr, ptr %26, align 8
  store i32 %73, ptr %74, align 4
  %75 = load i32, ptr %29, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %78, label %77

77:                                               ; preds = %68
  store i32 2, ptr %14, align 4
  br label %87

78:                                               ; preds = %68
  %79 = load i32, ptr %30, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %82, label %81

81:                                               ; preds = %78
  store i32 22, ptr %14, align 4
  br label %87

82:                                               ; preds = %78
  %83 = load i32, ptr %31, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %86, label %85

85:                                               ; preds = %82
  store i32 2, ptr %14, align 4
  br label %87

86:                                               ; preds = %82
  store i32 0, ptr %14, align 4
  br label %87

87:                                               ; preds = %86, %85, %81, %77, %43
  %88 = load i32, ptr %14, align 4
  ret i32 %88
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @direct_scounteren_permission(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %3
  store i32 2, ptr %4, align 4
  br label %20

11:                                               ; preds = %3
  %12 = load i32, ptr %6, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 22, ptr %4, align 4
  br label %20

15:                                               ; preds = %11
  %16 = load i32, ptr %7, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i32 2, ptr %4, align 4
  br label %20

19:                                               ; preds = %15
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %19, %18, %14, %10
  %21 = load i32, ptr %4, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @masked_scounteren_write(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = xor i32 %8, -1
  %10 = and i32 %7, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = and i32 %11, %12
  %14 = or i32 %10, %13
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @counter_exists(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = icmp sle i32 %11, 2
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %6, align 4
  store i32 %14, ptr %4, align 4
  br label %24

15:                                               ; preds = %10, %3
  %16 = load i32, ptr %5, align 4
  %17 = icmp sge i32 %16, 3
  br i1 %17, label %18, label %23

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = icmp sle i32 %19, 31
  br i1 %20, label %21, label %23

21:                                               ; preds = %18
  %22 = load i32, ptr %7, align 4
  store i32 %22, ptr %4, align 4
  br label %24

23:                                               ; preds = %18, %15
  store i32 0, ptr %4, align 4
  br label %24

24:                                               ; preds = %23, %21, %13
  %25 = load i32, ptr %4, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bit_enabled(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @counter_bit_mask(i32 noundef %6)
  store i32 %7, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %5, align 4
  %10 = and i32 %8, %9
  %11 = icmp ne i32 %10, 0
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @counter_bit_mask(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = and i32 %3, 31
  %int_cast_to_i64 = zext i32 %4 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %5 = shl i32 1, %4, !klee.check.shift !29
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_overshift_check(i64 noundef %0, i64 noundef %1) #2 !dbg !30 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !35, metadata !DIExpression()), !dbg !36
  store i64 %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  %5 = load i64, ptr %4, align 8, !dbg !39
  %6 = load i64, ptr %3, align 8, !dbg !41
  %7 = icmp uge i64 %5, %6, !dbg !42
  br i1 %7, label %8, label %9, !dbg !43

8:                                                ; preds = %2
  call void @klee_report_error(ptr noundef @.str.32, i32 noundef 0, ptr noundef @.str.1.33, ptr noundef @.str.2.34) #5, !dbg !44
  unreachable, !dbg !44

9:                                                ; preds = %2
  ret void, !dbg !46
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: noreturn
declare void @klee_report_error(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }

!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25, !25}
!llvm.dbg.cu = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "runtime/Intrinsic/klee_overshift_check.c", directory: "/mnt/data2/EMULATOR/misc/klee", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 8)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 16)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 14)
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 2}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{!"Ubuntu clang version 16.0.6 (23ubuntu4)"}
!26 = distinct !DICompileUnit(language: DW_LANG_C89, file: !27, producer: "Ubuntu clang version 16.0.6 (23ubuntu4)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !28, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "/mnt/data2/EMULATOR/misc/klee/runtime/Intrinsic/klee_overshift_check.c", directory: "/mnt/data2/EMULATOR/misc/klee/build/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "5666ed772284910b5d0f856859e4d123")
!28 = !{!0, !8, !13}
!29 = !{!"True"}
!30 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2, file: !2, line: 20, type: !31, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !34)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33, !33}
!33 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!34 = !{}
!35 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !30, file: !2, line: 20, type: !33)
!36 = !DILocation(line: 20, column: 46, scope: !30)
!37 = !DILocalVariable(name: "shift", arg: 2, scope: !30, file: !2, line: 20, type: !33)
!38 = !DILocation(line: 20, column: 75, scope: !30)
!39 = !DILocation(line: 21, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !30, file: !2, line: 21, column: 7)
!41 = !DILocation(line: 21, column: 16, scope: !40)
!42 = !DILocation(line: 21, column: 13, scope: !40)
!43 = !DILocation(line: 21, column: 7, scope: !30)
!44 = !DILocation(line: 27, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !2, line: 21, column: 26)
!46 = !DILocation(line: 29, column: 1, scope: !30)
