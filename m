Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4637BE5C5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF01EBB;
	Mon,  9 Oct 2023 18:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF01EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867342;
	bh=LMgtHIjJJ7qJHEvyuen5YMdx0RAoeDBKwsEVtnlXozU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mmsx6IqlkWcg/qOcDbE9IbIx0hniL+MNZV3j3smypcExJharBQhj4dLcVglhInDyc
	 Rc8uoAv9UU0+v6N2PecV9f2NldxBsl6eHeskjZfun4XN6J2S+miLEE4LpYPsgUdVim
	 Q97NdPGUyA4xi7o1JPPKbtUnSoCAFUyBM8ITev2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B200F80615; Mon,  9 Oct 2023 17:58:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB520F80619;
	Mon,  9 Oct 2023 17:58:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED2CFF80558; Mon,  9 Oct 2023 13:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C02F80557;
	Mon,  9 Oct 2023 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C02F80557
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	sound-open-firmware@alsa-project.org
Subject: [PATCH v7 12/13] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
Date: Mon,  9 Oct 2023 13:54:36 +0200
Message-Id: <20231009115437.99976-13-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O6LFD7H6MI37XVH3W7KHXIE6N26UEMDC
X-Message-ID-Hash: O6LFD7H6MI37XVH3W7KHXIE6N26UEMDC
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6LFD7H6MI37XVH3W7KHXIE6N26UEMDC/>
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
index 1cc18fb2b75bb..26105d8f1bdc7 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.probe_early	= hda_dsp_probe_early,
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
+	.remove_late	= hda_dsp_remove_late,
 
 	/* Register IO uses direct mmio */
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2f189473323f3..d4e76c58de13a 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1168,6 +1168,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 	sdev->pdata->hw_pdata = hdev;
 	hdev->desc = chip;
+	ret = hda_init(sdev);
 
 err:
 	return ret;
@@ -1177,7 +1178,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-	struct hdac_bus *bus;
 	int ret = 0;
 
 	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
@@ -1201,12 +1201,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
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
 
@@ -1315,8 +1309,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 hdac_bus_unmap:
 	platform_device_unregister(hdev->dmic_dev);
-	iounmap(bus->remap_addr);
-	hda_codec_i915_exit(sdev);
 
 	return ret;
 }
@@ -1325,7 +1317,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct nhlt_acpi_table *nhlt = hda->nhlt;
 
@@ -1376,10 +1367,13 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
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
index e13cdc933ca6b..8e846684279e7 100644
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
2.39.2

