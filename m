Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F5AF0194
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:37:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8FC1710;
	Tue,  5 Nov 2019 16:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8FC1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572968226;
	bh=UXUk1B5n5QWq8Y5E1IzNvyGwOWrTBgBBAt5Qsvk/vvA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQLmdpOdlnz+g94GRkn3zn66j8pz+Zdtf4jR8x92X++Ja5akhtMlUS2+/VVirsH+3
	 e/OCK1Lat10H0nIdeJPloz1g7YmRRdHeqHLLpeO74mIER0CaaWKpM2Twqy0hCJO8R5
	 BSeqRiO7Zdv6ILHJSdIw4qMZkaDuoQUefT4T0Uzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C2DF8087D;
	Tue,  5 Nov 2019 16:19:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134A0F80674; Tue,  5 Nov 2019 16:19:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FBDAF80612
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBDAF80612
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C85F7B461
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:55 +0100
Message-Id: <20191105151856.10785-24-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 23/24] ALSA: pci: Avoid non-standard macro usage
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

Pass the device pointer from the PCI pointer directly, instead of a
non-standard macro.  The macro didn't give any better readability.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c                      |  6 +++---
 sound/pci/ali5451/ali5451.c             |  2 +-
 sound/pci/als300.c                      |  3 ++-
 sound/pci/als4000.c                     |  3 ++-
 sound/pci/asihpi/asihpi.c               |  4 ++--
 sound/pci/atiixp.c                      |  6 +++---
 sound/pci/atiixp_modem.c                |  4 ++--
 sound/pci/au88x0/au88x0_pcm.c           |  2 +-
 sound/pci/aw2/aw2-alsa.c                |  6 +++---
 sound/pci/azt3328.c                     |  8 ++++----
 sound/pci/bt87x.c                       |  4 ++--
 sound/pci/ca0106/ca0106_main.c          |  6 +++---
 sound/pci/cmipci.c                      |  6 +++---
 sound/pci/cs4281.c                      |  3 ++-
 sound/pci/cs46xx/cs46xx_lib.c           | 16 ++++++++++------
 sound/pci/cs5535audio/cs5535audio_pcm.c |  6 +++---
 sound/pci/ctxfi/ctpcm.c                 |  3 ++-
 sound/pci/ctxfi/ctvmem.c                |  2 +-
 sound/pci/emu10k1/emu10k1.c             |  5 +++--
 sound/pci/emu10k1/emu10k1x.c            |  6 +++---
 sound/pci/emu10k1/emufx.c               |  2 +-
 sound/pci/emu10k1/emupcm.c              | 10 +++++-----
 sound/pci/emu10k1/memory.c              |  4 ++--
 sound/pci/emu10k1/p16v.c                |  4 ++--
 sound/pci/ens1370.c                     |  8 +++++---
 sound/pci/es1938.c                      |  3 ++-
 sound/pci/fm801.c                       |  2 +-
 sound/pci/ice1712/ice1712.c             |  9 ++++++---
 sound/pci/ice1712/ice1724.c             |  6 +++---
 sound/pci/intel8x0.c                    |  4 ++--
 sound/pci/intel8x0m.c                   |  4 ++--
 sound/pci/korg1212/korg1212.c           |  8 ++++----
 sound/pci/lola/lola.c                   |  2 +-
 sound/pci/lola/lola_pcm.c               |  4 ++--
 sound/pci/lx6464es/lx6464es.c           |  2 +-
 sound/pci/maestro3.c                    |  3 ++-
 sound/pci/mixart/mixart.c               |  7 ++++---
 sound/pci/oxygen/oxygen_pcm.c           | 10 +++++-----
 sound/pci/pcxhr/pcxhr.c                 |  4 ++--
 sound/pci/riptide/riptide.c             |  4 ++--
 sound/pci/sis7019.c                     |  3 ++-
 sound/pci/sonicvibes.c                  |  3 ++-
 sound/pci/trident/trident_main.c        | 22 ++++++++++++++--------
 sound/pci/via82xx.c                     | 12 ++++++------
 sound/pci/via82xx_modem.c               |  4 ++--
 sound/pci/ymfpci/ymfpci_main.c          | 16 ++++++++++------
 46 files changed, 145 insertions(+), 116 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 4b2451287e2c..5b6452df8bbd 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -633,9 +633,9 @@ snd_ad1889_pcm_init(struct snd_ad1889 *chip, int device)
 	chip->csubs = NULL;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						snd_dma_pci_data(chip->pci),
-						BUFFER_BYTES_MAX / 2,
-						BUFFER_BYTES_MAX);
+					      &chip->pci->dev,
+					      BUFFER_BYTES_MAX / 2,
+					      BUFFER_BYTES_MAX);
 
 	return 0;
 }
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 6e28e381c21a..ae29df085ae1 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1672,7 +1672,7 @@ static int snd_ali_pcm(struct snd_ali *codec, int device,
 				desc->capture_ops);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(codec->pci),
