Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB35116B25
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:35:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C349116D5;
	Mon,  9 Dec 2019 11:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C349116D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887745;
	bh=hgmjI8tz2/LgN5/btAVB9QhwkalNYm0ZOOO4roFtvCk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7Vcbf0P363wn4URSgtBensB4n9so78QzOUm7MzxTb7GpawJWBqXb5SLlpjsDRw0l
	 ZucKMgOuUqp8jILlbvOdRs6yF1opJO9wRU/cwxfNdnzViUs3QoZIKnfDdjL2ldydaW
	 qPlFX7zZCcIPURHARVb/MWqxA917tQIt4zY1O8gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623AAF805D7;
	Mon,  9 Dec 2019 10:52:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 284D2F8037F; Mon,  9 Dec 2019 10:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67CC7F802A9
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CC7F802A9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32D55B2DB
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:28 +0100
Message-Id: <20191209094943.14984-57-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 56/71] ALSA: ymfpci: Use managed buffer
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
The hw_params callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci_main.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 125c11ed5064..748bbdcb2c52 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -628,8 +628,6 @@ static int snd_ymfpci_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_ymfpci_pcm *ypcm = runtime->private_data;
 	int err;
 
-	if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
-		return err;
 	if ((err = snd_ymfpci_pcm_voice_alloc(ypcm, params_channels(hw_params))) < 0)
 		return err;
 	return 0;
@@ -647,7 +645,6 @@ static int snd_ymfpci_playback_hw_free(struct snd_pcm_substream *substream)
 
 	/* wait, until the PCI operations are not finished */
 	snd_ymfpci_irq_wait(chip);
-	snd_pcm_lib_free_pages(substream);
 	if (ypcm->voices[1]) {
 		snd_ymfpci_voice_free(chip, ypcm->voices[1]);
 		ypcm->voices[1] = NULL;
@@ -683,19 +680,13 @@ static int snd_ymfpci_playback_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_ymfpci_capture_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
 static int snd_ymfpci_capture_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_ymfpci *chip = snd_pcm_substream_chip(substream);
 
 	/* wait, until the PCI operations are not finished */
 	snd_ymfpci_irq_wait(chip);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int snd_ymfpci_capture_prepare(struct snd_pcm_substream *substream)
@@ -1124,7 +1115,6 @@ static const struct snd_pcm_ops snd_ymfpci_capture_rec_ops = {
 	.open =			snd_ymfpci_capture_rec_open,
 	.close =		snd_ymfpci_capture_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_ymfpci_capture_hw_params,
 	.hw_free =		snd_ymfpci_capture_hw_free,
 	.prepare =		snd_ymfpci_capture_prepare,
 	.trigger =		snd_ymfpci_capture_trigger,
@@ -1148,9 +1138,8 @@ int snd_ymfpci_pcm(struct snd_ymfpci *chip, int device)
 	strcpy(pcm->name, "YMFPCI");
 	chip->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 256*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_std_chmaps, 2, 0, NULL);
@@ -1160,7 +1149,6 @@ static const struct snd_pcm_ops snd_ymfpci_capture_ac97_ops = {
 	.open =			snd_ymfpci_capture_ac97_open,
 	.close =		snd_ymfpci_capture_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_ymfpci_capture_hw_params,
 	.hw_free =		snd_ymfpci_capture_hw_free,
 	.prepare =		snd_ymfpci_capture_prepare,
 	.trigger =		snd_ymfpci_capture_trigger,
@@ -1184,9 +1172,8 @@ int snd_ymfpci_pcm2(struct snd_ymfpci *chip, int device)
 		chip->device_id == PCI_DEVICE_ID_YAMAHA_754 ? "Direct Recording" : "AC'97");
 	chip->pcm2 = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 256*1024);
 
 	return 0;
 }
@@ -1218,9 +1205,8 @@ int snd_ymfpci_pcm_spdif(struct snd_ymfpci *chip, int device)
 	strcpy(pcm->name, "YMFPCI - IEC958");
 	chip->pcm_spdif = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 256*1024);
 
 	return 0;
 }
@@ -1260,9 +1246,8 @@ int snd_ymfpci_pcm_4ch(struct snd_ymfpci *chip, int device)
 	strcpy(pcm->name, "YMFPCI - Rear PCM");
 	chip->pcm_4ch = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 256*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     surround_map, 2, 0, NULL);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
