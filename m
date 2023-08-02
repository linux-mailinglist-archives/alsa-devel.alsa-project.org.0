Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAAA76D286
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6CE71D6;
	Wed,  2 Aug 2023 17:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6CE71D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990948;
	bh=ju5jk1SsL81iJwt0dO9WXzYXRhoBpsugYd4wduXB/gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMP06Q50JAKrKX9tdDjZu6lbyPhUW9py3vLJDlGzD6c4SkcoSdlVxX9SoSCqDtMaP
	 AnASEvQhXyhWcr6rBq6EDdOGqN1UYc+kj+1hQ1rCtNt/yDhvjzcdlG829nF2SnqHAO
	 6KrTpaVrTfem9Rnw4ErwoBZ4+8fRj4GppLDs69iw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D789F801D5; Wed,  2 Aug 2023 17:38:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFDCF802BE;
	Wed,  2 Aug 2023 17:38:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBF7F8060E; Wed,  2 Aug 2023 17:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FFA5F802BE
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFA5F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RD5JlHmu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990618; x=1722526618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ju5jk1SsL81iJwt0dO9WXzYXRhoBpsugYd4wduXB/gk=;
  b=RD5JlHmug53xYy6yYqWZcmXI7KBSrVgGuhOqrIe82ZPrRidT5HFzGB68
   KyCu1DHfnrxHdPsKx62/cNgvQhUgiZXR0Z4l8cZfD7shLz71SgdYheNCZ
   5WxdSF6dN1L5ezdQEH8ct8n3Vgne2nQg4MBmt93KNp8KZLNU+QDDtjcGC
   YIVevu/QcPe2i+jXhU6UWAsgzP0phLTUuASRYe5JVJKGNLBUqBrnKPQI0
   9GaHII95Agb7TYmyTgEcyQtc6e36G6lhSxcR4v0c4p362ZTYq7uVop0Oq
   C1pNqQ18a3E7dos3+owokhCRTgCBPQBumu9TIoGLdqKXqtF2QWbjshc3O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350738"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722886949"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722886949"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 02/16] ASoC: SoundWire codecs: make regmap cache-only in probe
Date: Wed,  2 Aug 2023 10:36:15 -0500
Message-Id: <20230802153629.53576-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K5JK3TX7EUX3BYMWVKT73K4NR4TGYAWV
X-Message-ID-Hash: K5JK3TX7EUX3BYMWVKT73K4NR4TGYAWV
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5JK3TX7EUX3BYMWVKT73K4NR4TGYAWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SoundWire bus may start after the probe where the SoundWire ASoC
components are registered. This creates a time window where the card
can be created and the registers be accessed.

As discussed on the mailing list, we can't really control when codecs
are enumerated and initialized, but we can make sure the access to the
codecs is cached until the hardware is accessible.

This patch configures regcache_cache_only() with a 'true' parameter in
the probe function, and a 'false' parameter in the io_init routine.

The rt5682 is handled through a different patch due to its specific
cache handling.

Link: https://lore.kernel.org/alsa-devel/20230503144102.242240-1-krzysztof.kozlowski@linaro.org/
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98363.c        | 7 ++++---
 sound/soc/codecs/max98373-sdw.c    | 7 ++++---
 sound/soc/codecs/rt1308-sdw.c      | 7 ++++---
 sound/soc/codecs/rt1316-sdw.c      | 4 +++-
 sound/soc/codecs/rt1318-sdw.c      | 4 +++-
 sound/soc/codecs/rt700.c           | 7 ++++---
 sound/soc/codecs/rt711-sdca.c      | 8 ++++++--
 sound/soc/codecs/rt711.c           | 7 ++++---
 sound/soc/codecs/rt712-sdca-dmic.c | 7 +++++--
 sound/soc/codecs/rt712-sdca.c      | 7 +++++--
 sound/soc/codecs/rt715-sdca.c      | 7 +++++++
 sound/soc/codecs/rt715.c           | 4 ++++
 12 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index b5c69bba0e48..80a1cb482183 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -160,10 +160,9 @@ static int max98363_io_init(struct sdw_slave *slave)
 	struct max98363_priv *max98363 = dev_get_drvdata(dev);
 	int ret, reg;
 