+					      &codec->pci->dev,
 					      64*1024, 128*1024);
 
 	pcm->info_flags = 0;
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 530799c8d3ce..cfbb8cacaaac 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -592,7 +592,8 @@ static int snd_als300_new_pcm(struct snd_als300 *chip)
 
 	/* pre-allocation of buffers */
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-	snd_dma_pci_data(chip->pci), 64*1024, 64*1024);
+					      &chip->pci->dev,
+					      64*1024, 64*1024);
 	return 0;
 }
 
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index b06c3dbb525d..d6f5487afe52 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -693,7 +693,8 @@ static int snd_als4000_pcm(struct snd_sb *chip, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_als4000_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_als4000_capture_ops);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
+					      &chip->pci->dev,
 					      64*1024, 64*1024);
 
 	chip->pcm = pcm;
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 2a21a3d99719..147005fdd3ea 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1325,8 +1325,8 @@ static int snd_card_asihpi_pcm_new(struct snd_card_asihpi *asihpi, int device)
 	/*? do we want to emulate MMAP for non-BBM cards?
 	Jack doesn't work with ALSAs MMAP emulation - WHY NOT? */
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						snd_dma_pci_data(asihpi->pci),
-						64*1024, BUFFER_BYTES_MAX);
+					      &asihpi->pci->dev,
+					      64*1024, BUFFER_BYTES_MAX);
 
 	return 0;
 }
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index c953bd73a48c..1e1ededf8eb2 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -353,7 +353,7 @@ static int atiixp_build_dma_packets(struct atiixp *chip, struct atiixp_dma *dma,
 
 	if (dma->desc_buf.area == NULL) {
 		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					snd_dma_pci_data(chip->pci),
+					&chip->pci->dev,
 					ATI_DESC_LIST_SIZE,
 					&dma->desc_buf) < 0)
 			return -ENOMEM;
@@ -1284,7 +1284,7 @@ static int snd_atiixp_pcm_new(struct atiixp *chip)
 	chip->pcmdevs[ATI_PCMDEV_ANALOG] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, 128*1024);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1317,7 +1317,7 @@ static int snd_atiixp_pcm_new(struct atiixp *chip)
 	chip->pcmdevs[ATI_PCMDEV_DIGITAL] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, 128*1024);
 
 	/* pre-select AC97 SPDIF slots 10/11 */
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 95d209f96581..6f088c1949f3 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -321,7 +321,7 @@ static int atiixp_build_dma_packets(struct atiixp_modem *chip,
 		return -ENOMEM;
 
 	if (dma->desc_buf.area == NULL) {
-		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 					ATI_DESC_LIST_SIZE, &dma->desc_buf) < 0)
 			return -ENOMEM;
 		dma->period_bytes = dma->periods = 0; /* clear */
@@ -995,7 +995,7 @@ static int snd_atiixp_pcm_new(struct atiixp_modem *chip)
 	chip->pcmdevs[ATI_PCMDEV_ANALOG] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, 128*1024);
 
 	return 0;
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index b835042893d9..1012e8da29e7 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -637,7 +637,7 @@ static int snd_vortex_new_pcm(vortex_t *chip, int idx, int nr)
 	/* pre-allocation of Scatter-Gather buffers */
 	
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci_dev),
+					      &chip->pci_dev,
 					      0x10000, 0x10000);
 
 	switch (VORTEX_PCM_TYPE(pcm)) {
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index e413414181df..1cbfae856a2a 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -613,7 +613,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	/* Preallocate continuous pages. */
 	snd_pcm_lib_preallocate_pages_for_all(pcm_playback_ana,
 					      SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64 * 1024, 64 * 1024);
 
 	err = snd_pcm_new(chip->card, "Audiowerk2 digital playback", 1, 1, 0,
@@ -645,7 +645,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	/* Preallocate continuous pages. */
 	snd_pcm_lib_preallocate_pages_for_all(pcm_playback_num,
 					      SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64 * 1024, 64 * 1024);
 
 	err = snd_pcm_new(chip->card, "Audiowerk2 capture", 2, 0, 1,
@@ -678,7 +678,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	/* Preallocate continuous pages. */
 	snd_pcm_lib_preallocate_pages_for_all(pcm_capture,
 					      SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64 * 1024, 64 * 1024);
 
 	/* Create control */
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index f92c9cbb955a..f475370faaaa 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2135,8 +2135,8 @@ snd_azf3328_pcm(struct snd_azf3328 *chip)
 	chip->pcm[AZF_CODEC_CAPTURE] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						snd_dma_pci_data(chip->pci),
-							64*1024, 64*1024);
+					      &chip->pci->dev,
+					      64*1024, 64*1024);
 
 	err = snd_pcm_new(chip->card, "AZF3328 I2S OUT", AZF_PCMDEV_I2S_OUT,
 								1, 0, &pcm);
@@ -2151,8 +2151,8 @@ snd_azf3328_pcm(struct snd_azf3328 *chip)
 	chip->pcm[AZF_CODEC_I2S_OUT] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						snd_dma_pci_data(chip->pci),
-							64*1024, 64*1024);
+					      &chip->pci->dev,
+					      64*1024, 64*1024);
 
 	return 0;
 }
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index d4b6da79ef49..6bf5ac3600c5 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -217,7 +217,7 @@ static int snd_bt87x_create_risc(struct snd_bt87x *chip, struct snd_pcm_substrea
 	__le32 *risc;
 
 	if (chip->dma_risc.area == NULL) {
-		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 					PAGE_ALIGN(MAX_RISC_SIZE), &chip->dma_risc) < 0)
 			return -ENOMEM;
 	}
