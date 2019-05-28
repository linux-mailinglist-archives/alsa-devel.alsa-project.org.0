Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C522CFEC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 22:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2326B1669;
	Tue, 28 May 2019 22:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2326B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559073875;
	bh=2R6+sZSdF6tktmH8TAJGw4zzWzpqVFvda/PrjbP7oLc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/U3Vu44BdoT0xV3wlfxrNRkoYVPJIYGKuGh2RGihyXALKNi4/F1K7GYpvepXwNjQ
	 pCQhwTG0mTXMrMUvfn8wMC+KVlttwIrm9Tqpm/KdrjOUcqNM9bmixL0ix6leyb0P9o
	 kb/BYNzQLTzuAL82VIRrMBEnhWw3YeoksNkciLuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AD8F89708;
	Tue, 28 May 2019 22:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D6DF8072E; Tue, 28 May 2019 22:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB559F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 22:02:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D3AAAA003F;
 Tue, 28 May 2019 22:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D3AAAA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1559073764; bh=4a5c5aSy2UVB93YUJ5pnDtf+5Gow1EYiIXPPDfsB0Ac=;
 h=From:To:Cc:Subject:Date:From;
 b=0MlhEMi2fXb5XmZDViadv2AcHltU2VqAn4U/c/Xfu9zLr5WNA15AgAzraZjpajP4B
 3qiNxAJre4RWSKxlkAygw7oxL8vJGKCkHyBZBea/A6ASLBllByCp3TfGi+kIfDfGzz
 ukUfBtPWXRzcw3fBLvW4VDDphd5a8ScVm1A6NOo0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 28 May 2019 22:02:37 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue, 28 May 2019 22:02:06 +0200
Message-Id: <20190528200206.2793-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: uapi headers - add missing include
	for stdint.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The modified header files depend on types defined in <stdint.h>.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/eq.h       | 4 ++++
 include/uapi/sound/sof/fw.h       | 4 ++++
 include/uapi/sound/sof/header.h   | 4 ++++
 include/uapi/sound/sof/manifest.h | 4 ++++
 include/uapi/sound/sof/trace.h    | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/include/uapi/sound/sof/eq.h b/include/uapi/sound/sof/eq.h
index 666c2b6a3229..106d56e357e0 100644
--- a/include/uapi/sound/sof/eq.h
+++ b/include/uapi/sound/sof/eq.h
@@ -9,6 +9,10 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
 #define __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
 
+#ifndef __KERNEL__
+#include <stdint.h>
+#endif
+
 /* FIR EQ type */
 
 #define SOF_EQ_FIR_IDX_SWITCH	0
diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
index 1afca973eb09..4f2de19a3b86 100644
--- a/include/uapi/sound/sof/fw.h
+++ b/include/uapi/sound/sof/fw.h
@@ -13,6 +13,10 @@
 #ifndef __INCLUDE_UAPI_SOF_FW_H__
 #define __INCLUDE_UAPI_SOF_FW_H__
 
+#ifndef __KERNEL__
+#include <stdint.h>
+#endif
+
 #define SND_SOF_FW_SIG_SIZE	4
 #define SND_SOF_FW_ABI		1
 #define SND_SOF_FW_SIG		"Reef"
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index 7868990b0d6f..6a62ae8f0eb9 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -9,6 +9,10 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
 #define __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
 
+#ifndef __KERNEL__
+#include <stdint.h>
+#endif
+
 /*
  * Header for all non IPC ABI data.
  *
diff --git a/include/uapi/sound/sof/manifest.h b/include/uapi/sound/sof/manifest.h
index 2009ee30fad0..d57aa2bc4764 100644
--- a/include/uapi/sound/sof/manifest.h
+++ b/include/uapi/sound/sof/manifest.h
@@ -9,6 +9,10 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
 #define __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
 
+#ifndef __KERNEL__
+#include <stdint.h>
+#endif
+
 /* start offset for base FW module */
 #define SOF_MAN_ELF_TEXT_OFFSET		0x2000
 
diff --git a/include/uapi/sound/sof/trace.h b/include/uapi/sound/sof/trace.h
index ffa7288a0f16..1652bc08d576 100644
--- a/include/uapi/sound/sof/trace.h
+++ b/include/uapi/sound/sof/trace.h
@@ -9,6 +9,10 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
 #define __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
 
+#ifndef __KERNEL__
+#include <stdint.h>
+#endif
+
 /*
  * Host system time.
  *
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
