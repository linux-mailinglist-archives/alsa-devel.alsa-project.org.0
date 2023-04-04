Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FC6D5DD0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82347F8;
	Tue,  4 Apr 2023 12:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82347F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605127;
	bh=GZwHfLOlTX/NHYYnwLIi26iyD9KhlGk9JSoeVmZyNV8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gfnuuonNuTI/B4N7Xdap8q2qR+5fbGt2t3l2tKawnHhfTS/FxS8GnyUKljVEHVkug
	 9CflttNMwmYguqGNY7dfeakp0J1Wc8rLGLxekduuoV54w86Td+oSH3HkSonNX0fIh1
	 QLyihNZQrZ/O2MbA4mLCSP9yvsNfbYYThNbgix6Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71220F805B2;
	Tue,  4 Apr 2023 12:41:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AD6AF8057C; Tue,  4 Apr 2023 12:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5E68F8055C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E68F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cp5jb6ow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604883; x=1712140883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GZwHfLOlTX/NHYYnwLIi26iyD9KhlGk9JSoeVmZyNV8=;
  b=Cp5jb6ownaSdm8LIZHpZUcYADI9H7F+WyRL18Ea40MeSxgU7QQQxN9gj
   80OAP88NWIzE4kb4kUdOD5cX9pP0jgRMGRyWIOfeYS+pGZQMZbaxSgSJl
   e0aSEu9rKCb/iK5ASlBpiY0Kn1J5DVjuLesxv0BqYtITErUk70YH0MqzN
   3QZV0U47DAUURvJrBAK0Drb5+CdMekuVYeddueT5a3168qjIaACOE0tTT
   QW0+rwa9EpRMtkIXTAJERgHZuXHMGBwNYMRxRkO65JBVksJyzhm11EVGn
   PgcYwPBDSzjYrHIeJe8prdxkO6b2SKRypmaBBMShv2V1mrJ84Uy7jZ9Ht
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340878022"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340878022"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930164"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930164"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 09/18] ASoC: SOF: Intel: hda-mlink: add convenience helpers
 for SoundWire PM
Date: Tue,  4 Apr 2023 13:41:18 +0300
Message-Id: <20230404104127.5629-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QJQF2KPQXNP62KJ6PD7QBMYHKGDUUQYR
X-Message-ID-Hash: QJQF2KPQXNP62KJ6PD7QBMYHKGDUUQYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJQF2KPQXNP62KJ6PD7QBMYHKGDUUQYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The updated SoundWire Intel driver will need to rely on Extended
HDaudio links for power management, but it doesn't need to be aware of
all the HDaudio structures. Add convenience helpers to avoid polluting
SoundWire drivers too much with HDaudio information.

Since the SoundWire/Intel solution already takes the lock at a higher
level, the _unlocked PM helpers are used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       |  9 +++++++++
 sound/soc/sof/intel/hda-mlink.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 6ecb4c29e472..c47008a603d0 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -19,6 +19,9 @@ int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int
 int hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublink);
 int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink);
 
+int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink);
+int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
@@ -55,6 +58,12 @@ hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int s
 	return 0;
 }
 
+static inline int
+hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
+
+static inline int
+hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink) { return 0; }
+
 static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 4d016f6ab773..5045c10bed76 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -414,6 +414,18 @@ int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, i
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
 
+int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink)
+{
+	return hdac_bus_eml_power_up_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_up_unlocked, SND_SOC_SOF_HDA_MLINK);
+
+int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink)
+{
+	return hdac_bus_eml_power_down_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
+
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.40.0