@@ -700,7 +700,7 @@ static int snd_bt87x_pcm(struct snd_bt87x *chip, int device, char *name)
 	strcpy(pcm->name, name);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_bt87x_pcm_ops);
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      128 * 1024,
 					      ALIGN(255 * 4092, 1024));
 	return 0;
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 478412e0aa3c..abc2440dc2d9 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1389,7 +1389,7 @@ static int snd_ca0106_pcm(struct snd_ca0106 *emu, int device)
 	    substream; 
 	    substream = substream->next) {
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 	}
 
@@ -1397,7 +1397,7 @@ static int snd_ca0106_pcm(struct snd_ca0106 *emu, int device)
 	      substream; 
 	      substream = substream->next) {
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 	}
   
@@ -1692,7 +1692,7 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 	chip->irq = pci->irq;
 
 	/* This stores the periods table. */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				1024, &chip->buffer) < 0) {
 		snd_ca0106_free(chip);
 		return -ENOMEM;
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index df720881eb99..dd9d62e2b633 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1902,7 +1902,7 @@ static int snd_cmipci_pcm_new(struct cmipci *cm, int device)
 	cm->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(cm->pci), 64*1024, 128*1024);
+					      &cm->pci->dev, 64*1024, 128*1024);
 
 	return 0;
 }
@@ -1924,7 +1924,7 @@ static int snd_cmipci_pcm2_new(struct cmipci *cm, int device)
 	cm->pcm2 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(cm->pci), 64*1024, 128*1024);
+					      &cm->pci->dev, 64*1024, 128*1024);
 
 	return 0;
 }
@@ -1947,7 +1947,7 @@ static int snd_cmipci_pcm_spdif_new(struct cmipci *cm, int device)
 	cm->pcm_spdif = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(cm->pci), 64*1024, 128*1024);
+					      &cm->pci->dev, 64*1024, 128*1024);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_alt_chmaps, cm->max_channels, 0,
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 04c712647853..058c1414b777 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -975,7 +975,8 @@ static int snd_cs4281_pcm(struct cs4281 *chip, int device)
 	chip->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 512*1024);
+					      &chip->pci->dev,
+					      64*1024, 512*1024);
 
 	return 0;
 }
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 5b888b795f7e..102a62965ac1 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1494,7 +1494,7 @@ static int _cs46xx_playback_open_channel (struct snd_pcm_substream *substream,in
 	cpcm = kzalloc(sizeof(*cpcm), GFP_KERNEL);
 	if (cpcm == NULL)
 		return -ENOMEM;
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 				PAGE_SIZE, &cpcm->hw_buf) < 0) {
 		kfree(cpcm);
 		return -ENOMEM;
@@ -1582,7 +1582,7 @@ static int snd_cs46xx_capture_open(struct snd_pcm_substream *substream)
 {
 	struct snd_cs46xx *chip = snd_pcm_substream_chip(substream);
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 				PAGE_SIZE, &chip->capt.hw_buf) < 0)
 		return -ENOMEM;
 	chip->capt.substream = substream;
@@ -1784,7 +1784,8 @@ int snd_cs46xx_pcm(struct snd_cs46xx *chip, int device)
 	chip->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
@@ -1809,7 +1810,8 @@ int snd_cs46xx_pcm_rear(struct snd_cs46xx *chip, int device)
 	chip->pcm_rear = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
@@ -1832,7 +1834,8 @@ int snd_cs46xx_pcm_center_lfe(struct snd_cs46xx *chip, int device)
 	chip->pcm_center_lfe = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
@@ -1855,7 +1858,8 @@ int snd_cs46xx_pcm_iec958(struct snd_cs46xx *chip, int device)
 	chip->pcm_iec958 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 04822bf2f987..4642e5384e83 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -117,7 +117,7 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 
 	if (dma->desc_buf.area == NULL) {
 		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					snd_dma_pci_data(cs5535au->pci),
+					&cs5535au->pci->dev,
 					CS5535AUDIO_DESC_LIST_SIZE+1,
 					&dma->desc_buf) < 0)
 			return -ENOMEM;
