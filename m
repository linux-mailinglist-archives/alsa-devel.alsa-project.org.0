Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D637A4AC4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF76E75;
	Mon, 18 Sep 2023 15:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF76E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044735;
	bh=/NYo106t5/piUdYrKv8Qtd8mnPI/votD9YglnUZ9lNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JAnzI+2e8WJMUY3mjJpG6eey/NaySdqYOEx2heM7CaeG09c2WoD6mF2mRX0/XLMGv
	 6vAf210nVg6HQD9x2TStB58BqOy5hy/vQ7Wea3QsI+hD3h58ntNsmqgvIH0SrLcTXv
	 rkO0bBqhq5eSXhz779ZkszDdNaAoZsUjnjOqtfKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81799F80631; Mon, 18 Sep 2023 15:41:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BC3F8062F;
	Mon, 18 Sep 2023 15:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF055F805E6; Mon, 18 Sep 2023 15:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2722F805BF
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2722F805BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R67sjN2I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044441; x=1726580441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NYo106t5/piUdYrKv8Qtd8mnPI/votD9YglnUZ9lNA=;
  b=R67sjN2IoWDu6Z2jKc/lID7IuBMQZkdePkjOF+lSRBbbW6uH6yYJ1xf1
   rrTkLY88Y3xBZfe/3LRKkAGyFwWUGvo2ccFBPpOJsWLwJpFYx3wEc59nF
   1Rv18FGXr2jTaAFira1vV8uqr9fxA7txvXxbTMGRAoBKsifn3VDT+ImLi
   uS9Ca5Gb1zMIZHR3AiTRLuZ6uR5mvlpS4/vyme/0kohr6eiWhuJXKHlWw
   ugCw6lFlEVQH7DPK5RpEdas+VOabyct2fcvPjSmyphadN/2ub3ks/Z9b6
   hjmWBbtgLVqdhXpLRENmQkTCQa8aIM9xv/ZyUxKH0F343c9wRjbKNxz8V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003882"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003882"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745826097"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745826097"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 16/17] ASoC: Intel: avs: Kill S24_LE in HDAudio streaming
Date: Mon, 18 Sep 2023 15:39:39 +0200
Message-Id: <20230918133940.3676091-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 73U72VNOPKZSEWXOCBEJEB7EU6EORZLR
X-Message-ID-Hash: 73U72VNOPKZSEWXOCBEJEB7EU6EORZLR
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/73U72VNOPKZSEWXOCBEJEB7EU6EORZLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Eliminate all occurrences of S24_LE within the HDAudio related pcm code,
both HOST and LINK side. Replace those with MSBITS subformats to allow
for granular selection when S32_LE is the format of choice.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 16 +++++++++++++---
 sound/soc/intel/avs/topology.c | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2a8aa4e6ce67..08855d4e0a37 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1069,6 +1069,16 @@ static int avs_component_resume(struct snd_soc_component *component)
 	return avs_component_resume_prepare(component, false);
 }
 
+static struct snd_pcm_subformat avs_pcm_subformats[] = {
+	{
+		.format = SNDRV_PCM_FORMAT_S32_LE,
+		.mask = SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+			SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
+	},
+	{}
+};
+
 static const struct snd_pcm_hardware avs_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_MMAP |
 				  SNDRV_PCM_INFO_MMAP_VALID |
@@ -1077,8 +1087,8 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 				  SNDRV_PCM_INFO_RESUME |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+	.subformats		= avs_pcm_subformats,
 	.buffer_bytes_max	= AZX_MAX_BUF_SIZE,
 	.period_bytes_min	= 128,
 	.period_bytes_max	= AZX_MAX_BUF_SIZE / 2,
@@ -1308,16 +1318,16 @@ static const struct snd_soc_dai_driver hda_cpu_dai = {
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= avs_pcm_subformats,
 	},
 	.capture = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= avs_pcm_subformats,
 	},
 };
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 45d0eb2a8e71..f2545dcbf86e 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1456,8 +1456,22 @@ static int avs_dai_load(struct snd_soc_component *comp, int index,
 			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
 			struct snd_soc_dai *dai)
 {
-	if (pcm)
+	static struct snd_pcm_subformat fe_subformats[] = {
+		{
+			.format = SNDRV_PCM_FORMAT_S32_LE,
+			.mask = SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
+		},
+		{}
+	};
+
+	if (pcm) {
 		dai_drv->ops = &avs_dai_fe_ops;
+		dai_drv->capture.subformats = fe_subformats;
+		dai_drv->playback.subformats = fe_subformats;
+	}
+
 	return 0;
 }
 
@@ -1476,6 +1490,9 @@ static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_s
 		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
 		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
 		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
+	} else {
+		/* Do not ignore codec capabilities. */
+		link->dpcm_merged_format = 1;
 	}
 
 	return 0;
-- 
2.25.1

