Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A20C0C83
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE87167B;
	Fri, 27 Sep 2019 22:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE87167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615388;
	bh=nJzB5vQqBm2PvipfK4S2CDkWLtvZzL4EBE99ZmQ+MG8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gl6ai2mnOR89j0lP17y5bU2W/f83Af3xNjlE1OXL2VkWFuspNgiO4dQkQATljBsTp
	 nxAMWkkuyfQZi87lYADbZa6jxFPO92ut+qHeg+0tpdeu2P7FR5xu6NbDGV9RKI4GhR
	 kWpua9lu4E12WoiaMSSYQyH16ng6CrnlLpJJF8Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4B4F80709;
	Fri, 27 Sep 2019 22:06:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9B6AF80633; Fri, 27 Sep 2019 22:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3508F8060D
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3508F8060D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444288"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:38 -0500
Message-Id: <20190927200538.660-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/13] ASoC: SOF: Intel: hda: Disable DMI L1
	entry during capture
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

There is a known issue on some Intel platforms which causes
pause/release to run into xrun's during capture usecases.
The suggested workaround to address the issue is to
disable the entry of lower power L1 state in the physical
DMI link when there is a capture stream open.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
