Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CD224E5
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2C61679;
	Sat, 18 May 2019 22:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2C61679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211828;
	bh=R++55eg7YLDeZPM4gJPHQ38lybmnJ82K8Ye+4k87PRE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5GQVMJECnj7NPlV4TD3aCSz2xE9iVE/CKmQ1mWyfcYfnwUUu7dS5r+xNjNURaHZx
	 DbpTwMroWDuam7Br/ldPo6Br1DYAVAjQWFOD/bbHv3QZRkqc/zcNp4+kfMM09GJKXw
	 SBocQZLkDUBpCol8tD2YiKVodKwlPpot9foEoXmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A284F89765;
	Sat, 18 May 2019 22:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89DF6F89723; Sat, 18 May 2019 22:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7606FF89721
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7606FF89721
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:27 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:27:01 -0500
Message-Id: <20190518202704.7772-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/12] ASoC: SOF: Intel: hda: fix the hda init
	chip
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

re-write hda_init_caps and remove the HDA reset, clean HDA
streams and clear interrupt steps in hda_dsp_probe so the
HDA init steps will not be called twice if the
CONFIG_SND_SOC_SOF_HDA is true.

Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel DSP")
Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
