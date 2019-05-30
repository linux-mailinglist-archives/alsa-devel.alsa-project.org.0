Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FD3003A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 18:35:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F831681;
	Thu, 30 May 2019 18:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F831681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559234140;
	bh=YFZAc64+QuDpug1adxTP1xYHu1Ep9zjueCaC3xlGQHA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LwRxW8O6vmTw9aTTWeEiSRjRwHQtwOY3ExFDSQ+cb1SfFPfUBtvW4B628zEBmz/oO
	 cNHQjmuyl1E/KpG6TIsqQO+xMNGWxBKnyHURv7WhCEgraL9U0v+T1CYI5+ZcGLL9eq
	 6hsTY3Eg7QYCdlwAYqGhqCi8hsGZeLRN8FiZuHfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61280F89719;
	Thu, 30 May 2019 18:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB2EF8972D; Thu, 30 May 2019 18:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 750BEF89708
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 18:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 750BEF89708
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qg6NxGB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Rqk/AOxriOrZGNtmnQ/EIz+oIW/ctgxIfmHAL5fJiqM=; b=qg6NxGB7hHzw
 wSOdXSVCw/+BGWGpTWAXSXSxNQfjWVmZ39rgzKLvaN0sQSjkjN2/dDHFb6mnDmbTuR7YV5T6Objbe
 Xjnca6UD4DfpBzFbBcg9bIfbNdEW8NgUxbm1T3PrsAVXrz/D43P+zoHuC3QpiVPcbotmaFfX5wRfI
 ujOZk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hWNzL-0007GF-0V; Thu, 30 May 2019 16:33:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 63792440049; Thu, 30 May 2019 17:33:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190530115015.5677-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190530163310.63792440049@finisterre.sirena.org.uk>
Date: Thu, 30 May 2019 17:33:10 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: add COMPILE_TEST for PCI options"
	to the asoc tree
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

   ASoC: SOF: add COMPILE_TEST for PCI options

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e13ef82a9ab83dd21d8dd43ef9f5e8bf5b101106 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 30 May 2019 06:50:15 -0500
Subject: [PATCH] ASoC: SOF: add COMPILE_TEST for PCI options

Add COMPILE_TEST and use IS_ENABLED(CONFIG_PCI) to sort out
cross-compilation issues.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig       |  2 +-
 sound/soc/sof/intel/hda.c   | 13 +++++++++++--
 sound/soc/sof/sof-pci-dev.c |  4 ++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index a9a1d502daae..ca3ad3362478 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -10,7 +10,7 @@ if SND_SOC_SOF_TOPLEVEL
 
 config SND_SOC_SOF_PCI
 	tristate "SOF PCI enumeration support"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_SOF_OPTIONS
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7e3980a2f7ba..5378d47a55fd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -506,7 +506,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	 * TODO: support interrupt mode selection with kernel parameter
 	 *       support msi multiple vectors
 	 */
+#if IS_ENABLED(CONFIG_PCI)
 	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI);
+#endif
 	if (ret < 0) {
 		dev_info(sdev->dev, "use legacy interrupt mode\n");
 		/*
@@ -518,7 +520,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		sdev->msi_enabled = 0;
 	} else {
 		dev_info(sdev->dev, "use msi interrupt mode\n");
+#if IS_ENABLED(CONFIG_PCI)
 		hdev->irq = pci_irq_vector(pci, 0);
+#endif
 		/* ipc irq number is the same of hda irq */
 		sdev->ipc_irq = hdev->irq;
 		sdev->msi_enabled = 1;
@@ -622,8 +626,10 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 free_hda_irq:
 	free_irq(hdev->irq, bus);
 free_irq_vector:
+#if IS_ENABLED(CONFIG_PCI)
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
+#endif
 free_streams:
 	hda_dsp_stream_free(sdev);
 /* dsp_unmap: not currently used */
@@ -638,7 +644,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
@@ -667,8 +672,12 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	free_irq(sdev->ipc_irq, sdev);
 	free_irq(hda->irq, bus);
-	if (sdev->msi_enabled)
+#if IS_ENABLED(CONFIG_PCI)
+	if (sdev->msi_enabled) {
+		struct pci_dev *pci = to_pci_dev(sdev->dev);
 		pci_free_irq_vectors(pci);
+	}
+#endif
 
 	hda_dsp_stream_free(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index e2b19782f01a..ab58d4f9119f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -251,9 +251,11 @@ static int sof_pci_probe(struct pci_dev *pci,
 	if (!sof_pdata)
 		return -ENOMEM;
 
+#if IS_ENABLED(CONFIG_PCI)
 	ret = pcim_enable_device(pci);
 	if (ret < 0)
 		return ret;
+#endif
 
 	ret = pci_request_regions(pci, "Audio DSP");
 	if (ret < 0)
@@ -386,6 +388,7 @@ static const struct pci_device_id sof_pci_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 
+#if IS_ENABLED(CONFIG_PCI)
 /* pci_driver definition */
 static struct pci_driver snd_sof_pci_driver = {
 	.name = "sof-audio-pci",
@@ -397,5 +400,6 @@ static struct pci_driver snd_sof_pci_driver = {
 	},
 };
 module_pci_driver(snd_sof_pci_driver);
+#endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
