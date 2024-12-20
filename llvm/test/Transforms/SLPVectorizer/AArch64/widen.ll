; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=slp-vectorizer -S < %s | FileCheck %s

target datalayout = "e-m:e-i64:64-i128:128-n32:64-S128"
target triple = "aarch64"

; This should not be matched as a load combining candidate.
; There are no 'or' operations, so it can't be a bswap or
; other pattern that we are expecting the backend to handle.

define void @PR50256(ptr %a, ptr %b, i32 %n) {
; CHECK-LABEL: @PR50256(
; CHECK-NEXT:    [[ARRAYIDX_8:%.*]] = getelementptr inbounds i8, ptr [[A:%.*]], i64 8
; CHECK-NEXT:    [[ARRAYIDX3_8:%.*]] = getelementptr inbounds i16, ptr [[B:%.*]], i64 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i8>, ptr [[A]], align 1
; CHECK-NEXT:    [[TMP3:%.*]] = zext <8 x i8> [[TMP2]] to <8 x i16>
; CHECK-NEXT:    [[TMP4:%.*]] = shl nuw <8 x i16> [[TMP3]], splat (i16 8)
; CHECK-NEXT:    [[TMP7:%.*]] = load <8 x i8>, ptr [[ARRAYIDX_8]], align 1
; CHECK-NEXT:    [[TMP8:%.*]] = zext <8 x i8> [[TMP7]] to <8 x i16>
; CHECK-NEXT:    [[TMP9:%.*]] = shl nuw <8 x i16> [[TMP8]], splat (i16 8)
; CHECK-NEXT:    store <8 x i16> [[TMP4]], ptr [[B]], align 2
; CHECK-NEXT:    store <8 x i16> [[TMP9]], ptr [[ARRAYIDX3_8]], align 2
; CHECK-NEXT:    ret void
;
  %arrayidx.1 = getelementptr inbounds i8, ptr %a, i64 1
  %arrayidx.2 = getelementptr inbounds i8, ptr %a, i64 2
  %arrayidx.3 = getelementptr inbounds i8, ptr %a, i64 3
  %arrayidx.4 = getelementptr inbounds i8, ptr %a, i64 4
  %arrayidx.5 = getelementptr inbounds i8, ptr %a, i64 5
  %arrayidx.7 = getelementptr inbounds i8, ptr %a, i64 7
  %arrayidx.6 = getelementptr inbounds i8, ptr %a, i64 6
  %arrayidx.8 = getelementptr inbounds i8, ptr %a, i64 8
  %arrayidx.9 = getelementptr inbounds i8, ptr %a, i64 9
  %arrayidx.10 = getelementptr inbounds i8, ptr %a, i64 10
  %arrayidx.11 = getelementptr inbounds i8, ptr %a, i64 11
  %arrayidx.12 = getelementptr inbounds i8, ptr %a, i64 12
  %arrayidx.13 = getelementptr inbounds i8, ptr %a, i64 13
  %arrayidx.14 = getelementptr inbounds i8, ptr %a, i64 14
  %arrayidx.15 = getelementptr inbounds i8, ptr %a, i64 15
  %i = load i8, ptr %a, align 1
  %i1 = load i8, ptr %arrayidx.1, align 1
  %i2 = load i8, ptr %arrayidx.2, align 1
  %i3 = load i8, ptr %arrayidx.3, align 1
  %i4 = load i8, ptr %arrayidx.4, align 1
  %i5 = load i8, ptr %arrayidx.5, align 1
  %i6 = load i8, ptr %arrayidx.6, align 1
  %i7 = load i8, ptr %arrayidx.7, align 1
  %i8 = load i8, ptr %arrayidx.8, align 1
  %i9 = load i8, ptr %arrayidx.9, align 1
  %i10 = load i8, ptr %arrayidx.10, align 1
  %i11 = load i8, ptr %arrayidx.11, align 1
  %i12 = load i8, ptr %arrayidx.12, align 1
  %i13 = load i8, ptr %arrayidx.13, align 1
  %i14 = load i8, ptr %arrayidx.14, align 1
  %i15 = load i8, ptr %arrayidx.15, align 1
  %conv5 = zext i8 %i to i16
  %conv5.1 = zext i8 %i1 to i16
  %conv5.2 = zext i8 %i2 to i16
  %conv5.3 = zext i8 %i3 to i16
  %conv5.4 = zext i8 %i4 to i16
  %conv5.5 = zext i8 %i5 to i16
  %conv5.6 = zext i8 %i6 to i16
  %conv5.7 = zext i8 %i7 to i16
  %conv5.8 = zext i8 %i8 to i16
  %conv5.9 = zext i8 %i9 to i16
  %conv5.10 = zext i8 %i10 to i16
  %conv5.11 = zext i8 %i11 to i16
  %conv5.12 = zext i8 %i12 to i16
  %conv5.13 = zext i8 %i13 to i16
  %conv5.14 = zext i8 %i14 to i16
  %conv5.15 = zext i8 %i15 to i16
  %shl = shl nuw i16 %conv5, 8
  %shl.1 = shl nuw i16 %conv5.1, 8
  %shl.2 = shl nuw i16 %conv5.2, 8
  %shl.3 = shl nuw i16 %conv5.3, 8
  %shl.4 = shl nuw i16 %conv5.4, 8
  %shl.5 = shl nuw i16 %conv5.5, 8
  %shl.6 = shl nuw i16 %conv5.6, 8
  %shl.7 = shl nuw i16 %conv5.7, 8
  %shl.8 = shl nuw i16 %conv5.8, 8
  %shl.9 = shl nuw i16 %conv5.9, 8
  %shl.10 = shl nuw i16 %conv5.10, 8
  %shl.11 = shl nuw i16 %conv5.11, 8
  %shl.12 = shl nuw i16 %conv5.12, 8
  %shl.13 = shl nuw i16 %conv5.13, 8
  %shl.14 = shl nuw i16 %conv5.14, 8
  %shl.15 = shl nuw i16 %conv5.15, 8
  %arrayidx3.1 = getelementptr inbounds i16, ptr %b, i64 1
  %arrayidx3.2 = getelementptr inbounds i16, ptr %b, i64 2
  %arrayidx3.3 = getelementptr inbounds i16, ptr %b, i64 3
  %arrayidx3.4 = getelementptr inbounds i16, ptr %b, i64 4
  %arrayidx3.5 = getelementptr inbounds i16, ptr %b, i64 5
  %arrayidx3.6 = getelementptr inbounds i16, ptr %b, i64 6
  %arrayidx3.7 = getelementptr inbounds i16, ptr %b, i64 7
  %arrayidx3.8 = getelementptr inbounds i16, ptr %b, i64 8
  %arrayidx3.9 = getelementptr inbounds i16, ptr %b, i64 9
  %arrayidx3.10 = getelementptr inbounds i16, ptr %b, i64 10
  %arrayidx3.11 = getelementptr inbounds i16, ptr %b, i64 11
  %arrayidx3.12 = getelementptr inbounds i16, ptr %b, i64 12
  %arrayidx3.13 = getelementptr inbounds i16, ptr %b, i64 13
  %arrayidx3.14 = getelementptr inbounds i16, ptr %b, i64 14
  %arrayidx3.15 = getelementptr inbounds i16, ptr %b, i64 15
  store i16 %shl, ptr %b, align 2
  store i16 %shl.1, ptr %arrayidx3.1, align 2
  store i16 %shl.2, ptr %arrayidx3.2, align 2
  store i16 %shl.3, ptr %arrayidx3.3, align 2
  store i16 %shl.4, ptr %arrayidx3.4, align 2
  store i16 %shl.5, ptr %arrayidx3.5, align 2
  store i16 %shl.6, ptr %arrayidx3.6, align 2
  store i16 %shl.7, ptr %arrayidx3.7, align 2
  store i16 %shl.8, ptr %arrayidx3.8, align 2
  store i16 %shl.9, ptr %arrayidx3.9, align 2
  store i16 %shl.10, ptr %arrayidx3.10, align 2
  store i16 %shl.11, ptr %arrayidx3.11, align 2
  store i16 %shl.12, ptr %arrayidx3.12, align 2
  store i16 %shl.13, ptr %arrayidx3.13, align 2
  store i16 %shl.14, ptr %arrayidx3.14, align 2
  store i16 %shl.15, ptr %arrayidx3.15, align 2
  ret void
}
