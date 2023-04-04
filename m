Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80336D5DD7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A17A20B;
	Tue,  4 Apr 2023 12:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A17A20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605171;
	bh=BZ2U0rHINzlqzkAGyKFIlNGfIEkbHW7QsVQwwl8LZoY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LmwRedSVt/05cNnzUJ0bK5l/n1nriTwjPz01PnpWIjQ/yZjc1C6y1nY0hcUCUjT+l
	 Lo65m6Yxw/9lUUZnRX/dTi8XhA8zPz0ZDi0gUKrP9NF+JpLqKzAukyjM5H/ineYI2J
	 rJNirQ0gU9PaT1y6wf2N//Z1ek8deJLGsbvLcaZU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE2E6F805C8;
	Tue,  4 Apr 2023 12:41:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A202AF805B4; Tue,  4 Apr 2023 12:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 288CEF805A9
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288CEF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KKQJuU+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604899; x=1712140899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZ2U0rHINzlqzkAGyKFIlNGfIEkbHW7QsVQwwl8LZoY=;
  b=KKQJuU+eGUdR6+SLJIHt1odMzEZYkeoiboTNJSQas9w+qcx7jU4FCJH4
   SMMe/xA/1OXstqs4tNwJ27nmcYe6II+NrDtkEr7HOHobGhoRDerJGwpFt
   yDOxG3a3MIg29QwtfrT0n22th1ciTgsi9C+afsDZQwvwhtvp9KVK42mtY
   c65aMp3rQg86ZlTiiTRP6wbGoz0TDRUJEElVKvRBcXRGBUTlAn2VBsMod
   Wn5zOzsttdTjzaWD7PsOAdQU8OgGSqg94SYGPoNJtjrL6R9rgMwFflKeN
   N4l01coPG3d0Ix2y8Y2mdYhnrsszW3fJM5Z3ZkqQIdMzR/Sy9MeyLUzG9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878089"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930211"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930211"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 14/18] ASoC: SOF: Intel: hda-mlink: add helper to check
 cmdsync
Date: Tue,  4 Apr 2023 13:41:23 +0300
Message-Id: <20230404104127.5629-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LU6B45PW62Q5SL7VNJ23LHANRVZOUDH6
X-Message-ID-Hash: LU6B45PW62Q5SL7VNJ23LHANRVZOUDH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU6B45PW62Q5SL7VNJ23LHANRVZOUDH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This helper is an optimization where sync_go is only called when the
cmdsync field is actually set to a non-zero value.

Since this is also only used by SoundWire for now, only expose the
_unlocked version.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  9 ++++++++
 sound/soc/sof/intel/hda-mlink.c | 38 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 234af269495e..0c71b843f2cf 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -29,6 +29,9 @@ void hdac_bus_eml_sdw_sync_arm_unlocked(struct hdac_bus *bus, int sublink);
 int hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid);
 int hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus);
 
+bool hdac_bus_eml_check_cmdsync_unlocked(struct hdac_bus *bus, bool alt, int elid);
+bool hdac_bus_eml_sdw_check_cmdsync_unlocked(struct hdac_bus *bus);
+
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
@@ -92,6 +95,12 @@ hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid) { return
 static inline int
 hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus) { return 0; }
 
+static inline bool
+hdac_bus_eml_check_cmdsync_unlocked(struct hdac_bus *bus, bool alt, int elid) { return false; }
+
+static inline bool
+hdac_bus_eml_sdw_check_cmdsync_unlocked(struct hdac_bus *bus) { return false; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index c8371ab03c0a..cbbc8639691c 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -314,6 +314,15 @@ static void hdaml_link_sync_go(u32 __iomem *lsync)
 	writel(val, lsync);
 }
 
+static bool hdaml_link_check_cmdsync(u32 __iomem *lsync, u32 cmdsync_mask)
+{
+	u32 val;
+
+	val = readl(lsync);
+
+	return !!(val & cmdsync_mask);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -562,6 +571,35 @@ int hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_go_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+bool hdac_bus_eml_check_cmdsync_unlocked(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+	u32 cmdsync_mask;
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
+	cmdsync_mask = GENMASK(AZX_REG_ML_LSYNC_CMDSYNC_SHIFT + h2link->slcount - 1,
+			       AZX_REG_ML_LSYNC_CMDSYNC_SHIFT);
+
+	return hdaml_link_check_cmdsync(hlink->ml_addr + AZX_REG_ML_LSYNC,
+					cmdsync_mask);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_check_cmdsync_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+bool hdac_bus_eml_sdw_check_cmdsync_unlocked(struct hdac_bus *bus)
+{
+	return hdac_bus_eml_check_cmdsync_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_check_cmdsync_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

