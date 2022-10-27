Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B896101E5
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68AC2DEB;
	Thu, 27 Oct 2022 21:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68AC2DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899704;
	bh=4O0OGnzo81lXS7ivbiKF0RLSA8nl4dwOAphMuq6u228=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fje4kET9mT1UUPBNn/BQRBbkL+3+tzBpz+3Ne5L4WjjISFplzzH/wDpiGigpb9xw5
	 uayqjE+f+t3K0HU1hbpmdwVkrNySNbHeZ6h7s4tMgHvs41UY9yBr1s8TBCK6b7jneb
	 8iyc3OoQ4SDe6d/GnoRK1HE583CwpUd2ZLm4Y0pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF040F805CB;
	Thu, 27 Oct 2022 21:36:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01019F805C4; Thu, 27 Oct 2022 21:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE, 
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE85F80580
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE85F80580
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j/l3b3hO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899385; x=1698435385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4O0OGnzo81lXS7ivbiKF0RLSA8nl4dwOAphMuq6u228=;
 b=j/l3b3hORCa1C7H1UJjhZSoJWXuFrm+nS0pmH3OPgGNhi9zswYd3tC3L
 pbrCYlxorTkpbRcVid0KKV3UhCrlOWltcUoONdrRJPR5gsWSojvj/yovU
 DUK9IRdbRpn716rFZFaW9mIu8mKbZgYpDn3MsC1kRD+O6RznuB7pOlIyv
 pM+Wl2d589NLzC2sPhe6hIvoYKwYx554lylleCq0msQB1hLtAnSQApuko
 3cBJXSZC8/BYS7CI8sMmKMBx6zcEFa7WbYiMl5bTlFUD1a7nUJlUKFyqb
 7fqikHyJbroGU5pDYATXbKKHZuG8xTFp3G04xGy1Ew/JFJIyXVPLGVbqX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957868"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527066"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527066"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/21] ASoC: SOF: Intel: hda-mlink: add helpers to
 suspend/resume links
Date: Thu, 27 Oct 2022 15:35:36 -0400
Message-Id: <20221027193540.259520-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

No functionality change, just move the code in hda-mlink.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c   | 36 +++++++++------------------------
 sound/soc/sof/intel/hda-mlink.c | 21 +++++++++++++++++++
 sound/soc/sof/intel/hda.h       |  4 ++++
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2596de5e24d6..c61bab1a5719 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -614,9 +614,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_bus *bus = sof_to_bus(sdev);
-#endif
 	int ret, j;
 
 	/*
@@ -637,10 +635,8 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 
 	hda_codec_jack_wake_enable(sdev, runtime_suspend);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* power down all hda link */
-	snd_hdac_ext_bus_link_power_down_all(bus);
-#endif
+	/* power down all hda links */
+	hda_bus_ml_suspend(bus);
 
 	ret = chip->power_down_dsp(sdev);
 	if (ret < 0) {
@@ -719,33 +715,23 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	const struct sof_dsp_power_state target_state = {
 		.state = SOF_DSP_PM_D0,
 		.substate = SOF_HDA_DSP_PM_D0I0,
 	};
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_ext_link *hlink = NULL;
-#endif
 	int ret;
 
 	/* resume from D0I3 */
 	if (sdev->dsp_power_state.state == SOF_DSP_PM_D0) {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-		/* power up links that were active before suspend */
-		list_for_each_entry(hlink, &bus->hlink_list, list) {
-			if (hlink->ref_count) {
-				ret = snd_hdac_ext_bus_link_power_up(hlink);
-				if (ret < 0) {
-					dev_err(sdev->dev,
-						"error %d in %s: failed to power up links",
-						ret, __func__);
-					return ret;
-				}
-			}
+		ret = hda_bus_ml_resume(bus);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error %d in %s: failed to power up links",
+				ret, __func__);
+			return ret;
 		}
-#endif
 
 		/* set up CORB/RIRB buffers if was on before suspend */
 		hda_codec_resume_cmd_io(sdev);
@@ -860,16 +846,14 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 		/* stop the CORB/RIRB DMA if it is On */
 		hda_codec_suspend_cmd_io(sdev);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 		/* no link can be powered in s0ix state */
-		ret = snd_hdac_ext_bus_link_power_down_all(bus);
+		ret = hda_bus_ml_suspend(bus);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error %d in %s: failed to power down links",
 				ret, __func__);
 			return ret;
 		}
-#endif
 
 		/* enable the system waking up via IPC IRQ */
 		enable_irq_wake(pci->irq);
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index b5f922603187..2cdee03e4a47 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -51,4 +51,25 @@ void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 }
 
+int hda_bus_ml_resume(struct hdac_bus *bus)
+{
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	/* power up links that were active before suspend */
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		if (hlink->ref_count) {
+			ret = snd_hdac_ext_bus_link_power_up(hlink);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return 0;
+}
+
+int hda_bus_ml_suspend(struct hdac_bus *bus)
+{
+	return snd_hdac_ext_bus_link_power_down_all(bus);
+}
+
 #endif
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0214097389d3..f0c9bb6d567d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -766,12 +766,16 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 void hda_bus_ml_get_capabilities(struct hdac_bus *bus);
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
+int hda_bus_ml_resume(struct hdac_bus *bus);
+int hda_bus_ml_suspend(struct hdac_bus *bus);
 
 #else
 
 static inline void hda_bus_ml_get_capabilities(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
+static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
+static inline int hda_bus_ml_suspend(struct hdac_bus *bus) { return 0; }
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-- 
2.34.1

