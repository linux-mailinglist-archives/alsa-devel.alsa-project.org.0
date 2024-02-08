Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630C84E5B2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:58:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1785182A;
	Thu,  8 Feb 2024 17:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1785182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411502;
	bh=FT8PgSPA4NcdoRR4TxGTK5GldPkh+1Qs3BzQhAvjUl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iZopeKtEuLcGGG3emrn12RQ98XtZRe1I5+dK3cI4zkZJwh0DEvkeaoW10TW18tmNR
	 vvrgc0QP3MIe8xSsh1ueZW5ZwIWy+bNFCSr55PYgROGEluouRSp6n6sx9mZ3Kqs2y5
	 2vWZgvZ/xIhDmXFSdiNAcNj5bsZNdrSRBjFbEyV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD576F8057E; Thu,  8 Feb 2024 17:56:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A6FF8068A;
	Thu,  8 Feb 2024 17:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0DBAF805E9; Thu,  8 Feb 2024 17:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D59DF800EE
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D59DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ANqZWsjL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FT8PgSPA4NcdoRR4TxGTK5GldPkh+1Qs3BzQhAvjUl4=;
  b=ANqZWsjLWSYfsp0qYC4g2kuBJO91Sib4VgKrsHuJrSNzBwdRV7r7Gl0/
   QKlhQoxGGM4YjSAGq2CceQelICyjzyw7FvlL3tUsSoXEqt6YTlWn02hH8
   6maguLVdcbG3on4XkYrPuMSClrvlawhm77qywdFzJBI3T4PQ3grZQQc1G
   a05kyzkwfBZ2fAtHk/xeJfde+xExJMYKgE/HwbYOgDDO0DUbdvAHvwicZ
   EwEbgWjvHhGYiLgJLGcAAArowwLPDZrW8XBf/0AdsslKG+Dp9AvR3M5Vm
   tnbikK+edbQrGsSbLpuFR6BUVV5wIi7ZD4FxxF3FfBEE/cJZwC/+AIhmd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675350"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675350"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690184"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:59 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/24] ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
Date: Thu,  8 Feb 2024 10:55:30 -0600
Message-Id: <20240208165545.93811-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q2BEWWYVWOZWJOJIWIHZEPKZRN3ZC3YK
X-Message-ID-Hash: Q2BEWWYVWOZWJOJIWIHZEPKZRN3ZC3YK
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2BEWWYVWOZWJOJIWIHZEPKZRN3ZC3YK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

2 amps can be in the same or different dai links. To handle this, the
existing code implements different spk_init functions to add dapm routes
for different amps. However, sof_sdw.c doesn't support non-aggregated
amp any more since it used pre-defined BE id.
With that assumption, combine the spk_init functions together.
This is a preparation of putting different types amps in a single dai
link.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_amp.c | 54 +++++--------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 436975b6bdc1..a4414c9793b4 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -185,12 +185,14 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
+static int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
+	struct snd_soc_dai *dai;
 	int ret;
+	int i;
 
 	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
 
@@ -214,40 +216,16 @@ static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		if (strstr(dai->component->name_prefix, "-1"))
+			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
+		else if (strstr(dai->component->name_prefix, "-2"))
+			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
+	}
 
 	return ret;
 }
 
-static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	const struct snd_soc_dapm_route *rt_amp_map;
-	char codec_name[CODEC_NAME_SIZE];
-	int ret;
-
-	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	ret = first_spk_init(rtd);
-	if (ret)
-		return ret;
-
-	return second_spk_init(rtd);
-}
-
 static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
@@ -317,8 +295,7 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 		return 0;
 
 	info->amp_num++;
-	if (info->amp_num == 1)
-		dai_links->init = first_spk_init;
+	dai_links->init = rt_amp_spk_rtd_init;
 
 	if (info->amp_num == 2) {
 		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
@@ -342,17 +319,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			return ret;
 		}
 		ctx->amp_dev2 = sdw_dev2;
-
-		/*
-		 * if two amps are in one dai link, the init function
-		 * in this dai link will be first set for the first speaker,
-		 * and it should be reset to initialize all speakers when
-		 * the second speaker is found.
-		 */
-		if (dai_links->init)
-			dai_links->init = all_spk_init;
-		else
-			dai_links->init = second_spk_init;
 	}
 
 	return 0;
-- 
2.40.1

