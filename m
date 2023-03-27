Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366A6CA276
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E963FDEE;
	Mon, 27 Mar 2023 13:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E963FDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916796;
	bh=G4W21sLQiar+foL0b73uroIddtaaOeSb6+00zUYAceM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=niUqsepSKUag+ErfW0oG5pPH4gwRepBja4xqZEm6Os4y6iAyo1NRbuO+yUdfdBDtk
	 1avVeIk+xE5wOE2FZU/bsGYKUxw3TMkALdUb+3iMooxwlKEQdU7sWaoqVnOyAzT7sn
	 JtIfbh7K7F5i7f61z2jGSSOn1p+gZlJrSPSN973E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30377F805A8;
	Mon, 27 Mar 2023 13:29:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF72F8057D; Mon, 27 Mar 2023 13:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51349F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51349F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DgMYHhOI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916584; x=1711452584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G4W21sLQiar+foL0b73uroIddtaaOeSb6+00zUYAceM=;
  b=DgMYHhOIlaY2KwwnXgFw2WBHvmqb4siWhHEAqXd/SQGyyuO6PkBrN0Pp
   By2gVvde2/XOrgCfhsHHIzOCZQb/kSkIJWuzXXJYCqIHUAUxV5dRevWON
   ONpADdby/mupnzFz8D8Dsq08huZYpvgDTUhFfe69ukGeVQdwDe7SGDa/A
   YP5YTLzf5l+ySlACr13HhB6HXeqF4J2yEkB6qv++p2nHZuPmZx/j3vIdW
   B1hz7Od9d/uLKeZYuqwlD79b+bk6tJgnlsz7U0SCSlyxHjElXe/YaacOW
   7/yLZ/dRCU3owSD4oeXOuvA8/YGk44xlX1mL+IpdvTaLsEATS/MrtAgvb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367987041"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367987041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620524"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620524"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 14/18] ASoC: SOF: Intel: hda-mlink: add helper to check
 cmdsync
Date: Mon, 27 Mar 2023 14:29:27 +0300
Message-Id: <20230327112931.23411-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4KM3LNUID65NOSHSW3EVZMJGAW5Z23IY
X-Message-ID-Hash: 4KM3LNUID65NOSHSW3EVZMJGAW5Z23IY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KM3LNUID65NOSHSW3EVZMJGAW5Z23IY/>
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
index 6be0fb63652c..64106d439fd8 100644
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
index 19df0253261a..0912989ce729 100644
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

