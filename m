Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AAB6D5DCC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064BA74C;
	Tue,  4 Apr 2023 12:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064BA74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605059;
	bh=kEpikR+bSKYb3JoKHxxM+Rj4dbRtbx0/MVQzt0kg7sA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U2wlhYv3OYj60skSFvhh/N1V2BaKkfJwh4/t7WE23ubdYwPyySvzhH9XJdIc45wcB
	 wYfV2HpDIbdodF6M8ljae7PoVrnO+s8oV59KgNUft7p+lGUevkKhTynAu4hs/ZBZp1
	 lTS4FSswSjIwPKA+j/gHGzCHpW4YGc7EtEq62MRU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF0CF8057B;
	Tue,  4 Apr 2023 12:41:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C54F8057D; Tue,  4 Apr 2023 12:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06F6DF80552
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F6DF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nIedPzY7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604881; x=1712140881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kEpikR+bSKYb3JoKHxxM+Rj4dbRtbx0/MVQzt0kg7sA=;
  b=nIedPzY7xZLOP+O6n4uevYaYA6n4rL7HJ/iwLmrL/fcGsj16/8qL5+j6
   ILg6fXwDviwzdMbtcGdbsYA425milR+OTCaV3A4kUWCtFvl85nQ2cG09M
   NYGkSjvZrtCe5c1pJqb5xe26SMVDGVDOqbyAuxxZQAW3YQTV+ImETkrnv
   h19shWdc/zuL9Hc53zmD2GfyKdwVjXHvXszecA6/3jijZ43EsV4S1WCN7
   aBbIrcbfk2RbAxLXHyT47xreNeR661q+SxA6djzK+eSSpEiuezudtW+Vc
   NlVaEFUfNcyPKpF50NbN7uHWClJY5vjpMql3MJtL6y6kVIA/r4sSxtDaI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878012"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878012"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930157"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930157"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for
 'extended links' PM
Date: Tue,  4 Apr 2023 13:41:17 +0300
Message-Id: <20230404104127.5629-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4HJ3QS7NVSJDICBYWTN7B5KMKLXSK5TW
X-Message-ID-Hash: 4HJ3QS7NVSJDICBYWTN7B5KMKLXSK5TW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HJ3QS7NVSJDICBYWTN7B5KMKLXSK5TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add helpers to program SPA/CPA bits, using a mutex to access the
shared LCTL register if required.

All links are managed with the same LCTLx.SPA bits. However there are
quite a few implementation details to be aware of:

Legacy HDaudio multi-links are powered-up when exiting reset, which
requires the ref_count to be manually set to one when initializing the
link.

Alternate links for SoundWire/DMIC/SSP need to be explicitly
powered-up before accessing the SHIM/IP/Vendor-Specific SHIM space for
each sublink. DMIC/SSP/SoundWire are all different cases with a
different device/dai/hlink relationship.

SoundWire will handle power management with the auxiliary device
resume/suspend routine. The ref_count is not necessary in this case.

The DMIC/SSP will by contrast handle the power management from DAI
.startup and .shutdown callbacks.

The SSP has a 1:1 mapping between sublink and DAI, but it's
bidirectional so the ref_count will help avoid turning off the sublink
when one of the two directions is still in use.

The DMIC has a single link but two DAIs for data generated at
different sampling frequencies, again the ref_count will make sure the
two DAIs can be used concurrently.

And last the SoundWire Intel require power-up/down and bank switch to
be handled with a lock already taken, so the 'eml_lock' is made
optional with the _unlocked versions of the helpers.

Note that the _check_power_active() implementation is similar to
previous helpers in sound/hda/ext, with sleep duration and timeout
aligned with hardware recommendations. If desired, this helper could
be modified in a second step with .e.g. readl_poll_timeout()

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  32 +++++++
 sound/soc/sof/intel/hda-mlink.c | 163 ++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 8048bf01c133..6ecb4c29e472 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -12,6 +12,13 @@ struct hdac_bus;
 
 int hda_bus_ml_init(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
+
+int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
+int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
+
+int hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublink);
+int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -23,6 +30,31 @@ static inline int
 hda_bus_ml_init(struct hdac_bus *bus) { return 0; }
 
 static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