@@ -432,8 +432,8 @@ int snd_cs5535audio_pcm(struct cs5535audio *cs5535au)
 	strcpy(pcm->name, "CS5535 Audio");
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					snd_dma_pci_data(cs5535au->pci),
-					64*1024, 128*1024);
+					      &cs5535au->pci->dev,
+					      64*1024, 128*1024);
 	cs5535au->pcm = pcm;
 
 	return 0;
diff --git a/sound/pci/ctxfi/ctpcm.c b/sound/pci/ctxfi/ctpcm.c
index c341f509e4fc..7ae5b238703c 100644
--- a/sound/pci/ctxfi/ctpcm.c
+++ b/sound/pci/ctxfi/ctpcm.c
@@ -450,7 +450,8 @@ int ct_alsa_pcm_create(struct ct_atc *atc,
 				SNDRV_PCM_STREAM_CAPTURE, &ct_pcm_capture_ops);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-			snd_dma_pci_data(atc->pci), 128*1024, 128*1024);
+					      &atc->pci->dev,
+					      128*1024, 128*1024);
 
 	chs = 2;
 	switch (device) {
diff --git a/sound/pci/ctxfi/ctvmem.c b/sound/pci/ctxfi/ctvmem.c
index 2e80b17a7104..bde28aa9e139 100644
--- a/sound/pci/ctxfi/ctvmem.c
+++ b/sound/pci/ctxfi/ctvmem.c
@@ -183,7 +183,7 @@ int ct_vm_create(struct ct_vm **rvm, struct pci_dev *pci)
 	/* Allocate page table pages */
 	for (i = 0; i < CT_PTP_NUM; i++) {
 		err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					  snd_dma_pci_data(pci),
+					  &pci->dev,
 					  PAGE_SIZE, &vm->ptp[i]);
 		if (err < 0)
 			break;
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index f208b6e217fd..29b7720d7961 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -124,8 +124,9 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 		goto error;
 	/* This stores the periods table. */
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */	
-		if ((err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
-					       1024, &emu->p16v_buffer)) < 0)
+		err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
+					  1024, &emu->p16v_buffer);
+		if (err < 0)
 			goto error;
 	}
 
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 9cf81832259c..241b4a0631ab 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -877,7 +877,7 @@ static int snd_emu10k1x_pcm(struct emu10k1x *emu, int device)
 	emu->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci), 
+					      &emu->pci->dev,
 					      32*1024, 32*1024);
   
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK, map, 2,
@@ -936,8 +936,8 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	}
 	chip->irq = pci->irq;
   
-	if(snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
-			       4 * 1024, &chip->dma_buffer) < 0) {
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
+				4 * 1024, &chip->dma_buffer) < 0) {
 		snd_emu10k1x_free(chip);
 		return -ENOMEM;
 	}
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index e053f0d58bdd..a31adecfe608 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2464,7 +2464,7 @@ int snd_emu10k1_fx8010_tram_setup(struct snd_emu10k1 *emu, u32 size)
 	}
 
 	if (size > 0) {
-		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(emu->pci),
+		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
 					size * 2, &emu->fx8010.etram_pages) < 0)
 			return -ENOMEM;
 		memset(emu->fx8010.etram_pages.area, 0, size * 2);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 46d8768adc01..9a8cf3c7dd67 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1412,12 +1412,12 @@ int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; substream; substream = substream->next)
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream; substream; substream = substream->next)
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	return 0;
@@ -1443,7 +1443,7 @@ int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device)
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; substream; substream = substream->next)
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	return 0;
@@ -1478,7 +1478,7 @@ int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device)
 	emu->pcm_mic = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	return 0;
@@ -1853,7 +1853,7 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 		return err;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      64*1024, 64*1024);
 
 	return 0;
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 135e26544275..94b8d5b08225 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -387,7 +387,7 @@ int snd_emu10k1_alloc_pages_maybe_wider(struct snd_emu10k1 *emu, size_t size,
 	}
 
 	return snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				   snd_dma_pci_data(emu->pci), size, dmab);
