Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F80118A51
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C36A1668;
	Tue, 10 Dec 2019 15:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C36A1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986542;
	bh=3MQY0KuufqBuXprGQcJ8eFKb7QXu5mGMgFyjDCPB+kg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qlfWlrXLfWwnCCk4rFDSXU1Qxnls2zYyvwGeG0vqS/s0Rd4nOqzHctNCRT/VXF9JO
	 sQ7FppembgguGuoMCBT7QlRLlcH19/YAGzetObEIJWbVOZIzA2ehTq7QQ0bAuYx7TP
	 UJa4F7mo63xKV6fIT/keI3jJTFVCMywv5knpJ9x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E54D1F80273;
	Tue, 10 Dec 2019 14:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99789F8026A; Tue, 10 Dec 2019 14:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89671F80249
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89671F80249
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09EBAAEEC;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:40 +0100
Message-Id: <20191210135849.15607-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 05/14] media: cx18: Clean up ALSA PCM
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

With the recent	change in ALSA PCM core, the whole open-coded vmalloc
buffer handling	in this	driver can be dropped by replacing with	the
managed buffer allocation.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cx18/cx18-alsa-pcm.c | 62 +---------------------------------
 1 file changed, 1 insertion(+), 61 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-alsa-pcm.c b/drivers/media/pci/cx18/cx18-alsa-pcm.c
index 13f858c41836..7dec5ce20eb7 100644
--- a/drivers/media/pci/cx18/cx18-alsa-pcm.c
+++ b/drivers/media/pci/cx18/cx18-alsa-pcm.c
@@ -11,7 +11,6 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/vmalloc.h>
 
 #include <media/v4l2-device.h>
 
@@ -213,55 +212,6 @@ static int snd_cx18_pcm_ioctl(struct snd_pcm_substream *substream,
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
-static int snd_cx18_pcm_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
-{
-	dprintk("%s called\n", __func__);
-
-	return snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(params));
-}
-
-static int snd_cx18_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
-	unsigned long flags;
-	unsigned char *dma_area = NULL;
-
-	spin_lock_irqsave(&cxsc->slock, flags);
-	if (substream->runtime->dma_area) {
-		dprintk("freeing pcm capture region\n");
-		dma_area = substream->runtime->dma_area;
-		substream->runtime->dma_area = NULL;
-	}
-	spin_unlock_irqrestore(&cxsc->slock, flags);
-	vfree(dma_area);
-
-	return 0;
-}
-
 static int snd_cx18_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
@@ -291,24 +241,13 @@ snd_pcm_uframes_t snd_cx18_pcm_pointer(struct snd_pcm_substream *substream)
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
 static const struct snd_pcm_ops snd_cx18_pcm_capture_ops = {
 	.open		= snd_cx18_pcm_capture_open,
 	.close		= snd_cx18_pcm_capture_close,
 	.ioctl		= snd_cx18_pcm_ioctl,
-	.hw_params	= snd_cx18_pcm_hw_params,
-	.hw_free	= snd_cx18_pcm_hw_free,
 	.prepare	= snd_cx18_pcm_prepare,
 	.trigger	= snd_cx18_pcm_trigger,
 	.pointer	= snd_cx18_pcm_pointer,
-	.page		= snd_pcm_get_vmalloc_page,
 };
 
 int snd_cx18_pcm_create(struct snd_cx18_card *cxsc)
@@ -334,6 +273,7 @@ int snd_cx18_pcm_create(struct snd_cx18_card *cxsc)
 
 	snd_pcm_set_ops(sp, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_cx18_pcm_capture_ops);
+	snd_pcm_set_managed_buffer_all(sp, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 	sp->info_flags = 0;
 	sp->private_data = cxsc;
 	strscpy(sp->name, cx->card_name, sizeof(sp->name));
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
