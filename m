Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC6E22F2
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD83A167E;
	Wed, 23 Oct 2019 20:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD83A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857125;
	bh=vYJfF3QZgmhsUgQjzRWdjfSqRbe7O1M9mrBIiUOY5t8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=c9m7hBEySeOJT8bYPP9i/p8ilAE8ruWl58w+SnSDyGKMeH2/iyVpcNKPcJdv+6C7B
	 9+tzTco77/e4pZ1QpAWkMAkN4mh+vuOwwo7m+qihKvvaSTUMdmSQcwuOMG6wd21yFB
	 XD3tyqCoahXCA/67bz+LkGqfrM4xaGIG29AhwJv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBEEF803D7;
	Wed, 23 Oct 2019 20:56:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042F9F805FD; Wed, 23 Oct 2019 20:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48BCEF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BCEF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XqNNaCKg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DwstmcniS79fBLbk2eZPym5lxUqHsiFAjO8g/YbvgBA=; b=XqNNaCKgfgGt
 qbXAyY+iP7CcZVfCciQr/4KTBGQW+DhfiiJJ3Za1tR/PDrUbUubZ2bZcb4W9CUe4qkIy7Ka+lTeq+
 Ha0oe7/dcNzcDyfaYXTHyOWDmiWeU7UhqdAvuG3171SQaK1QmtsiBF57zLod+I/lPmckM8TTYS2d0
 9/tUA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLni-0001Ao-Av; Wed, 23 Oct 2019 18:56:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C641C274326D; Wed, 23 Oct 2019 19:56:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191022192844.21022-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185605.C641C274326D@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:05 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: add dev_err() traces
	for snd_sof_dsp_read_poll_timeout()" to the asoc tree
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

The patch

   ASoC: SOF: Intel: hda: add dev_err() traces for snd_sof_dsp_read_poll_timeout()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6a414489e0f3309a221f26b3d11c19d1a96a3635 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 22 Oct 2019 14:28:44 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: add dev_err() traces for
 snd_sof_dsp_read_poll_timeout()

Such traces should be extremely rare but extremely useful for debug.

Report errors for all calls to sdn_sof_dsp_read_poll_timeout(), but
only on negative values for consistency.

Add traces that enable each timeout to be uniquely identified.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191022192844.21022-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c    | 30 +++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda-loader.c | 13 ++++++++++++-
 sound/soc/sof/intel/hda-stream.c | 24 ++++++++++++++++++++----
 3 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index fb55a3c5afd0..3ea401646e0c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -42,6 +42,12 @@ int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev, unsigned int core_mask)
 					((adspcs & reset) == reset),
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_RESET_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout on HDA_DSP_REG_ADSPCS read\n",
+			__func__);
+		return ret;
+	}
 
 	/* has core entered reset ? */
 	adspcs = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -77,6 +83,13 @@ int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_mask)
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
 
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout on HDA_DSP_REG_ADSPCS read\n",
+			__func__);
+		return ret;
+	}
+
 	/* has core left reset ? */
 	adspcs = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 				  HDA_DSP_REG_ADSPCS);
@@ -151,8 +164,12 @@ int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 					    (adspcs & cpa) == cpa,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
-	if (ret < 0)
-		dev_err(sdev->dev, "error: timeout on core powerup\n");
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout on HDA_DSP_REG_ADSPCS read\n",
+			__func__);
+		return ret;
+	}
 
 	/* did core power up ? */
 	adspcs = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -171,17 +188,24 @@ int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	u32 adspcs;
+	int ret;
 
 	/* update bits */
 	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
 					 HDA_DSP_REG_ADSPCS,
 					 HDA_DSP_ADSPCS_SPA_MASK(core_mask), 0);
 
-	return snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 				HDA_DSP_REG_ADSPCS, adspcs,
 				!(adspcs & HDA_DSP_ADSPCS_SPA_MASK(core_mask)),
 				HDA_DSP_REG_POLL_INTERVAL_US,
 				HDA_DSP_PD_TIMEOUT * USEC_PER_MSEC);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: %s: timeout on HDA_DSP_REG_ADSPCS read\n",
+			__func__);
+
+	return ret;
 }
 
 bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 7956dbf5be88..b1783360fe10 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -126,7 +126,8 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 					    HDA_DSP_INIT_TIMEOUT_US);
 
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: waiting for HIPCIE done\n");
+		dev_err(sdev->dev, "error: %s: timeout for HIPCIE done\n",
+			__func__);
 		goto err;
 	}
 
@@ -152,6 +153,10 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	if (!ret)
 		return 0;
 
+	dev_err(sdev->dev,
+		"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
+		__func__);
+
 err:
 	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
 	hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
@@ -258,6 +263,12 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
 	 * but we return the initial error should the DMA stop also fail
 	 */
 
+	if (status < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
+			__func__);
+	}
+
 	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 2c7447188402..450f9c55785f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -275,8 +275,12 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_STREAM_RUN_TIMEOUT);
 
-		if (ret)
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: %s: cmd %d: timeout on STREAM_SD_OFFSET read\n",
+				__func__, cmd);
 			return ret;
+		}
 
 		hstream->running = true;
 		break;
@@ -294,8 +298,12 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 						HDA_DSP_REG_POLL_INTERVAL_US,
 						HDA_DSP_STREAM_RUN_TIMEOUT);
 
-		if (ret)
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: %s: cmd %d: timeout on STREAM_SD_OFFSET read\n",
+				__func__, cmd);
 			return ret;
+		}
 
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset +
 				  SOF_HDA_ADSP_REG_CL_SD_STS,
@@ -356,8 +364,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_STREAM_RUN_TIMEOUT);
 
-	if (ret)
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout on STREAM_SD_OFFSET read1\n",
+			__func__);
 		return ret;
+	}
 
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
@@ -418,8 +430,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_STREAM_RUN_TIMEOUT);
 
-	if (ret)
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: %s: timeout on STREAM_SD_OFFSET read2\n",
+			__func__);
 		return ret;
+	}
 
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
