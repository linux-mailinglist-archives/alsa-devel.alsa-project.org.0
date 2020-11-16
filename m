Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BC2B44D4
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EEB1764;
	Mon, 16 Nov 2020 14:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EEB1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605533836;
	bh=H+2k5A04XfzLDBdEpEFpbx0sB0+qy5N8+aFpDNG8E0s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GX4/ektADpr/PgsG1wC07NSPxYic4iZGGa16nqOM1wXJD9QxYZD5lUWs8+TEAlBXn
	 OTqEFgr8vM8fh68y/CuraC4nud1ta7Di6PwPEq/XtQO+bDUDFyJSaVFoRfSxjbK0qX
	 EHNZhcokFXa/eG5E1lDWseJEamg8utkLxqr5v4Ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C049AF804D2;
	Mon, 16 Nov 2020 14:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F57F80168; Mon, 16 Nov 2020 14:34:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E26F8016D
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E26F8016D
IronPort-SDR: TXIqNlRGw8m8K9ePtjlTYaiYqu/+6mqFiS731WoSAZ+W8czFB+oy9VIfwiCQVR3mZY7kjYkwXO
 R1kI+GpMtDiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158520552"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="158520552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:33:55 -0800
IronPort-SDR: knOrbOVQtEpvDjjcplSZakPbdI23rHCL3wnUBJud4bpaCUmGUGHWMrsFyuX6+YLS3COm7ro55X
 /m7t5OwwWVbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="475525047"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 05:33:53 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: Intel: catpt: Streamline power routines across LPT
 and WPT
Date: Mon, 16 Nov 2020 14:33:31 +0100
Message-Id: <20201116133332.8530-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116133332.8530-1-cezary.rojewski@intel.com>
References: <20201116133332.8530-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, broonie@kernel.org
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

There is no need for separate power on/off routines for LPT and WPT as
as the protocol is shared for both platforms. Make WPT routines generic
and reuse them in LPT case too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   |  6 ++++--
 sound/soc/intel/catpt/device.c | 18 +++++++++---------
 sound/soc/intel/catpt/dsp.c    | 10 +++++-----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 88dc3fb6306f..693dc4a4b621 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -80,6 +80,8 @@ struct catpt_spec {
 	u32 host_ssp_offset[CATPT_SSP_COUNT];
 	u32 dram_mask;
 	u32 iram_mask;
+	u32 d3srampgd_bit;
+	u32 d3pgd_bit;
 	void (*pll_shutdown)(struct catpt_dev *cdev, bool enable);
 	int (*power_up)(struct catpt_dev *cdev);
 	int (*power_down)(struct catpt_dev *cdev);
@@ -128,8 +130,8 @@ void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
 void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
 int lpt_dsp_power_up(struct catpt_dev *cdev);
 int lpt_dsp_power_down(struct catpt_dev *cdev);
-int wpt_dsp_power_up(struct catpt_dev *cdev);
-int wpt_dsp_power_down(struct catpt_dev *cdev);
+int catpt_dsp_power_up(struct catpt_dev *cdev);
+int catpt_dsp_power_down(struct catpt_dev *cdev);
 int catpt_dsp_stall(struct catpt_dev *cdev, bool stall);
 void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *sram,
 			      unsigned long mask);
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index a70179959795..b1d380868d8c 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -69,7 +69,7 @@ static int __maybe_unused catpt_suspend(struct device *dev)
 	dma_release_channel(chan);
 	if (ret)
 		return ret;
-	return cdev->spec->power_down(cdev);
+	return catpt_dsp_power_down(cdev);
 }
 
 static int __maybe_unused catpt_resume(struct device *dev)
@@ -77,7 +77,7 @@ static int __maybe_unused catpt_resume(struct device *dev)
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 	int ret, i;
 
-	ret = cdev->spec->power_up(cdev);
+	ret = catpt_dsp_power_up(cdev);
 	if (ret)
 		return ret;
 