+				   &emu->pci->dev, size, dmab);
 }
 
 /*
@@ -477,7 +477,7 @@ static void __synth_free_pages(struct snd_emu10k1 *emu, int first_page,
 	int page;
 
 	dmab.dev.type = SNDRV_DMA_TYPE_DEV;
-	dmab.dev.dev = snd_dma_pci_data(emu->pci);
+	dmab.dev.dev = &emu->pci->dev;
 
 	for (page = first_page; page <= last_page; page++) {
 		if (emu->page_ptr_table[page] == NULL)
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index eeaed555185c..ab8876855989 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -643,7 +643,7 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	    substream; 
 	    substream = substream->next) {
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      (65536 - 64) * 8,
 					      (65536 - 64) * 8);
 		/*
@@ -656,7 +656,7 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 	      substream; 
 	      substream = substream->next) {
 		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(emu->pci),
+					      &emu->pci->dev,
 					      65536 - 64, 65536 - 64);
 		/*
 		dev_dbg(emu->card->dev,
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index b767df8181b5..0499dc863202 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1275,7 +1275,8 @@ static int snd_ensoniq_pcm(struct ensoniq *ensoniq, int device)
 	ensoniq->pcm1 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ensoniq->pci), 64*1024, 128*1024);
+					      &ensoniq->pci->dev,
+					      64*1024, 128*1024);
 
 #ifdef CHIP1370
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1307,7 +1308,8 @@ static int snd_ensoniq_pcm2(struct ensoniq *ensoniq, int device)
 	ensoniq->pcm2 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ensoniq->pci), 64*1024, 128*1024);
+					      &ensoniq->pci->dev,
+					      64*1024, 128*1024);
 
 #ifdef CHIP1370
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -2095,7 +2097,7 @@ static int snd_ensoniq_create(struct snd_card *card,
 	}
 	ensoniq->irq = pci->irq;
 #ifdef CHIP1370
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				16, &ensoniq->dma_bug) < 0) {
 		dev_err(card->dev, "unable to allocate space for phantom area - dma_bug\n");
 		snd_ensoniq_free(ensoniq);
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index ecf77c8c9e59..c571c5d380ca 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1032,7 +1032,8 @@ static int snd_es1938_new_pcm(struct es1938 *chip, int device)
 	strcpy(pcm->name, "ESS Solo-1");
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 64*1024);
+					      &chip->pci->dev,
+					      64*1024, 64*1024);
 
 	chip->pcm = pcm;
 	return 0;
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 3ef7d507eb9b..a7f8109acced 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -721,7 +721,7 @@ static int snd_fm801_pcm(struct fm801 *chip, int device)
 	chip->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(pdev),
+					      &pdev->dev,
 					      chip->multichannel ? 128*1024 : 64*1024, 128*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 4b0dea7f7669..deadba40131c 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -884,7 +884,8 @@ static int snd_ice1712_pcm(struct snd_ice1712 *ice, int device)
 	ice->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci), 64*1024, 64*1024);
+					      &ice->pci->dev,
+					      64*1024, 64*1024);
 
 	dev_warn(ice->card->dev,
 		 "Consumer PCM code does not work well at the moment --jk\n");
@@ -909,7 +910,8 @@ static int snd_ice1712_pcm_ds(struct snd_ice1712 *ice, int device)
 	ice->pcm_ds = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci), 64*1024, 128*1024);
+					      &ice->pci->dev,
+					      64*1024, 128*1024);
 
 	return 0;
 }
@@ -1253,7 +1255,8 @@ static int snd_ice1712_pcm_profi(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, "ICE1712 multi");
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci), 256*1024, 256*1024);
+					      &ice->pci->dev,
+					      256*1024, 256*1024);
 
 	ice->pcm_pro = pcm;
 
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index e62c11816683..c80a16ee6e76 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -1143,7 +1143,7 @@ static int snd_vt1724_pcm_profi(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, "ICE1724");
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci),
+					      &ice->pci->dev,
 					      256*1024, 256*1024);
 
 	ice->pcm_pro = pcm;
@@ -1341,7 +1341,7 @@ static int snd_vt1724_pcm_spdif(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, name);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci),
+					      &ice->pci->dev,
 					      256*1024, 256*1024);
 
 	ice->pcm = pcm;
@@ -1455,7 +1455,7 @@ static int snd_vt1724_pcm_indep(struct snd_ice1712 *ice, int device)
 	strcpy(pcm->name, "ICE1724 Surround PCM");
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(ice->pci),
+					      &ice->pci->dev,
 					      256*1024, 256*1024);
 
 	ice->pcm_ds = pcm;
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 6ff94d8ad86e..12374ba08ca2 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -1488,7 +1488,7 @@ static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 	chip->pcm[device] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, intel8x0_dma_type(chip),
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      rec->prealloc_size, rec->prealloc_max_size);
 
 	if (rec->playback_ops &&
@@ -3047,7 +3047,7 @@ static int snd_intel8x0_create(struct snd_card *card,
 
 	/* allocate buffer descriptor lists */
 	/* the start of each lists must be aligned to 8 bytes */
