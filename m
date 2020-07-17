Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB152234D7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 08:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0423B1662;
	Fri, 17 Jul 2020 08:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0423B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594968209;
	bh=W85Q8NUEFxnWAccfvpFBfEsI2Hv7PZ3NM1yUoC9zU7U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lKhzxydxgQPbGfHpcqvgg6ozD85Q+n/iQfNx9ANYSms+U9e+dDAgFYxHDaNJhJai1
	 16Z9G4rDoGg8WAFoQxH2hnU0e5bSZxdQdCHVJfGXraKF5PXYdjDgy3ka3ZB0TwZeQ2
	 rDNudGMYADPT1e1E6Jv76b0kHgJJ40NGqoMtmriI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1471FF800E4;
	Fri, 17 Jul 2020 08:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48685F80217; Fri, 17 Jul 2020 08:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D751F8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 08:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D751F8014E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CB46AC20
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:41:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: pcm: Use SG-buffer only when direct DMA is
 available"
Date: Fri, 17 Jul 2020 08:41:30 +0200
Message-Id: <20200717064130.22957-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

This reverts commit 3ad796cbc36a ("ALSA: pcm: Use SG-buffer only when
direct DMA is available") also the modification commit 467fd0e82b62
("ALSA: pcm: Fix build error on m68k and others").

Poking the DMA internal helper is a layer violation, so we should
avoid that.  Meanwhile the actual bug has been addressed by the
Kconfig fix in commit dbed452a078d ("dma-pool: decouple DMA_REMAP from
DMA_COHERENT_POOL"), so we can live without this hack.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 795af1b88051..1bf6a3d9e0c2 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -11,7 +11,6 @@
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 #include <linux/export.h>
-#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/info.h>
@@ -41,19 +40,6 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
 		return -ENOMEM;
 
-
-#ifdef CONFIG_SND_DMA_SGBUF
-	if ((type == SNDRV_DMA_TYPE_DEV_SG || type == SNDRV_DMA_TYPE_DEV_UC_SG) &&
-	    !dma_is_direct(get_dma_ops(dev))) {
-		/* mutate to continuous page allocation */
-		dev_dbg(dev, "Use continuous page allocator\n");
-		if (type == SNDRV_DMA_TYPE_DEV_SG)
-			type = SNDRV_DMA_TYPE_DEV;
-		else
-			type = SNDRV_DMA_TYPE_DEV_UC;
-	}
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 	err = snd_dma_alloc_pages(type, dev, size, dmab);
 	if (!err) {
 		mutex_lock(&card->memory_mutex);
-- 
2.16.4

