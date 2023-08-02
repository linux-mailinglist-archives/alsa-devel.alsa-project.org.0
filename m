Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0476D24B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0E0DE;
	Wed,  2 Aug 2023 17:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0E0DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990856;
	bh=q5AZ8YrIdr4ZfChrxytZ3xBV3kQ4vXWMJML36xAZKPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTWXrpeU757oz/uXWu/eCrbtJZ92H/el//l/LO+vfAKC0JUOJbBQJwXM+xRwQ/7am
	 Qdp9wtUYlHJVnizgvrrcFDUPK18HzOOkC3naMQmvR+YhZRKtPCYgMBj1NxXYL9ALDw
	 IWf0ZQ+/SzsNGOt1jhyNeHBQO0iTSNhmqpIKXCkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0710EF805E7; Wed,  2 Aug 2023 17:37:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB78F805E7;
	Wed,  2 Aug 2023 17:37:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AA31F805B4; Wed,  2 Aug 2023 17:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7EAAF80551
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EAAF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EbmMJwb+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990625; x=1722526625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q5AZ8YrIdr4ZfChrxytZ3xBV3kQ4vXWMJML36xAZKPc=;
  b=EbmMJwb+pwwgM9gf0O3s2INigvMaenn/QTh3mY+NnFTygjZ2VjkkzwcG
   wpWiGmnCMfJRWS7YIUPs0UjYRc8nePBRCBfKnP3nI8ei8TOx4IwySahjR
   5ZvzKchSLKq1G1+7KCo1r+ihhZV+Ja2ijlzMDYHDBcIb1AhQxwa6egTcF
   RW9GPhar72z3I3f83xjoY05UBcZh+ouskjrzq4NsGYlXmfUeTN9sGrqdX
   H+WUukdMBXZwAfOO5vgCISdIgNcaKCu9JY3IRln5hHoZy6zKp1GFKWQWn
   wWLpJji3S+Qy47Oz3fmD8GONe6M3HI2ou346gJzUKKR3/P6RTpxU3GgGc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350848"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350848"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887189"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887189"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 12/16] ASoC: rt1316-sdw: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:25 -0500
Message-Id: <20230802153629.53576-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WZA4342MWIMWP6RPNSB72HPNRDSY4J54
X-Message-ID-Hash: WZA4342MWIMWP6RPNSB72HPNRDSY4J54
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZA4342MWIMWP6RPNSB72HPNRDSY4J54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch suggests enabling pm_runtime during the probe, but marking the
device as 'active' only after it is enumerated. That will force a
dependency between the card and the codec, pm_runtime_get_sync() will
have to wait for the codec device to resume and hence implicitly wait
for the enumeration/initialization to be completed. In the nominal
case where the codec device is already active the get_sync() would
only perform a ref-count increase.

The changes are directly inspired by RT711 and RT711-sdca changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt1316-sdw.c | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 57abbe2de7cf..47511f70119a 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -277,20 +277,11 @@ static int rt1316_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt1316->regmap, true);
 	} else {
 		/*
-		 * PM runtime is only enabled when a Slave reports as Attached
+		 *  PM runtime status is marked as 'active' only when a Slave reports as Attached
 		 */
 
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
-
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
 	}
 
 	pm_runtime_get_noresume(&slave->dev);
@@ -607,6 +598,9 @@ static int rt1316_sdw_component_probe(struct snd_soc_component *component)
 	rt1316->component = component;
 	rt1316_sdw_parse_dt(rt1316, &rt1316->sdw_slave->dev);
 
+	if (!rt1316->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -687,10 +681,27 @@ static int rt1316_sdw_init(struct device *dev, struct regmap *regmap,
 				&soc_component_sdw_rt1316,
 				rt1316_sdw_dai,
 				ARRAY_SIZE(rt1316_sdw_dai));
+	if (ret < 0)
+		return ret;
 
-	dev_dbg(&slave->dev, "%s\n", __func__);
+	/* set autosuspend parameters */
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
 
-	return ret;
+	/* make sure the device does not suspend immediately */
+	pm_runtime_mark_last_busy(dev);
+
+	pm_runtime_enable(dev);
+
+	/* important note: the device is NOT tagged as 'active' and will remain
+	 * 'suspended' until the hardware is enumerated/initialized. This is required
+	 * to make sure the ASoC framework use of pm_runtime_get_sync() does not silently
+	 * fail with -EACCESS because of race conditions between card creation and enumeration
+	 */
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	return 0;
 }
 
 static int rt1316_sdw_probe(struct sdw_slave *slave,
@@ -708,10 +719,7 @@ static int rt1316_sdw_probe(struct sdw_slave *slave,
 
 static int rt1316_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(&slave->dev);
-
-	if (rt1316->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
-- 
2.39.2

