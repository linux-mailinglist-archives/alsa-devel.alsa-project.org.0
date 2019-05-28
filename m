Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF472C9DE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D0517F5;
	Tue, 28 May 2019 17:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D0517F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056343;
	bh=NstDhq+I/nzOTYRDBuJKFamcTf69zEap6GWaVthOsMk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=d7zT1+kLWxNpiJ1l8r/DCPsOIeIm5tT5Pbgd531qUqZNnenBecJ7MGK89mAbmP+GE
	 2HBwayXZ5uRng0t6jMDWnJy6lZgcXlAQiaFv2dSuGySMhtf1F6u1kHHHrvyM3XalDL
	 AqXmtLlAt9auUru4B1IoB2x9KYjTHnPzdYiGp678=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8DDF8971D;
	Tue, 28 May 2019 17:07:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12A44F8973F; Tue, 28 May 2019 17:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBAC3F896EB
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBAC3F896EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PHiOuhhb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z1fMUmmRZ5l2f/2YAwm8ReRit26wTST70xA9yod55AE=; b=PHiOuhhbgRsL
 twApuLvuSLECL1t/zVWrhSc53W4U7jt/VbhPND49wz2kWK7jNUXfsXCvBDq1rRb9btMZQ5e3N3O7+
 0JPoDPBei2Mcp/BHxGO4ZAt+Nj0ocNGl53LrA/NHmGXJY6WEhntIux9y8Vqp1rZ3i/PrxOLnzy93b
 FUJtE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgs-0002od-54; Tue, 28 May 2019 15:07:02 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 70DAA440046; Tue, 28 May 2019 16:07:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
In-Reply-To: <20190524190925.5931-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150701.70DAA440046@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:07:01 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix the hda init chip"
	to the asoc tree
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

   ASoC: SOF: Intel: hda: fix the hda init chip

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From be1b577d01787c67acc6dd1257588183386a08f4 Mon Sep 17 00:00:00 2001
From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Date: Fri, 24 May 2019 14:09:24 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: fix the hda init chip

re-write hda_init_caps and remove the HDA reset, clean HDA
streams and clear interrupt steps in hda_dsp_probe so the
HDA init steps will not be called twice if the
CONFIG_SND_SOC_SOF_HDA is true.

Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel DSP")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ctrl.c | 102 ++++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.c      |  99 ++++++--------------------------
 2 files changed, 112 insertions(+), 89 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 2c3645736e1f..07bc123112c9 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -161,21 +161,105 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-/*
- * While performing reset, controller may not come back properly and causing
- * issues, so recommendation is to set CGCTL.MISCBDCGE to 0 then do reset
- * (init chip) and then again set CGCTL.MISCBDCGE to 1
- */
 int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	int ret;
+	struct hdac_stream *stream;
+	int sd_offset, ret = 0;
+
+	if (bus->chip_init)
+		return 0;
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
-	ret = snd_hdac_bus_init_chip(bus, full_reset);
+
+	if (full_reset) {
+		/* clear WAKESTS */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+					SOF_HDA_WAKESTS_INT_MASK,
+					SOF_HDA_WAKESTS_INT_MASK);
+
+		/* reset HDA controller */
+		ret = hda_dsp_ctrl_link_reset(sdev, true);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to reset HDA controller\n");
+			return ret;
+		}
+
+		usleep_range(500, 1000);
+
+		/* exit HDA controller reset */
+		ret = hda_dsp_ctrl_link_reset(sdev, false);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
+			return ret;
+		}
+
+		usleep_range(1000, 1200);
+	}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* check to see if controller is ready */
+	if (!snd_hdac_chip_readb(bus, GCTL)) {
+		dev_dbg(bus->dev, "controller not ready!\n");
+		return -EBUSY;
+	}
+
+	/* Accept unsolicited responses */
+	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
+
+	/* detect codecs */
+	if (!bus->codec_mask) {
+		bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+		dev_dbg(bus->dev, "codec_mask = 0x%lx\n", bus->codec_mask);
+	}
+#endif
+
+	/* clear stream status */
+	list_for_each_entry(stream, &bus->stream_list, list) {
+		sd_offset = SOF_STREAM_SD_OFFSET(stream);
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					sd_offset +
+					SOF_HDA_ADSP_REG_CL_SD_STS,
+					SOF_HDA_CL_DMA_SD_INT_MASK,
+					SOF_HDA_CL_DMA_SD_INT_MASK);
+	}
+
+	/* clear WAKESTS */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+				SOF_HDA_WAKESTS_INT_MASK,
+				SOF_HDA_WAKESTS_INT_MASK);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* clear rirb status */
+	snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
+#endif
+
+	/* clear interrupt status register */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS,
+			  SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_ALL_STREAM);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* initialize the codec command I/O */
+	snd_hdac_bus_init_cmd_io(bus);
+#endif
+
+	/* enable CIE and GIE interrupts */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* program the position buffer */
+	if (bus->use_posbuf && bus->posbuf.addr) {
+		snd_hdac_chip_writel(bus, DPLBASE, (u32)bus->posbuf.addr);
+		snd_hdac_chip_writel(bus, DPUBASE,
+				     upper_32_bits(bus->posbuf.addr));
+	}
+#endif
+
+	bus->chip_init = true;
+
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
 
 	return ret;
 }
