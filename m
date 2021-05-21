Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9138C33B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 11:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A657516A1;
	Fri, 21 May 2021 11:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A657516A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621589693;
	bh=T4ixMz6D+t/C0mQAmY/Ugam3j95AyffPbMW/RszBLz4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zdz1iSidmborFW+qMdLfdLOS6KAmNMm/kS0ZmmNHJ0FhsZ/9ElDk873XjLFmA4tjs
	 MJQMxvsQqFXqXBgcHjTM+Ozpp0KLZuzZoaVmqb/BpCI5eq1nrRNW8DGuk+mFhJLl5C
	 +olYPkMT9+yTULcFgi7VWC1usR5nXgqYhzQL+3bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7357AF801DB;
	Fri, 21 May 2021 11:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0058DF80246; Fri, 21 May 2021 11:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB8FAF801DB
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB8FAF801DB
IronPort-SDR: jkQ7V46V2xaqvvowmgzhyrsGzz7B5cDBzOSOBB9cGO/220X/du4yRiJXuhOK6khgHxe8QaeYmh
 wnsGbqhJsc3g==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="262664180"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262664180"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 02:33:13 -0700
IronPort-SDR: rtsxcAx9KAeTarC82bXzV+hmYMbMBzj85H+a8VEl7sCAQ2MBaulMhyXKZAiEHXajaF8pVMjZIR
 dDYqkSBgPtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475640851"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 02:33:11 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/7] ASoC: SOF: Check desc->ops directly in acpi/pci/of probe
 functions
Date: Fri, 21 May 2021 12:27:58 +0300
Message-Id: <20210521092804.3721324-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
References: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Rander Wang <rander.wang@intel.com>, daniel.baluta@nxp.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

We can check for the desc->ops directly in the probe functions, the ops
is not used directly in the functions.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 5 +----
 sound/soc/sof/sof-of-dev.c   | 5 +----
 sound/soc/sof/sof-pci-dev.c  | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 7fbf09f9f17e..74982c04497b 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -60,7 +60,6 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 {
 	struct device *dev = &pdev->dev;
 	struct snd_sof_pdata *sof_pdata;
-	const struct snd_sof_dsp_ops *ops;
 
 	dev_dbg(dev, "ACPI DSP detected");
 
@@ -68,9 +67,7 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 	if (!sof_pdata)
 		return -ENOMEM;
 
-	/* get ops for platform */
-	ops = desc->ops;
-	if (!ops) {
+	if (!desc->ops) {
 		dev_err(dev, "error: no matching ACPI descriptor ops\n");
 		return -ENODEV;
 	}
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index c9c70645b377..d1a21edfa05d 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -70,7 +70,6 @@ static int sof_of_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct sof_dev_desc *desc;
 	struct snd_sof_pdata *sof_pdata;
-	const struct snd_sof_dsp_ops *ops;
 
 	dev_info(&pdev->dev, "DT DSP detected");
 
@@ -82,9 +81,7 @@ static int sof_of_probe(struct platform_device *pdev)
 	if (!desc)
 		return -ENODEV;
 
-	/* get ops for platform */
-	ops = desc->ops;
-	if (!ops) {
+	if (!desc->ops) {
 		dev_err(dev, "error: no matching DT descriptor ops\n");
 		return -ENODEV;
 	}
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 3489dc1b48f6..a1db973d5673 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -116,14 +116,11 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	const struct sof_dev_desc *desc =
 		(const struct sof_dev_desc *)pci_id->driver_data;
 	struct snd_sof_pdata *sof_pdata;
-	const struct snd_sof_dsp_ops *ops;
 	int ret;
 
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
-	/* get ops for platform */
-	ops = desc->ops;
-	if (!ops) {
+	if (!desc->ops) {
 		dev_err(dev, "error: no matching PCI descriptor ops\n");
 		return -ENODEV;
 	}
-- 
2.31.0

