Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23521116B28
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:36:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A844316D0;
	Mon,  9 Dec 2019 11:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A844316D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887782;
	bh=J1yvnbm0//H1ZgJOxPYvZu/OfX9XHew9sbYm+jL7OeU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fp4C7aUFC+j4kvwsLD2DF3Me7RXo2/U75JGFYD8dI+wM/p9D22/vZ/wqDQJ9cX+Om
	 5LhXrCtvfp6IqPUbZNXmBUy/Vbg4k4Cug9kCqdjau2a01S4ixZBDh5hgVnBZyq9XRb
	 bofledx5NxwSSxsyZRQLUTvowIHehPlJ05lzfEOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF28F805E2;
	Mon,  9 Dec 2019 10:52:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D140EF8037E; Mon,  9 Dec 2019 10:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67E95F802BC
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E95F802BC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E088B2DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:27 +0100
Message-Id: <20191209094943.14984-56-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 55/71] ALSA: via82xx: Use managed buffer
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

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 45 ++++++++++++++++++---------------------------
 sound/pci/via82xx_modem.c |  9 ++-------
 2 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 30c817b6b635..d116f32096c1 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -919,18 +919,10 @@ static int snd_via82xx_hw_params(struct snd_pcm_substream *substream,
 {
 	struct via82xx *chip = snd_pcm_substream_chip(substream);
 	struct viadev *viadev = substream->runtime->private_data;
-	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-	err = build_via_table(viadev, substream, chip->pci,
-			      params_periods(hw_params),
-			      params_period_bytes(hw_params));
-	if (err < 0)
-		return err;
-
-	return 0;
+	return build_via_table(viadev, substream, chip->pci,
+			       params_periods(hw_params),
+			       params_period_bytes(hw_params));
 }
 
 /*
@@ -943,7 +935,6 @@ static int snd_via82xx_hw_free(struct snd_pcm_substream *substream)
 	struct viadev *viadev = substream->runtime->private_data;
 
 	clean_via_table(viadev, substream, chip->pci);
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -1453,9 +1444,9 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	/* capture */
 	init_viadev(chip, chip->capture_devno, VIA_REG_CAPTURE_8233_STATUS, 6, 1);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, VIA_MAX_BUFSIZE);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev,
+				       64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_std_chmaps, 2, 0,
@@ -1477,9 +1468,9 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	/* set up capture */
 	init_viadev(chip, chip->capture_devno + 1, VIA_REG_CAPTURE_8233_STATUS + 0x10, 7, 1);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, VIA_MAX_BUFSIZE);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev,
+				       64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_alt_chmaps, 6, 0,
@@ -1520,9 +1511,9 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 	/* capture */
 	init_viadev(chip, chip->capture_devno, VIA_REG_CAPTURE_8233_STATUS, 6, 1);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, VIA_MAX_BUFSIZE);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev,
+				       64*1024, VIA_MAX_BUFSIZE);
 
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_alt_chmaps, 6, 0,
@@ -1546,9 +1537,9 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 	/* set up playback */
 	init_viadev(chip, chip->playback_devno, 0x30, 3, 0);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, VIA_MAX_BUFSIZE);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev,
+				       64*1024, VIA_MAX_BUFSIZE);
 	return 0;
 }
 
@@ -1576,9 +1567,9 @@ static int snd_via686_pcm_new(struct via82xx *chip)
 	init_viadev(chip, 0, VIA_REG_PLAYBACK_STATUS, 0, 0);
 	init_viadev(chip, 1, VIA_REG_CAPTURE_STATUS, 0, 1);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, VIA_MAX_BUFSIZE);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev,
+				       64*1024, VIA_MAX_BUFSIZE);
 	return 0;
 }
 
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 0edb9ea6e8a6..22eaa9216598 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -642,9 +642,6 @@ static int snd_via82xx_hw_params(struct snd_pcm_substream *substream,
 	struct viadev *viadev = substream->runtime->private_data;
 	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 	err = build_via_table(viadev, substream, chip->pci,
 			      params_periods(hw_params),
 			      params_period_bytes(hw_params));
@@ -667,7 +664,6 @@ static int snd_via82xx_hw_free(struct snd_pcm_substream *substream)
 	struct viadev *viadev = substream->runtime->private_data;
 
 	clean_via_table(viadev, substream, chip->pci);
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -849,9 +845,8 @@ static int snd_via686_pcm_new(struct via82xx_modem *chip)
 	init_viadev(chip, 0, VIA_REG_MO_STATUS, 0);
 	init_viadev(chip, 1, VIA_REG_MI_STATUS, 1);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-					      &chip->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       &chip->pci->dev, 64*1024, 128*1024);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
