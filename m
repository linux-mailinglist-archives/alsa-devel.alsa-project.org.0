Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C563A7B9BAA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50880EA2;
	Thu,  5 Oct 2023 09:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50880EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492775;
	bh=TksialVYRvpJmocDW6ZPuXtskt4AcOxpr5ehb+mU9uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cgeu6bHHdI7VopKTzCzArheFm82cKzSVCOaevrcbPTA/QTAe1Ru4fKmIg7/581Dha
	 T3lbotIigeD4fBqdFe9/eqcxhCVsesLoRk95/7LCgyLOoZqxZp/Za6fGNz1k7emnPR
	 maj21RfSbTUbc3uvorAU+8pNh1YhdkbGKCWrTNnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4356DF806A0; Thu,  5 Oct 2023 09:53:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAD5F806A0;
	Thu,  5 Oct 2023 09:53:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FA17F80552; Wed,  4 Oct 2023 16:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EFB7F800C1;
	Wed,  4 Oct 2023 16:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFB7F800C1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
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
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
Date: Wed,  4 Oct 2023 16:55:39 +0200
Message-Id: <20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 44JEWI4AQM4I2FAOT7LLVR3EEK4IQMVP
X-Message-ID-Hash: 44JEWI4AQM4I2FAOT7LLVR3EEK4IQMVP
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:53:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that we can use -EPROBE_DEFER, it's no longer required to spin off
the snd_hdac_i915_init into a workqueue.

Use the -EPROBE_DEFER mechanism instead, which must be returned in the
probe function.

The previously added probe_early can be used for this,
and we also use the newly added remove_late for unbinding afterwards.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda.c            | 18 ++++++------------
 sound/soc/sof/intel/hda.h            |  1 +
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 1cc18fb2b75b..26105d8f1bdc 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.probe_early	= hda_dsp_probe_early,
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
+	.remove_late	= hda_dsp_remove_late,
 
 	/* Register IO uses direct mmio */
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 86a2571488bc..4eb7f04b8ae1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 	sdev->pdata->hw_pdata = hdev;
 	hdev->desc = chip;
+	ret = hda_init(sdev);
 
 err:
 	return ret;
@@ -1169,7 +1170,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-	struct hdac_bus *bus;
 	int ret = 0;
 
 	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
@@ -1193,12 +1193,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (sdev->dspless_mode_selected)
 		hdev->no_ipc_position = 1;
 
-	/* set up HDA base */
-	bus = sof_to_bus(sdev);
-	ret = hda_init(sdev);
-	if (ret < 0)
-		goto hdac_bus_unmap;
-
 	if (sdev->dspless_mode_selected)
 		goto skip_dsp_setup;
 
@@ -1307,8 +1301,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 hdac_bus_unmap:
 	platform_device_unregister(hdev->dmic_dev);
-	iounmap(bus->remap_addr);
-	hda_codec_i915_exit(sdev);
 
 	return ret;
 }
@@ -1317,7 +1309,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct nhlt_acpi_table *nhlt = hda->nhlt;
 
@@ -1368,10 +1359,13 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (!sdev->dspless_mode_selected)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 
-	iounmap(bus->remap_addr);
+	return 0;
+}
 
+int hda_dsp_remove_late(struct snd_sof_dev *sdev)
+{
+	iounmap(sof_to_bus(sdev)->remap_addr);
 	sof_hda_bus_exit(sdev);
-
 	hda_codec_i915_exit(sdev);
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e13cdc933ca6..8e846684279e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -576,6 +576,7 @@ struct sof_intel_hda_stream {
 int hda_dsp_probe_early(struct snd_sof_dev *sdev);
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 int hda_dsp_remove(struct snd_sof_dev *sdev);
+int hda_dsp_remove_late(struct snd_sof_dev *sdev);
 int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
-- 
2.40.1

