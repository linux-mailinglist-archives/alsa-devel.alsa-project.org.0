Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D66A98E7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 14:52:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B47DF5;
	Fri,  3 Mar 2023 14:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B47DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677851541;
	bh=pP8AQruczD+pfiRSN3UN24ECjKcr1OzxB4s+RtGyJb0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FjzrY+uuXP3xgr9vwmbBS8CjD1BPmotFGgyOmVGjzmV2h0prKj0Bj+qp9kLnpV680
	 1tszJbW086mepAK4tDuDFilQ6/E4SJl7cM2RXiKOZl0SOrk29qnJnbimshC62TDMma
	 H/RLEkw4crnSB1HUqxcT20hJieBsFX+61C0l61M4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4FD9F8053B;
	Fri,  3 Mar 2023 14:50:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A01E0F80266; Fri,  3 Mar 2023 14:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7179BF8025A
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 14:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7179BF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UrJGOLsq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677851434; x=1709387434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pP8AQruczD+pfiRSN3UN24ECjKcr1OzxB4s+RtGyJb0=;
  b=UrJGOLsqpe4th7A5KGagrBfOOqSGJOC/pK07Bh/6+9yDND2GhWEwtHRl
   ay8Ux4X6yjAYX/JgfO4lPASfw3Ft6ioPtNZO5H29ZnmcSs5+laBcQRoqT
   n0o24PjIoPu1hSXmFBxp5REewd4vjQE/z2hSOs24pz79/8samBIJ4+WBW
   pyx+gesPY7tXXlbq7h5x0ghR+m5GbJOt5PtN+hq2jBM9QEG42PAE15ref
   Z/yD3tKOehIlKoLDZLq65PW6gwJH8PD9diqNgQ1HhJC75mmez1QzU7/XR
   qt+6+icM7+WQv3NVZU6wwrvwNjMIB7ZPLp3eRQht2Zv1+nlAtQlovAgvL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336564433"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="336564433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668660703"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="668660703"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 05:49:24 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: Intel: avs: da7219: Explicitly define codec format
Date: Fri,  3 Mar 2023 14:48:51 +0100
Message-Id: <20230303134854.2277146-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
References: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L4K6NFD2XNFP7WLXE3K5AZMX7BSX5KHH
X-Message-ID-Hash: L4K6NFD2XNFP7WLXE3K5AZMX7BSX5KHH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4K6NFD2XNFP7WLXE3K5AZMX7BSX5KHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

da7219 is headset codec configured in 48000/2/S24_LE format regardless
of front end format, so force it to be so.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/da7219.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index acd43b6108e9..1a1d572cc1d0 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -117,6 +117,26 @@ static void avs_da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
+static int
+avs_da7219_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* The ADSP will convert the FE rate to 48k, stereo */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP0 to 24 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
 			       struct snd_soc_dai_link **dai_link)
 {
@@ -148,6 +168,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->be_hw_params_fixup = avs_da7219_be_fixup;
 	dl->init = avs_da7219_codec_init;
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
-- 
2.34.1

