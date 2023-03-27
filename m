Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54E6CA272
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:32:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866C9AEA;
	Mon, 27 Mar 2023 13:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866C9AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916751;
	bh=5mhSzgtCnXvVaKdlNOhSJlqFNGFSUfi3ylXL7nu/YuI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nR9RgNfObxnrf/1xCm6ovm8FBUJFZ9d22wLTlDaLuRosC53D0oM4/Bhd52yLVlhIq
	 RH3RcTioFXDMLRiTwELdYQv9MgLuD/9U+sOPXTCP3vmi1EKLFDDQAictmIf6ym2nah
	 CAKalIMEb0vNQKlJU7LmASVOKbhDrQulo3e0p3kM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6CEF8057C;
	Mon, 27 Mar 2023 13:29:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28C1AF80495; Mon, 27 Mar 2023 13:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A1E0F80549
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A1E0F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iyAONNWr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916573; x=1711452573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mhSzgtCnXvVaKdlNOhSJlqFNGFSUfi3ylXL7nu/YuI=;
  b=iyAONNWr9F+kMB+WjCLuxFJz9UP8P2mBkVtl3CI+p4mgadji0SifD4Ce
   pSJ6q8/q7MCv/OnQEmGZetDBrtcm1WnNd3+L0EQB8EnWZxV7u9dsaXPRM
   yoqAjXNHeqKFlbrqyw/JVOpVPeqVvOX5Za5IhPcJ+Z6mnnpVUtedMjeAV
   xI33c78uEaAeOK+d5ESH9PG+9iS/p9VyPeYaHiqwNJP2XlWKIZlvMMx52
   8qmN08Tbdlgps5o1IGOKBM0JWq5fUZlLRNQYnGA5BDsPt9iJNNUYIK3MP
   FVKuQuHg4hVrSRJJw7tEk4z17XlZR303Nejz7lMDEuMqqPIjrPnKbrz4q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986992"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620467"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620467"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 10/18] ASoC: SOF: Intel: hda-mlink: add helper to return
 sublink count
Date: Mon, 27 Mar 2023 14:29:23 +0300
Message-Id: <20230327112931.23411-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYFZLMEFBTHJ2QU73RLCZ2NBKFBOEVPD
X-Message-ID-Hash: LYFZLMEFBTHJ2QU73RLCZ2NBKFBOEVPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYFZLMEFBTHJ2QU73RLCZ2NBKFBOEVPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This is needed for SoundWire integration.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  5 +++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 74737032a632..b8f889fa46c4 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -13,6 +13,8 @@ struct hdac_bus;
 int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
 void hda_bus_ml_free(struct hdac_bus *bus);
 
+int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid);
+
 int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
@@ -34,6 +36,9 @@ hda_bus_ml_get_capabilities(struct hdac_bus *bus) { return 0; }
 
 static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
 
+static inline int
+hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid) { return 0; }
+
 static inline int
 hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 310bb4c6822e..93d532acd1c2 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -328,6 +328,18 @@ find_ext2_link(struct hdac_bus *bus, bool alt, int elid)
 	return NULL;
 }
 
+int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return 0;
+
+	return h2link->slcount;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_count, SND_SOC_SOF_HDA_MLINK);
+
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
 {
-- 
2.40.0