-	if (snd_dma_alloc_pages(intel8x0_dma_type(chip), snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(intel8x0_dma_type(chip), &pci->dev,
 				chip->bdbars_count * sizeof(u32) * ICH_MAX_FRAGS * 2,
 				&chip->bdbars) < 0) {
 		snd_intel8x0_free(chip);
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 2f960fb092df..a9add5fedfcb 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -734,7 +734,7 @@ static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
 	chip->pcm[device] = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      rec->prealloc_size,
 					      rec->prealloc_max_size);
 
@@ -1176,7 +1176,7 @@ static int snd_intel8x0m_create(struct snd_card *card,
 
 	/* allocate buffer descriptor lists */
 	/* the start of each lists must be aligned to 8 bytes */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				chip->bdbars_count * sizeof(u32) * ICH_MAX_FRAGS * 2,
 				&chip->bdbars) < 0) {
 		snd_intel8x0m_free(chip);
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 0d81eac0a478..2b8204a13c69 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2275,7 +2275,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
                    korg1212->idRegPtr,
 		   stateName[korg1212->cardState]);
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				sizeof(struct KorgSharedBuffer), &korg1212->dma_shared) < 0) {
 		snd_printk(KERN_ERR "korg1212: can not allocate shared buffer memory (%zd bytes)\n", sizeof(struct KorgSharedBuffer));
                 snd_korg1212_free(korg1212);
@@ -2290,7 +2290,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 
         korg1212->DataBufsSize = sizeof(struct KorgAudioBuffer) * kNumBuffers;
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				korg1212->DataBufsSize, &korg1212->dma_play) < 0) {
 		snd_printk(KERN_ERR "korg1212: can not allocate play data buffer memory (%d bytes)\n", korg1212->DataBufsSize);
                 snd_korg1212_free(korg1212);
@@ -2302,7 +2302,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         K1212_DEBUG_PRINTK("K1212_DEBUG: Play Data Area = 0x%p (0x%08x), %d bytes\n",
 		korg1212->playDataBufsPtr, korg1212->PlayDataPhy, korg1212->DataBufsSize);
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				korg1212->DataBufsSize, &korg1212->dma_rec) < 0) {
 		snd_printk(KERN_ERR "korg1212: can not allocate record data buffer memory (%d bytes)\n", korg1212->DataBufsSize);
                 snd_korg1212_free(korg1212);
@@ -2337,7 +2337,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 		return err;
 	}
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				dsp_code->size, &korg1212->dma_dsp) < 0) {
 		snd_printk(KERN_ERR "korg1212: cannot allocate dsp code memory (%zd bytes)\n", dsp_code->size);
                 snd_korg1212_free(korg1212);
diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 5cda3488ceab..21ac9d003e8e 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -350,7 +350,7 @@ static int setup_corb_rirb(struct lola *chip)
 	unsigned long end_time;
 
 	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				  snd_dma_pci_data(chip->pci),
+				  &chip->pci->dev,
 				  PAGE_SIZE, &chip->rb);
 	if (err < 0)
 		return err;
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index f032d7ceb6e5..856bcca60128 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -591,7 +591,7 @@ int lola_create_pcm(struct lola *chip)
 
 	for (i = 0; i < 2; i++) {
 		err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					  snd_dma_pci_data(chip->pci),
+					  &chip->pci->dev,
 					  PAGE_SIZE, &chip->pcm[i].bdl);
 		if (err < 0)
 			return err;
@@ -611,7 +611,7 @@ int lola_create_pcm(struct lola *chip)
 	}
 	/* buffer pre-allocation */
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      1024 * 64, 32 * 1024 * 1024);
 	return 0;
 }
diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index fe10714380f2..d0f63fa54121 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -846,7 +846,7 @@ static int lx_pcm_create(struct lx6464es *chip)
 	strcpy(pcm->name, card_name);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      size, size);
 
 	chip->pcm = pcm;
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 19fa73df0846..cc8594d76c70 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1861,7 +1861,8 @@ snd_m3_pcm(struct snd_m3 * chip, int device)
 	chip->pcm = pcm;
 	
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 64*1024);
+					      &chip->pci->dev,
+					      64*1024, 64*1024);
 
 	return 0;
 }
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index e5279ce54ee1..674d37ec96b3 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -948,7 +948,8 @@ static void preallocate_buffers(struct snd_mixart *chip, struct snd_pcm *pcm)
 	}
 #endif
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->mgr->pci), 32*1024, 32*1024);
+					      &chip->mgr->pci->dev,
+					      32*1024, 32*1024);
 }
 
 /*
@@ -1360,7 +1361,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	/* create array of streaminfo */
 	size = PAGE_ALIGN( (MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS *
 			    sizeof(struct mixart_flowinfo)) );
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				size, &mgr->flowinfo) < 0) {
 		snd_mixart_free(mgr);
 		return -ENOMEM;
@@ -1371,7 +1372,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	/* create array of bufferinfo */
 	size = PAGE_ALIGN( (MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS *
 			    sizeof(struct mixart_bufferinfo)) );
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				size, &mgr->bufferinfo) < 0) {
 		snd_mixart_free(mgr);
 		return -ENOMEM;
diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index e6aa16646fd4..203c8fe48a01 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -713,13 +713,13 @@ int oxygen_pcm_init(struct oxygen *chip)
 		if (outs)
 			snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
 						      SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(chip->pci),
+						      &chip->pci->dev,
 						      DEFAULT_BUFFER_BYTES_MULTICH,
 						      BUFFER_BYTES_MAX_MULTICH);
 		if (ins)
 			snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
 						      SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(chip->pci),
+						      &chip->pci->dev,
 						      DEFAULT_BUFFER_BYTES,
 						      BUFFER_BYTES_MAX);
 	}
@@ -739,7 +739,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 		pcm->private_data = chip;
 		strcpy(pcm->name, "Digital");
 		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(chip->pci),
