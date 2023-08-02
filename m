Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4176D248
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30BCD820;
	Wed,  2 Aug 2023 17:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30BCD820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990828;
	bh=2sALb+tQ8E0Q5hlrP9ANuMuDZLWrkJC/pDnO/v6vF8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uCaZI+OO0wnjfEfIllFAkxtR9bP4qpTBJhOZLOELCNkAjvjv53hZsk2rHz8HRwL0Y
	 BRxs1Lo11PA44D5Ndf4RVg9VOENIaUQcEaPqvxifjqwDV0ejwlWFG751x9Ood21NTo
	 LpfSd9b4EeNNU41s5I2oU1uirssljry5MAL3dnU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B9FCF805D7; Wed,  2 Aug 2023 17:37:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5161FF805C8;
	Wed,  2 Aug 2023 17:37:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C325F805AD; Wed,  2 Aug 2023 17:37:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 73DB9F80548
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DB9F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NrRlaeui
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990623; x=1722526623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2sALb+tQ8E0Q5hlrP9ANuMuDZLWrkJC/pDnO/v6vF8Y=;
  b=NrRlaeuizyUc3SJBOsCbvQ25get8MkzatynZmI1rdA1DrHFfiNOr3laM
   DVf9uzq+gfG5ici1XjyDuRXhmphhPgP/rni5zD4/9VjvDC3w52+mveU4c
   7XMj+JMz3szc8CDKa5tZRfGLBOnf9GCxMiusUojTmIlxRt4gmY471+Npw
   wQtPbkn9Z+OQW4TSDfnhjeiS2tloJJO6qEytRGQ3U4MyUdHbxlAZZZD0i
   uDG/9krm32xrrtcpgsDU0d3j9SkIHhVH10HnI2sWqK/sFgM20yFU0cazd
   T60Am0yIV+Uyhu8xvGQSg9uWa8sVfZThRK4PbGLmCwJx9n+Vt/XQ9HpYs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350817"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350817"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887149"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887149"
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
Subject: [PATCH 10/16] ASoC: rt715-sdca: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:23 -0500
Message-Id: <20230802153629.53576-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JOPRN7HBZHPSWQMWCBKVOXPY76OJMGDI
X-Message-ID-Hash: JOPRN7HBZHPSWQMWCBKVOXPY76OJMGDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOPRN7HBZHPSWQMWCBKVOXPY76OJMGDI/>
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
 sound/soc/codecs/rt715-sdca-sdw.c |  5 +----
 sound/soc/codecs/rt715-sdca.c     | 34 ++++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index df10916bab46..ab54a67a27eb 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -193,10 +193,7 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
 
 static int rt715_sdca_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
-
-	if (rt715->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 176340a43446..9fa96fd83d4a 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -761,8 +761,12 @@ static const struct snd_soc_dapm_route rt715_sdca_audio_map[] = {
 
 static int rt715_sdca_probe(struct snd_soc_component *component)
 {
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+	if (!rt715->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -992,6 +996,25 @@ int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
 			&soc_codec_dev_rt715_sdca,
 			rt715_sdca_dai,
 			ARRAY_SIZE(rt715_sdca_dai));
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
@@ -1008,21 +1031,12 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	regcache_cache_only(rt715->mbq_regmap, false);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
 	if (!rt715->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-
 		rt715->first_hw_init = true;
 	}
 
-- 
2.39.2

