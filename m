Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FE75C0E5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30BCD7F8;
	Fri, 21 Jul 2023 10:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30BCD7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927015;
	bh=dk+UQL7jV5SAKcrXN0PwqpfcZjkKvshDUv2scyJow6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnfBNSi7gJ5RKhwaUtsV8NeLSovNcNZeiQZ6dE9Dlsb6CI4yY/W85MS2EVaCgUJEz
	 SpFzp3nhVux056/tYK//mSds+m8/v9CI430fIbG7QGbxMBGUX8K6LBGm3xQQAX4sFp
	 /c0nRAEbf+VBhAvcmVVBYb0rknasCmAMm/Lwv7ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF15F80557; Fri, 21 Jul 2023 10:08:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FFD4F8055C;
	Fri, 21 Jul 2023 10:08:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2523F80494; Wed, 19 Jul 2023 18:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB7FEF80535;
	Wed, 19 Jul 2023 18:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB7FEF80535
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 8/9] ASoC: SOF: Intel: Remove deferred probe for SOF
Date: Wed, 19 Jul 2023 18:41:40 +0200
Message-Id: <20230719164141.228073-9-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TCEA7SBZVB3VRPTFJXZYXRF57ZOAC37T
X-Message-ID-Hash: TCEA7SBZVB3VRPTFJXZYXRF57ZOAC37T
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCEA7SBZVB3VRPTFJXZYXRF57ZOAC37T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This was only used to allow modprobing i915, by converting to the
-EPROBE_DEFER mechanism, it can be completely removed, and is in
fact counterproductive since -EPROBE_DEFER otherwise won't be
handled correctly.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig           | 19 -----------------
 sound/soc/sof/core.c            | 38 ++-------------------------------
 sound/soc/sof/intel/Kconfig     |  1 -
 sound/soc/sof/intel/hda-codec.c |  2 +-
 sound/soc/sof/intel/hda.c       | 32 ++++++++++++++++-----------
 sound/soc/sof/sof-pci-dev.c     |  3 +--
 sound/soc/sof/sof-priv.h        |  5 -----
 7 files changed, 23 insertions(+), 77 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 80361139a49ad..8ee39e5558062 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -82,17 +82,6 @@ config SND_SOC_SOF_DEVELOPER_SUPPORT
 
 if SND_SOC_SOF_DEVELOPER_SUPPORT
 
-config SND_SOC_SOF_FORCE_PROBE_WORKQUEUE
-	bool "SOF force probe workqueue"
-	select SND_SOC_SOF_PROBE_WORK_QUEUE
-	help
-	  This option forces the use of a probe workqueue, which is only used
-	  when HDaudio is enabled due to module dependencies. Forcing this
-	  option is intended for debug only, but this should not add any
-	  functional issues in nominal cases.
-	  Say Y if you are involved in SOF development and need this option.
-	  If not, select N.
-
 config SND_SOC_SOF_NOCODEC
 	tristate
 
@@ -271,14 +260,6 @@ config SND_SOC_SOF
 	  module dependencies but since the module or built-in type is decided
 	  at the top level it doesn't matter.
 
-config SND_SOC_SOF_PROBE_WORK_QUEUE
-	bool
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-	  When selected, the probe is handled in two steps, for example to
-	  avoid lockdeps if request_module is used in the probe.
-
 # Supported IPC versions
 config SND_SOC_SOF_IPC3
 	bool
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 30db685cc5f4b..cdf86dc4a8a87 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -191,7 +191,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	/* probe the DSP hardware */
 	ret = snd_sof_probe(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
 		goto probe_err;
 	}
 
@@ -309,8 +310,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
-	sdev->probe_completed = true;
-
 	return 0;
 
 sof_machine_err:
@@ -336,19 +335,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static void sof_probe_work(struct work_struct *work)
-{
-	struct snd_sof_dev *sdev =
-		container_of(work, struct snd_sof_dev, probe_work);
-	int ret;
-
-	ret = sof_probe_continue(sdev);
-	if (ret < 0) {
-		/* errors cannot be propagated, log */
-		dev_err(sdev->dev, "error: %s failed err: %d\n", __func__, ret);
-	}
-}
-
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 {
 	struct snd_sof_dev *sdev;
@@ -436,33 +422,16 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
-		INIT_WORK(&sdev->probe_work, sof_probe_work);
-		schedule_work(&sdev->probe_work);
-		return 0;
-	}
-
 	return sof_probe_continue(sdev);
 }
 EXPORT_SYMBOL(snd_sof_device_probe);
 
