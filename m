Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4886CA273
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:32:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DCCDF1;
	Mon, 27 Mar 2023 13:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DCCDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916773;
	bh=mp7bgLJcmGSWpd6m6SraGM7Vew4wQLxOSuvbIaiXgEo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pohlGuJ1O92Q8wi9XLynLssEJGcLt4d9Yac1IYNa3sHWWVJtEmWmhjylwUnYy8b57
	 5sI6DoEZhyqr/jOue7E0oJfJTwoO20qTszyeuWIPVXJB2TtEfQlvrZRVJEHrP2TNz5
	 4leHdRs81ggcogBRToeYRjdpIRJqJ61yN8v072K8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF8B7F80563;
	Mon, 27 Mar 2023 13:29:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07CF2F80579; Mon, 27 Mar 2023 13:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E115F80558
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E115F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NWyPZNNA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916576; x=1711452576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mp7bgLJcmGSWpd6m6SraGM7Vew4wQLxOSuvbIaiXgEo=;
  b=NWyPZNNAaSRQR82G03hFTrqRqMHT7RhWpAEayrvsoOIx9EVM+XyCTxcA
   E4UD5DAJMCMEhRnHl+pk+qi5Xq9idtziKzZcQJFtYzUQZqK/nFF82nq5e
   flURU19vPB9KAxU/2qp0GOmF0GM5l1EmCOYUlQSCDyPSp5eK2QAgDE/JH
   DBC7igQhbm6WY2irMa5ILBo4LEVPEDQTifZXANZP0vP2j18DIQLoZXuiA
   r14Fht+AM/OCrcTvUxMLWCUwLOu/thL2fReJ2lksTxtbKAS2Tiz21vGNT
   BQd9Q9j4qvnyIzQ8vf2/aeoiQpQVNcNZsGmjh1ApqPqAumPL+JjQab2Zx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987003"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620480"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620480"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 11/18] ASoC: SOF: Intel: hda-mlink: add helpers to
 enable/check interrupts
Date: Mon, 27 Mar 2023 14:29:24 +0300
Message-Id: <20230327112931.23411-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HIDZT2HXQM7JEMWVAFHSD2AVK63ILLST
X-Message-ID-Hash: HIDZT2HXQM7JEMWVAFHSD2AVK63ILLST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIDZT2HXQM7JEMWVAFHSD2AVK63ILLST/>
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
index b8f889fa46c4..ebc7c5b07557 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -14,6 +14,8 @@ int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
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
index 93d532acd1c2..cd5bbfa3684d 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -232,6 +232,28 @@ static int hdaml_link_shutdown(u32 __iomem *lctl, int sublink)
 	return check_power_active(lctl, sublink, false);
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

