Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8661C77B5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6963C1794;
	Wed,  6 May 2020 19:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6963C1794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588785706;
	bh=G7xx58/uXIvBRu4EQoUBy1LUvBxBkPBafK3wTmcBAQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmWh7kDng7UQiaciV7ewMXLgU3hZNUsyrVo4V9HWSxZotQtWPJ+2mRAMKt5HHFVqe
	 9rEUgdP/s0upuVf+RKhOf9qJPj4Jw+e/fjibKZXktMoH2pczwFiOUi4y79GICXpeRn
	 hqB1RTO8YC/XGmpdKLv100dsafBJxeZEIQ2bn1AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66ECFF8025E;
	Wed,  6 May 2020 19:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A4DF8025E; Wed,  6 May 2020 19:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24433F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24433F800DE
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d87 with ME
 id bVKi2200W0PJwDa03VKq7o; Wed, 06 May 2020 19:19:50 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 06 May 2020 19:19:50 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 4/5] pcm_dmix assembly: refactor the PIC mode
Date: Wed,  6 May 2020 19:19:23 +0200
Message-Id: <20200506171924.2644-4-frederic.recoules@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506171924.2644-1-frederic.recoules@univ-grenoble-alpes.fr>
References: <20200506171924.2644-1-frederic.recoules@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Recoules?= <frederic.recoules@orange.fr>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Frédéric Recoules <frederic.recoules@orange.fr>

Newer versions of GCC (> 5.0) accept that ebx is declared
in the clobber list even in PIC mode. Meanwhile, even
unlikely, the compiler may use ebx as base address of
one of the memory entry, making subsequent access to
them unreliable ('size', 'dst_step', 'src_step', 'sum_step').

Adding ebx in the clobber solves the problem.
By the way, the entry 'old_ebx' is no longer required.

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 src/pcm/pcm_dmix_i386.h   | 93 ++++++++++++++++++++++++++++++---------
 src/pcm/pcm_dmix_x86_64.h | 59 ++++++++++++++++++++-----
 2 files changed, 120 insertions(+), 32 deletions(-)

diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index 5c900bf1..bd1d6644 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -26,6 +26,10 @@
  *
  */
 
+#if defined(__GNUC__) && __GNUC__ < 5 && defined(__PIC__)
+#  define BOUNDED_EBX
+#endif
+
 /*
  *  for plain i386
  */
@@ -34,8 +38,9 @@ static void MIX_AREAS_16(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -46,8 +51,9 @@ static void MIX_AREAS_16(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -140,13 +146,20 @@ static void MIX_AREAS_16(unsigned int size,
 		"\tjnz 1b\n"
 
 		"7:"
+#ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_EBX
+		  , "ebx"
+#endif
 	);
 }
 
@@ -158,8 +171,9 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 			     volatile signed int *sum, size_t dst_step,
 			     size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -170,8 +184,9 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -230,13 +245,20 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 		"\tjnz 1b\n"
 		"\temms\n"
                 "5:"
+#ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_EBX
+		  , "ebx"
+#endif
 #ifdef HAVE_MMX
 		  , "mm0"
 #else
@@ -254,8 +276,9 @@ static void MIX_AREAS_32(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -266,8 +289,9 @@ static void MIX_AREAS_32(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -349,13 +373,20 @@ static void MIX_AREAS_32(unsigned int size,
 		"\tjmp 1b\n"
 
 		"6:"
+#ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_EBX
+		  , "ebx"
+#endif
 	);
 }
 
@@ -367,8 +398,9 @@ static void MIX_AREAS_24(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -379,8 +411,9 @@ static void MIX_AREAS_24(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -455,13 +488,20 @@ static void MIX_AREAS_24(unsigned int size,
 		"\tjmp 1b\n"
 
 		"6:"
+#ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_EBX
+		  , "ebx"
+#endif
 	);
 }
 
@@ -473,8 +513,9 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 			      volatile signed int *sum, size_t dst_step,
 			      size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -485,8 +526,9 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -554,12 +596,23 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 		"\tjnz 1b\n"
 
 		"6:"
+#ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_EBX
+		  , "ebx"
+#endif
 	);
 }
+
+#ifdef BOUNDED_EBX
+#  undef BOUNDED_EBX
+#endif
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index 803d3b24..fff07529 100644
--- a/src/pcm/pcm_dmix_x86_64.h
+++ b/src/pcm/pcm_dmix_x86_64.h
@@ -27,6 +27,10 @@
  *
  */
 
+#if defined(__GNUC__) && __GNUC__ < 5 && defined(__PIC__)
+#  define BOUNDED_RBX
+#endif
+
 /*
  *  MMX optimized
  */
@@ -35,8 +39,9 @@ static void MIX_AREAS_16(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -47,8 +52,9 @@ static void MIX_AREAS_16(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
@@ -112,13 +118,20 @@ static void MIX_AREAS_16(unsigned int size,
 		"6:"
 
 		"\temms\n"
+#ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_RBX
+		  , "rbx"
+#endif
 #ifdef HAVE_MMX
 		  , "mm0"
 #else
@@ -136,8 +149,9 @@ static void MIX_AREAS_32(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -148,8 +162,9 @@ static void MIX_AREAS_32(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
@@ -233,13 +248,20 @@ static void MIX_AREAS_32(unsigned int size,
 		"\tjnz 1b\n"
 
 		"6:"
+#ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_RBX
+		  , "rbx"
+#endif
 	);
 }
 
@@ -251,8 +273,9 @@ static void MIX_AREAS_24(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -263,8 +286,9 @@ static void MIX_AREAS_24(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
@@ -336,12 +360,23 @@ static void MIX_AREAS_24(unsigned int size,
 		"\tjnz 1b\n"
 
 		"6:"
+#ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#endif
+		: [size] "+m" (size)
+#ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#ifndef BOUNDED_RBX
+		  , "rbx"
+#endif
 	);
 }
+
+#ifdef BOUNDED_RBX
+#  undef BOUNDED_RBX
+#endif
-- 
2.17.1

