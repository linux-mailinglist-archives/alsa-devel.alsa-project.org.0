Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563C6CA277
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4E8829;
	Mon, 27 Mar 2023 13:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4E8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916818;
	bh=58pnKGSviTtqNykvGmfmeZspIor2bKCh++f0ZWX2v6o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gp9me2EKdYHFxt7GFkodPQoASzhV9VFXlX/Cdas6SnY7wQlIyLW8YkdpC6OMrp3Z0
	 +Khh7xug0oQ+UF3y+MGvJwV8KcR0ZJCMp0irnz0ByJ86uBgE7Ego2/e18YJ+Rvcf4s
	 64skGkCw4BWAyvO8z1rgvtxnnYVm8BZgWYfF5cT0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2343DF805AC;
	Mon, 27 Mar 2023 13:29:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1587DF80588; Mon, 27 Mar 2023 13:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A78AF80563
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A78AF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VBBDyqlm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916578; x=1711452578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=58pnKGSviTtqNykvGmfmeZspIor2bKCh++f0ZWX2v6o=;
  b=VBBDyqlmiEu4Xl+3Usvt4vk2rlNkWQlwS/UmSY3faXbMwOiNoLZdjIEE
   W1H+IutUAQLeoMLygVpu4P57xQvuJIHmp1yph4KsYWQyjOv5KyKT65R7Y
   LcQQrh55MntAtOclAkccD8FXpbdbqirLGRuQKz7l7qFJfZ3EMR8NV/cNO
   Er2olgfLOu0rjT0gzjjkQ4mM2X0pwR7ZxzD2KCrOS7i0bqDzENZWJcOqY
   IXyq8n/kBtC49rXsTY1MqlHE0Kbov++AditKucM5LEAS1Koq4fAtWBPZe
   vmDcfkQoxOzudiYnVfr7+85XwSIQo1xrWp8a94bL07RWwjzVWuEoH0WXY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987018"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987018"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620492"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620492"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 12/18] ASoC: SOF: Intel: hda-mlink: add helpers to set link
 SYNC frequency
Date: Mon, 27 Mar 2023 14:29:25 +0300
Message-Id: <20230327112931.23411-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5ZSYEZ7YQFB7BFBYE4XARV2XKFNMPXNU
X-Message-ID-Hash: 5ZSYEZ7YQFB7BFBYE4XARV2XKFNMPXNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZSYEZ7YQFB7BFBYE4XARV2XKFNMPXNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

These helpers configure the ratio between the base clock and the
hardware signal used for link synchronization.

The SYNCPRD is written before the first sublink is powered-up. The
SYNCPU bit is set, but it will only be cleared after the link is
powered-up, hence the implementation with a set/wait pattern.

These helpers are currently only needed by SoundWire support, where
the lock is taken at a higher level, so only the _unlocked versions
are exposed for now.

Note that the _wait_bit() implementation is similar to previous
helpers in drivers/soundwire, but with sleep duration and timeout
aligned with hardware recommendations. If desired, this helper could
be modified in a second step with e.g. readl_poll_timeout().

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       | 27 ++++++++++
 sound/soc/sof/intel/hda-mlink.c | 90 +++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index ebc7c5b07557..7ef1cd9b72ec 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -17,6 +17,12 @@ int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid);
 void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool enable);
 bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid);
 
+int hdac_bus_eml_set_syncprd_unlocked(struct hdac_bus *bus, bool alt, int elid, u32 syncprd);
+int hdac_bus_eml_sdw_set_syncprd_unlocked(struct hdac_bus *bus, u32 syncprd);
+
+int hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid);
+int hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus);
+
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
@@ -47,6 +53,27 @@ hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool ena
 static inline bool
 hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid) { return false; }
 
+static inline int
+hdac_bus_eml_set_syncprd_unlocked(struct hdac_bus *bus, bool alt, int elid, u32 syncprd)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_sdw_set_syncprd_unlocked(struct hdac_bus *bus, u32 syncprd)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid)
+{
+	return 0;
+}
+
+static inline int
+hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus) { return 0; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index cd5bbfa3684d..1515c2327130 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -254,6 +254,46 @@ static bool hdaml_link_check_interrupt(u32 __iomem *lctl)
 	return val & AZX_ML_LCTL_INTSTS;
 }
 
+static int hdaml_wait_bit(void __iomem *base, int offset, u32 mask, u32 target)
+{
+	int timeout = HDAML_POLL_DELAY_RETRY;
+	u32 reg_read;
+
+	do {
+		reg_read = readl(base + offset);
+		if ((reg_read & mask) == target)
+			return 0;
+
+		timeout--;
+		usleep_range(HDAML_POLL_DELAY_MIN_US,
+			     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
+	} while (timeout != 0);
+
+	return -EAGAIN;
+}
+
+static void hdaml_link_set_syncprd(u32 __iomem *lsync, u32 syncprd)
+{
+	u32 val;
+
+	val = readl(lsync);
+	val &= ~AZX_REG_ML_LSYNC_SYNCPRD;
+	val |= (syncprd & AZX_REG_ML_LSYNC_SYNCPRD);
+
+	/*
+	 * set SYNCPU but do not wait. The bit is cleared by hardware when
+	 * the link becomes active.
+	 */
+	val |= AZX_REG_ML_LSYNC_SYNCPU;
+
+	writel(val, lsync);
+}
+
+static int hdaml_link_wait_syncpu(u32 __iomem *lsync)
+{
+	return hdaml_wait_bit(lsync, 0, AZX_REG_ML_LSYNC_SYNCPU, 0);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -402,6 +442,56 @@ bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_check_interrupt, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_set_syncprd_unlocked(struct hdac_bus *bus, bool alt, int elid, u32 syncprd)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return 0;
+
+	if (!h2link->lss)
+		return 0;
+
+	hlink = &h2link->hext_link;
+
+	hdaml_link_set_syncprd(hlink->ml_addr + AZX_REG_ML_LSYNC, syncprd);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_set_syncprd_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sdw_set_syncprd_unlocked(struct hdac_bus *bus, u32 syncprd)
+{
+	return hdac_bus_eml_set_syncprd_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, syncprd);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_syncprd_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return 0;
+
+	if (!h2link->lss)
+		return 0;
+
+	hlink = &h2link->hext_link;
+
+	return hdaml_link_wait_syncpu(hlink->ml_addr + AZX_REG_ML_LSYNC);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_wait_syncpu_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus)
+{
+	return hdac_bus_eml_wait_syncpu_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_wait_syncpu_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

