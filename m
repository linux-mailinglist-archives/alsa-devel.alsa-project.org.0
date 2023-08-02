Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D241276D251
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5627C851;
	Wed,  2 Aug 2023 17:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5627C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990887;
	bh=0+kv7zpuPadziXLzORXYvwXZw+0YACukfYorJcG01Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h0a9aY6sRwHhTNmnHEMfO1pElAha8Ul4hCC1Y6iX+li7ye509kEu8rqxr5u/HPihO
	 daKthIkfCLi5o3sPCfJQAYj+fiMvBvpxMLMxHoIih4pw6cDeQXMgNs9pJoRKfxpiDR
	 wr/18fuglYAysSEROsVJA0V00PQ28dCptThviVNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB47F805FF; Wed,  2 Aug 2023 17:37:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D542BF805FB;
	Wed,  2 Aug 2023 17:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33F92F805C0; Wed,  2 Aug 2023 17:37:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E2AD0F80553
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AD0F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=amcJ4+yp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990626; x=1722526626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0+kv7zpuPadziXLzORXYvwXZw+0YACukfYorJcG01Aw=;
  b=amcJ4+ypST+H8zgXl2+f92SaztNdQbG7dLuN6y0c7fehknY1bshngxvp
   Aq9jwG5S5bC7DA6usqVr4GaRrpSS8NPpTO6eCVYynp5eReCCFwcWJfjTm
   kmso9GNu6UyadIp5M91cHOaX+WaPDbHPiXBcU2sNjUOkOpaEZ8NmX/le/
   YH64y/O1Mq0oruqieBdRnqIWXscNj0Os1WJk1CLn7UYQY8tKlgPl4p9/t
   ruiSj82LOA8clmH9u3wa0Bs0Is452oP3p8V8KXqqJXAZAzAhYNy5x8Hpo
   T/NmpzDtRnMSXYm6WqYo4roaKwn2u7pVioCH1k2s1zx+ds5ZuNi4muzOe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350865"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350865"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887260"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887260"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 14/16] ASoC: rt5682-sdw: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:27 -0500
Message-Id: <20230802153629.53576-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TSSM5M67AT7HFW4TUAWQGN2BBMDASABY
X-Message-ID-Hash: TSSM5M67AT7HFW4TUAWQGN2BBMDASABY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSSM5M67AT7HFW4TUAWQGN2BBMDASABY/>
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
 sound/soc/codecs/rt5682-sdw.c | 37 +++++++++++++++++++++--------------
 sound/soc/codecs/rt5682.c     |  3 +++
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 6726458cf329..dfb702d1b3d4 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -339,7 +339,25 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 	ret = devm_snd_soc_register_component(dev,
 					      &rt5682_soc_component_dev,
 					      rt5682_dai, ARRAY_SIZE(rt5682_dai));
-	dev_dbg(&slave->dev, "%s\n", __func__);
+	if (ret < 0)
+		return ret;
+
+	/* set autosuspend parameters */
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+
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
 
 	return ret;
 }
@@ -361,22 +379,12 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt5682->regmap, true);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
-	if (!rt5682->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
+	if (!rt5682->first_hw_init)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
 	pm_runtime_get_noresume(&slave->dev);
 
 	while (loop > 0) {
@@ -687,8 +695,7 @@ static int rt5682_sdw_remove(struct sdw_slave *slave)
 	if (rt5682->hw_init)
 		cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
-	if (rt5682->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 5d992543b791..694c581070d9 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1017,6 +1017,9 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 
 	rt5682->hs_jack = hs_jack;
 
+	if (rt5682->is_sdw && !rt5682->first_hw_init)
+		return 0;
+
 	if (!hs_jack) {
 		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
 			RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
-- 
2.39.2

