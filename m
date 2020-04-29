Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D371BE713
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1411689;
	Wed, 29 Apr 2020 21:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1411689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187716;
	bh=4xxX3t98xQSW9ZP1wQ9e9tBPmyUyd6UnnTiX5NukiU8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=haCmGiE9hQabNjgDGMK77q0bG1nwH/TPMYhlAJEj5LtzX1sPBpQE/4bTDVVBNqtiT
	 Q8c+MntaqUbSo/Yu+kuyiGpBDlZNNkGmGeOZtqLEsk5ejifsgHkVSLngEFGt6pfS+f
	 +BBw7VSmQUjRH3SaM+ter32CwvvsVX6sGlG7r1Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BCEF802BC;
	Wed, 29 Apr 2020 21:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C90F802A2; Wed, 29 Apr 2020 21:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8775FF8022B
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8775FF8022B
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d31 with ME
 id YjAq2200t0PJwDa03jB6ie; Wed, 29 Apr 2020 21:11:07 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 29 Apr 2020 21:11:07 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6 V2] [pcm_dmix assembly] refactor the PIC mode
Date: Wed, 29 Apr 2020 21:10:38 +0200
Message-Id: <20200429191039.28106-5-frederic.recoules@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429191039.28106-1-frederic.recoules@univ-grenoble-alpes.fr>
References: <20200429191039.28106-1-frederic.recoules@univ-grenoble-alpes.fr>
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

Note: newer versions of GCC accept that ebx is declared
      in the clobber list.

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 src/pcm/pcm_dmix_i386.h   | 93 ++++++++++++++++++++++++++++++---------
 src/pcm/pcm_dmix_x86_64.h | 59 ++++++++++++++++++++-----
 2 files changed, 120 insertions(+), 32 deletions(-)

diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index d9bf8f50..b28ae787 100644
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
+#     ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#     endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -46,8 +51,9 @@ static void MIX_AREAS_16(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#            endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -140,13 +146,20 @@ static void MIX_AREAS_16(unsigned int size,
 		"\tjnz 1b\n"

 		"7:"
+#            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_EBX
+		  , "ebx"
+#               endif
 	);
 }

@@ -158,8 +171,9 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 			     volatile signed int *sum, size_t dst_step,
 			     size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#     endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -170,8 +184,9 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#            endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers and clear MM1
 		 */
@@ -231,13 +246,20 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 		"\tjnz 1b\n"
 		"\temms\n"
                 "5:"
+#            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_EBX
+		  , "ebx"
+#               endif
 #               ifdef HAVE_MMX
 		  , "mm0", "mm1"
 #               else
@@ -255,8 +277,9 @@ static void MIX_AREAS_32(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#     endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -267,8 +290,9 @@ static void MIX_AREAS_32(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#            endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -350,13 +374,20 @@ static void MIX_AREAS_32(unsigned int size,
 		"\tjmp 1b\n"

 		"6:"
+#            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_EBX
+		  , "ebx"
+#               endif
 	);
 }

@@ -368,8 +399,9 @@ static void MIX_AREAS_24(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#     endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -380,8 +412,9 @@ static void MIX_AREAS_24(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#            endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -456,13 +489,20 @@ static void MIX_AREAS_24(unsigned int size,
 		"\tjmp 1b\n"

 		"6:"
+#            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_EBX
+		  , "ebx"
+#               endif
 	);
 }

@@ -474,8 +514,9 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 			      volatile signed int *sum, size_t dst_step,
 			      size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_EBX
 	unsigned int old_ebx;
-
+#     endif
 	/*
 	 *  ESI - src
 	 *  EDI - dst
@@ -486,8 +527,9 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_EBX
 		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
+#            endif
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
@@ -555,12 +597,23 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 		"\tjnz 1b\n"

 		"6:"
+#            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
-
-	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_EBX
+		  , [old_ebx] "=m" (old_ebx)
+#               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_EBX
+		  , "ebx"
+#               endif
 	);
 }
+
+#ifdef BOUNDED_EBX
+#  undef BOUNDED_EBX
+#endif
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index 8ad1b2a0..f543a134 100644
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
+#     ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#     endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -47,8 +52,9 @@ static void MIX_AREAS_16(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#            endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers and clear MM1
 		 */
@@ -113,13 +119,20 @@ static void MIX_AREAS_16(unsigned int size,
 		"6:"

 		"\temms\n"
+#            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_RBX
+		  , "rbx"
+#               endif
 #               ifdef HAVE_MMX
 		  , "mm0", "mm1"
 #               else
@@ -137,8 +150,9 @@ static void MIX_AREAS_32(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#     endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -149,8 +163,9 @@ static void MIX_AREAS_32(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#            endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
@@ -234,13 +249,20 @@ static void MIX_AREAS_32(unsigned int size,
 		"\tjnz 1b\n"

 		"6:"
+#            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_RBX
+		  , "rbx"
+#               endif
 	);
 }

@@ -252,8 +274,9 @@ static void MIX_AREAS_24(unsigned int size,
 			 volatile signed int *sum, size_t dst_step,
 			 size_t src_step, size_t sum_step)
 {
+#     ifdef BOUNDED_RBX
 	unsigned long long old_rbx;
-
+#     endif
 	/*
 	 *  RSI - src
 	 *  RDI - dst
@@ -264,8 +287,9 @@ static void MIX_AREAS_24(unsigned int size,
 	 */
 	__asm__ __volatile__ (
 		"\n"
-
+#            ifdef BOUNDED_RBX
 		"\tmovq %%rbx, %[old_rbx]\n"
+#            endif
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
@@ -337,12 +361,23 @@ static void MIX_AREAS_24(unsigned int size,
 		"\tjnz 1b\n"

 		"6:"
+#            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
-
-		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+#            endif
+		: [size] "+m" (size)
+#               ifdef BOUNDED_RBX
+		  , [old_rbx] "=m" (old_rbx)
+#               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#               ifndef BOUNDED_RBX
+		  , "rbx"
+#               endif
 	);
 }
+
+#ifdef BOUNDED_RBX
+#  undef BOUNDED_RBX
+#endif
--
2.17.1

Note: it has not been tested but I can not figure out it could break
something because the compiler is now aware that ebx is clobbered.
Curiously, it seems it significantly reduces the size of the code.
