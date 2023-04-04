Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D227B6D5DDE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7C4083D;
	Tue,  4 Apr 2023 12:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7C4083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605220;
	bh=TozA5iC1kcmbQ3gT0P+TTs0NpzBRuyChUkg7ctPdx2U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KuezpeGa+opR6ZjknElS+JZ70V3ZwoXIGsA1OG6QHdIuXgM7GKm9YUuVuh3rnoZC0
	 lRWlUuoI30gsiZ+siXQDoXloELxF1fJC1+Pgm6NN1REsiimduOoyJHYcK4pPmSN1FE
	 FlSggCiLlrIJSFjgGUaZOpqJo4wjNgVZkJKT7o1s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7283EF805D9;
	Tue,  4 Apr 2023 12:41:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96361F805C0; Tue,  4 Apr 2023 12:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03B5FF805BB
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B5FF805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ODl5uXon
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604907; x=1712140907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TozA5iC1kcmbQ3gT0P+TTs0NpzBRuyChUkg7ctPdx2U=;
  b=ODl5uXonMUAbA93x86uCG+hHwo9A/JDzFmWNuLEm11tOYhnBVPWSty0K
   Jz8kuCxU3MKMBqO1y9cCIIOPz5yF9CUrb+UgQQZVza5H+KDqghPWNHRnG
   aF8NDckttYBFHHympKtA+ezTkCDld+OUAGMuAnYR6F4lhASnyUsG4ad2P
   2vmdqUi08cUakOT1Ii6D/DAwpo3nMhVjbcPNKp8cvEEgZi9y3APA/cNLA
   aNxIGuKysWOOGwTElGI69jFRNGd2tEYr5VndaltrhDu37eGaRJ178RPRf
   oQ7geSNDfgarrazu497dtNL4Ds260pRSir9HhUgdSIKVAfctOvZw1YnY5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878144"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878144"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930242"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930242"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 17/18] ASoC: SOF: Intel: hda-mlink: add helper to offload
 link ownership
Date: Tue,  4 Apr 2023 13:41:26 +0300
Message-Id: <20230404104127.5629-18-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QKY64P6XMSF3V64B4ACIOFYNWKWAA6G5
X-Message-ID-Hash: QKY64P6XMSF3V64B4ACIOFYNWKWAA6G5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKY64P6XMSF3V64B4ACIOFYNWKWAA6G5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For DMIC and SSP, the DSP will be responsible for programming the
blobs and link registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  7 +++++++
 sound/soc/sof/intel/hda-mlink.c | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index bfd2c77c184d..fee42c432fa3 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -52,6 +52,8 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus);
 
+int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
+
 #else
 
 static inline int
@@ -151,4 +153,9 @@ hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus) { return NULL; }
 static inline struct hdac_ext_link *
 hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus) { return NULL; }
 
+static inline int
+hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
+{
+	return 0;
+}
 #endif /* CONFIG_SND_SOC_SOF_HDA */
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 06613c081410..b9ce07c38bb5 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -333,6 +333,18 @@ static void hdaml_link_set_lsdiid(u32 __iomem *lsdiid, int dev_num)
 	writel(val, lsdiid);
 }
 
+static void hdaml_lctl_offload_enable(u32 __iomem *lctl, bool enable)
+{
+	u32 val = readl(lctl);
+
+	if (enable)
+		val |=  AZX_ML_LCTL_OFLEN;
+	else
+		val &=  ~AZX_ML_LCTL_OFLEN;
+
+	writel(val, lctl);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -812,6 +824,30 @@ struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_dmic_get_hlink, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return -ENODEV;
+
+	if (!h2link->ofls)
+		return 0;
+
+	hlink = &h2link->hext_link;
+
+	mutex_lock(&h2link->eml_lock);
+
+	hdaml_lctl_offload_enable(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
+
+	mutex_unlock(&h2link->eml_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, SND_SOC_SOF_HDA_MLINK);
+
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.40.0

