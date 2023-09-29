Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4EA7B3F22
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853D51509;
	Sat, 30 Sep 2023 10:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853D51509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061833;
	bh=oNEOQc1ZGRhE0hYnYV//ELv7fOqG+/5G5UxYrmRuneM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HA3YfuKRPerJLpAEyzJoCawRm/A33rsdWbPxLRdueOTLoz9fHg6UH3TpvPO/AeUlD
	 ltAWls3OuJ4TrWhp8AVwwO+hReBeZtUllBZI8wmPn0bCaFUsfHepygWiEBdh17dqFH
	 sKWG57YgA0UT5PuxsQCW5kz+O3sZpCAlTNi8HqpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B71FDF80589; Sat, 30 Sep 2023 10:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4752F80589;
	Sat, 30 Sep 2023 10:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAFA5F8016A; Fri, 29 Sep 2023 16:51:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 82E79F80290;
	Fri, 29 Sep 2023 16:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E79F80290
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
Subject: [PATCH v5 03/12] ASoC: SOF: Intel: hda: start splitting the probe
Date: Fri, 29 Sep 2023 16:51:17 +0200
Message-Id: <20230929145123.233838-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QTIZFTFOMNC75AHZ3D3OZ7BV3PV5DIYU
X-Message-ID-Hash: QTIZFTFOMNC75AHZ3D3OZ7BV3PV5DIYU
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:12:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTIZFTFOMNC75AHZ3D3OZ7BV3PV5DIYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This patch moves the initial parts of the probe to the probe_early()
callback, which provides a much faster decision on whether the SOF
driver shall deal with a specific platform or yield to other Intel
drivers.

This is a limited functionality change, the bigger change is to move
the i915/Xe initialization to the probe_early().

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda.c            | 16 +++++++++++++---
 sound/soc/sof/intel/hda.h            |  1 +
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 8e1cd0babd32c..1cc18fb2b75bb 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -16,6 +16,7 @@
 
 struct snd_sof_dsp_ops sof_hda_common_ops = {
 	/* probe/remove/shutdown */
+	.probe_early	= hda_dsp_probe_early,
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 15e6779efaa3b..86a2571488bcc 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1118,11 +1118,10 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
-int hda_dsp_probe(struct snd_sof_dev *sdev)
+int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *hdev;
-	struct hdac_bus *bus;
 	const struct sof_intel_dsp_desc *chip;
 	int ret = 0;
 
@@ -1162,6 +1161,17 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->pdata->hw_pdata = hdev;
 	hdev->desc = chip;
 
+err:
+	return ret;
+}
+
+int hda_dsp_probe(struct snd_sof_dev *sdev)
+{
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	struct hdac_bus *bus;
+	int ret = 0;
+
 	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
 						       PLATFORM_DEVID_NONE,
 						       NULL, 0);
@@ -1299,7 +1309,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	platform_device_unregister(hdev->dmic_dev);
 	iounmap(bus->remap_addr);
 	hda_codec_i915_exit(sdev);
-err:
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5c517ec57d4a2..e13cdc933ca6b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -573,6 +573,7 @@ struct sof_intel_hda_stream {
 /*
  * DSP Core services.
  */
+int hda_dsp_probe_early(struct snd_sof_dev *sdev);
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 int hda_dsp_remove(struct snd_sof_dev *sdev);
 int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
-- 
2.39.2

