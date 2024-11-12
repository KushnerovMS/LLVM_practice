; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

@__const.app.cell_colors = private unnamed_addr constant [6 x i32] [i32 0, i32 -14671840, i32 -1759963, i32 -345566, i32 -187, i32 -55], align 16
@__const.app.cell_power_bounds = private unnamed_addr constant [6 x i32] [i32 0, i32 5, i32 15, i32 50, i32 100, i32 200], align 16
@__const.app.neighbors_coefs = private unnamed_addr constant [9 x i32] [i32 4, i32 3, i32 4, i32 3, i32 12, i32 3, i32 1, i32 4, i32 1], align 16

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [2 x [64 x [32 x i32]]], align 16
  %2 = alloca [9 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 16384, ptr nonnull %1) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16384) %1, i8 0, i64 16384, i1 false)
  %3 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 1
  %4 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 2
  %5 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 3
  %6 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 4
  %7 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 5
  %8 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 3
  %9 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 4
  %10 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 5
  br label %11

11:                                               ; preds = %0, %18
  %12 = phi i32 [ %20, %18 ], [ 1, %0 ]
  %13 = zext nneg i32 %12 to i64
  %14 = xor i32 %12, 1
  %15 = zext nneg i32 %14 to i64
  %16 = zext nneg i32 %12 to i64
  %17 = zext i32 %12 to i64
  br label %21

18:                                               ; preds = %60
  %19 = and i32 %12, 1
  %20 = xor i32 %19, 1
  tail call void (...) @simFlush() #4
  br label %11, !llvm.loop !3

21:                                               ; preds = %11, %60
  %22 = phi i64 [ 0, %11 ], [ %56, %60 ]
  %23 = tail call i32 (...) @simRand() #4
  %24 = add nsw i64 %22, -32
  %25 = mul nsw i64 %24, %24
  %26 = sub nsw i64 1024, %25
  %27 = trunc i64 %26 to i32
  %28 = lshr i32 %27, 9
  %29 = sub nuw nsw i32 100, %28
  %30 = mul nuw nsw i32 %29, 21474836
  %31 = icmp ugt i32 %23, %30
  %32 = tail call i32 (...) @simRand() #4
  br i1 %31, label %33, label %36

33:                                               ; preds = %21
  %34 = sdiv i32 %32, 214748
  %35 = add nsw i32 %34, 10000
  br label %47

36:                                               ; preds = %21
  %37 = trunc i64 %26 to i32
  %38 = mul i32 %37, 5
  %39 = lshr i32 %38, 6
  %40 = sub nsw i32 100, %39
  %41 = mul nsw i32 %40, 21474836
  %42 = icmp ugt i32 %32, %41
  br i1 %42, label %43, label %52

43:                                               ; preds = %36
  %44 = tail call i32 (...) @simRand() #4
  %45 = sdiv i32 %44, 21474836
  %46 = add nsw i32 %45, 100
  br label %47

47:                                               ; preds = %33, %43
  %48 = phi i32 [ %46, %43 ], [ %35, %33 ]
  %49 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %17, i64 %22, i64 31
  %50 = load i32, ptr %49, align 4, !tbaa !5
  %51 = add i32 %48, %50
  store i32 %51, ptr %49, align 4, !tbaa !5
  br label %52

52:                                               ; preds = %47, %36
  %53 = icmp eq i64 %22, 0
  %54 = icmp eq i64 %22, 63
  %55 = add nsw i64 %22, -1
  %56 = add nuw nsw i64 %22, 1
  %57 = add nsw i64 %22, -1
  %58 = add nsw i64 %22, -1
  %59 = trunc i64 %22 to i32
  br label %62

60:                                               ; preds = %124
  %61 = icmp eq i64 %56, 64
  br i1 %61, label %18, label %21, !llvm.loop !9

62:                                               ; preds = %52, %124
  %63 = phi i64 [ 0, %52 ], [ %130, %124 ]
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %2) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(36) %2, i8 0, i64 36, i1 false)
  br i1 %53, label %67, label %64

64:                                               ; preds = %62
  %65 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %16, i64 %55, i64 %63
  %66 = load i32, ptr %65, align 4, !tbaa !5
  store i32 %66, ptr %2, align 16, !tbaa !5
  br label %67

67:                                               ; preds = %64, %62
  %68 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %22, i64 %63
  %69 = load i32, ptr %68, align 4, !tbaa !5
  store i32 %69, ptr %3, align 4, !tbaa !5
  br i1 %54, label %73, label %70

70:                                               ; preds = %67
  %71 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %56, i64 %63
  %72 = load i32, ptr %71, align 4, !tbaa !5
  store i32 %72, ptr %4, align 8, !tbaa !5
  br label %73

