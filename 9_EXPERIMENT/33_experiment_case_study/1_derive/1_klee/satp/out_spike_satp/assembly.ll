; ModuleID = 'spike_satp_klee.bc'
source_filename = "spike_satp_klee.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"has_mmu_idx\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"v_idx\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"prv_idx\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"hstatus_vtvm_idx\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"mstatus_tvm_idx\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"impl_mmu_asid_idx\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"max_vaddr_bits_idx\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"paddr_bits_idx\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"satp_old_mode_idx\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"satp_old_asid\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"satp_old_ppn\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"vsatp_old_mode_idx\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"vsatp_old_asid\00", align 1
@.str.13 = private unnamed_addr constant [14 x i8] c"vsatp_old_ppn\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"write_mode_idx\00", align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"write_asid\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"write_ppn\00", align 1
@.str.17 = private unnamed_addr constant [12 x i8] c"obs_has_mmu\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"obs_v\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"obs_prv\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"obs_hstatus_vtvm\00", align 1
@.str.21 = private unnamed_addr constant [16 x i8] c"obs_mstatus_tvm\00", align 1
@.str.22 = private unnamed_addr constant [18 x i8] c"obs_impl_mmu_asid\00", align 1
@.str.23 = private unnamed_addr constant [19 x i8] c"obs_max_vaddr_bits\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"obs_paddr_bits\00", align 1
@.str.25 = private unnamed_addr constant [18 x i8] c"obs_satp_old_mode\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"obs_vsatp_old_mode\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"obs_write_mode\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"obs_exc\00", align 1
@.str.29 = private unnamed_addr constant [16 x i8] c"obs_tlb_flushed\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"obs_target_is_vsatp\00", align 1
@.str.31 = private unnamed_addr constant [18 x i8] c"obs_satp_new_mode\00", align 1
@.str.32 = private unnamed_addr constant [18 x i8] c"obs_satp_new_asid\00", align 1
@.str.33 = private unnamed_addr constant [17 x i8] c"obs_satp_new_ppn\00", align 1
@.str.34 = private unnamed_addr constant [19 x i8] c"obs_vsatp_new_mode\00", align 1
@.str.35 = private unnamed_addr constant [19 x i8] c"obs_vsatp_new_asid\00", align 1
@.str.36 = private unnamed_addr constant [18 x i8] c"obs_vsatp_new_ppn\00", align 1

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
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca i32, align 4
  %57 = alloca i32, align 4
  %58 = alloca i32, align 4
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
  call void @klee_make_symbolic(ptr noundef %14, i64 noundef 4, ptr noundef @.str.12)
  call void @klee_make_symbolic(ptr noundef %15, i64 noundef 4, ptr noundef @.str.13)
  call void @klee_make_symbolic(ptr noundef %16, i64 noundef 4, ptr noundef @.str.14)
  call void @klee_make_symbolic(ptr noundef %17, i64 noundef 4, ptr noundef @.str.15)
  call void @klee_make_symbolic(ptr noundef %18, i64 noundef 4, ptr noundef @.str.16)
  %59 = load i32, ptr %2, align 4
  %60 = icmp sge i32 %59, 0
  %61 = zext i1 %60 to i32
  %62 = sext i32 %61 to i64
  call void @klee_assume(i64 noundef %62)
  %63 = load i32, ptr %2, align 4
  %64 = icmp sle i32 %63, 1
  %65 = zext i1 %64 to i32
  %66 = sext i32 %65 to i64
  call void @klee_assume(i64 noundef %66)
  %67 = load i32, ptr %3, align 4
  %68 = icmp sge i32 %67, 0
  %69 = zext i1 %68 to i32
  %70 = sext i32 %69 to i64
  call void @klee_assume(i64 noundef %70)
  %71 = load i32, ptr %3, align 4
  %72 = icmp sle i32 %71, 1
  %73 = zext i1 %72 to i32
  %74 = sext i32 %73 to i64
  call void @klee_assume(i64 noundef %74)
  %75 = load i32, ptr %4, align 4
  %76 = icmp sge i32 %75, 0
  %77 = zext i1 %76 to i32
  %78 = sext i32 %77 to i64
  call void @klee_assume(i64 noundef %78)
  %79 = load i32, ptr %4, align 4
  %80 = icmp sle i32 %79, 1
  %81 = zext i1 %80 to i32
  %82 = sext i32 %81 to i64
  call void @klee_assume(i64 noundef %82)
  %83 = load i32, ptr %5, align 4
  %84 = icmp sge i32 %83, 0
  %85 = zext i1 %84 to i32
  %86 = sext i32 %85 to i64
  call void @klee_assume(i64 noundef %86)
  %87 = load i32, ptr %5, align 4
  %88 = icmp sle i32 %87, 1
  %89 = zext i1 %88 to i32
  %90 = sext i32 %89 to i64
  call void @klee_assume(i64 noundef %90)
  %91 = load i32, ptr %6, align 4
  %92 = icmp sge i32 %91, 0
  %93 = zext i1 %92 to i32
  %94 = sext i32 %93 to i64
  call void @klee_assume(i64 noundef %94)
  %95 = load i32, ptr %6, align 4
  %96 = icmp sle i32 %95, 1
  %97 = zext i1 %96 to i32
  %98 = sext i32 %97 to i64
  call void @klee_assume(i64 noundef %98)
  %99 = load i32, ptr %7, align 4
  %100 = icmp sge i32 %99, 0
  %101 = zext i1 %100 to i32
  %102 = sext i32 %101 to i64
  call void @klee_assume(i64 noundef %102)
  %103 = load i32, ptr %7, align 4
  %104 = icmp sle i32 %103, 1
  %105 = zext i1 %104 to i32
  %106 = sext i32 %105 to i64
  call void @klee_assume(i64 noundef %106)
  %107 = load i32, ptr %8, align 4
  %108 = icmp sge i32 %107, 0
  %109 = zext i1 %108 to i32
  %110 = sext i32 %109 to i64
  call void @klee_assume(i64 noundef %110)
  %111 = load i32, ptr %8, align 4
  %112 = icmp sle i32 %111, 2
  %113 = zext i1 %112 to i32
  %114 = sext i32 %113 to i64
  call void @klee_assume(i64 noundef %114)
  %115 = load i32, ptr %9, align 4
  %116 = icmp sge i32 %115, 0
  %117 = zext i1 %116 to i32
  %118 = sext i32 %117 to i64
  call void @klee_assume(i64 noundef %118)
  %119 = load i32, ptr %9, align 4
  %120 = icmp sle i32 %119, 2
  %121 = zext i1 %120 to i32
  %122 = sext i32 %121 to i64
  call void @klee_assume(i64 noundef %122)
  %123 = load i32, ptr %10, align 4
  %124 = icmp sge i32 %123, 0
  %125 = zext i1 %124 to i32
  %126 = sext i32 %125 to i64
  call void @klee_assume(i64 noundef %126)
  %127 = load i32, ptr %10, align 4
  %128 = icmp sle i32 %127, 3
  %129 = zext i1 %128 to i32
  %130 = sext i32 %129 to i64
  call void @klee_assume(i64 noundef %130)
  %131 = load i32, ptr %13, align 4
  %132 = icmp sge i32 %131, 0
  %133 = zext i1 %132 to i32
  %134 = sext i32 %133 to i64
  call void @klee_assume(i64 noundef %134)
  %135 = load i32, ptr %13, align 4
  %136 = icmp sle i32 %135, 3
  %137 = zext i1 %136 to i32
  %138 = sext i32 %137 to i64
  call void @klee_assume(i64 noundef %138)
  %139 = load i32, ptr %11, align 4
  %140 = icmp sge i32 %139, 0
  %141 = zext i1 %140 to i32
  %142 = sext i32 %141 to i64
  call void @klee_assume(i64 noundef %142)
  %143 = load i32, ptr %11, align 4
  %144 = icmp sle i32 %143, 3
  %145 = zext i1 %144 to i32
  %146 = sext i32 %145 to i64
  call void @klee_assume(i64 noundef %146)
  %147 = load i32, ptr %12, align 4
  %148 = icmp sge i32 %147, 0
  %149 = zext i1 %148 to i32
  %150 = sext i32 %149 to i64
  call void @klee_assume(i64 noundef %150)
  %151 = load i32, ptr %12, align 4
  %152 = icmp sle i32 %151, 3
  %153 = zext i1 %152 to i32
  %154 = sext i32 %153 to i64
  call void @klee_assume(i64 noundef %154)
  %155 = load i32, ptr %14, align 4
  %156 = icmp sge i32 %155, 0
  %157 = zext i1 %156 to i32
  %158 = sext i32 %157 to i64
  call void @klee_assume(i64 noundef %158)
  %159 = load i32, ptr %14, align 4
  %160 = icmp sle i32 %159, 3
  %161 = zext i1 %160 to i32
  %162 = sext i32 %161 to i64
  call void @klee_assume(i64 noundef %162)
  %163 = load i32, ptr %15, align 4
  %164 = icmp sge i32 %163, 0
  %165 = zext i1 %164 to i32
  %166 = sext i32 %165 to i64
  call void @klee_assume(i64 noundef %166)
  %167 = load i32, ptr %15, align 4
  %168 = icmp sle i32 %167, 3
  %169 = zext i1 %168 to i32
  %170 = sext i32 %169 to i64
  call void @klee_assume(i64 noundef %170)
  %171 = load i32, ptr %16, align 4
  %172 = icmp sge i32 %171, 0
  %173 = zext i1 %172 to i32
  %174 = sext i32 %173 to i64
  call void @klee_assume(i64 noundef %174)
  %175 = load i32, ptr %16, align 4
  %176 = icmp sle i32 %175, 5
  %177 = zext i1 %176 to i32
  %178 = sext i32 %177 to i64
  call void @klee_assume(i64 noundef %178)
  %179 = load i32, ptr %17, align 4
  %180 = icmp sge i32 %179, 0
  %181 = zext i1 %180 to i32
  %182 = sext i32 %181 to i64
  call void @klee_assume(i64 noundef %182)
  %183 = load i32, ptr %17, align 4
  %184 = icmp sle i32 %183, 3
  %185 = zext i1 %184 to i32
  %186 = sext i32 %185 to i64
  call void @klee_assume(i64 noundef %186)
  %187 = load i32, ptr %18, align 4
  %188 = icmp sge i32 %187, 0
  %189 = zext i1 %188 to i32
  %190 = sext i32 %189 to i64
  call void @klee_assume(i64 noundef %190)
  %191 = load i32, ptr %18, align 4
  %192 = icmp sle i32 %191, 3
  %193 = zext i1 %192 to i32
  %194 = sext i32 %193 to i64
  call void @klee_assume(i64 noundef %194)
  %195 = load i32, ptr %2, align 4
  store i32 %195, ptr %19, align 4
  %196 = load i32, ptr %3, align 4
  store i32 %196, ptr %20, align 4
  %197 = load i32, ptr %4, align 4
  %198 = call i32 @map_prv(i32 noundef %197)
  store i32 %198, ptr %21, align 4
  %199 = load i32, ptr %5, align 4
  store i32 %199, ptr %22, align 4
  %200 = load i32, ptr %6, align 4
  store i32 %200, ptr %23, align 4
  %201 = load i32, ptr %7, align 4
  store i32 %201, ptr %24, align 4
  %202 = load i32, ptr %8, align 4
  %203 = call i32 @map_max_vaddr_bits(i32 noundef %202)
  store i32 %203, ptr %25, align 4
  %204 = load i32, ptr %9, align 4
  %205 = call i32 @map_paddr_bits(i32 noundef %204)
  store i32 %205, ptr %26, align 4
  %206 = load i32, ptr %10, align 4
  %207 = load i32, ptr %25, align 4
  %208 = call i32 @map_old_valid_mode(i32 noundef %206, i32 noundef %207)
  store i32 %208, ptr %27, align 4
  %209 = load i32, ptr %13, align 4
  %210 = load i32, ptr %25, align 4
  %211 = call i32 @map_old_valid_mode(i32 noundef %209, i32 noundef %210)
  store i32 %211, ptr %28, align 4
  %212 = load i32, ptr %16, align 4
  %213 = call i32 @map_write_mode(i32 noundef %212)
  store i32 %213, ptr %29, align 4
  %214 = load i32, ptr %19, align 4
  %215 = load i32, ptr %20, align 4
  %216 = load i32, ptr %21, align 4
  %217 = load i32, ptr %22, align 4
  %218 = load i32, ptr %23, align 4
  %219 = load i32, ptr %24, align 4
  %220 = load i32, ptr %25, align 4
  %221 = load i32, ptr %26, align 4
  %222 = load i32, ptr %27, align 4
  %223 = load i32, ptr %11, align 4
  %224 = load i32, ptr %12, align 4
  %225 = load i32, ptr %28, align 4
  %226 = load i32, ptr %14, align 4
  %227 = load i32, ptr %15, align 4
  %228 = load i32, ptr %29, align 4
  %229 = load i32, ptr %17, align 4
  %230 = load i32, ptr %18, align 4
  %231 = call i32 @write_virtualized_satp(i32 noundef %214, i32 noundef %215, i32 noundef %216, i32 noundef %217, i32 noundef %218, i32 noundef %219, i32 noundef %220, i32 noundef %221, i32 noundef %222, i32 noundef %223, i32 noundef %224, i32 noundef %225, i32 noundef %226, i32 noundef %227, i32 noundef %228, i32 noundef %229, i32 noundef %230, ptr noundef %30, ptr noundef %31, ptr noundef %32, ptr noundef %33, ptr noundef %34, ptr noundef %35, ptr noundef %36, ptr noundef %37)
  store i32 %231, ptr %38, align 4
  call void @klee_make_symbolic(ptr noundef %39, i64 noundef 4, ptr noundef @.str.17)
  call void @klee_make_symbolic(ptr noundef %40, i64 noundef 4, ptr noundef @.str.18)
  call void @klee_make_symbolic(ptr noundef %41, i64 noundef 4, ptr noundef @.str.19)
  call void @klee_make_symbolic(ptr noundef %42, i64 noundef 4, ptr noundef @.str.20)
  call void @klee_make_symbolic(ptr noundef %43, i64 noundef 4, ptr noundef @.str.21)
  call void @klee_make_symbolic(ptr noundef %44, i64 noundef 4, ptr noundef @.str.22)
  call void @klee_make_symbolic(ptr noundef %45, i64 noundef 4, ptr noundef @.str.23)
  call void @klee_make_symbolic(ptr noundef %46, i64 noundef 4, ptr noundef @.str.24)
  call void @klee_make_symbolic(ptr noundef %47, i64 noundef 4, ptr noundef @.str.25)
  call void @klee_make_symbolic(ptr noundef %48, i64 noundef 4, ptr noundef @.str.26)
  call void @klee_make_symbolic(ptr noundef %49, i64 noundef 4, ptr noundef @.str.27)
  call void @klee_make_symbolic(ptr noundef %50, i64 noundef 4, ptr noundef @.str.28)
  call void @klee_make_symbolic(ptr noundef %51, i64 noundef 4, ptr noundef @.str.29)
  call void @klee_make_symbolic(ptr noundef %52, i64 noundef 4, ptr noundef @.str.30)
  call void @klee_make_symbolic(ptr noundef %53, i64 noundef 4, ptr noundef @.str.31)
  call void @klee_make_symbolic(ptr noundef %54, i64 noundef 4, ptr noundef @.str.32)
  call void @klee_make_symbolic(ptr noundef %55, i64 noundef 4, ptr noundef @.str.33)
  call void @klee_make_symbolic(ptr noundef %56, i64 noundef 4, ptr noundef @.str.34)
  call void @klee_make_symbolic(ptr noundef %57, i64 noundef 4, ptr noundef @.str.35)
  call void @klee_make_symbolic(ptr noundef %58, i64 noundef 4, ptr noundef @.str.36)
  %232 = load i32, ptr %39, align 4
  %233 = load i32, ptr %19, align 4
  %234 = icmp eq i32 %232, %233
  %235 = zext i1 %234 to i32
  %236 = sext i32 %235 to i64
  call void @klee_assume(i64 noundef %236)
  %237 = load i32, ptr %40, align 4
  %238 = load i32, ptr %20, align 4
  %239 = icmp eq i32 %237, %238
  %240 = zext i1 %239 to i32
  %241 = sext i32 %240 to i64
  call void @klee_assume(i64 noundef %241)
  %242 = load i32, ptr %41, align 4
  %243 = load i32, ptr %21, align 4
  %244 = icmp eq i32 %242, %243
  %245 = zext i1 %244 to i32
  %246 = sext i32 %245 to i64
  call void @klee_assume(i64 noundef %246)
  %247 = load i32, ptr %42, align 4
  %248 = load i32, ptr %22, align 4
  %249 = icmp eq i32 %247, %248
  %250 = zext i1 %249 to i32
  %251 = sext i32 %250 to i64
  call void @klee_assume(i64 noundef %251)
  %252 = load i32, ptr %43, align 4
  %253 = load i32, ptr %23, align 4
  %254 = icmp eq i32 %252, %253
  %255 = zext i1 %254 to i32
  %256 = sext i32 %255 to i64
  call void @klee_assume(i64 noundef %256)
  %257 = load i32, ptr %44, align 4
  %258 = load i32, ptr %24, align 4
  %259 = icmp eq i32 %257, %258
  %260 = zext i1 %259 to i32
  %261 = sext i32 %260 to i64
  call void @klee_assume(i64 noundef %261)
  %262 = load i32, ptr %45, align 4
  %263 = load i32, ptr %25, align 4
  %264 = icmp eq i32 %262, %263
  %265 = zext i1 %264 to i32
  %266 = sext i32 %265 to i64
  call void @klee_assume(i64 noundef %266)
  %267 = load i32, ptr %46, align 4
  %268 = load i32, ptr %26, align 4
  %269 = icmp eq i32 %267, %268
  %270 = zext i1 %269 to i32
  %271 = sext i32 %270 to i64
  call void @klee_assume(i64 noundef %271)
  %272 = load i32, ptr %47, align 4
  %273 = load i32, ptr %27, align 4
  %274 = icmp eq i32 %272, %273
  %275 = zext i1 %274 to i32
  %276 = sext i32 %275 to i64
  call void @klee_assume(i64 noundef %276)
  %277 = load i32, ptr %48, align 4
  %278 = load i32, ptr %28, align 4
  %279 = icmp eq i32 %277, %278
  %280 = zext i1 %279 to i32
  %281 = sext i32 %280 to i64
  call void @klee_assume(i64 noundef %281)
  %282 = load i32, ptr %49, align 4
  %283 = load i32, ptr %29, align 4
  %284 = icmp eq i32 %282, %283
  %285 = zext i1 %284 to i32
  %286 = sext i32 %285 to i64
  call void @klee_assume(i64 noundef %286)
  %287 = load i32, ptr %50, align 4
  %288 = load i32, ptr %38, align 4
  %289 = icmp eq i32 %287, %288
  %290 = zext i1 %289 to i32
  %291 = sext i32 %290 to i64
  call void @klee_assume(i64 noundef %291)
  %292 = load i32, ptr %51, align 4
  %293 = load i32, ptr %37, align 4
  %294 = icmp eq i32 %292, %293
  %295 = zext i1 %294 to i32
  %296 = sext i32 %295 to i64
  call void @klee_assume(i64 noundef %296)
  %297 = load i32, ptr %52, align 4
  %298 = load i32, ptr %36, align 4
  %299 = icmp eq i32 %297, %298
  %300 = zext i1 %299 to i32
  %301 = sext i32 %300 to i64
  call void @klee_assume(i64 noundef %301)
  %302 = load i32, ptr %53, align 4
  %303 = load i32, ptr %30, align 4
  %304 = icmp eq i32 %302, %303
  %305 = zext i1 %304 to i32
  %306 = sext i32 %305 to i64
  call void @klee_assume(i64 noundef %306)
  %307 = load i32, ptr %54, align 4
  %308 = load i32, ptr %31, align 4
  %309 = icmp eq i32 %307, %308
  %310 = zext i1 %309 to i32
  %311 = sext i32 %310 to i64
  call void @klee_assume(i64 noundef %311)
  %312 = load i32, ptr %55, align 4
  %313 = load i32, ptr %32, align 4
  %314 = icmp eq i32 %312, %313
  %315 = zext i1 %314 to i32
  %316 = sext i32 %315 to i64
  call void @klee_assume(i64 noundef %316)
  %317 = load i32, ptr %56, align 4
  %318 = load i32, ptr %33, align 4
  %319 = icmp eq i32 %317, %318
  %320 = zext i1 %319 to i32
  %321 = sext i32 %320 to i64
  call void @klee_assume(i64 noundef %321)
  %322 = load i32, ptr %57, align 4
  %323 = load i32, ptr %34, align 4
  %324 = icmp eq i32 %322, %323
  %325 = zext i1 %324 to i32
  %326 = sext i32 %325 to i64
  call void @klee_assume(i64 noundef %326)
  %327 = load i32, ptr %58, align 4
  %328 = load i32, ptr %35, align 4
  %329 = icmp eq i32 %327, %328
  %330 = zext i1 %329 to i32
  %331 = sext i32 %330 to i64
  call void @klee_assume(i64 noundef %331)
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

