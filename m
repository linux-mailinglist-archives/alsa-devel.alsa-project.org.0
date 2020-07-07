Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29506216B33
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 13:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE77D1612;
	Tue,  7 Jul 2020 13:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE77D1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594120459;
	bh=wOnVbaPwYdvO4ll1/i4Wv3AO6B2sCSXcllfC+iesHKM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S/s7In5LHILLL8W8ABI7dEUeRC8h6ZDnT2WAOFBOIkyy93QYbP6y3OvfWNDMhHhYK
	 vYuW3dRkSJEGiq+NHn/JXN7QWj033LsN9F51SEq6ftD1T5nmJ9juZDS+ghBGt/tc5W
	 pFWMzwuCjCO/73B402BorQu0BPVtUmKCwFUH+YIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9BC2F80257;
	Tue,  7 Jul 2020 13:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC56F80216; Tue,  7 Jul 2020 13:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0CDBF800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 13:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0CDBF800DF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2536B163
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 11:12:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Fix build error on m68k and others
Date: Tue,  7 Jul 2020 13:12:25 +0200
Message-Id: <20200707111225.26826-1-tiwai@suse.de>
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

The commit 3ad796cbc36a ("ALSA: pcm: Use SG-buffer only when direct
DMA is available") introduced a check of the DMA type and this caused
a build error on m68k (and possibly some others) due to the lack of
dma_is_direct() definition.  Since the check is needed only for
CONFIG_SND_DMA_SGBUF enablement (i.e. solely x86), use #ifdef instead
of IS_ENABLED() for avoiding such a build error.

Fixes: 3ad796cbc36a ("ALSA: pcm: Use SG-buffer only when direct DMA is available")
Reported-by: Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 8326d16d3596..795af1b88051 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -41,8 +41,9 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
 		return -ENOMEM;
 
-	if (IS_ENABLED(CONFIG_SND_DMA_SGBUF) &&
-	    (type == SNDRV_DMA_TYPE_DEV_SG || type == SNDRV_DMA_TYPE_DEV_UC_SG) &&
+
+#ifdef CONFIG_SND_DMA_SGBUF
+	if ((type == SNDRV_DMA_TYPE_DEV_SG || type == SNDRV_DMA_TYPE_DEV_UC_SG) &&
 	    !dma_is_direct(get_dma_ops(dev))) {
 		/* mutate to continuous page allocation */
 		dev_dbg(dev, "Use continuous page allocator\n");
@@ -51,6 +52,7 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 		else
 			type = SNDRV_DMA_TYPE_DEV_UC;
 	}
+#endif /* CONFIG_SND_DMA_SGBUF */
 
 	err = snd_dma_alloc_pages(type, dev, size, dmab);
 	if (!err) {
-- 
2.16.4

