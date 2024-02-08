Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5584E5ED
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:03:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A6714FD;
	Thu,  8 Feb 2024 18:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A6714FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411779;
	bh=w/08Apl5ExoaCSROJAUFzeC3pL17+3exv81cgUwnrHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LbKRbPTEUG2b2l4D9kaLXe2OVoAjWsNyRzS29u/RRv8IwWmNDNttY1UXjTQtNpLTK
	 0CdEdM/peycVDkp3JWp5emWZw0fF5cmoglBngbsCavu3tD1936g7tgQ25Vd7Ax7Oyh
	 SM0OrSfv1Hun8VsFFJZCKoMm6e0+UuF0gkhxqD10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7381EF89709; Thu,  8 Feb 2024 17:57:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D45D4F89717;
	Thu,  8 Feb 2024 17:57:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C014F806D5; Thu,  8 Feb 2024 17:56:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E3CEF80567
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3CEF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=laex2VuC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411373; x=1738947373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w/08Apl5ExoaCSROJAUFzeC3pL17+3exv81cgUwnrHs=;
  b=laex2VuC3UUBRQTzqyazuHWWuNzH4LFgtO0ch2N4fBmbJ8hFp66kWPq0
   2xuh2YyOsL+Ibfnl9ICNa6Bp7P+5lVDCnJBACldnG/78ZuzqjnyufWC87
   SO7cuyi2fI6GHSK6DkDWghRO9E3Lf++1ybG6Nf2MWLG3Yd6T5GQHZll3Q
   ms4u8dZRXhehTXbVXZKEjJf9sgDHJilaY3+Z00aO2Fibc5kny3njrLI8L
   uc9xcj7Q7GUDkrRrtCmknd7rbT9WHA9BnZ0ToXGk4Rt9eUVNiPUUKx18t
   aNLrm5E8joAKML7DPCmzAP32A98gl/9ZNwG/ib4z9VuF6sviwJaHR3xXz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675411"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690258"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/24] ASoC: Intel: sof_sdw: add common sdw dai link init
Date: Thu,  8 Feb 2024 10:55:38 -0600
Message-Id: <20240208165545.93811-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N7SVLM7XLUQBEFPO6A2PTLKIZPBSNLGY
X-Message-ID-Hash: N7SVLM7XLUQBEFPO6A2PTLKIZPBSNLGY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7SVLM7XLUQBEFPO6A2PTLKIZPBSNLGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we set sdw dai link .init callback in the codec_info_list's
dais.init function. This works fine if all codecs in the dai link are
the same. However, we need to do all the .init stuff for all different
codecs in the dai link if not all codecs in the dai link are the same.
Use a common dai link .init callback to call the new rtd_init callback
in sof_sdw_dai_info{} to do rtd_init for each dai.
Some codec init callback will become empty after this change. They will
be removed in the follow up patch.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              | 75 ++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h       | 20 +++++
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  4 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  7 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  3 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  4 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  4 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  4 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  8 +-
 sound/soc/intel/boards/sof_sdw_rt715.c        |  4 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |  4 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  3 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  4 +-
 14 files changed, 108 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 300391fbc2fc..782b45adb21e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -651,6 +651,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt700_init,
+				.rtd_init = rt700_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -666,6 +667,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
+				.rtd_init = rt_sdca_jack_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -681,6 +683,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt711_init,
 				.exit = sof_sdw_rt711_exit,
+				.rtd_init = rt711_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -696,6 +699,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
+				.rtd_init = rt_sdca_jack_rtd_init,
 			},
 			{
 				.direction = {true, false},
@@ -703,6 +707,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt712_spk_init,
+				.rtd_init = rt712_spk_rtd_init,
 			},
 		},
 		.dai_num = 2,
