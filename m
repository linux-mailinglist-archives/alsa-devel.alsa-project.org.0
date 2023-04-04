Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ECD6D5DDC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:46:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843EA83A;
	Tue,  4 Apr 2023 12:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843EA83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605206;
	bh=pAoDRl2aRlPCAbXaObE5kJ2R7E2hqJwi5KIdjKawv/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgMz0w7vlNaJEJq9aKYCHeTQlPDn3ZDRWSlDlIDTzzZczKbjpX5kIDR+mVq8Z3k3u
	 QjDAcoShDb/XZuGYPsdUYLZnqCqfYu/VLyiwUY9pNDFmGFt94ajsBu+OrmpDucXpod
	 Oo8k/uYl+uOEhlF7RCiHy9PXrmh5PKK5FP2LDWnA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF45F805D4;
	Tue,  4 Apr 2023 12:41:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A72DDF805BF; Tue,  4 Apr 2023 12:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07DB4F805B6
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DB4F805B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TSD9aFeP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604905; x=1712140905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pAoDRl2aRlPCAbXaObE5kJ2R7E2hqJwi5KIdjKawv/Q=;
  b=TSD9aFePYmk3vdm/kPbUp5cEqibNmcM745k1NJ15UXq3d1TtuT8N7qqp
   Bk/e8s91Ha0VdfeZQYYQbufoxdCF6KAORFuyohdfcRFCfGxsgEEd/n/Js
   pbh3lG/vTr6PqoDmd9G1WsDROlvRXP0ykdJjbq92n2vRxR+y8wI61hafq
   zME8zHnZNtG62/UCp3moxzpcVjL2c52caKIvby3EeFnJzePOsNHahAmO/
   DNnKOA7GWbAhxtu6TdBTPE1i1hkPL1DzBhKkh4pXp5+QAzA0tlx/BQI4d
   M7H5Cg729OtaIaeIo7vqLoIflzB84LGZ7ogMTJxIHgQqEbVjZi7CFhlbR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878119"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878119"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930237"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930237"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 16/18] ASoC: SOF: Intel: hda-mlink: add helpers to retrieve
 DMIC/SSP hlink
Date: Tue,  4 Apr 2023 13:41:25 +0300
Message-Id: <20230404104127.5629-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BG4TJY62A3YFP5CSNDJVQZ4PGGTTZOJV
X-Message-ID-Hash: BG4TJY62A3YFP5CSNDJVQZ4PGGTTZOJV
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BG4TJY62A3YFP5CSNDJVQZ4PGGTTZOJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Small helpers to make DAI ops simpler.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       | 10 ++++++++++
 sound/soc/sof/intel/hda-mlink.c | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index d626ef964ea7..bfd2c77c184d 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -7,6 +7,7 @@
  */
 
 struct hdac_bus;
+struct hdac_ext_link;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
@@ -48,6 +49,9 @@ void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
 int hda_bus_ml_suspend(struct hdac_bus *bus);
 
+struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus);
+struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus);
+
 #else
 
 static inline int
@@ -141,4 +145,10 @@ static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
 static inline int hda_bus_ml_suspend(struct hdac_bus *bus) { return 0; }
 
+static inline struct hdac_ext_link *
+hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus) { return NULL; }
+
+static inline struct hdac_ext_link *
+hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus) { return NULL; }
+
 #endif /* CONFIG_SND_SOC_SOF_HDA */
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 5810d6f8719c..06613c081410 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -788,6 +788,30 @@ int hda_bus_ml_suspend(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
+struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_SSP);
+	if (!h2link)
+		return NULL;
+
+	return &h2link->hext_link;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_ssp_get_hlink, SND_SOC_SOF_HDA_MLINK);
+
+struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_DMIC);
+	if (!h2link)
+		return NULL;
+
+	return &h2link->hext_link;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_dmic_get_hlink, SND_SOC_SOF_HDA_MLINK);
+
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.40.0

