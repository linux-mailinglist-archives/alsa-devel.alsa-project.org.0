Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AC6D5DE1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F228984B;
	Tue,  4 Apr 2023 12:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F228984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605235;
	bh=DDgg3sHC5Zfv6PYCnrIZWwpMVKtPIYADTfAG3j48Uy8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0VvPR4+iWwZoPkxJsglg23s0GrtlKH+Og36w/At6hBokbrnjx1pI+XyQoo9iIkWj
	 Lz2eeM/uXXVTf4jhefn9m33QdFww70I5c58XrTIwDSTQxuIjQF4QN/prdGTtI2urEb
	 INMXBfmcVJ21glmswYr2NQCMMFKsE9txivZELejw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F1F3F805E6;
	Tue,  4 Apr 2023 12:42:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0353F805D2; Tue,  4 Apr 2023 12:41:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F04DF805C6
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F04DF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LC/R2mP/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604910; x=1712140910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DDgg3sHC5Zfv6PYCnrIZWwpMVKtPIYADTfAG3j48Uy8=;
  b=LC/R2mP/X7p9tHYm7W0sLgp1yUPnM1DQv4sqghbB6L1MfFRStusgjCyt
   hQ8nnlzH4xqgAJTyLY35EWzYH1zhwWP94XYqxy4vGYdEnQmKYu2ACtbk1
   yYWfFE0SAEBcGi9IWwZAOk62Y8bs5FiZ0sq0MzHJfzxqlKXABw7dnQy63
   rHk28CjlfvbziSDK+9hhQ5y2LIMd3elnxbgUCBsEgsQZjqlfslG84S9Iy
   dc9o/GydbXjPR3Pm2vf8/k0+ci4SsELZBqGlFdM1i3tlRNmaVI7P+q9dq
   jjcCem1okw8khHOJiJKBCnw6fQr7hALzYKfOTtwOxfM4nzgLbAZQjmaoY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878155"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930250"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930250"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 18/18] ASoC: SOF: Intel: hda-mlink: add helper to retrieve
 eml_lock
Date: Tue,  4 Apr 2023 13:41:27 +0300
Message-Id: <20230404104127.5629-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZH4WK2SWUXX55IYA6C7EWLHZSKP3QDZ
X-Message-ID-Hash: DZH4WK2SWUXX55IYA6C7EWLHZSKP3QDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZH4WK2SWUXX55IYA6C7EWLHZSKP3QDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For SoundWire usages, we need to use the global eml_lock to
serialize/protect all accesses to shared registers.  Due to the split
implementation across two subsystems, we need to pass a pointer
around.

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
index fee42c432fa3..dbc47af08135 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -52,6 +52,8 @@ int hda_bus_ml_suspend(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus);
 struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus);
 
+struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid);
+
 int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
 
 #else
@@ -153,6 +155,9 @@ hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus) { return NULL; }
 static inline struct hdac_ext_link *
 hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus) { return NULL; }
 
+static inline struct mutex *
+hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid) { return NULL; }
+
 static inline int
 hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index b9ce07c38bb5..775582ab7494 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -800,6 +800,18 @@ int hda_bus_ml_suspend(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
+struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return NULL;
+
+	return &h2link->eml_lock;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_mutex, SND_SOC_SOF_HDA_MLINK);
+
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus)
 {
 	struct hdac_ext2_link *h2link;
-- 
2.40.0

