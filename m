Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1576E76D24A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D077393A;
	Wed,  2 Aug 2023 17:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D077393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990836;
	bh=q0vnftKdn6U9J/JJvUSMcpW+ttC9DQVpy/fM3RL6494=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qqlinFHEQ0vxvOyodzXdeYAATftjCdecKAJrg+yT6HRpfz3nGKJ1DlpzQ3KivVmi5
	 RKGaCH4zQKIiM4vQtJTe69z6awbwcmlKoy+99pGWcBrRJTyJUc41cxHS21ipKZmDFd
	 cikIA5XcZGKdjPASCz4oZhVted6yBbhRnubixGaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93004F805E3; Wed,  2 Aug 2023 17:37:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 109FBF8025A;
	Wed,  2 Aug 2023 17:37:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 669DBF805AD; Wed,  2 Aug 2023 17:37:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DC1C8F80549
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC1C8F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H40w76ZL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990624; x=1722526624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0vnftKdn6U9J/JJvUSMcpW+ttC9DQVpy/fM3RL6494=;
  b=H40w76ZLnHzziUQDxH7w6kT+YeoctPhMBWhOZUOwiCKfNj82HOAiS+GN
   CkYMX8/1Q8Br2NkInAYl1FwGdI8PO33IIos1NzBzwxTrLWbArf7jSNRJV
   V4PFs8/E54N1vZhixsvCsdwQPU5mvdhP4MZLZvS5aoOo2YjyZTTKR+dZv
   EZA3lS/o9k/0bV9YiF7QLfoGewHBaDtez4mx8/+LpD2bapz5rIX3X5TbQ
   wGGEwQlMbS78LuiDblYf1dNUnj0sBo+zjQJmNysbj96Zqv38yfppG+llN
   NT73c7zX8wh6NblpVmWz4E7QFHlgMMSpMvnoIc7b7mNNWOEbw360YRX9l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350826"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350826"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887167"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887167"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 11/16] ASoC: rt1308-sdw: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:24 -0500
Message-Id: <20230802153629.53576-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6H5RN5LZ4SA6YHNLF6L6XMGWMK2YTA2F
X-Message-ID-Hash: 6H5RN5LZ4SA6YHNLF6L6XMGWMK2YTA2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H5RN5LZ4SA6YHNLF6L6XMGWMK2YTA2F/>
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
 sound/soc/codecs/rt1308-sdw.c | 43 ++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 2c4e5330c2df..c98cd7abef6a 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -223,22 +223,12 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt1308->regmap, true);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
-	if (!rt1308->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
+	if (!rt1308->first_hw_init)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
 	pm_runtime_get_noresume(&slave->dev);
 
 	/* sw reset */
@@ -625,6 +615,9 @@ static int rt1308_sdw_component_probe(struct snd_soc_component *component)
 	rt1308->component = component;
 	rt1308_sdw_parse_dt(rt1308, &rt1308->sdw_slave->dev);
 
+	if (!rt1308->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -700,10 +693,27 @@ static int rt1308_sdw_init(struct device *dev, struct regmap *regmap,
 				&soc_component_sdw_rt1308,
 				rt1308_sdw_dai,
 				ARRAY_SIZE(rt1308_sdw_dai));
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
 
 static int rt1308_sdw_probe(struct sdw_slave *slave,
@@ -721,10 +731,7 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 
 static int rt1308_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
-
-	if (rt1308->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
-- 
2.39.2

