Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F76D5DCF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0578582A;
	Tue,  4 Apr 2023 12:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0578582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605106;
	bh=6iVUmZ8k1ttcMhf5l0AdDwNTglNc2TIvrJZ78eu/ETk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBF9nva4yyuIIIsasLfAuoPyusgGnzisewnTUZ5p+5/i/2jaAt5RAS5Av3mOgMMHK
	 t/me0sXbS/FGzdAPmtp6IrPPt7Ub92DYtDj/tvIFXoHjFj1CuR2B/aVm5g4ZQr4qg/
	 YgCFh4udbVbb6EgGODEKyBDqjLKCxC79g0UCRTDI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C30AF805AF;
	Tue,  4 Apr 2023 12:41:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73744F8057F; Tue,  4 Apr 2023 12:41:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C20DCF8057C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C20DCF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QxZOtzh+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604888; x=1712140888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6iVUmZ8k1ttcMhf5l0AdDwNTglNc2TIvrJZ78eu/ETk=;
  b=QxZOtzh+ioomMV5bTnJNe/ZMPjF7Zq4MGzMUoFGRKIeda9Lj7N5vFVyl
   EW2XAdu8Gefju3E60vNvj5c5OjydJk1ZE50kuaQS9CT+PEW2AIz61D06O
   E60eyR2YSdyBNTZjJgTWlQ3b9zi8qF6tOjkcEEbCJ3+NtKSpA4NUutVA4
   bpmwr645VMzp6Okh6SN3nQn/SHa+APsv+bGmJaUsWv/M1viSLP40HF+45
   oBp1geU8s5sXQB1F280UjTMx/SD8Zca6HfBR7z54BwyiRq/CAmf1DizDJ
   Z/1rcXbdoaebE5yIf2zOHlrnOmW/Upx9VPHCDTjyOeD4PpH/OXiIQVrq6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878046"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930180"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930180"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 11/18] ASoC: SOF: Intel: hda-mlink: add helpers to
 enable/check interrupts
Date: Tue,  4 Apr 2023 13:41:20 +0300
Message-Id: <20230404104127.5629-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4ES2V3XWOEPKDOJNIGUGR57VTKFP3BLU
X-Message-ID-Hash: 4ES2V3XWOEPKDOJNIGUGR57VTKFP3BLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ES2V3XWOEPKDOJNIGUGR57VTKFP3BLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When INTC is set, LCTL exposes INTEN and INTSTS fields.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  8 +++++
 sound/soc/sof/intel/hda-mlink.c | 62 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index d7f65cb6e175..872652209a47 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -14,6 +14,8 @@ int hda_bus_ml_init(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
 
 int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid);
+void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool enable);
+bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid);
 
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
@@ -39,6 +41,12 @@ static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 static inline int
 hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid) { return 0; }
 
+static inline void
+hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool enable) { }
+
+static inline bool
+hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid) { return false; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 02743c342f28..026642659037 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -232,6 +232,28 @@ static int hdaml_link_shutdown(u32 __iomem *lctl, int sublink)
 	return check_sublink_power(lctl, sublink, false);
 }
 
+static void hdaml_link_enable_interrupt(u32 __iomem *lctl, bool enable)
+{
+	u32 val;
+
+	val = readl(lctl);
+	if (enable)
+		val |= AZX_ML_LCTL_INTEN;
+	else
+		val &= ~AZX_ML_LCTL_INTEN;
+
+	writel(val, lctl);
+}
+
+static bool hdaml_link_check_interrupt(u32 __iomem *lctl)
+{
+	u32 val;
+
+	val = readl(lctl);
+
+	return val & AZX_ML_LCTL_INTSTS;
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -340,6 +362,46 @@ int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_get_count, SND_SOC_SOF_HDA_MLINK);
 
+void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool enable)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return;
+
+	if (!h2link->intc)
+		return;
+
+	hlink = &h2link->hext_link;
+
+	mutex_lock(&h2link->eml_lock);
+
+	hdaml_link_enable_interrupt(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
+
+	mutex_unlock(&h2link->eml_lock);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_enable_interrupt, SND_SOC_SOF_HDA_MLINK);
+
+bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return false;
+
+	if (!h2link->intc)
+		return false;
+
+	hlink = &h2link->hext_link;
+
+	return hdaml_link_check_interrupt(hlink->ml_addr + AZX_REG_ML_LCTL);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_check_interrupt, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