+
+static inline int
+hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return 0;
+}
+
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 8a66c0a67589..4d016f6ab773 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -170,6 +170,68 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
 	return 0;
 }
 
+/*
+ * Hardware recommendations are to wait ~10us before checking any hardware transition
+ * reported by bits changing status.
+ * This value does not need to be super-precise, a slack of 5us is perfectly acceptable.
+ * The worst-case is about 1ms before reporting an issue
+ */
+#define HDAML_POLL_DELAY_MIN_US 10
+#define HDAML_POLL_DELAY_SLACK_US 5
+#define HDAML_POLL_DELAY_RETRY  100
+
+static int check_sublink_power(u32 __iomem *lctl, int sublink, bool enabled)
+{
+	int mask = BIT(sublink) << AZX_ML_LCTL_CPA_SHIFT;
+	int retry = HDAML_POLL_DELAY_RETRY;
+	u32 val;
+
+	usleep_range(HDAML_POLL_DELAY_MIN_US,
+		     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
+	do {
+		val = readl(lctl);
+		if (enabled) {
+			if (val & mask)
+				return 0;
+		} else {
+			if (!(val & mask))
+				return 0;
+		}
+		usleep_range(HDAML_POLL_DELAY_MIN_US,
+			     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
+
+	} while (--retry);
+
+	return -EIO;
+}
+
+static int hdaml_link_init(u32 __iomem *lctl, int sublink)
+{
+	u32 val;
+	u32 mask = BIT(sublink) << AZX_ML_LCTL_SPA_SHIFT;
+
+	val = readl(lctl);
+	val |= mask;
+
+	writel(val, lctl);
+
+	return check_sublink_power(lctl, sublink, true);
+}
+
+static int hdaml_link_shutdown(u32 __iomem *lctl, int sublink)
+{
+	u32 val;
+	u32 mask;
+
+	val = readl(lctl);
+	mask = BIT(sublink) << AZX_ML_LCTL_SPA_SHIFT;
+	val &= ~mask;
+
+	writel(val, lctl);
+
+	return check_sublink_power(lctl, sublink, false);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -251,6 +313,107 @@ void hda_bus_ml_free(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_free, SND_SOC_SOF_HDA_MLINK);
 
+static struct hdac_ext2_link *
+find_ext2_link(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext_link *hlink;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list) {
+		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
+
+		if (h2link->alt == alt && h2link->elid == elid)
+			return h2link;
+	}
+
+	return NULL;
+}
+
+static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
+				      bool eml_lock)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+	int ret = 0;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return -ENODEV;
+
+	if (sublink >= h2link->slcount)
+		return -EINVAL;
+
+	hlink = &h2link->hext_link;
+
+	if (eml_lock)
+		mutex_lock(&h2link->eml_lock);
+
+	if (++hlink->ref_count > 1)
+		goto skip_init;
+
+	ret = hdaml_link_init(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
+
+skip_init:
+	if (eml_lock)
+		mutex_unlock(&h2link->eml_lock);
+
+	return ret;
+}
+
+int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return hdac_bus_eml_power_up_base(bus, alt, elid, sublink, true);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_up, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return hdac_bus_eml_power_up_base(bus, alt, elid, sublink, false);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_up_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+static int hdac_bus_eml_power_down_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
+					bool eml_lock)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+	int ret = 0;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return -ENODEV;
+
+	if (sublink >= h2link->slcount)
+		return -EINVAL;
+
+	hlink = &h2link->hext_link;
+
+	if (eml_lock)
+		mutex_lock(&h2link->eml_lock);
+
+	if (--hlink->ref_count > 0)
+		goto skip_shutdown;
+
+	ret = hdaml_link_shutdown(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
+
+skip_shutdown:
+	if (eml_lock)
+		mutex_unlock(&h2link->eml_lock);
+
+	return ret;
+}
+
+int hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return hdac_bus_eml_power_down_base(bus, alt, elid, sublink, true);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_down, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	return hdac_bus_eml_power_down_base(bus, alt, elid, sublink, false);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.40.0

