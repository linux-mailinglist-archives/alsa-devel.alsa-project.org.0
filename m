Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB16D5DD6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB155836;
	Tue,  4 Apr 2023 12:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB155836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605157;
	bh=QTVaDtXVhNSuKuarCS5yBDAVtVcBy2zd5TrN5pcVZLU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dgccotR4M++SQPSSACEEx6X8NFNC9wjNmApWBDtUfZwsQW00OcufVnhuYXAlEmIUH
	 AV5BeQa719yRIMeXU1SBq19mI79JGOflqXyB9oAcxKkk9FoeZlyDbX+b/CRQK9syiZ
	 cxsRQcwbrsjuNzbylYEmHyBw11Wh7lxlg9NGgVzA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC628F805BB;
	Tue,  4 Apr 2023 12:41:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67420F8059F; Tue,  4 Apr 2023 12:41:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B118BF80587
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B118BF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AzS8yUIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604894; x=1712140894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QTVaDtXVhNSuKuarCS5yBDAVtVcBy2zd5TrN5pcVZLU=;
  b=AzS8yUIuOlsvpq/sPs95G2N6kMDNnE+YjEAKopH1MhzMqKOta3aaY8fo
   z5N6qJCL0zAkhzdx6aWtSiDryDOT7OdyqPSvbDZy5xpTAGIhqywgafCRq
   eOgZ4Gfb0q6SSxUs7CMvvHPpu6/QpY1nAlF3pp+BXCBA4cuoy9PVuDMO4
   MO6aYWTqsFmZ8iC8edN7LLcMW4kekagSekh8CBkCLUJ+mrVNaqQHJ0sp3
   4cEVU/Hd7xwnmjm8CdauxBt/STrgeRQ+1Gr6K4bd9130l+a+SIg6qKi2w
   pIngaouqMoyztghvRMVKwVhA80+dBlJewDXJrVuCOjVdrDBdYJkoUfDhA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878075"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878075"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930203"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930203"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 13/18] ASoC: SOF: Intel: hda-mlink: add helpers for
 sync_arm/sync_go
Date: Tue,  4 Apr 2023 13:41:22 +0300
Message-Id: <20230404104127.5629-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4TKAPXYGRDTPHVFMZCDARFETK4Q3P6NC
X-Message-ID-Hash: 4TKAPXYGRDTPHVFMZCDARFETK4Q3P6NC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TKAPXYGRDTPHVFMZCDARFETK4Q3P6NC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The multi-link synchronization uses the same concept and registers,
but moved to the HDAudio extended links.

Add helpers for sync_arm and sync_go which are the basic for the bus
reset, bank switch and clock stop.

Since SoundWire is the only user of those helpers, only expose the
_unlocked versions for now.

Note that SYNCGO is a write-only bit, so no error can be reported. We
still return 0 for compatibility with the SoundWire stream management
headers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       | 18 +++++++++
 sound/soc/sof/intel/hda-mlink.c | 70 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 80af2a3996d7..234af269495e 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -23,6 +23,12 @@ int hdac_bus_eml_sdw_set_syncprd_unlocked(struct hdac_bus *bus, u32 syncprd);
 int hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid);
 int hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus);
 
+void hdac_bus_eml_sync_arm_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
+void hdac_bus_eml_sdw_sync_arm_unlocked(struct hdac_bus *bus, int sublink);
+
+int hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid);
+int hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus);
+
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
@@ -74,6 +80,18 @@ hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid)
 static inline int
 hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus) { return 0; }
 
+static inline void
+hdac_bus_eml_sync_arm_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink) { }
+
+static inline void
+hdac_bus_eml_sdw_sync_arm_unlocked(struct hdac_bus *bus, int sublink) { }
+
+static inline int
+hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid) { return 0; }
+
+static inline int
+hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus) { return 0; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index a364d6b5935d..c8371ab03c0a 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -294,6 +294,26 @@ static int hdaml_link_wait_syncpu(u32 __iomem *lsync)
 	return hdaml_wait_bit(lsync, 0, AZX_REG_ML_LSYNC_SYNCPU, 0);
 }
 
+static void hdaml_link_sync_arm(u32 __iomem *lsync, int sublink)
+{
+	u32 val;
+
+	val = readl(lsync);
+	val |= (AZX_REG_ML_LSYNC_CMDSYNC << sublink);
+
+	writel(val, lsync);
+}
+
+static void hdaml_link_sync_go(u32 __iomem *lsync)
+{
+	u32 val;
+
+	val = readl(lsync);
+	val |= AZX_REG_ML_LSYNC_SYNCGO;
+
+	writel(val, lsync);
+}
+
 /* END HDAML section */
 
 static int hda_ml_alloc_h2link(struct hdac_bus *bus, int index)
@@ -492,6 +512,56 @@ int hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_wait_syncpu_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+void hdac_bus_eml_sync_arm_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return;
+
+	if (!h2link->lss)
+		return;
+
+	hlink = &h2link->hext_link;
+
+	hdaml_link_sync_arm(hlink->ml_addr + AZX_REG_ML_LSYNC, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sync_arm_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+void hdac_bus_eml_sdw_sync_arm_unlocked(struct hdac_bus *bus, int sublink)
+{
+	hdac_bus_eml_sync_arm_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_arm_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid)
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
+	hdaml_link_sync_go(hlink->ml_addr + AZX_REG_ML_LSYNC);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sync_go_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus)
+{
+	return hdac_bus_eml_sync_go_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_go_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