@@ -162,7 +162,7 @@ static int catpt_probe_components(struct catpt_dev *cdev)
 {
 	int ret;
 
-	ret = cdev->spec->power_up(cdev);
+	ret = catpt_dsp_power_up(cdev);
 	if (ret)
 		return ret;
 
@@ -204,7 +204,7 @@ static int catpt_probe_components(struct catpt_dev *cdev)
 err_boot_fw:
 	catpt_dmac_remove(cdev);
 err_dmac_probe:
-	cdev->spec->power_down(cdev);
+	catpt_dsp_power_down(cdev);
 
 	return ret;
 }
@@ -293,7 +293,7 @@ static int catpt_acpi_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_component(cdev->dev);
 	catpt_dmac_remove(cdev);
-	cdev->spec->power_down(cdev);
+	catpt_dsp_power_down(cdev);
 
 	catpt_sram_free(&cdev->iram);
 	catpt_sram_free(&cdev->dram);
@@ -311,9 +311,9 @@ static struct catpt_spec lpt_desc = {
 	.host_ssp_offset = { 0x0E8000, 0x0E9000 },
 	.dram_mask = LPT_VDRTCTL0_DSRAMPGE_MASK,
 	.iram_mask = LPT_VDRTCTL0_ISRAMPGE_MASK,
+	.d3srampgd_bit = LPT_VDRTCTL0_D3SRAMPGD,
+	.d3pgd_bit = LPT_VDRTCTL0_D3PGD,
 	.pll_shutdown = lpt_dsp_pll_shutdown,
-	.power_up = lpt_dsp_power_up,
-	.power_down = lpt_dsp_power_down,
 };
 
 static struct catpt_spec wpt_desc = {
@@ -326,9 +326,9 @@ static struct catpt_spec wpt_desc = {
 	.host_ssp_offset = { 0x0FC000, 0x0FD000 },
 	.dram_mask = WPT_VDRTCTL0_DSRAMPGE_MASK,
 	.iram_mask = WPT_VDRTCTL0_ISRAMPGE_MASK,
+	.d3srampgd_bit = WPT_VDRTCTL0_D3SRAMPGD,
+	.d3pgd_bit = WPT_VDRTCTL0_D3PGD,
 	.pll_shutdown = wpt_dsp_pll_shutdown,
-	.power_up = wpt_dsp_power_up,
-	.power_down = wpt_dsp_power_down,
 };
 
 static const struct acpi_device_id catpt_ids[] = {
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 9e807b941732..dfa442a3c1f1 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -390,7 +390,7 @@ int lpt_dsp_power_up(struct catpt_dev *cdev)
 	return 0;
 }
 
-int wpt_dsp_power_down(struct catpt_dev *cdev)
+int catpt_dsp_power_down(struct catpt_dev *cdev)
 {
 	u32 mask, val;
 
@@ -420,8 +420,8 @@ int wpt_dsp_power_down(struct catpt_dev *cdev)
 			      cdev->spec->dram_mask);
 	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
 			      cdev->spec->iram_mask);
-	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
-	catpt_updatel_pci(cdev, VDRTCTL0, mask, WPT_VDRTCTL0_D3PGD);
+	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
+	catpt_updatel_pci(cdev, VDRTCTL0, mask, cdev->spec->d3pgd_bit);
 
 	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
 	/* give hw time to drop off */
@@ -435,7 +435,7 @@ int wpt_dsp_power_down(struct catpt_dev *cdev)
 	return 0;
 }
 
-int wpt_dsp_power_up(struct catpt_dev *cdev)
+int catpt_dsp_power_up(struct catpt_dev *cdev)
 {
 	u32 mask, val;
 
@@ -450,7 +450,7 @@ int wpt_dsp_power_up(struct catpt_dev *cdev)
 	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0);
 
 	/* SRAM power gating none */
-	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
+	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
 	catpt_updatel_pci(cdev, VDRTCTL0, mask, mask);
 	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
 	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask, 0);
-- 
2.17.1