declare void @klee_assume(i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_prv(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %8

7:                                                ; preds = %1
  store i32 3, ptr %2, align 4
  br label %8

8:                                                ; preds = %7, %6
  %9 = load i32, ptr %2, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_max_vaddr_bits(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 39, ptr %2, align 4
  br label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 48, ptr %2, align 4
  br label %12

11:                                               ; preds = %7
  store i32 57, ptr %2, align 4
  br label %12

12:                                               ; preds = %11, %10, %6
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_paddr_bits(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 12, ptr %2, align 4
  br label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 13, ptr %2, align 4
  br label %12

11:                                               ; preds = %7
  store i32 14, ptr %2, align 4
  br label %12

12:                                               ; preds = %11, %10, %6
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_old_valid_mode(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 0, ptr %3, align 4
  br label %30

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store i32 8, ptr %3, align 4
  br label %30

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = load i32, ptr %5, align 4
  %18 = icmp sge i32 %17, 48
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  store i32 9, ptr %3, align 4
  br label %30

20:                                               ; preds = %16
  store i32 8, ptr %3, align 4
  br label %30

21:                                               ; preds = %13
  %22 = load i32, ptr %5, align 4
  %23 = icmp sge i32 %22, 57
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  store i32 10, ptr %3, align 4
  br label %30

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4
  %27 = icmp sge i32 %26, 48
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store i32 9, ptr %3, align 4
  br label %30

29:                                               ; preds = %25
  store i32 8, ptr %3, align 4
  br label %30

30:                                               ; preds = %29, %28, %24, %20, %19, %12, %8
  %31 = load i32, ptr %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @map_write_mode(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %24

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 8, ptr %2, align 4
  br label %24

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp eq i32 %12, 2
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 9, ptr %2, align 4
  br label %24

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = icmp eq i32 %16, 3
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i32 10, ptr %2, align 4
  br label %24

19:                                               ; preds = %15
  %20 = load i32, ptr %3, align 4
  %21 = icmp eq i32 %20, 4
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 11, ptr %2, align 4
  br label %24

23:                                               ; preds = %19
  store i32 15, ptr %2, align 4
  br label %24

24:                                               ; preds = %23, %22, %18, %14, %10, %6
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @write_virtualized_satp(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20, ptr noundef %21, ptr noundef %22, ptr noundef %23, ptr noundef %24) #0 {
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
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  store i32 %0, ptr %27, align 4
  store i32 %1, ptr %28, align 4
  store i32 %2, ptr %29, align 4
  store i32 %3, ptr %30, align 4
  store i32 %4, ptr %31, align 4
  store i32 %5, ptr %32, align 4
  store i32 %6, ptr %33, align 4
  store i32 %7, ptr %34, align 4
  store i32 %8, ptr %35, align 4
  store i32 %9, ptr %36, align 4
  store i32 %10, ptr %37, align 4
  store i32 %11, ptr %38, align 4
  store i32 %12, ptr %39, align 4
  store i32 %13, ptr %40, align 4
  store i32 %14, ptr %41, align 4
  store i32 %15, ptr %42, align 4
  store i32 %16, ptr %43, align 4
  store ptr %17, ptr %44, align 8
  store ptr %18, ptr %45, align 8
  store ptr %19, ptr %46, align 8
  store ptr %20, ptr %47, align 8
  store ptr %21, ptr %48, align 8
  store ptr %22, ptr %49, align 8
  store ptr %23, ptr %50, align 8
  store ptr %24, ptr %51, align 8
  %52 = load i32, ptr %35, align 4
  %53 = load ptr, ptr %44, align 8
  store i32 %52, ptr %53, align 4
  %54 = load i32, ptr %36, align 4
  %55 = load ptr, ptr %45, align 8
  store i32 %54, ptr %55, align 4
  %56 = load i32, ptr %37, align 4
  %57 = load ptr, ptr %46, align 8
  store i32 %56, ptr %57, align 4
  %58 = load i32, ptr %38, align 4
  %59 = load ptr, ptr %47, align 8
  store i32 %58, ptr %59, align 4
  %60 = load i32, ptr %39, align 4
  %61 = load ptr, ptr %48, align 8
  store i32 %60, ptr %61, align 4
  %62 = load i32, ptr %40, align 4
  %63 = load ptr, ptr %49, align 8
  store i32 %62, ptr %63, align 4
  %64 = load ptr, ptr %50, align 8
  store i32 0, ptr %64, align 4
  %65 = load ptr, ptr %51, align 8
  store i32 0, ptr %65, align 4
  %66 = load i32, ptr %28, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %95

68:                                               ; preds = %25
  %69 = load ptr, ptr %50, align 8
  store i32 1, ptr %69, align 4
  %70 = load i32, ptr %30, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %68
  store i32 22, ptr %26, align 4
  br label %125

73:                                               ; preds = %68
  %74 = load i32, ptr %27, align 4
  %75 = load i32, ptr %32, align 4
  %76 = load i32, ptr %33, align 4
  %77 = load i32, ptr %34, align 4
  %78 = load i32, ptr %35, align 4
  %79 = load i32, ptr %36, align 4
  %80 = load i32, ptr %37, align 4
  %81 = load i32, ptr %38, align 4
  %82 = load i32, ptr %39, align 4
  %83 = load i32, ptr %40, align 4
  %84 = load i32, ptr %41, align 4
  %85 = load i32, ptr %42, align 4
  %86 = load i32, ptr %43, align 4
  %87 = load ptr, ptr %44, align 8
  %88 = load ptr, ptr %45, align 8
  %89 = load ptr, ptr %46, align 8
  %90 = load ptr, ptr %47, align 8
  %91 = load ptr, ptr %48, align 8
  %92 = load ptr, ptr %49, align 8
  %93 = load ptr, ptr %51, align 8
  %94 = call i32 @write_satp_target(i32 noundef 1, i32 noundef %74, i32 noundef %75, i32 noundef %76, i32 noundef %77, i32 noundef %78, i32 noundef %79, i32 noundef %80, i32 noundef %81, i32 noundef %82, i32 noundef %83, i32 noundef %84, i32 noundef %85, i32 noundef %86, ptr noundef %87, ptr noundef %88, ptr noundef %89, ptr noundef %90, ptr noundef %91, ptr noundef %92, ptr noundef %93)
  store i32 %94, ptr %26, align 4
  br label %125

95:                                               ; preds = %25
  %96 = load ptr, ptr %50, align 8
  store i32 0, ptr %96, align 4
  %97 = load i32, ptr %31, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %95
  %100 = load i32, ptr %29, align 4
  %101 = icmp ne i32 %100, 3
  br i1 %101, label %102, label %103

102:                                              ; preds = %99
  store i32 2, ptr %26, align 4
  br label %125

103:                                              ; preds = %99, %95
  %104 = load i32, ptr %27, align 4
  %105 = load i32, ptr %32, align 4
  %106 = load i32, ptr %33, align 4
  %107 = load i32, ptr %34, align 4
  %108 = load i32, ptr %35, align 4
  %109 = load i32, ptr %36, align 4
  %110 = load i32, ptr %37, align 4
  %111 = load i32, ptr %38, align 4
  %112 = load i32, ptr %39, align 4
  %113 = load i32, ptr %40, align 4
  %114 = load i32, ptr %41, align 4
  %115 = load i32, ptr %42, align 4
  %116 = load i32, ptr %43, align 4
  %117 = load ptr, ptr %44, align 8
  %118 = load ptr, ptr %45, align 8
  %119 = load ptr, ptr %46, align 8
  %120 = load ptr, ptr %47, align 8
  %121 = load ptr, ptr %48, align 8
  %122 = load ptr, ptr %49, align 8
  %123 = load ptr, ptr %51, align 8
  %124 = call i32 @write_satp_target(i32 noundef 0, i32 noundef %104, i32 noundef %105, i32 noundef %106, i32 noundef %107, i32 noundef %108, i32 noundef %109, i32 noundef %110, i32 noundef %111, i32 noundef %112, i32 noundef %113, i32 noundef %114, i32 noundef %115, i32 noundef %116, ptr noundef %117, ptr noundef %118, ptr noundef %119, ptr noundef %120, ptr noundef %121, ptr noundef %122, ptr noundef %123)
  store i32 %124, ptr %26, align 4
  br label %125

125:                                              ; preds = %103, %102, %73, %72
  %126 = load i32, ptr %26, align 4
  ret i32 %126
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @write_satp_target(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20) #0 {
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
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  store i32 %0, ptr %22, align 4
  store i32 %1, ptr %23, align 4
  store i32 %2, ptr %24, align 4
  store i32 %3, ptr %25, align 4
  store i32 %4, ptr %26, align 4
  store i32 %5, ptr %27, align 4
  store i32 %6, ptr %28, align 4
  store i32 %7, ptr %29, align 4
  store i32 %8, ptr %30, align 4
  store i32 %9, ptr %31, align 4
  store i32 %10, ptr %32, align 4
  store i32 %11, ptr %33, align 4
  store i32 %12, ptr %34, align 4
  store i32 %13, ptr %35, align 4
  store ptr %14, ptr %36, align 8
  store ptr %15, ptr %37, align 8
  store ptr %16, ptr %38, align 8
  store ptr %17, ptr %39, align 8
  store ptr %18, ptr %40, align 8
  store ptr %19, ptr %41, align 8
  store ptr %20, ptr %42, align 8
  %49 = load i32, ptr %22, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %55

51:                                               ; preds = %21
  %52 = load i32, ptr %30, align 4
  store i32 %52, ptr %43, align 4
  %53 = load i32, ptr %31, align 4
  store i32 %53, ptr %44, align 4
  %54 = load i32, ptr %32, align 4
  store i32 %54, ptr %45, align 4
  br label %59

55:                                               ; preds = %21
  %56 = load i32, ptr %27, align 4
  store i32 %56, ptr %43, align 4
  %57 = load i32, ptr %28, align 4
  store i32 %57, ptr %44, align 4
  %58 = load i32, ptr %29, align 4
  store i32 %58, ptr %45, align 4
  br label %59

59:                                               ; preds = %55, %51
  %60 = load i32, ptr %23, align 4
  %61 = load i32, ptr %24, align 4
  %62 = load i32, ptr %25, align 4
  %63 = load i32, ptr %26, align 4
  %64 = load i32, ptr %43, align 4
  %65 = load i32, ptr %44, align 4
  %66 = load i32, ptr %45, align 4
  %67 = load i32, ptr %33, align 4
  %68 = load i32, ptr %34, align 4
  %69 = load i32, ptr %35, align 4
  call void @compute_new_satp(i32 noundef %60, i32 noundef %61, i32 noundef %62, i32 noundef %63, i32 noundef %64, i32 noundef %65, i32 noundef %66, i32 noundef %67, i32 noundef %68, i32 noundef %69, ptr noundef %46, ptr noundef %47, ptr noundef %48)
  %70 = load i32, ptr %46, align 4
  %71 = load i32, ptr %43, align 4
  %72 = icmp ne i32 %70, %71
  br i1 %72, label %81, label %73

73:                                               ; preds = %59
  %74 = load i32, ptr %47, align 4
  %75 = load i32, ptr %44, align 4
  %76 = icmp ne i32 %74, %75
  br i1 %76, label %81, label %77

77:                                               ; preds = %73
  %78 = load i32, ptr %48, align 4
  %79 = load i32, ptr %45, align 4
  %80 = icmp ne i32 %78, %79
  br i1 %80, label %81, label %83

81:                                               ; preds = %77, %73, %59
  %82 = load ptr, ptr %42, align 8
  store i32 1, ptr %82, align 4
  br label %83

83:                                               ; preds = %81, %77
  %84 = load i32, ptr %22, align 4
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %99

86:                                               ; preds = %83
  %87 = load i32, ptr %27, align 4
  %88 = load ptr, ptr %36, align 8
  store i32 %87, ptr %88, align 4
  %89 = load i32, ptr %28, align 4
  %90 = load ptr, ptr %37, align 8
  store i32 %89, ptr %90, align 4
  %91 = load i32, ptr %29, align 4
  %92 = load ptr, ptr %38, align 8
  store i32 %91, ptr %92, align 4
  %93 = load i32, ptr %46, align 4
  %94 = load ptr, ptr %39, align 8
  store i32 %93, ptr %94, align 4
  %95 = load i32, ptr %47, align 4
  %96 = load ptr, ptr %40, align 8
  store i32 %95, ptr %96, align 4
  %97 = load i32, ptr %48, align 4
  %98 = load ptr, ptr %41, align 8
  store i32 %97, ptr %98, align 4
  br label %112

99:                                               ; preds = %83
  %100 = load i32, ptr %46, align 4
  %101 = load ptr, ptr %36, align 8
  store i32 %100, ptr %101, align 4
  %102 = load i32, ptr %47, align 4
  %103 = load ptr, ptr %37, align 8
  store i32 %102, ptr %103, align 4
  %104 = load i32, ptr %48, align 4
  %105 = load ptr, ptr %38, align 8
  store i32 %104, ptr %105, align 4
  %106 = load i32, ptr %30, align 4
  %107 = load ptr, ptr %39, align 8
  store i32 %106, ptr %107, align 4
  %108 = load i32, ptr %31, align 4
  %109 = load ptr, ptr %40, align 8
  store i32 %108, ptr %109, align 4
  %110 = load i32, ptr %32, align 4
  %111 = load ptr, ptr %41, align 8
  store i32 %110, ptr %111, align 4
  br label %112

112:                                              ; preds = %99, %86
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_new_satp(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12) #0 {
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
  store i32 %0, ptr %14, align 4
  store i32 %1, ptr %15, align 4
  store i32 %2, ptr %16, align 4
  store i32 %3, ptr %17, align 4
  store i32 %4, ptr %18, align 4
  store i32 %5, ptr %19, align 4
  store i32 %6, ptr %20, align 4
  store i32 %7, ptr %21, align 4
  store i32 %8, ptr %22, align 4
  store i32 %9, ptr %23, align 4
  store ptr %10, ptr %24, align 8
  store ptr %11, ptr %25, align 8
  store ptr %12, ptr %26, align 8
  %27 = load i32, ptr %14, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %33, label %29

29:                                               ; preds = %13
  %30 = load ptr, ptr %24, align 8
  store i32 0, ptr %30, align 4
  %31 = load ptr, ptr %25, align 8
  store i32 0, ptr %31, align 4
  %32 = load ptr, ptr %26, align 8
  store i32 0, ptr %32, align 4
  br label %53

33:                                               ; preds = %13
  %34 = load i32, ptr %21, align 4
  %35 = load i32, ptr %16, align 4
  %36 = call i32 @satp_mode_valid(i32 noundef %34, i32 noundef %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %33
  %39 = load i32, ptr %21, align 4
  %40 = load ptr, ptr %24, align 8
  store i32 %39, ptr %40, align 4
  br label %44

41:                                               ; preds = %33
  %42 = load i32, ptr %18, align 4
  %43 = load ptr, ptr %24, align 8
  store i32 %42, ptr %43, align 4
  br label %44

44:                                               ; preds = %41, %38
  %45 = load i32, ptr %22, align 4
  %46 = load i32, ptr %15, align 4
  %47 = call i32 @mask_asid(i32 noundef %45, i32 noundef %46)
  %48 = load ptr, ptr %25, align 8
  store i32 %47, ptr %48, align 4
  %49 = load i32, ptr %23, align 4
  %50 = load i32, ptr %17, align 4
  %51 = call i32 @mask_ppn(i32 noundef %49, i32 noundef %50)
  %52 = load ptr, ptr %26, align 8
  store i32 %51, ptr %52, align 4
  br label %53

53:                                               ; preds = %44, %29
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @satp_mode_valid(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4
  br label %31

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp eq i32 %10, 8
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = icmp sge i32 %13, 39
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 1, ptr %3, align 4
  br label %31

16:                                               ; preds = %12, %9
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %17, 9
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = load i32, ptr %5, align 4
  %21 = icmp sge i32 %20, 48
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 1, ptr %3, align 4
  br label %31

23:                                               ; preds = %19, %16
  %24 = load i32, ptr %4, align 4
  %25 = icmp eq i32 %24, 10
  br i1 %25, label %26, label %30

26:                                               ; preds = %23
  %27 = load i32, ptr %5, align 4
  %28 = icmp sge i32 %27, 57
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  store i32 1, ptr %3, align 4
  br label %31

30:                                               ; preds = %26, %23
  store i32 0, ptr %3, align 4
  br label %31

31:                                               ; preds = %30, %29, %22, %15, %8
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mask_asid(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  store i32 0, ptr %3, align 4
  br label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = and i32 %10, 3
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %9, %8
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mask_ppn(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp sle i32 %6, 12
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 0, ptr %3, align 4
  br label %18

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp eq i32 %10, 13
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = and i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %18

15:                                               ; preds = %9
  %16 = load i32, ptr %4, align 4
  %17 = and i32 %16, 3
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %15, %12, %8
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 16.0.6 (23ubuntu4)"}
