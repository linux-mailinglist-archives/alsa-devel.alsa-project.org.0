Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182796101D3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2932DCF;
	Thu, 27 Oct 2022 21:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2932DCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899550;
	bh=sYvcV1khHcITo/9K0EY8Xw1RoeJgNDLyLG6jpZTdpQI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CLlzquS77soHNAUcQVQIdRQ8U3qLldGHAXtmp/+V8AwvmPM9c7Yz41tjV3kPqfnco
	 EqWX9EKctTsT3nx6LvwJzk/crddZ+pNJ9Xcu8Ft/2bcgge/351cVEumIJlE/PhRU3y
	 4P1RlHHC94Lq3lhCFwhrpxSg6px33kcu5YxT72dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4496FF805A0;
	Thu, 27 Oct 2022 21:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F6EF8057C; Thu, 27 Oct 2022 21:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1680F80551
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1680F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CqZH2lKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899371; x=1698435371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sYvcV1khHcITo/9K0EY8Xw1RoeJgNDLyLG6jpZTdpQI=;
 b=CqZH2lKknJjY5xUvblPVZhD7ScLvUv1feW288o8VFCpuAUPh4/gIlms/
 vL86HYZg8ANKn+IfWt/jRblg9qnNrQdk/fb3DG+UvkCmaKIRTcd9Kmopd
 oJF0OcA1mULA48v8qSJ8dROzsdarpnFYfKROk/Sg7DwpydliGudi9Wfxy
 YHNTkQqWftBiK7/VP2CP5BGPehf207QPNdDeoYDAYyWVQX+g23p9R9Wlt
 ppE0gB0+qUbRInRUrFljQ7cGLyGRvyzp+z0POPZRHlfFB2aJo4fpAwN8P
 F3mesYE/aQJnDAjq4iJmQMmQP/HKuhbmxQnIoiIff2tdMExyRUk1SasQE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957820"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957820"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526986"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526986"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/21] ASoC: SOF: Intel: hda: add multi-link helper for LOSVID
Date: Thu, 27 Oct 2022 15:35:25 -0400
Message-Id: <20221027193540.259520-7-pierre-louis.bossart@linux.intel.com>
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

Add new helper to deal with LOSVID.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c  | 9 +--------
 sound/soc/sof/intel/hda-mlink.c | 9 +++++++++
 sound/soc/sof/intel/hda.h       | 2 ++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 12900965ca5f..449e1e93505e 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -185,9 +185,6 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_ext_link *hlink;
-#endif
 	struct hdac_stream *stream;
 	int sd_offset, ret = 0;
 
@@ -269,11 +266,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 				  upper_32_bits(bus->posbuf.addr));
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* Reset stream-to-link mapping */
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
-#endif
+	hda_bus_ml_reset_losidv(bus);
 
 	bus->chip_init = true;
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 228ec35017ec..b5f922603187 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -42,4 +42,13 @@ void hda_bus_ml_put_all(struct hdac_bus *bus)
 		snd_hdac_ext_bus_link_put(bus, hlink);
 }
 
+void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
+{
+	struct hdac_ext_link *hlink;
+
+	/* Reset stream-to-link mapping */
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+}
+
 #endif
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c40364a9a761..a82b17596a27 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -746,11 +746,13 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
 void hda_bus_ml_get_capabilities(struct hdac_bus *bus);
 void hda_bus_ml_put_all(struct hdac_bus *bus);
+void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 
 #else
 
 static inline void hda_bus_ml_get_capabilities(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
+static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-- 
2.34.1

