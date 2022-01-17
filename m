Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B4490D37
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:01:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CB7188F;
	Mon, 17 Jan 2022 18:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CB7188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438898;
	bh=7bcSEZLz3ee9hcPWYNTolYzG/C+UFjH9TlCAQp+r2gA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WD7rWFKzYTuRDLi11wkzN66Apwwn+XEAk0dmlQRJQT5edKqpk5rcd7DNPNUJl4ckj
	 RtNQCOICSmqJQ/RR9ss7Vcyl0wtIMQTiG+FIgWTHo+FTULchcPzFBg0L6TPgL2cVHK
	 Neg8pNmF4YdZ7e2pyk+CuuoNUNvMKr1SScacOvN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8E1F80517;
	Mon, 17 Jan 2022 18:00:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8358EF80254; Mon, 17 Jan 2022 18:00:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC83F80506;
 Mon, 17 Jan 2022 18:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC83F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P+da5lNL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AFD760EDB;
 Mon, 17 Jan 2022 17:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3059AC36AE3;
 Mon, 17 Jan 2022 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438818;
 bh=7bcSEZLz3ee9hcPWYNTolYzG/C+UFjH9TlCAQp+r2gA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P+da5lNLI3l8+z+JtAAFZ/r/+73DRx4NepOSL6dVpKJPwtw5PrtLWI5ZjfNYKsVyi
 rxIn58BdewKz7Irax8+DlLrg5I/AKYtS6R4bgPtn48LcJQLTmGnkp0bgyk/HNp5xTM
 r0GTqkvPxR3NLTAd3mb2UESJaRV5rgRSg0z+EtQ2tevtDHPQLaEQjx7n+P9KUtsqQq
 E5x3GUlgmOTv0OHkY74Fq5atG/XXcY+zkePXlA+hqtJXdVYKC9bbGvqj99foJSYgc/
 j7xcJv22eVNCJ6KzA6q7XIr7wDXPGLXWl+J3JuwWqKlF791+rXZLdR+bC7mJp/NFKC
 rlb1b/8jY4X8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 31/52] ASoC: SOF: Intel: hda: add quirks for
 HDAudio DMA position information
Date: Mon, 17 Jan 2022 11:58:32 -0500
Message-Id: <20220117165853.1470420-31-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, yung-chuan.liao@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 cujomalainey@chromium.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 288fad2f71fa0b989c075d4984879c26d47cfb06 ]

The code inherited from the Skylake driver does not seem to follow any
known hardware recommendations.

The only two recommended options are
a) use DPIB registers if VC1 traffic is not allowed
b) use DPIB DDR update if VC1 traffic is used

In all of SOF-based updated, VC1 is not supported so we can 'safely'
move to using DPIB registers only.

This patch keeps the legacy code, in case there was an undocumented
issue lost to history, and adds the DPIB DDR update for additional
debug.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20211207193947.71080-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-pcm.c | 86 +++++++++++++++++++++++++----------
 sound/soc/sof/intel/hda.c     |  9 +++-
 sound/soc/sof/intel/hda.h     |  6 +++
 3 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index cc8ddef37f37b..41cb60955f5c1 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -172,38 +172,74 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 		goto found;
 	}
 