@@ -717,6 +722,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt712_sdca_dmic_init,
+				.rtd_init = rt712_sdca_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -732,6 +738,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
+				.rtd_init = rt_sdca_jack_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -746,6 +753,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt712_sdca_dmic_init,
+				.rtd_init = rt712_sdca_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -761,6 +769,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
+				.rtd_init = rt_amp_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -776,6 +785,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
+				.rtd_init = rt_amp_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -790,6 +800,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
+				.rtd_init = rt_amp_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -805,6 +816,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_sdca_init,
+				.rtd_init = rt715_sdca_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -820,6 +832,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_sdca_init,
+				.rtd_init = rt715_sdca_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -835,6 +848,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_init,
+				.rtd_init = rt715_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -850,6 +864,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_init,
+				.rtd_init = rt715_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -893,6 +908,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_maxim_init,
+				.rtd_init = maxim_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -906,6 +922,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_maxim_init,
+				.rtd_init = maxim_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -919,6 +936,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt5682_init,
+				.rtd_init = rt5682_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -932,6 +950,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_cs_amp_init,
+				.rtd_init = cs_spk_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -945,6 +964,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_cs42l42_init,
+				.rtd_init = cs42l42_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -959,6 +979,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_cs42l43_hs_init,
+				.rtd_init = cs42l43_hs_rtd_init,
 			},
 			{
 				.direction = {false, true},
@@ -966,6 +987,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_cs42l43_dmic_init,
+				.rtd_init = cs42l43_dmic_rtd_init,
 			},
 			{
 				.direction = {false, true},
@@ -1387,6 +1409,56 @@ static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 	}
 }
 
+static inline int find_codec_info_dai(const char *dai_name, int *dai_index)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
+				*dai_index = j;
+				return i;
+			}
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_sdw_codec_info *codec_info;
+	struct snd_soc_dai *dai;
+	int codec_index;
+	int dai_index;
+	int ret;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		codec_index = find_codec_info_dai(dai->name, &dai_index);
+		if (codec_index < 0)
+			return -EINVAL;
+
+		codec_info = &codec_info_list[codec_index];
+		/*
+		 * A codec dai can be connected to different dai links for capture and playback,
+		 * but we only need to call the rtd_init function once.
+		 * The rtd_init for each codec dai is independent. So, the order of rtd_init
+		 * doesn't matter.
+		 */
+		if (codec_info->dais[dai_index].rtd_init_done)
+			continue;
+		if (codec_info->dais[dai_index].rtd_init) {
+			ret = codec_info->dais[dai_index].rtd_init(rtd);
+			if (ret)
+				return ret;
+		}
+		codec_info->dais[dai_index].rtd_init_done = true;
+	}
+
+	return 0;
+}
+
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
 static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
@@ -1547,7 +1619,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 
 		init_dai_link(dev, dai_links + *link_index, be_id, name,
 			      playback, capture, cpus, cpu_dai_num, codecs, codec_num,
-			      NULL, &sdw_ops);
+			      sof_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -1880,6 +1952,7 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
 		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			codec_info_list[i].dais[j].rtd_init_done = false;
 			/* Check each dai in codec_info_lis to see if it is used in the link */
 			if (!codec_info_list[i].dais[j].exit)
 				continue;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index f16456945edb..ab444dae46ab 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -78,6 +78,8 @@ struct sof_sdw_dai_info {
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd);
+	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
 };
 
 struct sof_sdw_codec_info {
@@ -235,4 +237,22 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
+
+/* dai_link init callbacks */
+
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
+
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 22f4f9a19088..5d0915b72c7f 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -51,7 +51,7 @@ static const char * const jack_codecs[] = {
 	"cs42l42"
 };
 
-static int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -135,8 +135,6 @@ int sof_sdw_cs42l42_init(struct snd_soc_card *card,
 	if (!playback)
 		return 0;
 
-	dai_links->init = cs42l42_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 360f11b72aa2..7909ea9c9c14 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -50,7 +50,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 	},
 };
 
-static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -116,12 +116,11 @@ int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card, const struct snd_soc_acpi
 	 * No need to test if (!playback) like other codecs as cs42l43 uses separated dai for
 	 * playback and capture, and sof_sdw_cs42l43_init is only linked to the playback dai.
 	 */
-	dai_links->init = cs42l43_hs_rtd_init;
 
 	return 0;
 }
 
