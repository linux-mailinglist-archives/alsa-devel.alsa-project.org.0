Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D97B9BB0
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 10:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365231073;
	Thu,  5 Oct 2023 09:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365231073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492839;
	bh=K8qFC+A34oEcf8vUCdFm04BBoUs9Bf/zW4Kx81IocnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNYGvfQiyxocSIdgn9VN5mvNE0hJaQJslhW8sVHKIAekcChPxuiDY8er2ilnVJiw4
	 VoXoTGykUqOKXBLEerSNITjZEIk9vK4YhLJUtXsuocuUM7rvGXbSqpY/dxkOtcQucC
	 Hp3X+rAFrgMiQQOHbX1v97E9dncr9+Bxq9wFEEX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A85F806D4; Thu,  5 Oct 2023 09:53:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0986F806D6;
	Thu,  5 Oct 2023 09:53:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7900DF80310; Wed,  4 Oct 2023 16:56:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A775F8047D;
	Wed,  4 Oct 2023 16:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A775F8047D
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
Subject: [PATCH v6 03/12] ASoC: SOF: Intel: hda: start splitting the probe
Date: Wed,  4 Oct 2023 16:55:31 +0200
Message-Id: <20231004145540.32321-4-maarten.lankhorst@linux.intel.com>
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
Message-ID-Hash: TFBETMQHAYF7PZM2EMHDCZTBUXAL5MTC
X-Message-ID-Hash: TFBETMQHAYF7PZM2EMHDCZTBUXAL5MTC
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:53:13 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFBETMQHAYF7PZM2EMHDCZTBUXAL5MTC/>
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
index 8e1cd0babd32..1cc18fb2b75b 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -16,6 +16,7 @@
 
 struct snd_sof_dsp_ops sof_hda_common_ops = {
 	/* probe/remove/shutdown */
+	.probe_early	= hda_dsp_probe_early,
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 15e6779efaa3..86a2571488bc 100644
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
index 5c517ec57d4a..e13cdc933ca6 100644
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
2.40.1

