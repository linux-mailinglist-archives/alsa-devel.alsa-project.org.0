Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8A50A9DE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806AE16E5;
	Thu, 21 Apr 2022 22:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806AE16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650572458;
	bh=3RzliklXPJ+rZylSPqHG0TEULQr4oS0TNHglXR461X8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mGcoAicr050/Bu+krLz2gGVNxcYccwuBeeWjhZ0gdZl22bLJgwXMKwURMKPHY0/1p
	 cfcrqcOJ+9n5TLQYot8plcE1yxiqPrughPph8kgI7cJle9yTalbd85hqVp5THox76D
	 rUEPQCLvhLmmMZwvf1mGcfltuujTD4MTscmW863s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0295CF8047D;
	Thu, 21 Apr 2022 22:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F226FF804C1; Thu, 21 Apr 2022 22:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D854AF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D854AF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OUkBX/Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650572400; x=1682108400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3RzliklXPJ+rZylSPqHG0TEULQr4oS0TNHglXR461X8=;
 b=OUkBX/QtzMdQeJ5WEp8VVMleQsPMDDqvCmka9oKOaHgnpYSKm8k1XeW5
 UfXm3ePHqti1bqeWebWBoKBQOghkBomrJlL7RHdV+racBqcfBKvbEhAkh
 J21LXk8ZJqv0xrK3Bd9/1CpUrIci05R98KEJAjAD2Zyl+q1miabhJazpK
 NYDpWKiS6sOmY3XSCPDhdL+mdRxwk9ibYXC7BLJUsNy7FX4ljxzf+GR19
 R/uKPQW61E0dy6CTHm8m7MGRvtqPquRzdbmBPL+invkHiViVqYHHt20dZ
 v35ONPdS+soaS4hwEvRgMPjh22Gd+nDp2EeFG0Rv1GMTHiIfO617fsEPV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="324919441"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="324919441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:19:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577447899"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:19:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: simplify NHLT handling
Date: Thu, 21 Apr 2022 15:19:46 -0500
Message-Id: <20220421201946.1547041-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

The existing code does an init/free for each piece of information
needed. We can instead initialize the NHLT table in the .probe() and
free it in the .remove() callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 17 +++++++++++------
 sound/soc/sof/intel/hda.h |  3 +++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d34cd4d341c5e..bc07df1fc39f0 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -599,14 +599,13 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 static int check_dmic_num(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct nhlt_acpi_table *nhlt;
 	int dmic_num = 0;
 
-	nhlt = intel_nhlt_init(sdev->dev);
-	if (nhlt) {
+	nhlt = hdev->nhlt;
+	if (nhlt)
 		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
-		intel_nhlt_free(nhlt);
-	}
 
 	/* allow for module parameter override */
 	if (dmic_num_override != -1) {
@@ -626,10 +625,11 @@ static int check_dmic_num(struct snd_sof_dev *sdev)
 
 static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct nhlt_acpi_table *nhlt;
 	int ssp_mask = 0;
 
-	nhlt = intel_nhlt_init(sdev->dev);
+	nhlt = hdev->nhlt;
 	if (!nhlt)
 		return ssp_mask;
 
@@ -638,7 +638,6 @@ static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
 		if (ssp_mask)
 			dev_info(sdev->dev, "NHLT_DEVICE_I2S detected, ssp_mask %#x\n", ssp_mask);
 	}
-	intel_nhlt_free(nhlt);
 
 	return ssp_mask;
 }
@@ -999,6 +998,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
 
+	hdev->nhlt = intel_nhlt_init(sdev->dev);
+
 	return 0;
 
 free_ipc_irq:
@@ -1024,6 +1025,10 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct nhlt_acpi_table *nhlt = hda->nhlt;
+
+	if (nhlt)
+		intel_nhlt_free(nhlt);
 
 	/* cancel any attempt for DSP D0I3 */
 	cancel_delayed_work_sync(&hda->d0i3_work);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 36445482a122f..7827ea4fdacb3 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -449,6 +449,9 @@ struct sof_intel_hda_dev {
 
 	/* FW clock config, 0:HPRO, 1:LPRO */
 	bool clk_config_lpro;
+
+	/* Intel NHLT information */
+	struct nhlt_acpi_table *nhlt;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
-- 
2.30.2

