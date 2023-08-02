Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958C76D243
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990AB86F;
	Wed,  2 Aug 2023 17:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990AB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990786;
	bh=xigV77OZtyVIbMW7kE5kR5EiCFiThDpwxc3Xd/EODyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a3PBxVT70G/RxxSbzgVHxF4HmrUUrlwqbX8Iv+k55bDwFaCXuulyEzPxwBtZnkXGj
	 GwVewDdmKiR1B/mMjupgrzORx8WFQCF3uRcPCklaz/3n/t08bf9UXsGavLoItl7Azp
	 63h4S4+F9aayGaQPZW8RwRYu+GZcGkhBtmtvHFOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4058F805B6; Wed,  2 Aug 2023 17:37:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D43F805B6;
	Wed,  2 Aug 2023 17:37:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A51B3F805A0; Wed,  2 Aug 2023 17:37:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E892F8053B
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E892F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iwA7PWUp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990622; x=1722526622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xigV77OZtyVIbMW7kE5kR5EiCFiThDpwxc3Xd/EODyc=;
  b=iwA7PWUpsGheAoexCrRKLsfe0dFJsyc86yp2M3K2FiL3gWEq/ksntz44
   qD77FHJAN2Qwy20cLMP4Y63safcKvCiXPAKLcwXkhwo8blosiONye5LI6
   J+osgNfm74gMmSJa6KqRx5NcdH47mk1JfGU5MqeFfHrI2jq32vSUIky7N
   hoCMmWhKaz6nQMPp6S+fqe8UNAXb5SX0lmIcqaNlEIg0Mpbe6y2zVLmN7
   Geo5OEp4TsdDKWZM9EA2diVaz2tJEPCs3U8xHu1G4b/Iz6p008Pa7W0tj
   yANqC7jhxqqjyPQdlkJDJtUjGYtXI61wxMdski2R4O9DAbK13nU4QfYmc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350804"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350804"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887131"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887131"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 09/16] ASoC: rt715: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:22 -0500
Message-Id: <20230802153629.53576-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TOTC7JIFHP6MSQWYHMJ235J555FGOK5V
X-Message-ID-Hash: TOTC7JIFHP6MSQWYHMJ235J555FGOK5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOTC7JIFHP6MSQWYHMJ235J555FGOK5V/>
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
 sound/soc/codecs/rt715-sdw.c |  5 +----
 sound/soc/codecs/rt715.c     | 37 +++++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index d09b3061096d..21f37babd148 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -513,10 +513,7 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 
 static int rt715_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
-
-	if (rt715->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1bd2fe8aa625..79416bb48814 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -740,8 +740,12 @@ static int rt715_set_bias_level(struct snd_soc_component *component,
 
 static int rt715_probe(struct snd_soc_component *component)
 {
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+	if (!rt715->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -997,8 +1001,25 @@ int rt715_init(struct device *dev, struct regmap *sdw_regmap,
 						&soc_codec_dev_rt715,
 						rt715_dai,
 						ARRAY_SIZE(rt715_dai));
+	if (ret < 0)
+		return ret;
 
-	return ret;
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
+	return 0;
 }
 
 int rt715_io_init(struct device *dev, struct sdw_slave *slave)
@@ -1011,22 +1032,12 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 	regcache_cache_only(rt715->regmap, false);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 *  PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
-	if (!rt715->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
+	if (!rt715->first_hw_init)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
 	pm_runtime_get_noresume(&slave->dev);
 
 	/* Mute nid=08h/09h */
-- 
2.39.2