+						      &chip->pci->dev,
 						      DEFAULT_BUFFER_BYTES,
 						      BUFFER_BYTES_MAX);
 	}
@@ -769,7 +769,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 		pcm->private_data = chip;
 		strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
 		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(chip->pci),
+						      &chip->pci->dev,
 						      DEFAULT_BUFFER_BYTES,
 						      BUFFER_BYTES_MAX);
 	}
@@ -787,7 +787,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 		pcm->private_data = chip;
 		strcpy(pcm->name, "Analog 3");
 		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(chip->pci),
+						      &chip->pci->dev,
 						      DEFAULT_BUFFER_BYTES,
 						      BUFFER_BYTES_MAX);
 	}
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index e493962d8455..4af34d6d92df 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1171,7 +1171,7 @@ int pcxhr_create_pcm(struct snd_pcxhr *chip)
 	strcpy(pcm->name, name);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->mgr->pci),
+					      &chip->mgr->pci->dev,
 					      32*1024, 32*1024);
 	chip->pcm = pcm;
 	return 0;
@@ -1644,7 +1644,7 @@ static int pcxhr_probe(struct pci_dev *pci,
 
 	/* create hostport purgebuffer */
 	size = PAGE_ALIGN(sizeof(struct pcxhr_hostport));
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
 				size, &mgr->hostport) < 0) {
 		pcxhr_free(mgr);
 		return -ENOMEM;
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index ac10d6f229d8..abcea86045ec 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1550,7 +1550,7 @@ snd_riptide_hw_params(struct snd_pcm_substream *substream,
 	if (sgdlist->area)
 		snd_dma_free_pages(sgdlist);
 	if ((err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				       snd_dma_pci_data(chip->pci),
+				       &chip->pci->dev,
 				       sizeof(struct sgd) * (DESC_MAX_MASK + 1),
 				       sgdlist)) < 0) {
 		snd_printk(KERN_ERR "Riptide: failed to alloc %d dma bytes\n",
@@ -1693,7 +1693,7 @@ static int snd_riptide_pcm(struct snd_riptide *chip, int device)
 	strcpy(pcm->name, "RIPTIDE");
 	chip->pcm = pcm;
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64 * 1024, 128 * 1024);
 	return 0;
 }
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index b0b5e74e776c..ef7dd290ae05 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -905,7 +905,8 @@ static int sis_pcm_create(struct sis7019 *sis)
 	 * world if this fails.
 	 */
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-				snd_dma_pci_data(sis->pci), 64*1024, 128*1024);
+					      &sis->pci->dev,
+					      64*1024, 128*1024);
 
 	return 0;
 }
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index 13103f5c309b..31cbc811ad37 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -884,7 +884,8 @@ static int snd_sonicvibes_pcm(struct sonicvibes *sonic, int device)
 	sonic->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(sonic->pci), 64*1024, 128*1024);
+					      &sonic->pci->dev,
+					      64*1024, 128*1024);
 
 	return 0;
 }
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 8ac6f541b008..07022c0dad40 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -2184,14 +2184,16 @@ int snd_trident_pcm(struct snd_trident *trident, int device)
 		struct snd_pcm_substream *substream;
 		for (substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; substream; substream = substream->next)
 			snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV_SG,
-						      snd_dma_pci_data(trident->pci),
+						      &trident->pci->dev,
 						      64*1024, 128*1024);
 		snd_pcm_lib_preallocate_pages(pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream,
-					      SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(trident->pci),
+					      SNDRV_DMA_TYPE_DEV,
+					      &trident->pci->dev,
 					      64*1024, 128*1024);
 	} else {
 		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(trident->pci), 64*1024, 128*1024);
+						      &trident->pci->dev,
+						      64*1024, 128*1024);
 	}
 
 	return 0;
@@ -2241,10 +2243,12 @@ int snd_trident_foldback_pcm(struct snd_trident *trident, int device)
 
 	if (trident->tlb.entries)
 		snd_pcm_lib_preallocate_pages_for_all(foldback, SNDRV_DMA_TYPE_DEV_SG,
-						      snd_dma_pci_data(trident->pci), 0, 128*1024);
+						      &trident->pci->dev,
+						      0, 128*1024);
 	else
 		snd_pcm_lib_preallocate_pages_for_all(foldback, SNDRV_DMA_TYPE_DEV,
-						      snd_dma_pci_data(trident->pci), 64*1024, 128*1024);
+						      &trident->pci->dev,
+						      64*1024, 128*1024);
 
 	return 0;
 }
@@ -2278,7 +2282,9 @@ int snd_trident_spdif_pcm(struct snd_trident *trident, int device)
 	strcpy(spdif->name, "Trident 4DWave IEC958");
 	trident->spdif = spdif;
 