-#endif
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7e3980a2f7ba..e47f03dc62f0 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -264,9 +264,12 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 	return tplg_filename;
 }
 
+#endif
+
 static int hda_init_caps(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_ext_link *hlink;
 	struct snd_soc_acpi_mach_params *mach_params;
 	struct snd_soc_acpi_mach *hda_mach;
@@ -274,8 +277,9 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 	const char *tplg_filename;
 	int codec_num = 0;
-	int ret = 0;
 	int i;
+#endif
+	int ret = 0;
 
 	device_disable_async_suspend(bus->dev);
 
@@ -283,6 +287,14 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->ppcap)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
+	ret = hda_dsp_ctrl_init_chip(sdev, true);
+	if (ret < 0) {
+		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
+			ret);
+		return ret;
+	}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
@@ -293,12 +305,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	ret = hda_dsp_ctrl_init_chip(sdev, true);
-	if (ret < 0) {
-		dev_err(bus->dev, "error: init chip failed with ret: %d\n", ret);
-		goto out;
-	}
-
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_info(bus->dev, "no hda codecs found!\n");
@@ -339,8 +345,10 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 				/* use local variable for readability */
 				tplg_filename = pdata->tplg_filename;
 				tplg_filename = fixup_tplg_name(sdev, tplg_filename);
-				if (!tplg_filename)
-					goto out;
+				if (!tplg_filename) {
+					hda_codec_i915_exit(sdev);
+					return ret;
+				}
 				pdata->tplg_filename = tplg_filename;
 			}
 		}
@@ -364,35 +372,10 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	 */
 	list_for_each_entry(hlink, &bus->hlink_list, list)
 		snd_hdac_ext_bus_link_put(bus, hlink);
-
-	return 0;
-
-out:
-	hda_codec_i915_exit(sdev);
-	return ret;
-}
-
-#else
-
-static int hda_init_caps(struct snd_sof_dev *sdev)
-{
-	/*
-	 * set CGCTL.MISCBDCGE to 0 during reset and set back to 1
-	 * when reset finished.
-	 * TODO: maybe no need for init_caps?
-	 */
-	hda_dsp_ctrl_misc_clock_gating(sdev, 0);
-
-	/* clear WAKESTS */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-				SOF_HDA_WAKESTS_INT_MASK,
-				SOF_HDA_WAKESTS_INT_MASK);
-
+#endif
 	return 0;
 }
 
-#endif
-
 static const struct sof_intel_dsp_desc
 	*get_chip_info(struct snd_sof_pdata *pdata)
 {
@@ -409,9 +392,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *hdev;
 	struct hdac_bus *bus;
-	struct hdac_stream *stream;
 	const struct sof_intel_dsp_desc *chip;
-	int sd_offset, ret = 0;
+	int ret = 0;
 
 	/*
 	 * detect DSP by checking class/subclass/prog-id information
@@ -558,49 +540,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto free_ipc_irq;
 
-	/* reset HDA controller */
-	ret = hda_dsp_ctrl_link_reset(sdev, true);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to reset HDA controller\n");
-		goto free_ipc_irq;
-	}
-
-	/* exit HDA controller reset */
-	ret = hda_dsp_ctrl_link_reset(sdev, false);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
-		goto free_ipc_irq;
-	}
-
-	/* clear stream status */
-	list_for_each_entry(stream, &bus->stream_list, list) {
-		sd_offset = SOF_STREAM_SD_OFFSET(stream);
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-					sd_offset +
-					SOF_HDA_ADSP_REG_CL_SD_STS,
-					SOF_HDA_CL_DMA_SD_INT_MASK,
-					SOF_HDA_CL_DMA_SD_INT_MASK);
-	}
-
-	/* clear WAKESTS */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-				SOF_HDA_WAKESTS_INT_MASK,
-				SOF_HDA_WAKESTS_INT_MASK);
-
-	/* clear interrupt status register */
-	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS,
-			  SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_ALL_STREAM);
-
-	/* enable CIE and GIE interrupts */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
-
-	/* re-enable CGCTL.MISCBDCGE after reset */
-	hda_dsp_ctrl_misc_clock_gating(sdev, true);
-
-	device_disable_async_suspend(&pci->dev);
-
 	/* enable DSP features */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_GPROCEN, SOF_HDA_PPCTL_GPROCEN);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
