Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AC7BE5B3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6459EAD;
	Mon,  9 Oct 2023 17:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6459EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867216;
	bh=pd605UIlcdRh2KocdbVoH1c0KNm2o08hXSF1mh7sjRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IV/t4NgJ/ZyGy84DfwYmec1SEI+PwgK8fxb2msvYXs/A5L57GlZ0m56jiLvZ1Kr7/
	 1iZcE2/1tt2Tr0rzjMrFin23hfvqjR65vBLmgPp9NfGfWZGZlu1oeFc/B31bZ5g9+h
	 mxq95NHl42eWxVEdCLKg85FaxNXGDtJ4UPChBqV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74065F805C9; Mon,  9 Oct 2023 17:57:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C60EBF805C5;
	Mon,  9 Oct 2023 17:57:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E08F6F80558; Mon,  9 Oct 2023 13:54:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E82ECF802BE;
	Mon,  9 Oct 2023 13:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E82ECF802BE
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
Subject: [PATCH v7 03/13] ASoC: SOF: Intel: hda: start splitting the probe
Date: Mon,  9 Oct 2023 13:54:27 +0200
Message-Id: <20231009115437.99976-4-maarten.lankhorst@linux.intel.com>
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
Message-ID-Hash: WC5HSNMQGKKBJHNYNQ53FKTDTKJNPNFZ
X-Message-ID-Hash: WC5HSNMQGKKBJHNYNQ53FKTDTKJNPNFZ
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WC5HSNMQGKKBJHNYNQ53FKTDTKJNPNFZ/>
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
Acked-by: Mark Brown <broonie@kernel.org>
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

