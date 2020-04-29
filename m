Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E21BE70A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C7B41692;
	Wed, 29 Apr 2020 21:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C7B41692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187612;
	bh=nryJOzFM98racKi2uvbSx28r/AUjuDF1JXfd/4zzJTI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1Oo8sNlN+yA+V3Pl99U3Tzb6Cu8oOv77heIe5nNeciU4EfQSewooXcCfzHdBVD3v
	 w97hjZD1fTAtrAK+b1YERZPUfJv5cXhO5GoBoMYhPPD0uWF6je8N4O9/0xvkYuK7gK
	 z9BAuK79ExtVRL9yPKYI3BlPLbmey85yVGEhYbWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A77F8026F;
	Wed, 29 Apr 2020 21:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BF1F8026F; Wed, 29 Apr 2020 21:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89C7EF800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C7EF800B6
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d31 with ME
 id YjAq2200t0PJwDa03jAyhu; Wed, 29 Apr 2020 21:10:59 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 29 Apr 2020 21:10:59 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6 V2] [pcm_dmix assembly] change the token by symbolic names
Date: Wed, 29 Apr 2020 21:10:35 +0200
Message-Id: <20200429191039.28106-2-frederic.recoules@univ-grenoble-alpes.fr>
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

Note: produce exactly the same binary output.

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 src/pcm/pcm_dmix_i386.h   | 147 ++++++++++++++++++++------------------
 src/pcm/pcm_dmix_x86_64.h |  93 ++++++++++++------------
 2 files changed, 124 insertions(+), 116 deletions(-)

diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index 2778cb1d..e816d5e0 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -47,14 +47,14 @@ static void MIX_AREAS_16(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovl %%ebx, %7\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
-		"\tmovl %1, %%edi\n"
-		"\tmovl %2, %%esi\n"
-		"\tmovl %3, %%ebx\n"
-		"\tcmpl $0, %0\n"
+		"\tmovl %[dst], %%edi\n"
+		"\tmovl %[src], %%esi\n"
+		"\tmovl %[sum], %%ebx\n"
+		"\tcmpl $0, %[size]\n"
 		"\tjnz 2f\n"
 		"\tjmp 7f\n"

@@ -64,9 +64,9 @@ static void MIX_AREAS_16(unsigned int size,
 		 */
 		"\t.p2align 4,,15\n"
 		"1:"
-		"\tadd %4, %%edi\n"
-		"\tadd %5, %%esi\n"
-		"\tadd %6, %%ebx\n"
+		"\tadd %[dst_step], %%edi\n"
+		"\tadd %[src_step], %%esi\n"
+		"\tadd %[sum_step], %%ebx\n"

 		/*
 		 *   sample = *src;
@@ -108,7 +108,7 @@ static void MIX_AREAS_16(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
 		"\tjmp 7f\n"

@@ -122,7 +122,7 @@ static void MIX_AREAS_16(unsigned int size,
 		"\tmovw $0x7fff, (%%edi)\n"
 		"\tcmpl %%ecx,(%%ebx)\n"
 		"\tjnz 4b\n"
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
 		"\tjmp 7f\n"

@@ -136,16 +136,17 @@ static void MIX_AREAS_16(unsigned int size,
 		"\tmovw $-0x8000, (%%edi)\n"
 		"\tcmpl %%ecx, (%%ebx)\n"
 		"\tjnz 4b\n"
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
-
+
 		"7:"
-		"\tmovl %7, %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_ebx)
+		: [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
 		: "esi", "edi", "edx", "ecx", "eax"
 	);
 }
@@ -171,22 +172,22 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovl %%ebx, %7\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
-		"\tmovl %1, %%edi\n"
-		"\tmovl %2, %%esi\n"
-		"\tmovl %3, %%ebx\n"
-		"\tcmpl $0, %0\n"
+		"\tmovl %[dst], %%edi\n"
+		"\tmovl %[src], %%esi\n"
+		"\tmovl %[sum], %%ebx\n"
+		"\tcmpl $0, %[size]\n"
 		"\tjnz 2f\n"
 		"\tjmp 5f\n"

 		"\t.p2align 4,,15\n"
 		"1:"
-		"\tadd %4, %%edi\n"
-		"\tadd %5, %%esi\n"
-		"\tadd %6, %%ebx\n"
+		"\tadd %[dst_step], %%edi\n"
+		"\tadd %[src_step], %%esi\n"
+		"\tadd %[sum_step], %%ebx\n"

 		"2:"
 		/*
@@ -226,16 +227,17 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
 		"\temms\n"
                 "5:"
-		"\tmovl %7, %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_ebx)
+		: [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
 		: "esi", "edi", "edx", "ecx", "eax"
 	);
 }
@@ -261,14 +263,14 @@ static void MIX_AREAS_32(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovl %%ebx, %7\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
-		"\tmovl %1, %%edi\n"
-		"\tmovl %2, %%esi\n"
-		"\tmovl %3, %%ebx\n"
-		"\tcmpl $0, %0\n"
+		"\tmovl %[dst], %%edi\n"
+		"\tmovl %[src], %%esi\n"
+		"\tmovl %[sum], %%ebx\n"
+		"\tcmpl $0, %[size]\n"
 		"\tjnz 1f\n"
 		"\tjmp 6f\n"

@@ -335,20 +337,21 @@ static void MIX_AREAS_32(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjz 6f\n"
-		"\tadd %4, %%edi\n"
-		"\tadd %5, %%esi\n"
-		"\tadd %6, %%ebx\n"
+		"\tadd %[dst_step], %%edi\n"
+		"\tadd %[src_step], %%esi\n"
+		"\tadd %[sum_step], %%ebx\n"
 		"\tjmp 1b\n"
-
+
 		"6:"
-		"\tmovl %7, %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_ebx)
+		: [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
 		: "esi", "edi", "edx", "ecx", "eax"
 	);
 }
@@ -374,14 +377,14 @@ static void MIX_AREAS_24(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovl %%ebx, %7\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
-		"\tmovl %1, %%edi\n"
-		"\tmovl %2, %%esi\n"
-		"\tmovl %3, %%ebx\n"
-		"\tcmpl $0, %0\n"
+		"\tmovl %[dst], %%edi\n"
+		"\tmovl %[src], %%esi\n"
+		"\tmovl %[sum], %%ebx\n"
+		"\tcmpl $0, %[size]\n"
 		"\tjnz 1f\n"
 		"\tjmp 6f\n"

@@ -441,20 +444,21 @@ static void MIX_AREAS_24(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tdecl %0\n"
+		"\tdecl %[size]\n"
 		"\tjz 6f\n"
-		"\tadd %4, %%edi\n"
-		"\tadd %5, %%esi\n"
-		"\tadd %6, %%ebx\n"
+		"\tadd %[dst_step], %%edi\n"
+		"\tadd %[src_step], %%esi\n"
+		"\tadd %[sum_step], %%ebx\n"
 		"\tjmp 1b\n"
-
+
 		"6:"
-		"\tmovl %7, %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_ebx)
+		: [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
 		: "esi", "edi", "edx", "ecx", "eax"
 	);
 }
@@ -480,14 +484,14 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovl %%ebx, %7\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %%ebx, %[old_ebx]\n"	/* ebx is GOT pointer (-fPIC) */
 		/*
 		 *  initialization, load ESI, EDI, EBX registers
 		 */
-		"\tmovl %1, %%edi\n"
-		"\tmovl %2, %%esi\n"
-		"\tmovl %3, %%ebx\n"
-		"\tcmpl $0, %0\n"
+		"\tmovl %[dst], %%edi\n"
+		"\tmovl %[src], %%esi\n"
+		"\tmovl %[sum], %%ebx\n"
+		"\tcmpl $0, %[size]\n"
 		"\tjz 6f\n"

 		"\t.p2align 4,,15\n"
@@ -541,19 +545,20 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tadd %4, %%edi\n"
-		"\tadd %5, %%esi\n"
-		"\tadd %6, %%ebx\n"
-		"\tdecl %0\n"
+		"\tadd %[dst_step], %%edi\n"
+		"\tadd %[src_step], %%esi\n"
+		"\tadd %[sum_step], %%ebx\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
-
+
 		"6:"
-		"\tmovl %7, %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
+		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_ebx)
+		: [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
 		: "esi", "edi", "edx", "ecx", "eax"
 	);
 }
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index 1ef608af..dc433b35 100644
--- a/src/pcm/pcm_dmix_x86_64.h
+++ b/src/pcm/pcm_dmix_x86_64.h
@@ -48,18 +48,18 @@ static void MIX_AREAS_16(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovq %%rbx, %7\n"
+		"\tmovq %%rbx, %[old_rbx]\n"
 		/*
 		 *  initialization, load RSI, RDI, RBX registers
 		 */
-		"\tmovq %1, %%rdi\n"
-		"\tmovq %2, %%rsi\n"
-		"\tmovq %3, %%rbx\n"
+		"\tmovq %[dst], %%rdi\n"
+		"\tmovq %[src], %%rsi\n"
+		"\tmovq %[sum], %%rbx\n"

 		/*
 		 * while (size-- > 0) {
 		 */
-		"\tcmpl $0, %0\n"
+		"\tcmpl $0, %[size]\n"
 		"jz 6f\n"

 		"\t.p2align 4,,15\n"
@@ -103,21 +103,22 @@ static void MIX_AREAS_16(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tadd %4, %%rdi\n"
-		"\tadd %5, %%rsi\n"
-		"\tadd %6, %%rbx\n"
-		"\tdecl %0\n"
+		"\tadd %[dst_step], %%rdi\n"
+		"\tadd %[src_step], %%rsi\n"
+		"\tadd %[sum_step], %%rbx\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"

 		"6:"
-
+
 		"\temms\n"
-		"\tmovq %7, %%rbx\n"
+		"\tmovq %[old_rbx], %%rbx\n"

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_rbx)
+	        : [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
 		: "rsi", "rdi", "edx", "ecx", "eax"
 	);
 }
