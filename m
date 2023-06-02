Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F934720A37
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213BE1FE;
	Fri,  2 Jun 2023 22:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213BE1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737505;
	bh=2H90HdKpx6lpXPWauOcusCv8FrzygAPjMIOJhvx+0kU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iza7+wgJskm3AHWIZRX2SdRyF5dRiMotL3BEjEZb+TXlCh6xqJp8wnAEux5emOXdG
	 bsvZ2ZR+wl06eXeJXa0cDH4hsCHcbcBnWlqlPEbcKfDHcYrPK9CauAspl1/MLWUUS5
	 k2fHYz28pgwGwZdec8JamwrmXRbbpueEa1MomskQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BC9F805B5; Fri,  2 Jun 2023 22:23:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C3BF800C1;
	Fri,  2 Jun 2023 22:23:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C983F80589; Fri,  2 Jun 2023 22:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F978F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F978F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O33XlHK3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737385; x=1717273385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2H90HdKpx6lpXPWauOcusCv8FrzygAPjMIOJhvx+0kU=;
  b=O33XlHK3M1LkyC56xXiOMZi/b2Vy+uVfagTdZo5Ijo13bSdUgVHaQNmS
   9SyGPxRX0d9YODDjnZFm+kpNuEdBh/IZ32vN4Xi+Ok4CDFVUss4GZKw0t
   WHEQ7/siRdgn9XvIA1IeEEs53aT5mw/mgb90mXQXgyRGClGlMp68P/8Ld
   6VsEEysFFYWgUpD7FsF2Hsdv1IH4VFaIQXJ59yN07EROwC3FPPV12FdNz
   XN5VIiMw+8gbP+ZI5nHpZg+2mxX44mCMGzdvlU5r3g7ZcS5jNVhyOq1Kg
   VRlK0Y4ZZWScrxqocKUHVatqmSXeLAb67C0O3fGMQCwZBYtilhr88G5+h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811200"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811200"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020006"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020006"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/28] ASoC: Intel: sof_sdw: add dai info
Date: Fri,  2 Jun 2023 15:21:59 -0500
Message-Id: <20230602202225.249209-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 23LB45XQZPYGO3VIQ2SIPA4KVV3WZMQY
X-Message-ID-Hash: 23LB45XQZPYGO3VIQ2SIPA4KVV3WZMQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23LB45XQZPYGO3VIQ2SIPA4KVV3WZMQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code create a dailink for a codec. However, we may need
multi dailinks for a codec. This commit adds a new struct in
sof_sdw_codec_info{} to store the dai info of a codec.
The initial assumption if that we will create at most 3 dailink types
for a codec, since this is the max known with upcoming SDCA devices. We
may need to increase this number as new SDCA 'functions' become available.

One strong assumption is that all dailinks exposed are independent, as per
SDCA directions.

This commit just moves some items into the new sof_sdw_dai_info struct.
There is no function changed. Multi dais supported will be added in the
follow up commits.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 225 +++++++++++++++++-------
 sound/soc/intel/boards/sof_sdw_common.h |  31 +++-
 2 files changed, 183 insertions(+), 73 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2dadde7a7ab9..cf12f1ae67c1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -563,134 +563,231 @@ static const struct snd_soc_ops sdw_ops = {
 static struct sof_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x700,
-		.direction = {true, true},
-		.dai_name = "rt700-aif1",
-		.init = sof_sdw_rt700_init,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt700-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = sof_sdw_rt700_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
 		.version_id = 3,
-		.direction = {true, true},
-		.dai_name = "rt711-sdca-aif1",
-		.init = sof_sdw_rt711_sdca_init,
-		.exit = sof_sdw_rt711_sdca_exit,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt711-sdca-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = sof_sdw_rt711_sdca_init,
+				.exit = sof_sdw_rt711_sdca_exit,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
 		.version_id = 2,
-		.direction = {true, true},
-		.dai_name = "rt711-aif1",
-		.init = sof_sdw_rt711_init,
-		.exit = sof_sdw_rt711_exit,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt711-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = sof_sdw_rt711_init,
+				.exit = sof_sdw_rt711_exit,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x1308,
 		.acpi_id = "10EC1308",
-		.direction = {true, false},
-		.dai_name = "rt1308-aif",
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "rt1308-aif",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
+			},
+		},
+		.dai_num = 1,
 		.ops = &sof_sdw_rt1308_i2s_ops,