-	if (max98363->first_hw_init) {
-		regcache_cache_only(max98363->regmap, false);
+	regcache_cache_only(max98363->regmap, false);
+	if (max98363->first_hw_init)
 		regcache_cache_bypass(max98363->regmap, true);
-	}
 
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
@@ -409,6 +408,8 @@ static int max98363_init(struct sdw_slave *slave, struct regmap *regmap)
 	max98363->regmap = regmap;
 	max98363->slave = slave;
 
+	regcache_cache_only(max98363->regmap, true);
+
 	max98363->hw_init = false;
 	max98363->first_hw_init = false;
 
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index df92242af960..92d2b872f9f8 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -361,10 +361,9 @@ static int max98373_io_init(struct sdw_slave *slave)
 	struct device *dev = &slave->dev;
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 
-	if (max98373->first_hw_init) {
-		regcache_cache_only(max98373->regmap, false);
+	regcache_cache_only(max98373->regmap, false);
+	if (max98373->first_hw_init)
 		regcache_cache_bypass(max98373->regmap, true);
-	}
 
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
@@ -753,6 +752,8 @@ static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
 	max98373->regmap = regmap;
 	max98373->slave = slave;
 
+	regcache_cache_only(max98373->regmap, true);
+
 	max98373->cache_num = ARRAY_SIZE(max98373_sdw_cache_reg);
 	max98373->cache = devm_kcalloc(dev, max98373->cache_num,
 				       sizeof(*max98373->cache),
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index a7740549d35c..2c4e5330c2df 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -218,10 +218,9 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt1308->hw_init)
 		return 0;
 
