Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E7118A4A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCAC81658;
	Tue, 10 Dec 2019 15:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCAC81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986451;
	bh=hdybu9OO1JIXvVEwSyQnHcP4IQuiLOfzGFhRARMAeak=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHgTouFR8w8x0BcYTIPGLtpTrtJ1lKcexX19JQZuaS89EVk3X6JWwquV9GcKzq0qQ
	 un2Rhav+ASDf19ne9ki/6N5LwKatHkTB6f5GUzI85WAwHo8q1Qly4kT1QjtyZIJ9tj
	 Skmfa3iu2TMg8j9Tv8VrgXFD8fnlgSHXDalhgkWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F279DF8025E;
	Tue, 10 Dec 2019 14:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254EDF800B4; Tue, 10 Dec 2019 14:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EDFCF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EDFCF800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09A8CAEAB;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:41 +0100
Message-Id: <20191210135849.15607-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 06/14] media: ivtv: Clean up ALSA PCM
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

With the recent  change in ALSA PCM core, the whole open-coded vmalloc
buffer handling in this driver can be dropped by replacing with the
managed buffer allocation.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c | 63 +---------------------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
index 9e6019a159f4..cb281ce089f9 100644
--- a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
+++ b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
@@ -16,8 +16,6 @@
 #include "ivtv-alsa.h"
 #include "ivtv-alsa-pcm.h"
 
-#include <linux/vmalloc.h>
-
 #include <sound/core.h>
 #include <sound/pcm.h>
 
@@ -218,55 +216,6 @@ static int snd_ivtv_pcm_ioctl(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-
-static int snd_pcm_alloc_vmalloc_buffer(struct snd_pcm_substream *subs,
-					size_t size)
-{
-	struct snd_pcm_runtime *runtime = subs->runtime;
-
-	dprintk("Allocating vbuffer\n");
-	if (runtime->dma_area) {
-		if (runtime->dma_bytes > size)
-			return 0;
-
-		vfree(runtime->dma_area);
-	}
-	runtime->dma_area = vmalloc(size);
-	if (!runtime->dma_area)
-		return -ENOMEM;
-
-	runtime->dma_bytes = size;
-
-	return 0;
-}
-
-static int snd_ivtv_pcm_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
-{
-	dprintk("%s called\n", __func__);
-
-	return snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(params));
-}
-
-static int snd_ivtv_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_ivtv_card *itvsc = snd_pcm_substream_chip(substream);
-	unsigned long flags;
-	unsigned char *dma_area = NULL;
-
-	spin_lock_irqsave(&itvsc->slock, flags);
-	if (substream->runtime->dma_area) {
-		dprintk("freeing pcm capture region\n");
-		dma_area = substream->runtime->dma_area;
-		substream->runtime->dma_area = NULL;
-	}
-	spin_unlock_irqrestore(&itvsc->slock, flags);
-	vfree(dma_area);
-
-	return 0;
-}
-
 static int snd_ivtv_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_ivtv_card *itvsc = snd_pcm_substream_chip(substream);
@@ -296,24 +245,13 @@ snd_pcm_uframes_t snd_ivtv_pcm_pointer(struct snd_pcm_substream *substream)
 	return hwptr_done;
 }
 
-static struct page *snd_pcm_get_vmalloc_page(struct snd_pcm_substream *subs,
-					     unsigned long offset)
-{
-	void *pageptr = subs->runtime->dma_area + offset;
-
-	return vmalloc_to_page(pageptr);
-}
-
 static const struct snd_pcm_ops snd_ivtv_pcm_capture_ops = {
 	.open		= snd_ivtv_pcm_capture_open,
 	.close		= snd_ivtv_pcm_capture_close,
 	.ioctl		= snd_ivtv_pcm_ioctl,
-	.hw_params	= snd_ivtv_pcm_hw_params,
-	.hw_free	= snd_ivtv_pcm_hw_free,
 	.prepare	= snd_ivtv_pcm_prepare,
 	.trigger	= snd_ivtv_pcm_trigger,
 	.pointer	= snd_ivtv_pcm_pointer,
-	.page		= snd_pcm_get_vmalloc_page,
 };
 
 int snd_ivtv_pcm_create(struct snd_ivtv_card *itvsc)
@@ -339,6 +277,7 @@ int snd_ivtv_pcm_create(struct snd_ivtv_card *itvsc)
 
 	snd_pcm_set_ops(sp, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_ivtv_pcm_capture_ops);
+	snd_pcm_set_managed_buffer_all(sp, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 	sp->info_flags = 0;
 	sp->private_data = itvsc;
 	strscpy(sp->name, itv->card_name, sizeof(sp->name));
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