-		.init = sof_sdw_rt_amp_init,
-		.exit = sof_sdw_rt_amp_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1316,
-		.direction = {true, true},
-		.dai_name = "rt1316-aif",
-		.init = sof_sdw_rt_amp_init,
-		.exit = sof_sdw_rt_amp_exit,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt1316-aif",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1318,
-		.direction = {true, true},
-		.dai_name = "rt1318-aif",
-		.init = sof_sdw_rt_amp_init,
-		.exit = sof_sdw_rt_amp_exit,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt1318-aif",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x714,
 		.version_id = 3,
-		.direction = {false, true},
 		.ignore_pch_dmic = true,
-		.dai_name = "rt715-aif2",
-		.init = sof_sdw_rt715_sdca_init,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.init = sof_sdw_rt715_sdca_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
 		.version_id = 3,
-		.direction = {false, true},
 		.ignore_pch_dmic = true,
-		.dai_name = "rt715-aif2",
-		.init = sof_sdw_rt715_sdca_init,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.init = sof_sdw_rt715_sdca_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x714,
 		.version_id = 2,
-		.direction = {false, true},
 		.ignore_pch_dmic = true,
-		.dai_name = "rt715-aif2",
-		.init = sof_sdw_rt715_init,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.init = sof_sdw_rt715_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
 		.version_id = 2,
-		.direction = {false, true},
 		.ignore_pch_dmic = true,
-		.dai_name = "rt715-aif2",
-		.init = sof_sdw_rt715_init,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.init = sof_sdw_rt715_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x8373,
-		.direction = {true, true},
-		.dai_name = "max98373-aif1",
-		.init = sof_sdw_mx8373_init,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "max98373-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.init = sof_sdw_mx8373_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5682,
-		.direction = {true, true},
-		.dai_name = "rt5682-sdw",
-		.init = sof_sdw_rt5682_init,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt5682-sdw",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = sof_sdw_rt5682_init,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.version_id = 0,
-		.direction = {true, true},
-		.dai_name = "sdw-mockup-aif1",
-		.init = NULL,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = NULL,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
 		.version_id = 0,
-		.direction = {true, true},
-		.dai_name = "sdw-mockup-aif1",
-		.init = NULL,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.init = NULL,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
 		.version_id = 0,
-		.direction = {true, false},
-		.dai_name = "sdw-mockup-aif1",
-		.init = NULL,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.init = NULL,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5555,
 		.version_id = 0,
-		.direction = {false, true},
-		.dai_name = "sdw-mockup-aif1",
+		.dais = {
+			{
+				.dai_name = "sdw-mockup-aif1",
+				.direction = {false, true},
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.init = NULL,
+			},
+		},
+		.dai_num = 1,
 		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 };
