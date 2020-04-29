Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B21BE70D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C27D1673;
	Wed, 29 Apr 2020 21:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C27D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187627;
	bh=6XF5Xrp+tT2nCcEsULrcikd1dv0Bmx47Rp48v2YO6yk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJ1hoKhrRSgqUtnkqZ64Y9uKrobpmgHA2M6IFQfwW66eRxZOxIqpvOaiI4HSBQt06
	 a7XgQNYQ+AXiC/7rRocXcc47zJHpNQxyMTwI+Xdo+jzUD7FMXCAxrBA2N7aZDg3rFZ
	 O4qHh1EZ1fPtwaVSLHlGjBAz96lp76Exf9waivXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBA7F8028F;
	Wed, 29 Apr 2020 21:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62C3EF80247; Wed, 29 Apr 2020 21:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 746C9F800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 746C9F800D2
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d31 with ME
 id YjAq2200t0PJwDa03jB1iJ; Wed, 29 Apr 2020 21:11:02 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 29 Apr 2020 21:11:02 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6 V2] [pcm_dmix assembly] fix the interface for safety
Date: Wed, 29 Apr 2020 21:10:36 +0200
Message-Id: <20200429191039.28106-3-frederic.recoules@univ-grenoble-alpes.fr>
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

- move 'size' and 'old_ebx' in the output section
  since they are clobbered;
- add the "memory" clobber since input pointers
  are dereferenced;
- (minor) add the "cc" clobber since flags are
  clobbered.

Note: produce exactly the same binary output.

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 src/pcm/pcm_dmix_i386.h   | 45 +++++++++++++++++----------------------
 src/pcm/pcm_dmix_x86_64.h | 27 +++++++++++------------
 2 files changed, 32 insertions(+), 40 deletions(-)

diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index e816d5e0..3ea0737d 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -142,12 +142,11 @@ static void MIX_AREAS_16(unsigned int size,
 		"7:"
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

-		: /* no output regs */
-		: [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
-		: "esi", "edi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -233,12 +232,11 @@ static void MIX_AREAS_16_MMX(unsigned int size,
                 "5:"
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

-		: /* no output regs */
-		: [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
-		: "esi", "edi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -347,12 +345,11 @@ static void MIX_AREAS_32(unsigned int size,
 		"6:"
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

-		: /* no output regs */
-		: [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		: [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
-		: "esi", "edi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -454,12 +451,11 @@ static void MIX_AREAS_24(unsigned int size,
 		"6:"
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

-		: /* no output regs */
-		: [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
-		: "esi", "edi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -554,11 +550,10 @@ static void MIX_AREAS_24_CMOV(unsigned int size,
 		"6:"
 		"\tmovl %[old_ebx], %%ebx\n"	/* ebx is GOT pointer (-fPIC) */

-		: /* no output regs */
-		: [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+	        : [size] "+m" (size), [old_ebx] "=m" (old_ebx)
+		: [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_ebx] "m" (old_ebx)
-		: "esi", "edi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index dc433b35..7f711547 100644
--- a/src/pcm/pcm_dmix_x86_64.h
+++ b/src/pcm/pcm_dmix_x86_64.h
@@ -114,12 +114,11 @@ static void MIX_AREAS_16(unsigned int size,
 		"\temms\n"
 		"\tmovq %[old_rbx], %%rbx\n"

-		: /* no output regs */
-	        : [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
-		: "rsi", "rdi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -230,12 +229,11 @@ static void MIX_AREAS_32(unsigned int size,
 		"6:"
 		"\tmovq %[old_rbx], %%rbx\n"

-		: /* no output regs */
-	        : [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
-		: "rsi", "rdi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }

@@ -334,11 +332,10 @@ static void MIX_AREAS_24(unsigned int size,
 		"6:"
 		"\tmovq %[old_rbx], %%rbx\n"

-		: /* no output regs */
-	        : [size] "m" (size),
-		  [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
+		: [size] "+m" (size), [old_rbx] "=m" (old_rbx)
+	        : [dst] "m" (dst), [src] "m" (src), [sum] "m" (sum),
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
-		  [sum_step] "m" (sum_step), [old_rbx] "m" (old_rbx)
-		: "rsi", "rdi", "edx", "ecx", "eax"
+		  [sum_step] "m" (sum_step)
+		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
 	);
 }
--
2.17.1
