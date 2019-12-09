Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56DF116AEF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B70916F6;
	Mon,  9 Dec 2019 11:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B70916F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887179;
	bh=Te4/1R/F+EKsLywLgj+miMZ4gu8O+Xn/rxElkzItGJQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNf+SYDYbuKyvWI9vvSLatZvkLQvp8UQl0lK0rOEHjIt1oKhIswOYN+FP/sUoNKih
	 wubUTIR5qBBoSFZZY9mC8JyiUQ4vyVnCIgYFGUimeuGodxRS5Eeh30zAuxG7ODouS0
	 QVLYgaR28UA0wmEhmOnW5RRyibQWaCvSPplWPDCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2D36F802EC;
	Mon,  9 Dec 2019 10:52:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E3FF8035F; Mon,  9 Dec 2019 10:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 905E5F8028E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905E5F8028E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8418AB282
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:13 +0100
Message-Id: <20191209094943.14984-42-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 41/71] ALSA: ice1712: Use managed buffer
	allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1712.c | 42 ++++++++----------------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index deadba40131c..1783584e90c5 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -479,21 +479,6 @@ static irqreturn_t snd_ice1712_interrupt(int irq, void *dev_id)
 }
 
 
-/*
- *  PCM part - misc
- */
-
-static int snd_ice1712_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_ice1712_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 /*
  *  PCM part - consumer I/O
  */
@@ -837,8 +822,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_ops = {
 	.open =		snd_ice1712_playback_open,
 	.close =	snd_ice1712_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ice1712_hw_params,
-	.hw_free =	snd_ice1712_hw_free,
 	.prepare =	snd_ice1712_playback_prepare,
 	.trigger =	snd_ice1712_playback_trigger,
 	.pointer =	snd_ice1712_playback_pointer,
@@ -848,8 +831,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_ds_ops = {
 	.open =		snd_ice1712_playback_ds_open,
 	.close =	snd_ice1712_playback_ds_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ice1712_hw_params,
-	.hw_free =	snd_ice1712_hw_free,
 	.prepare =	snd_ice1712_playback_ds_prepare,
 	.trigger =	snd_ice1712_playback_ds_trigger,
 	.pointer =	snd_ice1712_playback_ds_pointer,
@@ -859,8 +840,6 @@ static const struct snd_pcm_ops snd_ice1712_capture_ops = {
 	.open =		snd_ice1712_capture_open,
 	.close =	snd_ice1712_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ice1712_hw_params,
-	.hw_free =	snd_ice1712_hw_free,
 	.prepare =	snd_ice1712_capture_prepare,
 	.trigger =	snd_ice1712_capture_trigger,
 	.pointer =	snd_ice1712_capture_pointer,
@@ -883,9 +862,8 @@ static int snd_ice1712_pcm(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, "ICE1712 consumer");
 	ice->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 64*1024, 64*1024);
 
 	dev_warn(ice->card->dev,
 		 "Consumer PCM code does not work well at the moment --jk\n");
@@ -909,9 +887,8 @@ static int snd_ice1712_pcm_ds(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, "ICE1712 consumer (DS)");
 	ice->pcm_ds = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 64*1024, 128*1024);
 
 	return 0;
 }
@@ -1063,7 +1040,7 @@ static int snd_ice1712_playback_pro_hw_params(struct snd_pcm_substream *substrea
 	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
 
 	snd_ice1712_set_pro_rate(ice, params_rate(hw_params), 0);
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+	return 0;
 }
 
 static int snd_ice1712_capture_pro_prepare(struct snd_pcm_substream *substream)
@@ -1085,7 +1062,7 @@ static int snd_ice1712_capture_pro_hw_params(struct snd_pcm_substream *substream
 	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
 
 	snd_ice1712_set_pro_rate(ice, params_rate(hw_params), 0);
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+	return 0;
 }
 
 static snd_pcm_uframes_t snd_ice1712_playback_pro_pointer(struct snd_pcm_substream *substream)
@@ -1221,7 +1198,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_pro_ops = {
 	.close =	snd_ice1712_playback_pro_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ice1712_playback_pro_hw_params,
-	.hw_free =	snd_ice1712_hw_free,
 	.prepare =	snd_ice1712_playback_pro_prepare,
 	.trigger =	snd_ice1712_pro_trigger,
 	.pointer =	snd_ice1712_playback_pro_pointer,
@@ -1232,7 +1208,6 @@ static const struct snd_pcm_ops snd_ice1712_capture_pro_ops = {
 	.close =	snd_ice1712_capture_pro_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ice1712_capture_pro_hw_params,
-	.hw_free =	snd_ice1712_hw_free,
 	.prepare =	snd_ice1712_capture_pro_prepare,
 	.trigger =	snd_ice1712_pro_trigger,
 	.pointer =	snd_ice1712_capture_pro_pointer,
@@ -1254,9 +1229,8 @@ static int snd_ice1712_pcm_profi(struct snd_ice1712 *ice, int device)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, "ICE1712 multi");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      256*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 256*1024, 256*1024);
 
 	ice->pcm_pro = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
