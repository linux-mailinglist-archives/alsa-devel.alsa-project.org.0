Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 359C0118A74
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1FDF1661;
	Tue, 10 Dec 2019 15:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1FDF1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986936;
	bh=eRhMQibE5CdeOX4TIs3/JJYMM5rhd9fIcO9kbsNioR0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufuU9THXYaKTAQ4Mw+wYc25JZ13mhY+Ovgekz2St9Z74jqg/h4aSbDJvSBh0C2meh
	 r3pu443F9OjDcfDlGmN9qrbo/S86sIqbIqXGRlGx7z6n16uzL13TjG7kkTOu+UXR0O
	 Ze8h01D2JPK3StezTI53xvizv3YloJS+SJIGuATQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2610AF802EB;
	Tue, 10 Dec 2019 14:59:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2CB6F80277; Tue, 10 Dec 2019 14:59:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1E4F80257
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1E4F80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18DD7B157;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:45 +0100
Message-Id: <20191210135849.15607-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 10/14] media: tm6000: Clean up ALSA PCM
	API usages
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

With the recent change in ALSA PCM core, the whole open-coded vmalloc
buffer handling in this driver can be dropped by replacing with the
managed buffer allocation.

Also, snd_tm6000_capture_free() is dropped since the check of
stream_started flag makes no sense; hw_free callback is guaranteed to
be called after the stream gets stopped.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/tm6000/tm6000-alsa.c | 81 +---------------------------------
 1 file changed, 1 insertion(+), 80 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-alsa.c b/drivers/media/usb/tm6000/tm6000-alsa.c
index d6c79c13b332..2bfa5abc1b49 100644
--- a/drivers/media/usb/tm6000/tm6000-alsa.c
+++ b/drivers/media/usb/tm6000/tm6000-alsa.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/usb.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
 
 #include <linux/delay.h>
 #include <sound/core.h>
@@ -94,40 +93,6 @@ static int _tm6000_stop_audio_dma(struct snd_tm6000_card *chip)
 	return 0;
 }
 
-static void dsp_buffer_free(struct snd_pcm_substream *substream)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-
-	dprintk(2, "Freeing buffer\n");
-
-	vfree(substream->runtime->dma_area);
-	substream->runtime->dma_area = NULL;
-	substream->runtime->dma_bytes = 0;
-}
-
-static int dsp_buffer_alloc(struct snd_pcm_substream *substream, int size)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-
-	dprintk(2, "Allocating buffer\n");
-
-	if (substream->runtime->dma_area) {
-		if (substream->runtime->dma_bytes > size)
-			return 0;
-
-		dsp_buffer_free(substream);
-	}
-
-	substream->runtime->dma_area = vmalloc(size);
-	if (!substream->runtime->dma_area)
-		return -ENOMEM;
-
-	substream->runtime->dma_bytes = size;
-
-	return 0;
-}
-
-
 /****************************************************************************
 				ALSA PCM Interface
  ****************************************************************************/
@@ -268,40 +233,6 @@ static int tm6000_fillbuf(struct tm6000_core *core, char *buf, int size)
 	return 0;
 }
 
-/*
- * hw_params callback
- */
-static int snd_tm6000_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	int size, rc;
-
-	size = params_period_bytes(hw_params) * params_periods(hw_params);
-
-	rc = dsp_buffer_alloc(substream, size);
-	if (rc < 0)
-		return rc;
-
-	return 0;
-}
-
-/*
- * hw free callback
- */
-static int snd_tm6000_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-	struct tm6000_core *core = chip->core;
-
-	if (atomic_read(&core->stream_started) > 0) {
-		atomic_set(&core->stream_started, 0);
-		schedule_work(&core->wq_trigger);
-	}
-
-	dsp_buffer_free(substream);
-	return 0;
-}
-
 /*
  * prepare callback
  */
@@ -369,14 +300,6 @@ static snd_pcm_uframes_t snd_tm6000_pointer(struct snd_pcm_substream *substream)
 	return chip->buf_pos;
 }
 
-static struct page *snd_pcm_get_vmalloc_page(struct snd_pcm_substream *subs,
-					     unsigned long offset)
-{
-	void *pageptr = subs->runtime->dma_area + offset;
-
-	return vmalloc_to_page(pageptr);
-}
-
 /*
  * operators
  */
@@ -384,12 +307,9 @@ static const struct snd_pcm_ops snd_tm6000_pcm_ops = {
 	.open = snd_tm6000_pcm_open,
 	.close = snd_tm6000_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_tm6000_hw_params,
-	.hw_free = snd_tm6000_hw_free,
 	.prepare = snd_tm6000_prepare,
 	.trigger = snd_tm6000_card_trigger,
 	.pointer = snd_tm6000_pointer,
-	.page = snd_pcm_get_vmalloc_page,
 };
 
 /*
@@ -459,6 +379,7 @@ static int tm6000_audio_init(struct tm6000_core *dev)
 	strscpy(pcm->name, "Trident TM5600/60x0", sizeof(pcm->name));
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_tm6000_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	INIT_WORK(&dev->wq_trigger, audio_trigger);
 	rc = snd_card_register(card);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
