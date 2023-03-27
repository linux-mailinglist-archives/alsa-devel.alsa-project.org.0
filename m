Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF06CA27A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290B5825;
	Mon, 27 Mar 2023 13:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290B5825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916844;
	bh=dMU3CPbXh9iecocKD183y8TGpW8OaHs9YYkgLRReILs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eZmCIjJwtEJbH1k2tLs/PGOeZ9Z2KPV6NwFC3xr+Fa6gxk9ZCOG1oTujYIWkZk5Lj
	 lk3MfmIQr5wb6Usn1mQJH0Fmc6XLmxnBtBnervaojwhoMoGWSMNbaVS20YLLR7JeaM
	 E+hHFwyHrEokJZ5XlSMOBff26DrGoxkGGj3dfFcM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9B9F805B2;
	Mon, 27 Mar 2023 13:30:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB985F805AC; Mon, 27 Mar 2023 13:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BF51F8057E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF51F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LtRuJwHK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916590; x=1711452590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dMU3CPbXh9iecocKD183y8TGpW8OaHs9YYkgLRReILs=;
  b=LtRuJwHKkOjskZfTDBer+OVJX4BY5ExEADnQsnZ5gtfNpIDfHq8n0/CW
   vse2rHYaacEJWWjQUgWOUN8uH/rXR5CD7T7Sz9K6ip5UMarQgrcquEJjK
   S6bui7WhveO6bAwSN3wilusFnVcM378EWQ60ptccusRnBb/shFUcclyhY
   Nkv6B1XddaX3EK9pS6T4mJSagrQVDGzHJQWnSx9KYN5mfkgaLAkTrQIdo
   ljxgXRtGXELEf+/kJd8usTGsh8AEy/I6NmW/2LA106rEjyfAg06XUiFrV
   QcZabGqwLgE/bErzk/579GhfU/8KIy4dQ0cWsh/Udf+be4UKT08kacCDX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987066"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987066"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620558"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620558"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 16/18] ASoC: SOF: Intel: hda-mlink: add helpers to retrieve
 DMIC/SSP hlink
Date: Mon, 27 Mar 2023 14:29:29 +0300
Message-Id: <20230327112931.23411-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZQQOVBLPK3BBQ5CCPCIHHEPSSJBGMZL
X-Message-ID-Hash: CZQQOVBLPK3BBQ5CCPCIHHEPSSJBGMZL
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZQQOVBLPK3BBQ5CCPCIHHEPSSJBGMZL/>
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
index fc63aec97119..c3f31fa85104 100644
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
index 87e6c5f2f3ea..2e0ca6eb322d 100644
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

