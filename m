Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3021C77C2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E3F169C;
	Wed,  6 May 2020 19:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E3F169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588785854;
	bh=495ggyzYjcXlC2ISJTldvsycSQ+peaO9l0WjxcYspOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gcnw0p1DfpxbG/odmSeqKj5X1nag4suxJjEBwUmhlwQrCMXpVP0EgFP+THF15xNuy
	 lEHGGMpZI06RDaEE6LWy6OmC8CTTMXbLvuVUfJDRKMJDGb5xI6fFgaNC6iZIWQjDxw
	 6xuxW6enbcJsVbG+Cc0sFwHSLZ47lzEUmEO6IK5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00D1F802A8;
	Wed,  6 May 2020 19:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C987F80249; Wed,  6 May 2020 19:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5672F80253
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5672F80253
Received: from is232189.intra.cea.fr ([46.193.2.18]) by mwinf5d87 with ME
 id bVKi2200W0PJwDa03VKp7b; Wed, 06 May 2020 19:19:49 +0200
X-ME-Helo: is232189.intra.cea.fr
X-ME-Auth: ZnJlZGVyaWMucmVjb3VsZXNAb3JhbmdlLmZy
X-ME-Date: Wed, 06 May 2020 19:19:49 +0200
X-ME-IP: 46.193.2.18
From: frederic.recoules@univ-grenoble-alpes.fr
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 3/5] pcm_dmix assembly: fix the interface for safety (mmx)
Date: Wed,  6 May 2020 19:19:22 +0200
Message-Id: <20200506171924.2644-3-frederic.recoules@univ-grenoble-alpes.fr>
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

- add mm0 in the clobber list if the compiler
  is aware of the mmx technology;
- otherwise, add the mmx aliased x87 floating point
  registers in the clobbers;
- the configure now checks if the compiler is aware of
  the MMX technology.

  The compiler assumes none of the mmx or x87 registers are used
  by the function. If it chooses to store some data in them, they
  will be overwritten by the chunk.
  Recall that any mmx instruction invalidate the whole set of
  x87 floating point registers.

  Note: currently does not impact the binary output.

Signed-off-by: Frédéric Recoules <frederic.recoules@orange.fr>
---
 configure.ac              | 7 +++++++
 src/pcm/pcm_dmix_i386.h   | 6 ++++++
 src/pcm/pcm_dmix_x86_64.h | 6 ++++++
 3 files changed, 19 insertions(+)

diff --git a/configure.ac b/configure.ac
index 4b5ab662..1838e50b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -516,6 +516,13 @@ if test -z "$gcc_have_atomics"; then
 fi
 AC_MSG_RESULT($gcc_have_atomics)
 
+dnl check mmx register for pcm_dmix_i386
+
+AC_TRY_LINK([],
+    [__asm__ volatile ("" : : : "mm0");],
+    [AC_DEFINE([HAVE_MMX], "1", [MMX technology is enabled])],
+    [])
+
 PCM_PLUGIN_LIST="copy linear route mulaw alaw adpcm rate plug multi shm file null empty share meter hooks lfloat ladspa dmix dshare dsnoop asym iec958 softvol extplug ioplug mmap_emul"
 
 build_pcm_plugin="no"
diff --git a/src/pcm/pcm_dmix_i386.h b/src/pcm/pcm_dmix_i386.h
index 3ea0737d..5c900bf1 100644
--- a/src/pcm/pcm_dmix_i386.h
+++ b/src/pcm/pcm_dmix_i386.h
@@ -237,6 +237,12 @@ static void MIX_AREAS_16_MMX(unsigned int size,
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "esi", "edi", "edx", "ecx", "eax", "memory", "cc"
+#ifdef HAVE_MMX
+		  , "mm0"
+#else
+		  , "st", "st(1)", "st(2)", "st(3)",
+		  "st(4)", "st(5)", "st(6)", "st(7)"
+#endif
 	);
 }
 
diff --git a/src/pcm/pcm_dmix_x86_64.h b/src/pcm/pcm_dmix_x86_64.h
index 7f711547..803d3b24 100644
--- a/src/pcm/pcm_dmix_x86_64.h
+++ b/src/pcm/pcm_dmix_x86_64.h
@@ -119,6 +119,12 @@ static void MIX_AREAS_16(unsigned int size,
 		  [dst_step] "m" (dst_step),  [src_step] "m" (src_step),
 		  [sum_step] "m" (sum_step)
 		: "rsi", "rdi", "edx", "ecx", "eax", "memory", "cc"
+#ifdef HAVE_MMX
+		  , "mm0"
+#else
+		  , "st", "st(1)", "st(2)", "st(3)",
+		  "st(4)", "st(5)", "st(6)", "st(7)"
+#endif
 	);
 }
 
-- 
2.17.1

