Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71750EF6C5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CCD1713;
	Tue,  5 Nov 2019 09:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CCD1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572941011;
	bh=oame+hngOpbmbMk7YbH06YYDa+T1tF3eDNgaUa+UHAg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPSnCTtcSqcbUCAFF4k5wMzfIN3cjTUz6pC8uakyz6g4bjCCie0rBoXNXh4aPf3w0
	 EE86iGy4J6MIB9IKNobJS1888IcsePjamPYxuDKszXZ9Sc1bz0TVRlizvGgB+03MoI
	 dTefhmwuflzF2NX7/1qUrQi8FMkFRH1JWyTQEicY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1AE1F8053B;
	Tue,  5 Nov 2019 09:01:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E7FAF805DF; Tue,  5 Nov 2019 09:01:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8E2CF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E2CF800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FCBCB04F
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 08:01:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 09:01:37 +0100
Message-Id: <20191105080138.1260-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105080138.1260-1-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/4] ALSA: pcm: Handle special page mapping in
	the default mmap handler
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When a driver needs to deal with a special buffer like a SG or a
vmalloc buffer, it has to set up the PCM page ops explicitly for the
corresponding helper function.  This is rather error-prone and many
people forgot or incorrectly used it.

For simplifying the call patterns and avoiding such a potential bug,
this patch enhances the PCM default mmap handler to check the
(pre-)allocated buffer type and handles the page gracefully depending
on the buffer type.  If the PCM page ops is given, the ops is still
used in a higher priority.  The new code path is only for the default
(NULL page ops) case.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index c3a139436ac2..998c63192ae4 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -13,6 +13,7 @@
 #include <linux/pm_qos.h>
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
+#include <linux/vmalloc.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/info.h>
@@ -3335,7 +3336,18 @@ static inline struct page *
 snd_pcm_default_page_ops(struct snd_pcm_substream *substream, unsigned long ofs)
 {
 	void *vaddr = substream->runtime->dma_area + ofs;
-	return virt_to_page(vaddr);
+
+	switch (substream->dma_buffer.dev.type) {
+#ifdef CONFIG_SND_DMA_SGBUF
+	case SNDRV_DMA_TYPE_DEV_SG:
+	case SNDRV_DMA_TYPE_DEV_UC_SG:
+		return snd_pcm_sgbuf_ops_page(substream, ofs);
+#endif /* CONFIG_SND_DMA_SGBUF */
+	case SNDRV_DMA_TYPE_VMALLOC:
+		return vmalloc_to_page(vaddr);
+	default:
+		return virt_to_page(vaddr);
+	}
 }
 
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
