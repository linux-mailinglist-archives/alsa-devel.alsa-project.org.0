Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB817EDFC3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AA9E72;
	Thu, 16 Nov 2023 12:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AA9E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133986;
	bh=v1+8aCvBhTC0KW/UxxH7boYEwxvUIYTIlUs8nqQsEI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C9pBfqkXGVklqBzK75i2FYaeyD0tTSBbiKNdK24MH3XoN5mmNp7KrzR4EjG2c6Bwy
	 RSUy8Uum791Lf6DLaFMulNaFMVUPDY38l0czcNPLaYrnOPMJWwgqICPRieB/zDdH9N
	 qYf8v7MH0Jowvbo3IcItqVH8USCdi6dqOb2kerXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9387BF805FC; Thu, 16 Nov 2023 12:22:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD716F805FA;
	Thu, 16 Nov 2023 12:22:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFB62F805EB; Thu, 16 Nov 2023 12:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C8AAF805E4
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C8AAF805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fVzBEEdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133760; x=1731669760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1+8aCvBhTC0KW/UxxH7boYEwxvUIYTIlUs8nqQsEI0=;
  b=fVzBEEdfmHWTP8olJOP4rnLTGkFjF4EDPekEgIjV53Ir7Hx94/TGwD8O
   ydQ0WXeH7Iecl8UZ5XGewbMet13ecMt6A7wgidVikAhn9IDnadgewQ5wi
   p++pvL0AWn9+BGPz9QVNOxfD7oQmJwbB34vwKiUuY3Cwp4St3+Mc4a4lW
   5yfh9qfl/7UCuWZU1nlfKPJGeCU6c2sUsITjXCiPUu7Ci4nro49L9q9ZU
   9OnHhB8wKu0Su5Q+6fbRCTVQ2eBuj2zqQRL8koKuzh2HHuRHtvz54oYyl
   2fMPgHm8TjxWJGEqTbytL5K4zbVi1nsaETSvukN07HLUHGa8lbQ2DEtHN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562077"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600";
   d="scan'208";a="457562077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698272"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:12 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 15/16] ASoC: Intel: avs: Kill S24_LE format
Date: Thu, 16 Nov 2023 12:22:54 +0100
Message-Id: <20231116112255.1584795-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SS4JUWVUIRDNYIM24SSE6KYKT7NVI42L
X-Message-ID-Hash: SS4JUWVUIRDNYIM24SSE6KYKT7NVI42L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SS4JUWVUIRDNYIM24SSE6KYKT7NVI42L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Eliminate all occurrences of S24_LE within PCM code, both HOST and LINK
side. Replace those with MSBITS subformats to allow for granular
selection when S32_LE is the format of choice.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 20 +++++++++++++++-----
 sound/soc/intel/avs/topology.c | 13 ++++++++++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 595914f93846..73f0fadb97b9 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1073,8 +1073,10 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 				  SNDRV_PCM_INFO_RESUME |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+	.subformats		= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	.buffer_bytes_max	= AZX_MAX_BUF_SIZE,
 	.period_bytes_min	= 128,
 	.period_bytes_max	= AZX_MAX_BUF_SIZE / 2,
@@ -1225,8 +1227,10 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_KNOT,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 	.capture = {
 		.channels_min	= 1,
@@ -1234,8 +1238,10 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_KNOT,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 };
 
@@ -1310,16 +1316,20 @@ static const struct snd_soc_dai_driver hda_cpu_dai = {
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 	.capture = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 };
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index c74e9d622e4c..778236d3fd28 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1514,8 +1514,16 @@ static int avs_dai_load(struct snd_soc_component *comp, int index,
 			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
 			struct snd_soc_dai *dai)
 {
-	if (pcm)
+	u32 fe_subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+			    SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			    SNDRV_PCM_SUBFMTBIT_MSBITS_MAX;
+
+	if (pcm) {
 		dai_drv->ops = &avs_dai_fe_ops;
+		dai_drv->capture.subformats = fe_subformats;
+		dai_drv->playback.subformats = fe_subformats;
+	}
+
 	return 0;
 }
 
@@ -1534,6 +1542,9 @@ static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_s
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