-bool snd_sof_device_probe_completed(struct device *dev)
-{
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-
-	return sdev->probe_completed;
-}
-EXPORT_SYMBOL(snd_sof_device_probe_completed);
-
 int snd_sof_device_remove(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
-		cancel_work_sync(&sdev->probe_work);
-
 	/*
 	 * Unregister any registered client device first before IPC and debugfs
 	 * to allow client drivers to be removed cleanly
@@ -501,9 +470,6 @@ int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
-		cancel_work_sync(&sdev->probe_work);
-
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
 		sof_fw_trace_free(sdev);
 		return snd_sof_shutdown(sdev);
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 69c1a370d3b61..d9e87a91670a3 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -293,7 +293,6 @@ config SND_SOC_SOF_HDA_LINK
 config SND_SOC_SOF_HDA_AUDIO_CODEC
 	bool "SOF support for HDAudio codecs"
 	depends on SND_SOC_SOF_HDA_LINK
-	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDAudio codecs with Sound Open Firmware
 	  for Intel(R) platforms.
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index f1fd5b44aaac9..344b61576c0e3 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* i915 exposes a HDA codec for HDMI audio */
-	ret = snd_hdac_i915_init(bus, true);
+	ret = snd_hdac_i915_init(bus, false);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 64bebe1a72bbc..a8b7a68142c05 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -801,8 +801,11 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* init i915 and HDMI codecs */
 	ret = hda_codec_i915_init(sdev);
-	if (ret < 0)
-		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_warn(sdev->dev, "init of i915 and HDMI codec failed: %i\n", ret);
+		return ret;
+	}
 
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
@@ -1115,14 +1118,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->pdata->hw_pdata = hdev;
 	hdev->desc = chip;
 
-	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
-						       PLATFORM_DEVID_NONE,
-						       NULL, 0);
-	if (IS_ERR(hdev->dmic_dev)) {
-		dev_err(sdev->dev, "error: failed to create DMIC device\n");
-		return PTR_ERR(hdev->dmic_dev);
-	}
-
 	/*
 	 * use position update IPC if either it is forced
 	 * or we don't have other choice
@@ -1142,6 +1137,15 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto hdac_bus_unmap;
 
+	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
+						       PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(hdev->dmic_dev)) {
+		dev_err(sdev->dev, "error: failed to create DMIC device\n");
+		ret = PTR_ERR(hdev->dmic_dev);
+		goto hdac_exit;
+	}
+
 	if (sdev->dspless_mode_selected)
 		goto skip_dsp_setup;
 
@@ -1150,7 +1154,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (!sdev->bar[HDA_DSP_BAR]) {
 		dev_err(sdev->dev, "error: ioremap error\n");
 		ret = -ENXIO;
-		goto hdac_bus_unmap;
+		goto platform_unreg;
 	}
 
 	sdev->mmio_bar = HDA_DSP_BAR;
@@ -1248,10 +1252,12 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 /* dsp_unmap: not currently used */
 	if (!sdev->dspless_mode_selected)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
-hdac_bus_unmap:
+platform_unreg:
 	platform_device_unregister(hdev->dmic_dev);
-	iounmap(bus->remap_addr);
+hdac_exit:
 	hda_codec_i915_exit(sdev);
+hdac_bus_unmap:
+	iounmap(bus->remap_addr);
 err:
 	return ret;
 }
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index f5ece43d0ec24..0fa424613082e 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -339,8 +339,7 @@ void sof_pci_remove(struct pci_dev *pci)
 	snd_sof_device_remove(&pci->dev);
 
 	/* follow recommendation in pci-driver.c to increment usage counter */
-	if (snd_sof_device_probe_completed(&pci->dev) &&
-	    !(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
+	if (!(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
 		pm_runtime_get_noresume(&pci->dev);
 
 	/* release pci regions and disable device */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d4f6702e93dcb..71db636cfdccc 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -564,10 +564,6 @@ struct snd_sof_dev {
 	enum sof_fw_state fw_state;
 	bool first_boot;
 
-	/* work queue in case the probe is implemented in two steps */
-	struct work_struct probe_work;
-	bool probe_completed;
-
 	/* DSP HW differentiation */
 	struct snd_sof_pdata *pdata;
 
@@ -675,7 +671,6 @@ struct snd_sof_dev {
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
 int snd_sof_device_remove(struct device *dev);
 int snd_sof_device_shutdown(struct device *dev);
-bool snd_sof_device_probe_completed(struct device *dev);
 
 int snd_sof_runtime_suspend(struct device *dev);
 int snd_sof_runtime_resume(struct device *dev);
-- 
2.39.2

