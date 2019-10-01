Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC73C3F45
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B751657;
	Tue,  1 Oct 2019 20:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B751657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953019;
	bh=tgvyyGoCG39AtYS8s6yS1h7OeMzu7VJW4jMlZa1oyS0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rrGV4nHGCZR/cOi7+b6qr3FvbLEwESl4qo4osU03iAsjvnpd2WHT7RhVCR3++CnBQ
	 zEEb/J/rmXy4QsvkUCa7qZD4+1ar91liy1AOiDLR2z0xy9l01dwfBWpMcOADCttZZc
	 F5O+UNLAA3xWeGKPzHWWjFIt+0UObE1QCrRlfD0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A08F806E7;
	Tue,  1 Oct 2019 19:57:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEDB2F80638; Tue,  1 Oct 2019 19:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21B0F80639
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21B0F80639
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PJskfDOv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TP7J7RxCKgomzG3FJWaRMpH7H34VKPRCeYak3IF93bE=; b=PJskfDOvY6QV
 yLhmVSmO+al6SwpUw/mwjtPrCLxR/4fcqh5IgK2/oMI0W9ZgPwz5/ljeUIxgBI0vbVr/4IDc2DT1a
 FKt+kt3/JbMVqOc1HSMABPES0kcZgPWrxbVWoCs+ifbvPGla7eybFZWSm0DZd2G4cssal9opiAE4z
 3NlyY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOG-0005t6-M4; Tue, 01 Oct 2019 17:56:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 34B3A2742A10; Tue,  1 Oct 2019 18:56:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190927200538.660-14-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175648.34B3A2742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:48 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Disable DMI L1 entry
	during capture" to the asoc tree
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

   ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 43b2ab9009b13bfff47fcc1893de9244b39bdd54 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:38 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture

There is a known issue on some Intel platforms which causes
pause/release to run into xrun's during capture usecases.
The suggested workaround to address the issue is to
disable the entry of lower power L1 state in the physical
DMI link when there is a capture stream open.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-14-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig      | 10 +++++++
 sound/soc/sof/intel/hda-ctrl.c   | 12 +++------
 sound/soc/sof/intel/hda-stream.c | 45 +++++++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.h        |  5 +++-
 4 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 479ba249e219..d62f51d33be1 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -273,6 +273,16 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
+config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
+	bool "SOF enable DMI Link L1"
+	help
+	  This option enables DMI L1 for both playback and capture
+	  and disables known workarounds for specific HDaudio platforms.
+	  Only use to look into power optimizations on platforms not
+	  affected by DMI L1 issues. This option is not recommended.
+	  Say Y if you want to enable DMI Link L1
+	  If unsure, select "N".
+
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index bc41028a7a01..df1909e1d950 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -139,20 +139,16 @@ void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable)
  */
 int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-#endif
 	u32 val;
 
 	/* enable/disable audio dsp clock gating */
 	val = enable ? PCI_CGCTL_ADSPDCGE : 0;
 	snd_sof_pci_update_bits(sdev, PCI_CGCTL, PCI_CGCTL_ADSPDCGE, val);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* enable/disable L1 support */
-	val = enable ? SOF_HDA_VS_EM2_L1SEN : 0;
-	snd_hdac_chip_updatel(bus, VS_EM2, SOF_HDA_VS_EM2_L1SEN, val);
-#endif
+	/* enable/disable DMI Link L1 support */
+	val = enable ? HDA_VS_INTEL_EM2_L1SEN : 0;
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
+				HDA_VS_INTEL_EM2_L1SEN, val);
 
 	/* enable/disable audio dsp power gating */
 	val = enable ? 0 : PCI_PGCTL_ADSPPGD;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index ad8d41f22e92..2c7447188402 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -185,6 +185,17 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
 			direction == SNDRV_PCM_STREAM_PLAYBACK ?
 			"playback" : "capture");
 
+	/*
+	 * Disable DMI Link L1 entry when capture stream is opened.
+	 * Workaround to address a known issue with host DMA that results
+	 * in xruns during pause/release in capture scenarios.
+	 */
+	if (!IS_ENABLED(SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
+		if (stream && direction == SNDRV_PCM_STREAM_CAPTURE)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN, 0);
+
 	return stream;
 }
 
@@ -193,23 +204,43 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *s;
+	bool active_capture_stream = false;
+	bool found = false;
 
 	spin_lock_irq(&bus->reg_lock);
 
-	/* find used stream */
+	/*
+	 * close stream matching the stream tag
+	 * and check if there are any open capture streams.
+	 */
 	list_for_each_entry(s, &bus->stream_list, list) {
-		if (s->direction == direction &&
-		    s->opened && s->stream_tag == stream_tag) {
+		if (!s->opened)
+			continue;
+
+		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
-			spin_unlock_irq(&bus->reg_lock);
-			return 0;
+			found = true;
+		} else if (s->direction == SNDRV_PCM_STREAM_CAPTURE) {
+			active_capture_stream = true;
 		}
 	}
 
 	spin_unlock_irq(&bus->reg_lock);
 
-	dev_dbg(sdev->dev, "stream_tag %d not opened!\n", stream_tag);
-	return -ENODEV;
+	/* Enable DMI L1 entry if there are no capture streams open */
+	if (!IS_ENABLED(SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
+		if (!active_capture_stream)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+						HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN,
+						HDA_VS_INTEL_EM2_L1SEN);
+
+	if (!found) {
+		dev_dbg(sdev->dev, "stream_tag %d not opened!\n", stream_tag);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5591841a1b6f..23e430d3e056 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -39,7 +39,6 @@
 #define SOF_HDA_WAKESTS			0x0E
 #define SOF_HDA_WAKESTS_INT_MASK	((1 << 8) - 1)
 #define SOF_HDA_RIRBSTS			0x5d
-#define SOF_HDA_VS_EM2_L1SEN            BIT(13)
 
 /* SOF_HDA_GCTL register bist */
 #define SOF_HDA_GCTL_RESET		BIT(0)
@@ -228,6 +227,10 @@
 #define HDA_DSP_REG_HIPCIE		(HDA_DSP_IPC_BASE + 0x0C)
 #define HDA_DSP_REG_HIPCCTL		(HDA_DSP_IPC_BASE + 0x10)
 
+/* Intel Vendor Specific Registers */
+#define HDA_VS_INTEL_EM2		0x1030
+#define HDA_VS_INTEL_EM2_L1SEN		BIT(13)
+
 /*  HIPCI */
 #define HDA_DSP_REG_HIPCI_BUSY		BIT(31)
 #define HDA_DSP_REG_HIPCI_MSG_MASK	0x7FFFFFFF
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
