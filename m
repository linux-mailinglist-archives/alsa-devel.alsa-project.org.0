Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38F1F9C7B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 18:02:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BBDC166F;
	Mon, 15 Jun 2020 18:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BBDC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592236958;
	bh=XN+QOQKRWc7wKuAbtB+v29aBQtC0V9NSH/eTUqs2DIk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Af+s7CU+OwER4sTm4dMQkD/KAZPI9HhP8BGQvkkVIVB+hBiqe1erC34olHy1HQLhi
	 L6hx5cmnJgOYvfUYVoqcbaDm7kA145wet8Ne+PmPv/HWuD7TxwiAxcxIM2qq3eGPDg
	 uf8iwrdwRvp0Qc6TTOVFHsraxLnAOdylMzipBjkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92425F800EF;
	Mon, 15 Jun 2020 18:00:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9000BF8025F; Mon, 15 Jun 2020 18:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68203F8013E
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 18:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68203F8013E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57506AE0D
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 16:00:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: pcm: Use SG-buffer only when direct DMA is available
Date: Mon, 15 Jun 2020 18:00:45 +0200
Message-Id: <20200615160045.2703-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200615160045.2703-1-tiwai@suse.de>
References: <20200615160045.2703-1-tiwai@suse.de>
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

The DMA-coherent SG-buffer is tricky to use, as it does need the
mapping.  It used to work stably on x86 over years (and that's why we
had enabled SG-buffer on solely x86) with the default mmap handler and
vmap(), but our luck seems no forever success.  The chance of breakage
is high when the special DMA handling is introduced in the arch side.

In this patch, we change the buffer allocation to use the SG-buffer
only when the device in question is with the direct DMA.  It's a bit
hackish, but it's currently the only condition that may work (more or
less) reliably with the default mmap and vmap() for mapping the pages
that are deduced via virt_to_page().

In theory, we can apply the similar hack in the sound/core memory
allocation helper, too; but it's used by SOF for allocating SG pages
without re-mapping via vmap() or mmap, and it's fine to use it in that
way, so let's keep it and adds the workaround in PCM side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 860935e3aea4..8326d16d3596 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -11,6 +11,7 @@
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 #include <linux/export.h>
+#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/info.h>
@@ -39,6 +40,18 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	if (max_alloc_per_card &&
 	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
 		return -ENOMEM;
+
+	if (IS_ENABLED(CONFIG_SND_DMA_SGBUF) &&
+	    (type == SNDRV_DMA_TYPE_DEV_SG || type == SNDRV_DMA_TYPE_DEV_UC_SG) &&
+	    !dma_is_direct(get_dma_ops(dev))) {
+		/* mutate to continuous page allocation */
+		dev_dbg(dev, "Use continuous page allocator\n");
+		if (type == SNDRV_DMA_TYPE_DEV_SG)
+			type = SNDRV_DMA_TYPE_DEV;
+		else
+			type = SNDRV_DMA_TYPE_DEV_UC;
+	}
+
 	err = snd_dma_alloc_pages(type, dev, size, dmab);
 	if (!err) {
 		mutex_lock(&card->memory_mutex);
-- 
2.16.4

