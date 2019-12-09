Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF1116AA6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139E916A5;
	Mon,  9 Dec 2019 11:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139E916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886471;
	bh=3xdapNYwyrCeXXBJEO1VxnWrX00h8WIPc87f18cZ3MI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2IKge0iTsvTGasMNacNYY9XGY/dFz8U+tCR5OCzuhG0g0Xku0o7OnZPZakIipMt2
	 SHyEE6CCCHdcHfzrduWaBTUYPUnyZGYjB7Xvc/2bGQdxB1AzSKnnI4oGSU3K0lCk6e
	 d+B8N1mi/3gfaaxV3dB4JUtVgUn7zEqKfm/ELOZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 280A9F803F5;
	Mon,  9 Dec 2019 10:51:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A19F80349; Mon,  9 Dec 2019 10:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD6FF80279
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD6FF80279
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE6CDB2C3
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:02 +0100
Message-Id: <20191209094943.14984-31-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 30/71] ALSA: cmipci: Use managed buffer
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
 sound/pci/cmipci.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index dd9d62e2b633..1eac076f4692 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -666,12 +666,6 @@ static void snd_cmipci_set_pll(struct cmipci *cm, unsigned int rate, unsigned in
 }
 #endif /* USE_VAR48KRATE */
 
-static int snd_cmipci_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
 static int snd_cmipci_playback2_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *hw_params)
 {
@@ -686,7 +680,7 @@ static int snd_cmipci_playback2_hw_params(struct snd_pcm_substream *substream,
 		cm->opened[CM_CH_PLAY] = CM_OPEN_PLAYBACK_MULTI;
 		mutex_unlock(&cm->open_mutex);
 	}
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+	return 0;
 }
 
 static void snd_cmipci_ch_reset(struct cmipci *cm, int ch)
@@ -697,11 +691,6 @@ static void snd_cmipci_ch_reset(struct cmipci *cm, int ch)
 	udelay(10);
 }
 
-static int snd_cmipci_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 
 /*
  */
@@ -1371,14 +1360,14 @@ static int snd_cmipci_playback_hw_free(struct snd_pcm_substream *substream)
 	setup_spdif_playback(cm, substream, 0, 0);
 	restore_mixer_state(cm);
 	snd_cmipci_silence_hack(cm, &cm->channel[0]);
-	return snd_cmipci_hw_free(substream);
+	return 0;
 }
 
 static int snd_cmipci_playback2_hw_free(struct snd_pcm_substream *substream)
 {
 	struct cmipci *cm = snd_pcm_substream_chip(substream);
 	snd_cmipci_silence_hack(cm, &cm->channel[1]);
-	return snd_cmipci_hw_free(substream);
+	return 0;
 }
 
 /* capture */
@@ -1420,7 +1409,7 @@ static int snd_cmipci_capture_spdif_hw_free(struct snd_pcm_substream *subs)
 	snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_SPD32SEL);
 	spin_unlock_irq(&cm->reg_lock);
 
-	return snd_cmipci_hw_free(subs);
+	return 0;
 }
 
 
@@ -1829,7 +1818,6 @@ static const struct snd_pcm_ops snd_cmipci_playback_ops = {
 	.open =		snd_cmipci_playback_open,
 	.close =	snd_cmipci_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_cmipci_hw_params,
 	.hw_free =	snd_cmipci_playback_hw_free,
 	.prepare =	snd_cmipci_playback_prepare,
 	.trigger =	snd_cmipci_playback_trigger,
@@ -1840,8 +1828,6 @@ static const struct snd_pcm_ops snd_cmipci_capture_ops = {
 	.open =		snd_cmipci_capture_open,
 	.close =	snd_cmipci_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_cmipci_hw_params,
-	.hw_free =	snd_cmipci_hw_free,
 	.prepare =	snd_cmipci_capture_prepare,
 	.trigger =	snd_cmipci_capture_trigger,
 	.pointer =	snd_cmipci_capture_pointer,
@@ -1862,7 +1848,6 @@ static const struct snd_pcm_ops snd_cmipci_playback_spdif_ops = {
 	.open =		snd_cmipci_playback_spdif_open,
 	.close =	snd_cmipci_playback_spdif_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_cmipci_hw_params,
 	.hw_free =	snd_cmipci_playback_hw_free,
 	.prepare =	snd_cmipci_playback_spdif_prepare,	/* set up rate */
 	.trigger =	snd_cmipci_playback_trigger,
@@ -1873,7 +1858,6 @@ static const struct snd_pcm_ops snd_cmipci_capture_spdif_ops = {
 	.open =		snd_cmipci_capture_spdif_open,
 	.close =	snd_cmipci_capture_spdif_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_cmipci_hw_params,
 	.hw_free =	snd_cmipci_capture_spdif_hw_free,
 	.prepare =	snd_cmipci_capture_spdif_prepare,
 	.trigger =	snd_cmipci_capture_trigger,
@@ -1901,8 +1885,8 @@ static int snd_cmipci_pcm_new(struct cmipci *cm, int device)
 	strcpy(pcm->name, "C-Media PCI DAC/ADC");
 	cm->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &cm->pci->dev, 64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &cm->pci->dev, 64*1024, 128*1024);
 
 	return 0;
 }
@@ -1923,8 +1907,8 @@ static int snd_cmipci_pcm2_new(struct cmipci *cm, int device)
 	strcpy(pcm->name, "C-Media PCI 2nd DAC");
 	cm->pcm2 = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &cm->pci->dev, 64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &cm->pci->dev, 64*1024, 128*1024);
 
 	return 0;
 }
@@ -1946,8 +1930,8 @@ static int snd_cmipci_pcm_spdif_new(struct cmipci *cm, int device)
 	strcpy(pcm->name, "C-Media PCI IEC958");
 	cm->pcm_spdif = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &cm->pci->dev, 64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &cm->pci->dev, 64*1024, 128*1024);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_alt_chmaps, cm->max_channels, 0,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
