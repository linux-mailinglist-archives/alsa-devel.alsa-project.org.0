Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CC76D282
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A67868;
	Wed,  2 Aug 2023 17:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A67868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990939;
	bh=VKRNd272HcPXXsaKzOSJocqut4o04BsKjl3uRPi+kD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7mxve1k10XQSfMDvst+VpWhQjFVBuuzaYMGP0muexGVmfSSS9ltTCd5njsfbKFZ0
	 eaLV0/PpuYT1Ibq2MWjp7hddEGulpEYr3Yio+4sBTsyhQOCNMCYokQ2WpWbXg4ncna
	 YmXq266xfrhQb/kC2jZaL3FYa9PBu78KuiNHJApk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88712F80425; Wed,  2 Aug 2023 17:38:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E06F80578;
	Wed,  2 Aug 2023 17:38:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 093A9F8061A; Wed,  2 Aug 2023 17:38:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 72A51F80425
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A51F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rvks9dP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990619; x=1722526619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VKRNd272HcPXXsaKzOSJocqut4o04BsKjl3uRPi+kD8=;
  b=Rvks9dP5TSd9966URj7qhcBK//FYWGlu3txJVs1vKOC0Hsavm2jpBEGC
   yM/RAjPscMuEputHw0rUMSwAbL0ul8if5Vw5hEQNfp5qsZZczD27tPxsr
   TI4dWjSZJt06P5oxW8aTHIO+7ET7jMQoEgdVxD076VBtkIDFseRO5DGGN
   rPsyZtNitS70HPgg2cvIDsqeZ3FdDIM5v6ovHNb3SV83AY0UZSACIFHv6
   UNeFfKgbKgt5SytlvqKTvkNgcIO/zsyAPJUHbJ4r+KoG01GDk9IdMiz5V
   NyV6w5Ut1fRY3zEpX76QwGzMszkrU4oVQ7dVcFq2sjIoysmzyUKWccB1m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350759"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350759"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722886991"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722886991"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 04/16] ASoC: rt711: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:17 -0500
Message-Id: <20230802153629.53576-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQ52KLM3FSE7AYGEERLTHVR7OOOXYBB3
X-Message-ID-Hash: ZQ52KLM3FSE7AYGEERLTHVR7OOOXYBB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ52KLM3FSE7AYGEERLTHVR7OOOXYBB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In stress cases involving module insertion/removal followed by
playback/capture, it can happen that capture/playback is started
before the codec enumeration completes.

The codec driver registers its components with the ASoC framework
during the probe stage, so there is currently no way for the card
creation to wait for the codec enumeration/initialization to complete.

In addition, when the capture/playback starts, the ASoC framework uses
pm_runtime_get_sync() to properly refcount and power-manage
devices. This is problematic in the SoundWire case because pm_runtime
is enabled during the enumeration/initialization stage, so
pm_runtime_get_sync() will return -EACCESS which is
ignored. Additional errors will happen when setting the pm_runtime
status as 'active' because the parent is not properly resumed,
resulting in an error such as:

"rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"

This patch suggests enabling pm_runtime during the probe, but marking
the device as 'active' only after it is enumerated. That will force a
dependency between the card and the codec, pm_runtime_get_sync() will
have to wait for the codec device to resume and hence implicitly wait
for the enumeration/initialization to be completed. In the nominal
case where the codec device is already active the get_sync() would
only perform a ref-count increase.

Closes: https://github.com/thesofproject/linux/issues/4328
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c |  3 +--
 sound/soc/codecs/rt711.c     | 40 ++++++++++++++++++++++++------------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 530d1ae32c04..3f5773310ae8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -466,8 +466,7 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 		cancel_work_sync(&rt711->calibration_work);
 	}
 
-	if (rt711->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	mutex_destroy(&rt711->calibrate_mutex);
 	mutex_destroy(&rt711->disable_irq_lock);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 0ca955e2f4e7..66eaed13b0d6 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -462,6 +462,10 @@ static int rt711_set_jack_detect(struct snd_soc_component *component,
 
 	rt711->hs_jack = hs_jack;
 
+	/* we can only resume if the device was initialized at least once */
+	if (!rt711->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
 		if (ret != -EACCES) {
@@ -941,6 +945,9 @@ static int rt711_probe(struct snd_soc_component *component)
 	rt711_parse_dt(rt711, &rt711->slave->dev);
 	rt711->component = component;
 
+	if (!rt711->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -1206,8 +1213,25 @@ int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 				&soc_codec_dev_rt711,
 				rt711_dai,
 				ARRAY_SIZE(rt711_dai));
+	if (ret < 0)
+		return ret;
 
-	dev_dbg(&slave->dev, "%s\n", __func__);
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
@@ -1226,22 +1250,12 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt711->regmap, true);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
-	if (!rt711->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
+	if (!rt711->first_hw_init)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
 	pm_runtime_get_noresume(&slave->dev);
 
 	rt711_reset(rt711->regmap);
-- 
2.39.2