-static int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -150,7 +149,5 @@ int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card, const struct snd_soc_ac
 			      struct snd_soc_dai_link *dai_links, struct sof_sdw_codec_info *info,
 			      bool playback)
 {
-	dai_links->init = cs42l43_dmic_rtd_init;
-
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index f88c01552a92..56cf75bc6cc4 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -18,7 +18,7 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 };
 
-static int cs_spk_init(struct snd_soc_pcm_runtime *rtd)
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
@@ -67,7 +67,6 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 		return 0;
 
 	info->amp_num++;
-	dai_links->init = cs_spk_init;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index e36b8d8c70c9..034730432671 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -27,7 +27,7 @@ static const struct snd_kcontrol_new maxim_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
-static int spk_init(struct snd_soc_pcm_runtime *rtd)
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -145,8 +145,6 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       bool playback)
 {
 	info->amp_num++;
-	if (info->amp_num == 2)
-		dai_links->init = spk_init;
 
 	maxim_part_id = info->part_id;
 	switch (maxim_part_id) {
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 27aca76dbee4..4e3fcc861074 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -50,7 +50,7 @@ static const char * const jack_codecs[] = {
 	"rt5682"
 };
 
-static int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -134,8 +134,6 @@ int sof_sdw_rt5682_init(struct snd_soc_card *card,
 	if (!playback)
 		return 0;
 
-	dai_links->init = rt5682_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index d9a45392bbbf..781d41e35191 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -50,7 +50,7 @@ static const char * const jack_codecs[] = {
 	"rt700"
 };
 
-static int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -133,8 +133,6 @@ int sof_sdw_rt700_init(struct snd_soc_card *card,
 	if (!playback)
 		return 0;
 
-	dai_links->init = rt700_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 5d8f90f2bf55..cdd1587b246c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -74,7 +74,7 @@ static const char * const jack_codecs[] = {
 	"rt711"
 };
 
-static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -186,8 +186,6 @@ int sof_sdw_rt711_init(struct snd_soc_card *card,
 	}
 	ctx->headset_codec_dev = sdw_dev;
 
-	dai_links->init = rt711_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 27c924885ffc..dddb27e4c943 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -35,7 +35,7 @@ static const struct snd_kcontrol_new rt712_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-static int rt712_spk_init(struct snd_soc_pcm_runtime *rtd)
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -73,8 +73,6 @@ int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
 			   struct sof_sdw_codec_info *info,
 			   bool playback)
 {
-	dai_links->init = rt712_spk_init;
-
 	return 0;
 }
 
@@ -82,7 +80,7 @@ static const char * const dmics[] = {
 	"rt712-sdca-dmic"
 };
 
-static int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai;
@@ -108,8 +106,6 @@ int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
 				 struct sof_sdw_codec_info *info,
 				 bool playback)
 {
-	dai_links->init = rt712_sdca_dmic_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
index 7c068dc6b9cf..19194fe92b8e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715.c
@@ -11,7 +11,7 @@
 #include <sound/soc-acpi.h>
 #include "sof_sdw_common.h"
 
-static int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 
@@ -30,7 +30,5 @@ int sof_sdw_rt715_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
 {
-	dai_links->init = rt715_rtd_init;
-
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
index ca0cf3db2e4d..3089fa8450fa 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
@@ -11,7 +11,7 @@
 #include <sound/soc-acpi.h>
 #include "sof_sdw_common.h"
 
-static int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 
@@ -30,7 +30,5 @@ int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
 			    struct sof_sdw_codec_info *info,
 			    bool playback)
 {
-	dai_links->init = rt715_sdca_rtd_init;
-
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index a4414c9793b4..202edab95000 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -185,7 +185,7 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-static int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
@@ -295,7 +295,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 		return 0;
 
 	info->amp_num++;
-	dai_links->init = rt_amp_spk_rtd_init;
 
 	if (info->amp_num == 2) {
 		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 4f2e105a1124..5253d8332780 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -89,7 +89,7 @@ static const char * const jack_codecs[] = {
 	"rt711", "rt712", "rt713"
 };
 
-static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -219,8 +219,6 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 	}
 	ctx->headset_codec_dev = sdw_dev;
 
-	dai_links->init = rt_sdca_jack_rtd_init;
-
 	return 0;
 }
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

