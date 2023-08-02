Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C185C76D242
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC551D6;
	Wed,  2 Aug 2023 17:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC551D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990779;
	bh=zUha+96k97jhUYFPC8nrnixE0mHrTcvyWKSYSfHB3vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pznAk6VqFlinj3cIMe0rwlKzc9and2O5FMPXPs0QSlHZgqn8gm5e4DJ4KL3na5qLD
	 HyPXJG2xHw9kGhmCMcLaXDak1+e0QBb8DMa8ArCKfy3n5553MqveIpTjjuqFWm6qP+
	 99H5vOoIlC6y5jBLESCjGCPl2/CqZYmFx/SvSpNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37BCEF80551; Wed,  2 Aug 2023 17:37:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA3F4F80549;
	Wed,  2 Aug 2023 17:37:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6900F80580; Wed,  2 Aug 2023 17:37:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EFB6F80535
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFB6F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lwG9TcMO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990621; x=1722526621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zUha+96k97jhUYFPC8nrnixE0mHrTcvyWKSYSfHB3vo=;
  b=lwG9TcMOhOEmlZc0T4+jMu4CIlzqwDaFL2sCLs6Mv2bIM+lRDdm1scVu
   xxoabNrcpu9FPmaRDgEqago9pOp/X7T1/5mmN2dqmJW34fOfbwDuQ5ZaV
   csIoMzgVnTqMUkN8zMeVcnNXsYgBMC5EPjWD0C6/vthNHckvYgCCEgqpI
   ZjwNgPuPOvM9grmoq1QMbk8tx0K30DN9RvMdYMg1pCcz8GTBXVTD46Imj
   qWLYMQb/BRqFFDxNImNHH0wLgkuLupYC4Vfa1jg0K6YtNAL2C2RDiVBv8
   WQnOTehXeCKS9a7HMgDVnr6pjgCYNvZ8geyz/gjxx1i4qlZSLCrcK8pXO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350795"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350795"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887108"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887108"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 08/16] ASoC: rt712-sdca-dmic: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:21 -0500
Message-Id: <20230802153629.53576-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 44NIGGNROAQDQJL45MVUJFFZOQRCPOOU
X-Message-ID-Hash: 44NIGGNROAQDQJL45MVUJFFZOQRCPOOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44NIGGNROAQDQJL45MVUJFFZOQRCPOOU/>
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
 sound/soc/codecs/rt712-sdca-dmic.c | 40 ++++++++++++++++++------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 0102bad0b66a..ba08d03e717c 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -189,20 +189,11 @@ static int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt712->mbq_regmap, true);
 	} else {
 		/*
-		 * PM runtime is only enabled when a Slave reports as Attached
+		 * PM runtime status is marked as 'active' only when a Slave reports as Attached
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
@@ -608,6 +599,9 @@ static int rt712_sdca_dmic_probe(struct snd_soc_component *component)
 
 	rt712->component = component;
 
+	if (!rt712->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -794,10 +788,27 @@ static int rt712_sdca_dmic_init(struct device *dev, struct regmap *regmap,
 			&soc_sdca_dev_rt712_dmic,
 			rt712_sdca_dmic_dai,
 			ARRAY_SIZE(rt712_sdca_dmic_dai));
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
 
 
@@ -957,10 +968,7 @@ static int rt712_sdca_dmic_sdw_probe(struct sdw_slave *slave,
 
 static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(&slave->dev);
-
-	if (rt712->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
-- 
2.39.2

