Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B850116AB6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC54E16BC;
	Mon,  9 Dec 2019 11:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC54E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886588;
	bh=LO4euC1WXlLReqyaS7pYkz1+BIeJHkfZeWZFOauAe6U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wl1HoGfGY5+Iu6S/wzddR2ng0ABfw4c7E+DPZ4q27h9dZ5PWQNxbfyjO49AJ30dOg
	 iHiUjmaC7qsozzZKp05tthxOzSeU8Ghue1irV8zo1AaYlXqgaWoqC3gPtuaAJtWvAA
	 JsbO+cHrqZ6QQN3Ul38v+cOYQDedWgLV4NB8ytCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DD2F80435;
	Mon,  9 Dec 2019 10:52:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A494FF8034A; Mon,  9 Dec 2019 10:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E50F8028A
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E50F8028A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C91DB2CA
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:08 +0100
Message-Id: <20191209094943.14984-37-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 36/71] ALSA: emu10k1: Use managed buffer
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
The normal playback streams need a workaround for the aligned buffer,
and cannot apply the straight snd_pcm_lib_malloc() stuff, so they
remain untouched, while other streams are converted to the new managed
mode.

Most of hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emupcm.c | 41 +++++++--------------------------------
 sound/pci/emu10k1/p16v.c   | 48 +++++++---------------------------------------
 2 files changed, 14 insertions(+), 75 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 9a8cf3c7dd67..3a68148f6ecf 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -569,17 +569,6 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
 	.fifo_size =		0,
 };
 
-static int snd_emu10k1_capture_hw_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_emu10k1_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
@@ -1372,8 +1361,6 @@ static const struct snd_pcm_ops snd_emu10k1_capture_ops = {
 	.open =			snd_emu10k1_capture_open,
 	.close =		snd_emu10k1_capture_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_emu10k1_capture_hw_params,
-	.hw_free =		snd_emu10k1_capture_hw_free,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1410,15 +1397,15 @@ int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
 	strcpy(pcm->name, "ADC Capture/Standard PCM Playback");
 	emu->pcm = pcm;
 
+	/* playback substream can't use managed buffers due to alignment */
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; substream; substream = substream->next)
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV_SG,
 					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream; substream; substream = substream->next)
-		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      64*1024, 64*1024);
+		snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+					   &emu->pci->dev, 64*1024, 64*1024);
 
 	return 0;
 }
@@ -1454,8 +1441,6 @@ static const struct snd_pcm_ops snd_emu10k1_capture_mic_ops = {
 	.open =			snd_emu10k1_capture_mic_open,
 	.close =		snd_emu10k1_capture_mic_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_emu10k1_capture_hw_params,
-	.hw_free =		snd_emu10k1_capture_hw_free,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1477,9 +1462,8 @@ int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device)
 	strcpy(pcm->name, "Mic Capture");
 	emu->pcm_mic = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
+				       64*1024, 64*1024);
 
 	return 0;
 }
@@ -1551,8 +1535,6 @@ static const struct snd_pcm_ops snd_emu10k1_capture_efx_ops = {
 	.open =			snd_emu10k1_capture_efx_open,
 	.close =		snd_emu10k1_capture_efx_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_emu10k1_capture_hw_params,
-	.hw_free =		snd_emu10k1_capture_hw_free,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1633,12 +1615,6 @@ static int snd_emu10k1_fx8010_playback_transfer(struct snd_pcm_substream *substr
 						  fx8010_pb_trans_copy);
 }
 
-static int snd_emu10k1_fx8010_playback_hw_params(struct snd_pcm_substream *substream,
-						 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
 static int snd_emu10k1_fx8010_playback_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
@@ -1647,7 +1623,6 @@ static int snd_emu10k1_fx8010_playback_hw_free(struct snd_pcm_substream *substre
 
 	for (i = 0; i < pcm->channels; i++)
 		snd_emu10k1_ptr_write(emu, TANKMEMADDRREGBASE + 0x80 + pcm->etram[i], 0, 0);
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -1793,7 +1768,6 @@ static const struct snd_pcm_ops snd_emu10k1_fx8010_playback_ops = {
 	.open =			snd_emu10k1_fx8010_playback_open,
 	.close =		snd_emu10k1_fx8010_playback_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_emu10k1_fx8010_playback_hw_params,
 	.hw_free =		snd_emu10k1_fx8010_playback_hw_free,
 	.prepare =		snd_emu10k1_fx8010_playback_prepare,
 	.trigger =		snd_emu10k1_fx8010_playback_trigger,
@@ -1852,9 +1826,8 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 	if (err < 0)
 		return err;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
+				       64*1024, 64*1024);
 
 	return 0;
 }
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index ab8876855989..2263db4c954b 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -282,36 +282,6 @@ static int snd_p16v_pcm_open_capture(struct snd_pcm_substream *substream)
 	return snd_p16v_pcm_open_capture_channel(substream, 0);
 }
 
-/* hw_params callback */
-static int snd_p16v_pcm_hw_params_playback(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-/* hw_params callback */
-static int snd_p16v_pcm_hw_params_capture(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-
-/* hw_free callback */
-static int snd_p16v_pcm_hw_free_playback(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
-/* hw_free callback */
-static int snd_p16v_pcm_hw_free_capture(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
-
 /* prepare playback callback */
 static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 {
@@ -583,8 +553,6 @@ static const struct snd_pcm_ops snd_p16v_playback_front_ops = {
 	.open =        snd_p16v_pcm_open_playback_front,
 	.close =       snd_p16v_pcm_close_playback,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_p16v_pcm_hw_params_playback,
-	.hw_free =     snd_p16v_pcm_hw_free_playback,
 	.prepare =     snd_p16v_pcm_prepare_playback,
 	.trigger =     snd_p16v_pcm_trigger_playback,
 	.pointer =     snd_p16v_pcm_pointer_playback,
@@ -594,8 +562,6 @@ static const struct snd_pcm_ops snd_p16v_capture_ops = {
 	.open =        snd_p16v_pcm_open_capture,
 	.close =       snd_p16v_pcm_close_capture,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_p16v_pcm_hw_params_capture,
-	.hw_free =     snd_p16v_pcm_hw_free_capture,
 	.prepare =     snd_p16v_pcm_prepare_capture,
 	.trigger =     snd_p16v_pcm_trigger_capture,
 	.pointer =     snd_p16v_pcm_pointer_capture,
@@ -642,10 +608,10 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	for(substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; 
 	    substream; 
 	    substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      (65536 - 64) * 8,
-					      (65536 - 64) * 8);
+		snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+					   &emu->pci->dev,
+					   (65536 - 64) * 8,
+					   (65536 - 64) * 8);
 		/*
 		dev_dbg(emu->card->dev,
 			   "preallocate playback substream: err=%d\n", err);
@@ -655,9 +621,9 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream; 
 	      substream; 
 	      substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      65536 - 64, 65536 - 64);
+		snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+					   &emu->pci->dev,
+					   65536 - 64, 65536 - 64);
 		/*
 		dev_dbg(emu->card->dev,
 			   "preallocate capture substream: err=%d\n", err);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