@@ -143,18 +144,18 @@ static void MIX_AREAS_32(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovq %%rbx, %7\n"
+		"\tmovq %%rbx, %[old_rbx]\n"
 		/*
-		 *  initialization, load ESI, EDI, EBX registers
+		 *  initialization, load RSI, RDI, RBX registers
 		 */
-		"\tmovq %1, %%rdi\n"
-		"\tmovq %2, %%rsi\n"
-		"\tmovq %3, %%rbx\n"
+		"\tmovq %[dst], %%rdi\n"
+		"\tmovq %[src], %%rsi\n"
+		"\tmovq %[sum], %%rbx\n"

 		/*
 		 * while (size-- > 0) {
 		 */
-		"\tcmpl $0, %0\n"
+		"\tcmpl $0, %[size]\n"
 		"jz 6f\n"

 		"\t.p2align 4,,15\n"
@@ -220,19 +221,20 @@ static void MIX_AREAS_32(unsigned int size,
 		/*
 		 * while (size-- > 0)
 		 */
-		"\tadd %4, %%rdi\n"
-		"\tadd %5, %%rsi\n"
-		"\tadd %6, %%rbx\n"
-		"\tdecl %0\n"
+		"\tadd %[dst_step], %%rdi\n"
+		"\tadd %[src_step], %%rsi\n"
+		"\tadd %[sum_step], %%rbx\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
-
+
 		"6:"
-		"\tmovq %7, %%rbx\n"
+		"\tmovq %[old_rbx], %%rbx\n"

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_rbx)
+	        : [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
 		: "rsi", "rdi", "edx", "ecx", "eax"
 	);
 }
@@ -258,18 +260,18 @@ static void MIX_AREAS_24(unsigned int size,
 	__asm__ __volatile__ (
 		"\n"

-		"\tmovq %%rbx, %7\n"
+		"\tmovq %%rbx, %[old_rbx]\n"
 		/*
-		 *  initialization, load ESI, EDI, EBX registers
+		 *  initialization, load RSI, RDI, RBX registers
 		 */
-		"\tmovq %1, %%rdi\n"
-		"\tmovq %2, %%rsi\n"
-		"\tmovq %3, %%rbx\n"
+		"\tmovq %[dst], %%rdi\n"
+		"\tmovq %[src], %%rsi\n"
+		"\tmovq %[sum], %%rbx\n"

 		/*
 		 * while (size-- > 0) {
 		 */
-		"\tcmpl $0, %0\n"
+		"\tcmpl $0, %[size]\n"
 		"jz 6f\n"

 		"\t.p2align 4,,15\n"
@@ -316,26 +318,27 @@ static void MIX_AREAS_24(unsigned int size,
 		"\tmovw %%ax, (%%rdi)\n"
 		"\tshrl $16, %%eax\n"
 		"\tmovb %%al, 2(%%rdi)\n"
-
+
 		"\tcmpl %%ecx, (%%rbx)\n"
 		"\tjnz 3b\n"

 		/*
 		 * while (size-- > 0)
 		 */
-		"\tadd %4, %%rdi\n"
-		"\tadd %5, %%rsi\n"
-		"\tadd %6, %%rbx\n"
-		"\tdecl %0\n"
+		"\tadd %[dst_step], %%rdi\n"
+		"\tadd %[src_step], %%rsi\n"
+		"\tadd %[sum_step], %%rbx\n"
+		"\tdecl %[size]\n"
 		"\tjnz 1b\n"
-
+
 		"6:"
-		"\tmovq %7, %%rbx\n"
+		"\tmovq %[old_rbx], %%rbx\n"

 		: /* no output regs */
-		: "m" (size), "m" (dst), "m" (src),
-		  "m" (sum), "m" (dst_step), "m" (src_step),
-		  "m" (sum_step), "m" (old_rbx)
+	        : [size] "m" (size),
+		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
+		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
 		: "rsi", "rdi", "edx", "ecx", "eax"
 	);
 }
--
2.17.1