-	snd_pcm_lib_preallocate_pages_for_all(spdif, SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(trident->pci), 64*1024, 128*1024);
+	snd_pcm_lib_preallocate_pages_for_all(spdif, SNDRV_DMA_TYPE_DEV,
+					      &trident->pci->dev,
+					      64*1024, 128*1024);
 
 	return 0;
 }
@@ -3336,7 +3342,7 @@ static int snd_trident_tlb_alloc(struct snd_trident *trident)
 	/* TLB array must be aligned to 16kB !!! so we allocate
 	   32kB region and correct offset when necessary */
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(trident->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &trident->pci->dev,
 				2 * SNDRV_TRIDENT_MAX_PAGES * 4, &trident->tlb.buffer) < 0) {
 		dev_err(trident->card->dev, "unable to allocate TLB buffer\n");
 		return -ENOMEM;
@@ -3351,7 +3357,7 @@ static int snd_trident_tlb_alloc(struct snd_trident *trident)
 		return -ENOMEM;
 
 	/* allocate and setup silent page and initialise TLB entries */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(trident->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &trident->pci->dev,
 				SNDRV_TRIDENT_PAGE_SIZE, &trident->tlb.silent_page) < 0) {
 		dev_err(trident->card->dev, "unable to allocate silent page\n");
 		return -ENOMEM;
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 902409dbc4c8..30c817b6b635 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -419,7 +419,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 		/* the start of each lists must be aligned to 8 bytes,
 		 * but the kernel pages are much bigger, so we don't care
 		 */
-		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 					PAGE_ALIGN(VIA_TABLE_SIZE * 2 * 8),
 					&dev->table) < 0)
 			return -ENOMEM;
@@ -1454,7 +1454,7 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	init_viadev(chip, chip->capture_devno, VIA_REG_CAPTURE_8233_STATUS, 6, 1);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1478,7 +1478,7 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	init_viadev(chip, chip->capture_devno + 1, VIA_REG_CAPTURE_8233_STATUS + 0x10, 7, 1);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1521,7 +1521,7 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 	init_viadev(chip, chip->capture_devno, VIA_REG_CAPTURE_8233_STATUS, 6, 1);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1547,7 +1547,7 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 	init_viadev(chip, chip->playback_devno, 0x30, 3, 0);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, VIA_MAX_BUFSIZE);
 	return 0;
 }
@@ -1577,7 +1577,7 @@ static int snd_via686_pcm_new(struct via82xx *chip)
 	init_viadev(chip, 1, VIA_REG_CAPTURE_STATUS, 0, 1);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, VIA_MAX_BUFSIZE);
 	return 0;
 }
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 2c8370cf03b3..0edb9ea6e8a6 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -272,7 +272,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 		/* the start of each lists must be aligned to 8 bytes,
 		 * but the kernel pages are much bigger, so we don't care
 		 */
-		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 					PAGE_ALIGN(VIA_TABLE_SIZE * 2 * 8),
 					&dev->table) < 0)
 			return -ENOMEM;
@@ -850,7 +850,7 @@ static int snd_via686_pcm_new(struct via82xx_modem *chip)
 	init_viadev(chip, 1, VIA_REG_MI_STATUS, 1);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      snd_dma_pci_data(chip->pci),
+					      &chip->pci->dev,
 					      64*1024, 128*1024);
 	return 0;
 }
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 90400ebb64af..125c11ed5064 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -587,7 +587,7 @@ static void snd_ymfpci_pcm_init_voice(struct snd_ymfpci_pcm *ypcm, unsigned int
 
 static int snd_ymfpci_ac3_init(struct snd_ymfpci *chip)
 {
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 				4096, &chip->ac3_tmp_base) < 0)
 		return -ENOMEM;
 
@@ -1149,7 +1149,8 @@ int snd_ymfpci_pcm(struct snd_ymfpci *chip, int device)
 	chip->pcm = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_std_chmaps, 2, 0, NULL);
@@ -1184,7 +1185,8 @@ int snd_ymfpci_pcm2(struct snd_ymfpci *chip, int device)
 	chip->pcm2 = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
@@ -1217,7 +1219,8 @@ int snd_ymfpci_pcm_spdif(struct snd_ymfpci *chip, int device)
 	chip->pcm_spdif = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return 0;
 }
@@ -1258,7 +1261,8 @@ int snd_ymfpci_pcm_4ch(struct snd_ymfpci *chip, int device)
 	chip->pcm_4ch = pcm;
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      snd_dma_pci_data(chip->pci), 64*1024, 256*1024);
+					      &chip->pci->dev,
+					      64*1024, 256*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     surround_map, 2, 0, NULL);
@@ -2108,7 +2112,7 @@ static int snd_ymfpci_memalloc(struct snd_ymfpci *chip)
 	       chip->work_size;
 	/* work_ptr must be aligned to 256 bytes, but it's already
 	   covered with the kernel page allocation mechanism */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, snd_dma_pci_data(chip->pci),
+	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 				size, &chip->work_ptr) < 0) 
 		return -ENOMEM;
 	ptr = chip->work_ptr.area;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
