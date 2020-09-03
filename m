Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA725BF9F
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096B01914;
	Thu,  3 Sep 2020 12:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096B01914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130350;
	bh=lMDRkzK+SOdIJczYhFF8Emk5f0XLlstvZUEFboInU/A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxx+JLaCE+p2hGfqM9beGsNQBcHVUUFVEp9waAOxwXx6gwaLuKf6jySxthZpWTx5v
	 FyiCgoWlxJI0xZdrJBtPF3yvIoaDcOdXWU37e9XPiiauZoAt9pu86MXMZVR6XoV6wA
	 +TOe2lGcdAOYkkacwW/wFHyk5JGG8qMGHcE16geg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8CFF802E1;
	Thu,  3 Sep 2020 12:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCAD8F802E2; Thu,  3 Sep 2020 12:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B206F802C4
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B206F802C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0DA9B149;
 Thu,  3 Sep 2020 10:47:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: txx9: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:47:49 +0200
Message-Id: <20200903104749.21435-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104749.21435-1-tiwai@suse.de>
References: <20200903104749.21435-1-tiwai@suse.de>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In ASoC TXx9 ACLC driver, a tasklet
is still used for offloading the hardware reset function.  It can be
achieved gracefully with a work queued, too.

This patch replaces the tasklet usage in TXx9 ACLC driver with a
simple work.  The conversion is fairly straightforward.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/txx9/txx9aclc.c | 11 ++++++-----
 sound/soc/txx9/txx9aclc.h |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 939b33ec39f5..1d2d0d9b57b0 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -102,7 +102,7 @@ static void txx9aclc_dma_complete(void *arg)
 	if (dmadata->frag_count >= 0) {
 		dmadata->dmacount--;
 		if (!WARN_ON(dmadata->dmacount < 0))
-			tasklet_schedule(&dmadata->tasklet);
+			queue_work(system_highpri_wq, &dmadata->work);
 	}
 	spin_unlock_irqrestore(&dmadata->dma_lock, flags);
 }
@@ -134,9 +134,10 @@ txx9aclc_dma_submit(struct txx9aclc_dmadata *dmadata, dma_addr_t buf_dma_addr)
 
 #define NR_DMA_CHAIN		2
 
-static void txx9aclc_dma_tasklet(struct tasklet_struct *t)
+static void txx9aclc_dma_work(struct work_struct *work)
 {
-	struct txx9aclc_dmadata *dmadata = from_tasklet(dmadata, t, tasklet);
+	struct txx9aclc_dmadata *dmadata =
+		container_of(work, struct txx9aclc_dmadata, work);
 	struct dma_chan *chan = dmadata->dma_chan;
 	struct dma_async_tx_descriptor *desc;
 	struct snd_pcm_substream *substream = dmadata->substream;
@@ -208,7 +209,7 @@ static int txx9aclc_pcm_trigger(struct snd_soc_component *component,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		dmadata->frag_count = -1;
-		tasklet_schedule(&dmadata->tasklet);
+		queue_work(system_highpri_wq, &dmadata->work);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -352,7 +353,7 @@ static int txx9aclc_dma_init(struct txx9aclc_soc_device *dev,
 			"playback" : "capture");
 		return -EBUSY;
 	}
-	tasklet_setup(&dmadata->tasklet, txx9aclc_dma_tasklet);
+	INIT_WORK(&dmadata->work, txx9aclc_dma_work);
 	return 0;
 }
 
diff --git a/sound/soc/txx9/txx9aclc.h b/sound/soc/txx9/txx9aclc.h
index 7b3d57e8e546..37c691ba56ed 100644
--- a/sound/soc/txx9/txx9aclc.h
+++ b/sound/soc/txx9/txx9aclc.h
@@ -43,7 +43,7 @@ struct txx9aclc_dmadata {
 	struct resource *dma_res;
 	struct txx9dmac_slave dma_slave;
 	struct dma_chan *dma_chan;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	spinlock_t dma_lock;
 	int stream; /* SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE */
 	struct snd_pcm_substream *substream;
-- 
2.16.4

