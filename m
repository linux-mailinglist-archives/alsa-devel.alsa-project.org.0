Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582C70249
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15B186F;
	Mon, 22 Jul 2019 16:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15B186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805606;
	bh=IyeAfTOsbBpJL8jKkRqCQ3nIwRABu5ser1i1P6/2LUs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W16xdx516vWCiPUt8k7yfhIjraEs0SMXXCWPnYCUtqSguXG2Gj9F11mRMeXUjRyHb
	 IKfla6GbE+//uYBiqesbg3+GY8XDFJF3MMgutHZxckDZzPFIqml2aQ1wzxIQx5wfjP
	 qVy7afCLEvXSS07444K5ky3e9+akKlG1z6NONeNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 608F7F80675;
	Mon, 22 Jul 2019 16:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 700E6F8048E; Mon, 22 Jul 2019 16:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E69AF8049A
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E69AF8049A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733300"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:57 -0500
Message-Id: <20190722141402.7194-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 16/21] ASoC: SOF: Intel: hda: add a parameter
	to disable MSI
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Enabling MSI on HDA can fail, in which case the legacy PCI IRQ mode
will be used. To make testing this mode easier add an "enable_msi"
module parameter, which is only enabled if debugging is enabled too.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 28 +++++++++++++++++-----------
 sound/soc/sof/sof-priv.h  |  2 +-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7f665392618f..79cce20666b6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -46,6 +46,12 @@ struct hda_dsp_msg_code {
 	const char *msg;
 };
 
+static bool hda_use_msi = IS_ENABLED(CONFIG_PCI);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG)
+module_param_named(use_msi, hda_use_msi, bool, 0444);
+MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
+#endif
+
 static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 	{HDA_DSP_ROM_FW_MANIFEST_LOADED, "status: manifest loaded"},
 	{HDA_DSP_ROM_FW_FW_LOADED, "status: fw loaded"},
@@ -529,11 +535,18 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	 * register our IRQ
 	 * let's try to enable msi firstly
 	 * if it fails, use legacy interrupt mode
-	 * TODO: support interrupt mode selection with kernel parameter
-	 *       support msi multiple vectors
+	 * TODO: support msi multiple vectors
 	 */
-	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI);
-	if (ret < 0) {
+	if (hda_use_msi && !pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI)) {
+		dev_info(sdev->dev, "use msi interrupt mode\n");
+		hdev->irq = pci_irq_vector(pci, 0);
+		/* ipc irq number is the same of hda irq */
+		sdev->ipc_irq = hdev->irq;
+		/* initialised to "false" by kzalloc() */
+		sdev->msi_enabled = true;
+	}
+
+	if (!sdev->msi_enabled) {
 		dev_info(sdev->dev, "use legacy interrupt mode\n");
 		/*
 		 * in IO-APIC mode, hda->irq and ipc_irq are using the same
@@ -541,13 +554,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		 */
 		hdev->irq = pci->irq;
 		sdev->ipc_irq = pci->irq;
-		sdev->msi_enabled = 0;
-	} else {
-		dev_info(sdev->dev, "use msi interrupt mode\n");
-		hdev->irq = pci_irq_vector(pci, 0);
-		/* ipc irq number is the same of hda irq */
-		sdev->ipc_irq = hdev->irq;
-		sdev->msi_enabled = 1;
 	}
 
 	dev_dbg(sdev->dev, "using HDA IRQ %d\n", hdev->irq);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index b8c9274ccf42..983eadef4b30 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -435,7 +435,7 @@ struct snd_sof_dev {
 	u32 dtrace_error;
 	u32 dtrace_draining;
 
-	u32 msi_enabled;
+	bool msi_enabled;
 
 	void *private;			/* core does not touch this */
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
