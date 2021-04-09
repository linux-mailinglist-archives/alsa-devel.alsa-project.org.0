Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D512935A8A4
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:12:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6723A16A4;
	Sat, 10 Apr 2021 00:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6723A16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618006350;
	bh=TSZ9AKtt2rW5jR7NwTFwSkqK1woJZHmEMjIPZ2hrCDA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/bYd5vGdgC1ZDQHm89+0H6X7Z1Dwr1wT/7xTmIvl/pmHE7IlJvteYVCcm0JRvswx
	 f0IX6jqcC/03jJoyzD7nCykkTv4t9ZY+qiG10KrdQaNm4UaCmB8gvAt0A6qDMpszWg
	 Q0pDhQ72v1+lfjndna5c5qMGpBeqii5eHprl13NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B1E1F80431;
	Sat, 10 Apr 2021 00:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A07EBF8032C; Sat, 10 Apr 2021 00:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 483FFF80162
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 483FFF80162
IronPort-SDR: wAHGCxkO6wwxbhnWXivx+V8TXu7wYV+q/E8D78gSIbbL228+iN9yXBZiPz+ohKAUpJ3997r6y/
 KKOSu+F8WLhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214285714"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214285714"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:07 -0700
IronPort-SDR: R7LzTTs0LrwhL4gR1lpqLfsYIS8cnfhzQHEjtoAeo5MxFt1aino0+gwtovNFdRgi96tEOetwWQ
 9Y0+Wyf+kE8g==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599292833"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:07 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Simplify sof_probe_complete handling for
 acpi/pci/of
Date: Fri,  9 Apr 2021 15:09:59 -0700
Message-Id: <20210409220959.1543456-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
References: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Set the sof_data->sof_probe_complete callback unconditionally of
CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE.

The sof_probe_complete will be called when the sof_probe_continue()
function is successfully executed, called either directly from
snd_sof_device_probe() or from the scheduled work.

Since all error cases within the call chain of snd_sof_device_probe() have
error prints, there is no need to print again in the acpi/pci/of level.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 18 +++---------------
 sound/soc/sof/sof-of-dev.c   | 18 +++---------------
 sound/soc/sof/sof-pci-dev.c  | 20 ++++----------------
 3 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 1fec0420f662..7fbf09f9f17e 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -61,7 +61,6 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 	struct device *dev = &pdev->dev;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
-	int ret;
 
 	dev_dbg(dev, "ACPI DSP detected");
 
@@ -93,22 +92,11 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 		sof_pdata->tplg_filename_prefix =
 			sof_pdata->desc->default_tplg_path;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	/* set callback to enable runtime_pm */
+	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
-#endif
-	/* call sof helper for DSP hardware probe */
-	ret = snd_sof_device_probe(dev, sof_pdata);
-	if (ret) {
-		dev_err(dev, "error: failed to probe DSP hardware!\n");
-		return ret;
-	}
 
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	sof_acpi_probe_complete(dev);
-#endif
-
-	return ret;
+	/* call sof helper for DSP hardware probe */
+	return snd_sof_device_probe(dev, sof_pdata);
 }
 EXPORT_SYMBOL_NS(sof_acpi_probe, SND_SOC_SOF_ACPI_DEV);
 
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 85ff0db88eb7..c9c70645b377 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -71,7 +71,6 @@ static int sof_of_probe(struct platform_device *pdev)
 	const struct sof_dev_desc *desc;
 	struct snd_sof_pdata *sof_pdata;
 	const struct snd_sof_dsp_ops *ops;
-	int ret;
 
 	dev_info(&pdev->dev, "DT DSP detected");
 
@@ -98,22 +97,11 @@ static int sof_of_probe(struct platform_device *pdev)
 	sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
 	sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	/* set callback to enable runtime_pm */
+	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
-#endif
-	 /* call sof helper for DSP hardware probe */
-	ret = snd_sof_device_probe(dev, sof_pdata);
-	if (ret) {
-		dev_err(dev, "error: failed to probe DSP hardware\n");
-		return ret;
-	}
-
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	sof_of_probe_complete(dev);
-#endif
 
-	return ret;
+	/* call sof helper for DSP hardware probe */
+	return snd_sof_device_probe(dev, sof_pdata);
 }
 
 static int sof_of_remove(struct platform_device *pdev)
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b842a414e1df..3489dc1b48f6 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -184,25 +184,13 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (sof_override_tplg_name)
 		sof_pdata->tplg_filename = sof_override_tplg_name;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	/* set callback to enable runtime_pm */
+	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
-#endif
+
 	/* call sof helper for DSP hardware probe */
 	ret = snd_sof_device_probe(dev, sof_pdata);
-	if (ret) {
-		dev_err(dev, "error: failed to probe DSP hardware!\n");
-		goto release_regions;
-	}
-
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
-	sof_pci_probe_complete(dev);
-#endif
-
-	return ret;
-
-release_regions:
-	pci_release_regions(pci);
+	if (ret)
+		pci_release_regions(pci);
 
 	return ret;
 }
-- 
2.25.1

