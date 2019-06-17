Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4C482ED
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 14:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F39401719;
	Mon, 17 Jun 2019 14:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F39401719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560775709;
	bh=dhJjIJIuYV0UW8idGA8n44z8ETb3DFCMhbJbSmWlR0U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C2Ze8HeHPzPcQlBlkig1mviblihTBJfQa6oBDlrr7eAMkMolNcURSWS2re9WIU4Ky
	 uNxLFa5U9UJ/WVzyTlwP/aMVgJzb5vxERU3K0Bh1VhmiNJpnnWyAkuuT/0UFbvUJm8
	 DYGKNoALsWfzwAQGTV2MgXMzIQRboHTedzUub5jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42168F896C7;
	Mon, 17 Jun 2019 14:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3913F896C7; Mon, 17 Jun 2019 14:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4742EF8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 14:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4742EF8075C
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M3UlW-1hcInY2a26-000Zk4; Mon, 17 Jun 2019 14:46:34 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jun 2019 14:45:49 +0200
Message-Id: <20190617124632.1176809-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zjguk+EiCZ7J5N0uQo6ZqiNPElZuXOt1JmScjIIsUYFVLDr+9l2
 6jPbjPtFVh6fk1dmrRxqCABnkWPFFhuQ8rA5k5vWSGtFnJKwFyoqugs3mAoILldbdPzmIQI
 2elb639HYkY17SSSWlhxO4nf0Gg3tIwacC5rA0wdaFZ+GU1KoayiiCEMBKQGxKaBp/sslc4
 I7i8qEKMpLpEbZ54YqZAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xi+POJeJJtM=:przZadmzFqStofKh6Jr1O9
 G6BVw6EN74EjTxnSCeQs+Vg4hgtLd+PBD6nlpNahr+kKDrWfM5ztjGOIN9GO93RXRFQLdtLi2
 HWvB0mM0H75OcQFRO2cGskKzb6xKfKVPv6rZvN8p5tWCKDRR0OWK5iNJh5ygqjW4AwMif5zgP
 K7ioiNYbMWFm4gfMfdhdAh7X0o1cqti8MY3eGvo1JwovwniXaCVmUa+2EAfyBLe2tDyn5JMvU
 +A3nQoBvz9BP+9uQSS/cUrFeXF+93V8LXkpvlQsC5Yrqssmd/3zGEm0sH2f/jmiaDJZqaTpvq
 urTNlxOM/oT9xgBEMmgmh/wLd9xBA8C9pZy4762x5UQTrqGITnb2eoWu8Nn4NF4rMahEMHQ2k
 ktugDiYH2d3nRjI64eYy8ILRyEx4ivYX7BvSqx3C7M9NiVX1xPxnKyty547SGeq9yfbDlJKuC
 OFqTdhgwX6FJupH8hzrfcg7kx1MoOFdepA17h3rwZ9+wZ+KH2vyc13QFyAHYe2458ApZ+qukS
 cw6KsJUgICP5fVJEbfqyMjgI+WB4WsEyONSuK62cnmEDXKREQI2xyJW4nFuAaFTNF1Km1JnkY
 +0PZrLxCm8zQIQ4OmoTa38IyLx3JmQz6JSj9nrT0d4C81kx9IANAnvidfSeUIXbrox/UStLVw
 SIBRJnaH817Fs/OWZrQYQ4RIobSblZ6ZW/0kFXdr0P4IO3b9xWpNOpbEESg7eTd13A9ogdZZW
 Q93FKw6TKgfIT38unKPp6NTu2SRZlm/UePOc6A==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: disallow building without
	CONFIG_PCI again
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

Compile-testing without PCI just causes warnings:

sound/soc/sof/sof-pci-dev.c:330:13: error: 'sof_pci_remove' defined but not used [-Werror=unused-function]
 static void sof_pci_remove(struct pci_dev *pci)
             ^~~~~~~~~~~~~~
sound/soc/sof/sof-pci-dev.c:230:12: error: 'sof_pci_probe' defined but not used [-Werror=unused-function]
 static int sof_pci_probe(struct pci_dev *pci,
            ^~~~~~~~~~~~~

I tried to fix this in a way that would still allow compile
tests, but it got too ugly, so this just reverts the patch
that allowed it in the first place.

Most architectures do allow enabling PCI, so the value of the
COMPILE_TEST alternative was not very high to start with.

Fixes: e13ef82a9ab8 ("ASoC: SOF: add COMPILE_TEST for PCI options")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/Kconfig       |  2 +-
 sound/soc/sof/intel/hda.c   | 13 ++-----------
 sound/soc/sof/sof-pci-dev.c |  4 ----
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 41f79cdcbf47..fb01f0ca6027 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -11,7 +11,7 @@ if SND_SOC_SOF_TOPLEVEL
 
 config SND_SOC_SOF_PCI
 	tristate "SOF PCI enumeration support"
-	depends on PCI || COMPILE_TEST
+	depends on PCI
 	select SND_SOC_SOF
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_SOF_OPTIONS
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 140b1424f291..51c1c1787de7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -533,9 +533,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	 * TODO: support interrupt mode selection with kernel parameter
 	 *       support msi multiple vectors
 	 */
-#if IS_ENABLED(CONFIG_PCI)
 	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI);
-#endif
 	if (ret < 0) {
 		dev_info(sdev->dev, "use legacy interrupt mode\n");
 		/*
@@ -547,9 +545,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		sdev->msi_enabled = 0;
 	} else {
 		dev_info(sdev->dev, "use msi interrupt mode\n");
-#if IS_ENABLED(CONFIG_PCI)
 		hdev->irq = pci_irq_vector(pci, 0);
-#endif
 		/* ipc irq number is the same of hda irq */
 		sdev->ipc_irq = hdev->irq;
 		sdev->msi_enabled = 1;
@@ -606,10 +602,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 free_hda_irq:
 	free_irq(hdev->irq, bus);
 free_irq_vector:
-#if IS_ENABLED(CONFIG_PCI)
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
-#endif
 free_streams:
 	hda_dsp_stream_free(sdev);
 /* dsp_unmap: not currently used */
@@ -624,6 +618,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
@@ -652,12 +647,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	free_irq(sdev->ipc_irq, sdev);
 	free_irq(hda->irq, bus);
-#if IS_ENABLED(CONFIG_PCI)
-	if (sdev->msi_enabled) {
-		struct pci_dev *pci = to_pci_dev(sdev->dev);
+	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
-	}
-#endif
 
 	hda_dsp_stream_free(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index ab58d4f9119f..e2b19782f01a 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -251,11 +251,9 @@ static int sof_pci_probe(struct pci_dev *pci,
 	if (!sof_pdata)
 		return -ENOMEM;
 
-#if IS_ENABLED(CONFIG_PCI)
 	ret = pcim_enable_device(pci);
 	if (ret < 0)
 		return ret;
-#endif
 
 	ret = pci_request_regions(pci, "Audio DSP");
 	if (ret < 0)
@@ -388,7 +386,6 @@ static const struct pci_device_id sof_pci_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 
-#if IS_ENABLED(CONFIG_PCI)
 /* pci_driver definition */
 static struct pci_driver snd_sof_pci_driver = {
 	.name = "sof-audio-pci",
@@ -400,6 +397,5 @@ static struct pci_driver snd_sof_pci_driver = {
 	},
 };
 module_pci_driver(snd_sof_pci_driver);
-#endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
