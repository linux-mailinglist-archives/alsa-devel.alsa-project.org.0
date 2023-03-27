Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D026CA281
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A92852;
	Mon, 27 Mar 2023 13:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A92852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916862;
	bh=ftu6oDNj7lFBP2DDgU/625ioJUYxmRfvNvEZPcUpfRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nID+TIm0HRDWNQNYyO1SEyleOlREh3ZqaVD73WoS7uln6EoAezAdyC6+HADlI9XxK
	 f/YGFMRE2fDSCZ0jnrvHkreCsjMSwzKvOyxerAazl7N2eEe8t+4Ou9u9N67htSvsXq
	 Wrfdm6GPe41fNQRXB/XeRX3qTxalwL+5vN38g6QY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7204F805B6;
	Mon, 27 Mar 2023 13:30:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1704BF805AF; Mon, 27 Mar 2023 13:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18F2AF80589
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F2AF80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xwu2b0GQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916594; x=1711452594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ftu6oDNj7lFBP2DDgU/625ioJUYxmRfvNvEZPcUpfRQ=;
  b=Xwu2b0GQq+jv89eAs094x3z7blUY+lvr7WjSzO0MDj0AT77imuFeEQhs
   r3tg2p3QylVdhjBs1guhKv4am7lfUtooPBcx3Lew4CAsZxguw5TV4KwX6
   D5P8ZG/yKXlb2RtObsHvtbbZFLiXpDop/KV0IBdvsxFvk/n6Kvnc1ws0o
   1bAuUMMi05qOYFEQK5J+RDjdC0Z+27tZBQ//tdT8IwAenbEny5JHPUTWz
   HJOcF2ipVx16tynJblLFI5hAe3W/wrGhuSwKXxCnm+Aqtbanfkb4c4oLY
   KFZsWE8UD/O293IQliYs6aV606S4pUfbVe2dA/nMiEyOv0jvmmEgiRIzg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987075"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987075"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620574"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620574"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 17/18] ASoC: SOF: Intel: hda-mlink: add helper to offload link
 ownership
Date: Mon, 27 Mar 2023 14:29:30 +0300
Message-Id: <20230327112931.23411-18-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T4R6AJQLM64BIUGMI2AHIEFGHDGW6GML
X-Message-ID-Hash: T4R6AJQLM64BIUGMI2AHIEFGHDGW6GML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4R6AJQLM64BIUGMI2AHIEFGHDGW6GML/>
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
index c3f31fa85104..17adb748597a 100644
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
index 2e0ca6eb322d..e38f00bd72ad 100644
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

