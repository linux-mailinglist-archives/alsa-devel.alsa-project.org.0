Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1677310C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFAC9827;
	Mon,  7 Aug 2023 23:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFAC9827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442940;
	bh=Vua+59ya3IKEkUg4JlemO5ieOV+GohcuI8EPkxy1HO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=giQcItsYMH+id6OHKNSRqYGCQNC39jZzHLmhd0ZJe3KI9t1gXawiNUcVGuWS7kFeo
	 BdOhiodAeVBJ+dx+lROKRTZoKMiJSKCaogVYefVMB0Aq5490r0n3Ie12fOtwm5cATr
	 3FtmWAAiKkiZb5oMG1/PM+Sx16LEkErs55GQW8sU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 793EEF8061F; Mon,  7 Aug 2023 23:11:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64DE4F80619;
	Mon,  7 Aug 2023 23:11:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A96DF805C2; Mon,  7 Aug 2023 23:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B38CF80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B38CF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mHWUbsUe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442627; x=1722978627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vua+59ya3IKEkUg4JlemO5ieOV+GohcuI8EPkxy1HO4=;
  b=mHWUbsUe9MiDB2n/KdKLZSG6LGhGr/kmrSFQBtxW0Iy3sLE6Pn5PHnb3
   n5wbMkmUm3CtXO0VVOBi4CRWkOBOgWsbahaKJn+ZYyrjwJVgynh13Qjb3
   Yvzc04YHk/3gJZauV4TBZPCg8xOvw5M2JQEJEv4D0cZf+BaFNXdAYwKrf
   M8jF88VV8E7sIpPA0t4jYDi06NGh2YQ02ZQfHlaE3SyUnh17V/PmjFTK7
   Sur4Bew+Pg4EsYncCyk9JWTsBw8600zAW6FDW2XyANMIPEADmLk1EDNYB
   EAKfACHVH2Bfbp58qdkIzwVfgrd4u741/57dHCeNO1tu8QgHtFHg0Eqqu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244389"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465258"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465258"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 17/20] ASoC: SOF: Intel: hda-mlink: add helper to get sublink
 LSDIID register
Date: Mon,  7 Aug 2023 16:09:56 -0500
Message-Id: <20230807210959.506849-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DWMOV2JTLHMQIEROULROP327EOYRW5BO
X-Message-ID-Hash: DWMOV2JTLHMQIEROULROP327EOYRW5BO
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We need to retrieve the current value to deal with the HDAudio
WAKEEN/WAKESTS setup.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 include/sound/hda-mlink.h       |  4 ++++
 sound/soc/sof/intel/hda-mlink.c | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 4f44f0bd5388..228114aca415 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -42,6 +42,7 @@ int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, i
 int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink);
 int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink);
 
+int hdac_bus_eml_sdw_get_lsdiid_unlocked(struct hdac_bus *bus, int sublink, u16 *lsdiid);
 int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num);
 
 int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
@@ -145,6 +146,9 @@ hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink) { return 0
 static inline int
 hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
 
+static inline int
+hdac_bus_eml_sdw_get_lsdiid_unlocked(struct hdac_bus *bus, int sublink, u16 *lsdiid) { return 0; }
+
 static inline int
 hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num) { return 0; }
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index df87b3791c23..9fbbcc1744db 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -331,6 +331,11 @@ static bool hdaml_link_check_cmdsync(u32 __iomem *lsync, u32 cmdsync_mask)
 	return !!(val & cmdsync_mask);
 }
 
+static u16 hdaml_link_get_lsdiid(u16 __iomem *lsdiid)
+{
+	return readw(lsdiid);
+}
+
 static void hdaml_link_set_lsdiid(u16 __iomem *lsdiid, int dev_num)
 {
 	u16 val;
@@ -752,6 +757,22 @@ int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_sdw_get_lsdiid_unlocked(struct hdac_bus *bus, int sublink, u16 *lsdiid)
+{
+	struct hdac_ext2_link *h2link;
+	struct hdac_ext_link *hlink;
+
+	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
+	if (!h2link)
+		return -ENODEV;
+
+	hlink = &h2link->hext_link;
+
+	*lsdiid = hdaml_link_get_lsdiid(hlink->ml_addr + AZX_REG_ML_LSDIID_OFFSET(sublink));
+
+	return 0;
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_lsdiid_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
 {
 	struct hdac_ext2_link *h2link;
-- 
2.39.2

