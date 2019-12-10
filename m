Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E8118A5C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:04:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2031672;
	Tue, 10 Dec 2019 15:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2031672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986696;
	bh=IDuO+7mSQ5BHgfsr60RCl0dQpHV+4p8PIuEMctriTuc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4ww6wBnpLdDo2vokvaQZKrq/FREWYhkXHnf6xAPn1la17m1KZOQiRwlT0P5T9gJP
	 vMQpzp9BPHbARqbRMb9sm3ziQFjkwDY3dNBG3I+E9pyPXH7cupHwBB0BP6j4XWbhPg
	 LMDBnDk5wK4DKkuzxmXuKTw6xjdtKTTkdWg4FIhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66ABFF8028A;
	Tue, 10 Dec 2019 14:59:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 727BDF80248; Tue, 10 Dec 2019 14:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB5DF80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB5DF80217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5044AE4D;
 Tue, 10 Dec 2019 13:58:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:39 +0100
Message-Id: <20191210135849.15607-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 04/14] media: cobalt: Clean up ALSA PCM
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

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cobalt/cobalt-alsa-pcm.c | 61 ++----------------------------
 1 file changed, 4 insertions(+), 57 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
index 38d00935a292..77570a1127c9 100644
--- a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
+++ b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
@@ -9,7 +9,6 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/vmalloc.h>
 #include <linux/delay.h>
 
 #include <media/v4l2-device.h>
@@ -244,48 +243,6 @@ static int snd_cobalt_pcm_ioctl(struct snd_pcm_substream *substream,
 	return snd_pcm_lib_ioctl(substream, cmd, arg);
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
-static int snd_cobalt_pcm_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
-{
-	dprintk("%s called\n", __func__);
-
-	return snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(params));
-}
-
-static int snd_cobalt_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	if (substream->runtime->dma_area) {
-		dprintk("freeing pcm capture region\n");
-		vfree(substream->runtime->dma_area);
-		substream->runtime->dma_area = NULL;
-	}
-
-	return 0;
-}
-
 static int snd_cobalt_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cobalt_card *cobsc = snd_pcm_substream_chip(substream);
@@ -490,36 +447,22 @@ snd_pcm_uframes_t snd_cobalt_pcm_pb_pointer(struct snd_pcm_substream *substream)
 	       substream->runtime->buffer_size;
 }
 
-static struct page *snd_pcm_get_vmalloc_page(struct snd_pcm_substream *subs,
-					     unsigned long offset)
-{
-	void *pageptr = subs->runtime->dma_area + offset;
-
-	return vmalloc_to_page(pageptr);
-}
-
 static const struct snd_pcm_ops snd_cobalt_pcm_capture_ops = {
 	.open		= snd_cobalt_pcm_capture_open,
 	.close		= snd_cobalt_pcm_capture_close,
 	.ioctl		= snd_cobalt_pcm_ioctl,
-	.hw_params	= snd_cobalt_pcm_hw_params,
-	.hw_free	= snd_cobalt_pcm_hw_free,
 	.prepare	= snd_cobalt_pcm_prepare,
 	.trigger	= snd_cobalt_pcm_trigger,
 	.pointer	= snd_cobalt_pcm_pointer,
-	.page		= snd_pcm_get_vmalloc_page,
 };
 
 static const struct snd_pcm_ops snd_cobalt_pcm_playback_ops = {
 	.open		= snd_cobalt_pcm_playback_open,
 	.close		= snd_cobalt_pcm_playback_close,
 	.ioctl		= snd_cobalt_pcm_ioctl,
-	.hw_params	= snd_cobalt_pcm_hw_params,
-	.hw_free	= snd_cobalt_pcm_hw_free,
 	.prepare	= snd_cobalt_pcm_pb_prepare,
 	.trigger	= snd_cobalt_pcm_pb_trigger,
 	.pointer	= snd_cobalt_pcm_pb_pointer,
-	.page		= snd_pcm_get_vmalloc_page,
 };
 
 int snd_cobalt_pcm_create(struct snd_cobalt_card *cobsc)
@@ -555,6 +498,8 @@ int snd_cobalt_pcm_create(struct snd_cobalt_card *cobsc)
 
 		snd_pcm_set_ops(sp, SNDRV_PCM_STREAM_CAPTURE,
 				&snd_cobalt_pcm_capture_ops);
+		snd_pcm_set_managed_buffer_all(sp, SNDRV_DMA_TYPE_VMALLOC,
+					       NULL, 0, 0);
 		sp->info_flags = 0;
 		sp->private_data = cobsc;
 		strscpy(sp->name, "cobalt", sizeof(sp->name));
@@ -579,6 +524,8 @@ int snd_cobalt_pcm_create(struct snd_cobalt_card *cobsc)
 
 		snd_pcm_set_ops(sp, SNDRV_PCM_STREAM_PLAYBACK,
 				&snd_cobalt_pcm_playback_ops);
+		snd_pcm_set_managed_buffer_all(sp, SNDRV_DMA_TYPE_VMALLOC,
+					       NULL, 0, 0);
 		sp->info_flags = 0;
 		sp->private_data = cobsc;
 		strscpy(sp->name, "cobalt", sizeof(sp->name));
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
