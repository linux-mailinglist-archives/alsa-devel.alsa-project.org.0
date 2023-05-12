Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B0700E17
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC927E82;
	Fri, 12 May 2023 19:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC927E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913712;
	bh=MNGWA3vmWo08eGxBJmdouKC0KZWye9m7SyWKKawgpi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UuUfqizHnm6afapyF0qVyNfnUzsocI5eSY22CuW5ciLat5Sqmfg2dkHOturoVqvNO
	 2WTAJLDuFRwm7RXbhbui9zeRnkdwCN0YwlwRsWXPrz2Cz5H2izWNsvJkFzI8WBylH4
	 fkC8bKERguwNJw9bS8x4w7aPgu9wIRyfti1wawfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F86F80588; Fri, 12 May 2023 19:46:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D01F80579;
	Fri, 12 May 2023 19:46:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2756F80558; Fri, 12 May 2023 19:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE9B5F8052E
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9B5F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bW7lEI+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913585; x=1715449585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MNGWA3vmWo08eGxBJmdouKC0KZWye9m7SyWKKawgpi4=;
  b=bW7lEI+Bh/W9I9FGr+JZXwFHCltuIvlkW9YlgGobRWGfyRVcSdCeBUM1
   0g79kinrGaJiGz1T3Uscv+1Xi1deXRLW+fmHsHP5AALwT4j0O7lo+X1xB
   Gb0TclY2lb6aRcnFphUOjMT/+FbznB3Wr8zzYJ+3ielg/AmnHyGg0AD6z
   qKRcm7g0S0V98ZHoOYVDCrX4jTZjvRRCiIU/okRk4r5gkM2SmCM4vGyhk
   yyNCVbPXL0wIqX8Jn/ST2Vkyg+dUWXxpn2kA6Q9khZIKP+mJUPqef96Ti
   LyQ/5THFQmO/ILjrGy5F8xkvI3AVxKLIL0iqprH5Ga3svKpT0raqtlHst
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688054"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167767"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167767"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/6] ASoC: SOF: Intel: hda-mlink: add helper to get SoundWire
 hlink
Date: Fri, 12 May 2023 12:46:07 -0500
Message-Id: <20230512174611.84372-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JEQ6B7GTL24KCHVK6OZQ364OGGUSYHBM
X-Message-ID-Hash: JEQ6B7GTL24KCHVK6OZQ364OGGUSYHBM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEQ6B7GTL24KCHVK6OZQ364OGGUSYHBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Same functionality as for DMIC/SSP with different ID.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/hda-mlink.h       |  4 ++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index dbc47af08135..5bfa8ae940e4 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -51,6 +51,7 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus);
+struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus);
 
 struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid);
 
@@ -155,6 +156,9 @@ hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus) { return NULL; }
 static inline struct hdac_ext_link *
 hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus) { return NULL; }
 
+static inline struct hdac_ext_link *
+hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus) { return NULL; }
+
 static inline struct mutex *
 hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid) { return NULL; }
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 6d0145c30afe..cfa43d93cbd0 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -850,6 +850,18 @@ struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_dmic_get_hlink, SND_SOC_SOF_HDA_MLINK);
 
+struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+	if (!h2link)
+		return NULL;
+
+	return &h2link->hext_link;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_hlink, SND_SOC_SOF_HDA_MLINK);
+
 int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
 	struct hdac_ext2_link *h2link;
-- 
2.37.2