@@ -780,7 +877,7 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 
 			/* count DAI number for playback and capture */
 			for_each_pcm_streams(stream) {
-				if (!codec_info_list[codec_index].direction[stream])
+				if (!codec_info_list[codec_index].dais[0].direction[stream])
 					continue;
 
 				(*sdw_cpu_dai_num)++;
@@ -920,7 +1017,7 @@ static int create_codec_dai_name(struct device *dev,
 		_codec_index = codec_index;
 
 		codec[comp_index].dai_name =
-			codec_info_list[codec_index].dai_name;
+			codec_info_list[codec_index].dais[0].dai_name;
 
 		codec_conf[*codec_conf_index].dlc = codec[comp_index];
 		codec_conf[*codec_conf_index].name_prefix = link->adr_d[i].name_prefix;
@@ -957,8 +1054,8 @@ static int set_codec_init_func(struct snd_soc_card *card,
 			/* The group_id is > 0 iff the codec is aggregated */
 			if (link->adr_d[i].endpoints->group_id != group_id)
 				continue;
-			if (codec_info_list[codec_index].init)
-				codec_info_list[codec_index].init(card,
+			if (codec_info_list[codec_index].dais[0].init)
+				codec_info_list[codec_index].dais[0].init(card,
 						link,
 						dai_links,
 						&codec_info_list[codec_index],
@@ -1154,7 +1251,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			"SDW%d-Capture-%s",
 		};
 
-		if (!codec_info_list[codec_index].direction[stream])
+		if (!codec_info_list[codec_index].dais[0].direction[stream])
 			continue;
 
 		/* create stream name according to first link id */
@@ -1458,18 +1555,18 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		ssp_components->name = codec_name;
-		ssp_components->dai_name = info->dai_name;
+		ssp_components->dai_name = info->dais[0].dai_name;
 		cpus[cpu_id].dai_name = cpu_name;
 
-		playback = info->direction[SNDRV_PCM_STREAM_PLAYBACK];
-		capture = info->direction[SNDRV_PCM_STREAM_CAPTURE];
+		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
+		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 		init_dai_link(dev, links + link_index, be_id, name,
 			      playback, capture,
 			      cpus + cpu_id, 1,
 			      ssp_components, 1,
 			      NULL, info->ops);
 
-		ret = info->init(card, NULL, links + link_index, info, 0);
+		ret = info->dais[0].init(card, NULL, links + link_index, info, 0);
 		if (ret < 0)
 			return ret;
 
@@ -1606,7 +1703,7 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 	int i, j;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		if (!codec_info_list[i].exit)
+		if (!codec_info_list[i].dais[0].exit)
 			continue;
 		/*
 		 * We don't need to call .exit function if there is no matched
@@ -1614,8 +1711,8 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 		 */
 		for_each_card_prelinks(card, j, link) {
 			if (!strcmp(link->codecs[0].dai_name,
-				    codec_info_list[i].dai_name)) {
-				ret = codec_info_list[i].exit(card, link);
+				    codec_info_list[i].dais[0].dai_name)) {
+				ret = codec_info_list[i].dais[0].exit(card, link);
 				if (ret)
 					dev_warn(card->dev,
 						 "codec exit failed %d\n",
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 081ab7eac5b6..e6d539bd63ec 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -56,24 +56,37 @@ enum {
 #define SOF_SDW_CODEC_TYPE_AMP		1
 #define SOF_SDW_CODEC_TYPE_MIC		2
 
+#define SOF_SDW_DAI_TYPE_JACK		0
+#define SOF_SDW_DAI_TYPE_AMP		1
+#define SOF_SDW_DAI_TYPE_MIC		2
+
+#define SOF_SDW_MAX_DAI_NUM		3
+
+struct sof_sdw_codec_info;
+
+struct sof_sdw_dai_info {
+	const bool direction[2]; /* playback & capture support */
+	const char *dai_name;
+	const int dai_type;
+	int  (*init)(struct snd_soc_card *card,
+		     const struct snd_soc_acpi_link_adr *link,
+		     struct snd_soc_dai_link *dai_links,
+		     struct sof_sdw_codec_info *info,
+		     bool playback);
+	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+};
+
 struct sof_sdw_codec_info {
 	const int part_id;
 	const int version_id;
 	const int codec_type;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
-	const bool direction[2]; // playback & capture support
 	const bool ignore_pch_dmic;
-	const char *dai_name;
 	const struct snd_soc_ops *ops;
+	struct sof_sdw_dai_info dais[SOF_SDW_MAX_DAI_NUM];
+	const int dai_num;
 
-	int  (*init)(struct snd_soc_card *card,
-		     const struct snd_soc_acpi_link_adr *link,
-		     struct snd_soc_dai_link *dai_links,
-		     struct sof_sdw_codec_info *info,
-		     bool playback);
-
-	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 };
 
-- 
2.37.2

