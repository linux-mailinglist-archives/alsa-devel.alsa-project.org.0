Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAE1BE71C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A7B1673;
	Wed, 29 Apr 2020 21:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A7B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187753;
	bh=gup4YHX5fSe2ET94W4V8jbi1issyEmQkKLt9UFQ1B34=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSHANZTDbRPFhRT/T9SJM4cHKpjlVsAbCyjYWcWekgico1RIY61SUdDVtlrj8f49s
	 Wldxh8WbCw1+KJl2YMWfkEIcuLk1tdp/BaU5vl7LQCH0B8bhZ1PYXyxg3VvdNlNScH
	 HK/ekshUz3BL/xS3UeTunD1pL36/q03faOnwDHKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 907DFF802C3;
	Wed, 29 Apr 2020 21:11:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D75D2F802BE; Wed, 29 Apr 2020 21:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E98F3F80290
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98F3F80290
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d31 with ME
 id YjAq2200t0PJwDa03jB8j0; Wed, 29 Apr 2020 21:11:09 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 29 Apr 2020 21:11:09 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6 V2] [pcm_dmix assembly] (minor) give more freedom over the
 constraints
Date: Wed, 29 Apr 2020 21:10:39 +0200
Message-Id: <20200429191039.28106-6-frederic.recoules@univ-grenoble-alpes.fr>
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

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 src/pcm/pcm_dmix_i386.h   | 30 +++++++++++++++---------------
 src/pcm/pcm_dmix_x86_64.h | 18 +++++++++---------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index b28ae787..65ed6d43 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -149,13 +149,13 @@ static void MIX_AREAS_16(unsigned int size,
 #            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_EBX
 		  , [old_ebx] "=m" (old_ebx)
 #               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_EBX
 		  , "ebx"
@@ -249,13 +249,13 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 #            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_EBX
 		  , [old_ebx] "=m" (old_ebx)
 #               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_EBX
 		  , "ebx"
@@ -377,13 +377,13 @@ static void MIX_AREAS_32(unsigned int size,
 #            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_EBX
 		  , [old_ebx] "=m" (old_ebx)
 #               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_EBX
 		  , "ebx"
@@ -492,13 +492,13 @@ static void MIX_AREAS_24(unsigned int size,
 #            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_EBX
 		  , [old_ebx] "=m" (old_ebx)
 #               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_EBX
 		  , "ebx"
@@ -600,13 +600,13 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 #            ifdef BOUNDED_EBX
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_EBX
 		  , [old_ebx] "=m" (old_ebx)
 #               endif
 		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_EBX
 		  , "ebx"
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index f543a134..4848ff80 100644
--- a/src/pcm/pcm_dmix_x86_64.h
+++ b/src/pcm/pcm_dmix_x86_64.h
@@ -122,13 +122,13 @@ static void MIX_AREAS_16(unsigned int size,
 #            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_RBX
 		  , [old_rbx] "=m" (old_rbx)
 #               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_RBX
 		  , "rbx"
@@ -252,13 +252,13 @@ static void MIX_AREAS_32(unsigned int size,
 #            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_RBX
 		  , [old_rbx] "=m" (old_rbx)
 #               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_RBX
 		  , "rbx"
@@ -364,13 +364,13 @@ static void MIX_AREAS_24(unsigned int size,
 #            ifdef BOUNDED_RBX
 		"\tmovq %[old_rbx], %%rbx\n"
 #            endif
-		: [size] "+m" (size)
+		: [size] "+&rm" (size)
 #               ifdef BOUNDED_RBX
 		  , [old_rbx] "=m" (old_rbx)
 #               endif
 	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
-		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step)
+		  [dst_step] "im" (dst_step),  [src_step] "im" (src_step),
+		  [sum_step] "im" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 #               ifndef BOUNDED_RBX
 		  , "rbx"
--
2.17.1