-	if (rt1308->first_hw_init) {
-		regcache_cache_only(rt1308->regmap, false);
+	regcache_cache_only(rt1308->regmap, false);
+	if (rt1308->first_hw_init)
 		regcache_cache_bypass(rt1308->regmap, true);
-	}
 
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
@@ -688,6 +687,8 @@ static int rt1308_sdw_init(struct device *dev, struct regmap *regmap,
 	rt1308->sdw_slave = slave;
 	rt1308->regmap = regmap;
 
+	regcache_cache_only(rt1308->regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 10a53c8d4874..57abbe2de7cf 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -272,8 +272,8 @@ static int rt1316_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt1316->hw_init)
 		return 0;
 
+	regcache_cache_only(rt1316->regmap, false);
 	if (rt1316->first_hw_init) {
-		regcache_cache_only(rt1316->regmap, false);
 		regcache_cache_bypass(rt1316->regmap, true);
 	} else {
 		/*
@@ -674,6 +674,8 @@ static int rt1316_sdw_init(struct device *dev, struct regmap *regmap,
 	rt1316->sdw_slave = slave;
 	rt1316->regmap = regmap;
 
+	regcache_cache_only(rt1316->regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 16d750102c8c..d7803342f5c2 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -408,8 +408,8 @@ static int rt1318_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt1318->hw_init)
 		return 0;
 
+	regcache_cache_only(rt1318->regmap, false);
 	if (rt1318->first_hw_init) {
-		regcache_cache_only(rt1318->regmap, false);
 		regcache_cache_bypass(rt1318->regmap, true);
 	} else {
 		/*
@@ -752,6 +752,8 @@ static int rt1318_sdw_init(struct device *dev, struct regmap *regmap,
 	rt1318->sdw_slave = slave;
 	rt1318->regmap = regmap;
 
+	regcache_cache_only(rt1318->regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index a04b9246256b..b774349dfdae 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -1099,6 +1099,8 @@ int rt700_init(struct device *dev, struct regmap *sdw_regmap,
 	rt700->sdw_regmap = sdw_regmap;
 	rt700->regmap = regmap;
 
+	regcache_cache_only(rt700->regmap, true);
+
 	mutex_init(&rt700->disable_irq_lock);
 
 	INIT_DELAYED_WORK(&rt700->jack_detect_work,
@@ -1132,10 +1134,9 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt700->hw_init)
 		return 0;
 
-	if (rt700->first_hw_init) {
-		regcache_cache_only(rt700->regmap, false);
+	regcache_cache_only(rt700->regmap, false);
+	if (rt700->first_hw_init)
 		regcache_cache_bypass(rt700->regmap, true);
-	}
 
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 07640d2f6e56..bd0f5e05874b 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1406,6 +1406,9 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	rt711->regmap = regmap;
 	rt711->mbq_regmap = mbq_regmap;
 
+	regcache_cache_only(rt711->regmap, true);
+	regcache_cache_only(rt711->mbq_regmap, true);
+
 	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
@@ -1500,10 +1503,11 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt711->hw_init)
 		return 0;
 
+	regcache_cache_only(rt711->regmap, false);
+	regcache_cache_only(rt711->mbq_regmap, false);
+
 	if (rt711->first_hw_init) {
-		regcache_cache_only(rt711->regmap, false);
 		regcache_cache_bypass(rt711->regmap, true);
-		regcache_cache_only(rt711->mbq_regmap, false);
 		regcache_cache_bypass(rt711->mbq_regmap, true);
 	} else {
 		/*
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index af53cbcc7bf2..0ca955e2f4e7 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1183,6 +1183,8 @@ int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 	rt711->sdw_regmap = sdw_regmap;
 	rt711->regmap = regmap;
 
+	regcache_cache_only(rt711->regmap, true);
+
 	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
@@ -1219,10 +1221,9 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt711->hw_init)
 		return 0;
 
-	if (rt711->first_hw_init) {
-		regcache_cache_only(rt711->regmap, false);
+	regcache_cache_only(rt711->regmap, false);
+	if (rt711->first_hw_init)
 		regcache_cache_bypass(rt711->regmap, true);
-	}
 
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 869cc7bfd178..0102bad0b66a 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -182,10 +182,10 @@ static int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt712->hw_init)
 		return 0;
 
+	regcache_cache_only(rt712->regmap, false);
+	regcache_cache_only(rt712->mbq_regmap, false);
 	if (rt712->first_hw_init) {
-		regcache_cache_only(rt712->regmap, false);
 		regcache_cache_bypass(rt712->regmap, true);
-		regcache_cache_only(rt712->mbq_regmap, false);
 		regcache_cache_bypass(rt712->mbq_regmap, true);
 	} else {
 		/*
@@ -777,6 +777,9 @@ static int rt712_sdca_dmic_init(struct device *dev, struct regmap *regmap,
 	rt712->regmap = regmap;
 	rt712->mbq_regmap = mbq_regmap;
 
+	regcache_cache_only(rt712->regmap, true);
+	regcache_cache_only(rt712->mbq_regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 89d245655ca4..88f6c895722e 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1183,6 +1183,9 @@ int rt712_sdca_init(struct device *dev, struct regmap *regmap,
 	rt712->regmap = regmap;
 	rt712->mbq_regmap = mbq_regmap;
 
+	regcache_cache_only(rt712->regmap, true);
+	regcache_cache_only(rt712->mbq_regmap, true);
+
 	mutex_init(&rt712->calibrate_mutex);
 	mutex_init(&rt712->disable_irq_lock);
 
@@ -1224,10 +1227,10 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt712->hw_init)
 		return 0;
 
+	regcache_cache_only(rt712->regmap, false);
+	regcache_cache_only(rt712->mbq_regmap, false);
 	if (rt712->first_hw_init) {
-		regcache_cache_only(rt712->regmap, false);
 		regcache_cache_bypass(rt712->regmap, true);
-		regcache_cache_only(rt712->mbq_regmap, false);
 		regcache_cache_bypass(rt712->mbq_regmap, true);
 	} else {
 		/*
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index b989f907784b..176340a43446 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -977,6 +977,10 @@ int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
 	rt715->regmap = regmap;
 	rt715->mbq_regmap = mbq_regmap;
 	rt715->hw_sdw_ver = slave->id.sdw_version;
+
+	regcache_cache_only(rt715->regmap, true);
+	regcache_cache_only(rt715->mbq_regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1000,6 +1004,9 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt715->hw_init)
 		return 0;
 
+	regcache_cache_only(rt715->regmap, false);
+	regcache_cache_only(rt715->mbq_regmap, false);
+
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 6c2e165dd621..1bd2fe8aa625 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -984,6 +984,8 @@ int rt715_init(struct device *dev, struct regmap *sdw_regmap,
 	rt715->regmap = regmap;
 	rt715->sdw_regmap = sdw_regmap;
 
+	regcache_cache_only(rt715->regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1006,6 +1008,8 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt715->hw_init)
 		return 0;
 
+	regcache_cache_only(rt715->regmap, false);
+
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
-- 
2.39.2