-	/*
-	 * DPIB/posbuf position mode:
-	 * For Playback, Use DPIB register from HDA space which
-	 * reflects the actual data transferred.
-	 * For Capture, Use the position buffer for pointer, as DPIB
-	 * is not accurate enough, its update may be completed
-	 * earlier than the data written to DDR.
-	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	switch (sof_hda_position_quirk) {
+	case SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY:
+		/*
+		 * This legacy code, inherited from the Skylake driver,
+		 * mixes DPIB registers and DPIB DDR updates and
+		 * does not seem to follow any known hardware recommendations.
+		 * It's not clear e.g. why there is a different flow
+		 * for capture and playback, the only information that matters is
+		 * what traffic class is used, and on all SOF-enabled platforms
+		 * only VC0 is supported so the work-around was likely not necessary
+		 * and quite possibly wrong.
+		 */
+
+		/* DPIB/posbuf position mode:
+		 * For Playback, Use DPIB register from HDA space which
+		 * reflects the actual data transferred.
+		 * For Capture, Use the position buffer for pointer, as DPIB
+		 * is not accurate enough, its update may be completed
+		 * earlier than the data written to DDR.
+		 */
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+					       AZX_REG_VS_SDXDPIB_XBASE +
+					       (AZX_REG_VS_SDXDPIB_XINTERVAL *
+						hstream->index));
+		} else {
+			/*
+			 * For capture stream, we need more workaround to fix the
+			 * position incorrect issue:
+			 *
+			 * 1. Wait at least 20us before reading position buffer after
+			 * the interrupt generated(IOC), to make sure position update
+			 * happens on frame boundary i.e. 20.833uSec for 48KHz.
+			 * 2. Perform a dummy Read to DPIB register to flush DMA
+			 * position value.
+			 * 3. Read the DMA Position from posbuf. Now the readback
+			 * value should be >= period boundary.
+			 */
+			usleep_range(20, 21);
+			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+					 AZX_REG_VS_SDXDPIB_XBASE +
+					 (AZX_REG_VS_SDXDPIB_XINTERVAL *
+					  hstream->index));
+			pos = snd_hdac_stream_get_pos_posbuf(hstream);
+		}
+		break;
+	case SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS:
+		/*
+		 * In case VC1 traffic is disabled this is the recommended option
+		 */
 		pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 				       AZX_REG_VS_SDXDPIB_XBASE +
 				       (AZX_REG_VS_SDXDPIB_XINTERVAL *
 					hstream->index));
-	} else {
+		break;
+	case SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE:
 		/*
-		 * For capture stream, we need more workaround to fix the
-		 * position incorrect issue:
-		 *
-		 * 1. Wait at least 20us before reading position buffer after
-		 * the interrupt generated(IOC), to make sure position update
-		 * happens on frame boundary i.e. 20.833uSec for 48KHz.
-		 * 2. Perform a dummy Read to DPIB register to flush DMA
-		 * position value.
-		 * 3. Read the DMA Position from posbuf. Now the readback
-		 * value should be >= period boundary.
+		 * This is the recommended option when VC1 is enabled.
+		 * While this isn't needed for SOF platforms it's added for
+		 * consistency and debug.
 		 */
-		usleep_range(20, 21);
-		snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-				 AZX_REG_VS_SDXDPIB_XBASE +
-				 (AZX_REG_VS_SDXDPIB_XINTERVAL *
-				  hstream->index));
 		pos = snd_hdac_stream_get_pos_posbuf(hstream);
+		break;
+	default:
+		dev_err_once(sdev->dev, "hda_position_quirk value %d not supported\n",
+			     sof_hda_position_quirk);
+		pos = 0;
+		break;
 	}
 
 	if (pos >= hstream->bufsize)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2c0d4d06ab364..25200a0e1dc9d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -440,6 +440,10 @@ MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
 #define hda_use_msi	(1)
 #endif
 
+int sof_hda_position_quirk = SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS;
+module_param_named(position_quirk, sof_hda_position_quirk, int, 0444);
+MODULE_PARM_DESC(position_quirk, "SOF HDaudio position quirk");
+
 static char *hda_model;
 module_param(hda_model, charp, 0444);
 MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
@@ -618,7 +622,10 @@ static int hda_init(struct snd_sof_dev *sdev)
 	/* HDA bus init */
 	sof_hda_bus_init(bus, &pci->dev);
 
-	bus->use_posbuf = 1;
+	if (sof_hda_position_quirk == SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS)
+		bus->use_posbuf = 0;
+	else
+		bus->use_posbuf = 1;
 	bus->bdl_pos_adj = 0;
 	bus->sync_write = 1;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1195018a1f4f5..dba4733ccf9ae 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -738,4 +738,10 @@ struct sof_ipc_dai_config;
 int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w);
 int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w);
 
+#define SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY	(0) /* previous implementation */
+#define SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS	(1) /* recommended if VC0 only */
+#define SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE	(2) /* recommended with VC0 or VC1 */
+
+extern int sof_hda_position_quirk;
+
 #endif
-- 
2.34.1