73:                                               ; preds = %70, %67
  %74 = icmp eq i64 %63, 31
  br i1 %74, label %87, label %75

75:                                               ; preds = %73
  br i1 %53, label %80, label %76

76:                                               ; preds = %75
  %77 = add nuw nsw i64 %63, 1
  %78 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %57, i64 %77
  %79 = load i32, ptr %78, align 4, !tbaa !5
  store i32 %79, ptr %5, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %76, %75
  %81 = add nuw nsw i64 %63, 1
  %82 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %22, i64 %81
  %83 = load i32, ptr %82, align 4, !tbaa !5
  store i32 %83, ptr %6, align 16, !tbaa !5
  br i1 %54, label %87, label %84

84:                                               ; preds = %80
  %85 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %56, i64 %81
  %86 = load i32, ptr %85, align 4, !tbaa !5
  store i32 %86, ptr %7, align 4, !tbaa !5
  br label %87

87:                                               ; preds = %80, %84, %73
  %88 = icmp ult i64 %63, 30
  br i1 %88, label %90, label %89

89:                                               ; preds = %95, %99, %87
  br label %105

90:                                               ; preds = %87
  br i1 %53, label %95, label %91

91:                                               ; preds = %90
  %92 = add nuw nsw i64 %63, 2
  %93 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %58, i64 %92
  %94 = load i32, ptr %93, align 4, !tbaa !5
  store i32 %94, ptr %8, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %91, %90
  %96 = add nuw nsw i64 %63, 2
  %97 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %22, i64 %96
  %98 = load i32, ptr %97, align 4, !tbaa !5
  store i32 %98, ptr %9, align 16, !tbaa !5
  br i1 %54, label %89, label %99

99:                                               ; preds = %95
  %100 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %13, i64 %56, i64 %96
  %101 = load i32, ptr %100, align 4, !tbaa !5
  store i32 %101, ptr %10, align 4, !tbaa !5
  br label %89

102:                                              ; preds = %105
  %103 = udiv i32 %113, 35
  %104 = getelementptr inbounds [2 x [64 x [32 x i32]]], ptr %1, i64 0, i64 %15, i64 %22, i64 %63
  store i32 %103, ptr %104, align 4, !tbaa !5
  br label %116

105:                                              ; preds = %89, %105
  %106 = phi i64 [ %114, %105 ], [ 0, %89 ]
  %107 = phi i32 [ %113, %105 ], [ 0, %89 ]
  %108 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %106
  %109 = load i32, ptr %108, align 4, !tbaa !5
  %110 = getelementptr inbounds [9 x i32], ptr @__const.app.neighbors_coefs, i64 0, i64 %106
  %111 = load i32, ptr %110, align 4, !tbaa !5
  %112 = mul i32 %111, %109
  %113 = add i32 %112, %107
  %114 = add nuw nsw i64 %106, 1
  %115 = icmp eq i64 %114, 9
  br i1 %115, label %102, label %105, !llvm.loop !11

116:                                              ; preds = %102, %121
  %117 = phi i64 [ 0, %102 ], [ %122, %121 ]
  %118 = getelementptr inbounds [6 x i32], ptr @__const.app.cell_power_bounds, i64 0, i64 %117
  %119 = load i32, ptr %118, align 4, !tbaa !5
  %120 = icmp ugt i32 %103, %119
  br i1 %120, label %121, label %124

121:                                              ; preds = %116
  %122 = add nuw nsw i64 %117, 1
  %123 = icmp eq i64 %122, 6
  br i1 %123, label %124, label %116, !llvm.loop !12

124:                                              ; preds = %116, %121
  %125 = phi i64 [ 5, %121 ], [ %117, %116 ]
  %126 = and i64 %125, 4294967295
  %127 = getelementptr inbounds [6 x i32], ptr @__const.app.cell_colors, i64 0, i64 %126
  %128 = load i32, ptr %127, align 4, !tbaa !5
  %129 = trunc i64 %63 to i32
  tail call void @simPutCell(i32 noundef %59, i32 noundef %129, i32 noundef %128) #4
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %2) #4
  %130 = add nuw nsw i64 %63, 1
  %131 = icmp eq i64 %130, 32
  br i1 %131, label %60, label %62, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare dso_local i32 @simRand(...) local_unnamed_addr #3

declare dso_local void @simPutCell(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

declare dso_local void @simFlush(...) local_unnamed_addr #3

attributes #0 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{!"clang version 18.1.8 (Fedora 18.1.8-1.fc40)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !4}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10, !4}
!12 = distinct !{!12, !10, !4}
!13 = distinct !{!13, !10, !4}
