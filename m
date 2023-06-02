Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C5720A38
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE08D82B;
	Fri,  2 Jun 2023 22:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE08D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737510;
	bh=m89oFciJ85pcKOqmt5AKh6rHY4CxFKkCqy+uvw+r5zI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FEBId0FPiKpyVKd14QstOtNYXpt8faHiuSq/53SWKAuXc3UNnOqGgkGFjWQD5dycc
	 JlLBlBRWfJjPiCPzriZ0n2HhxqT7XaYLkXEbtz+0A6xbaepKZuejJAZ80ZVPqbhVPi
	 4cowPD6C4tg+wA8smRVdXuB8SIcUgBDLipie4wgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 614E7F805BD; Fri,  2 Jun 2023 22:23:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A03F804DA;
	Fri,  2 Jun 2023 22:23:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB59F805BD; Fri,  2 Jun 2023 22:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEAA2F8016B
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEAA2F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TeymumZ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737387; x=1717273387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m89oFciJ85pcKOqmt5AKh6rHY4CxFKkCqy+uvw+r5zI=;
  b=TeymumZ16hsix8td4YEvnCETBbea6gIIX7Tr/kkroFFeRV0hHvr2xZY9
   ZXu1Eic17H8DKvcMB9l2ebcTuUmGpQECkzf5AwkSFkp3oFQIaHIUbSXMA
   CAeQLLizZ3rSc1gTRXh4HZ47V8eEbQEGJXrkn7W1sWZfWxvjgGAUW9Fd2
   YDvlVRcoInG/CVgC8Fco/37iYzCWFoL+4hNplmHJA+GF6pod/XQ/2jMco
   AJ8DF91fu8sbHv0E9oVtP+lZSUuhyZVJl/85ZiRYaz/HM8EfXpcqCCyGD
   xcHjz1ExGzbtUeg2xz+dA/7Cb5BXtyAttqo9rQQl3zecYwYBWGkc6YXXz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811205"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811205"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020007"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020007"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/28] ASoC: Intel: sof_sdw: use predefine dailink id
Date: Fri,  2 Jun 2023 15:22:00 -0500
Message-Id: <20230602202225.249209-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DOWZ36OPFRKWE22QK3I5I5TLX3EDO4KK
X-Message-ID-Hash: DOWZ36OPFRKWE22QK3I5I5TLX3EDO4KK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOWZ36OPFRKWE22QK3I5I5TLX3EDO4KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we assign dailink ids in order, and shift with codec type.
The purpose is to have consistent dailink ids for topologies.
This can be simplified if we have a predefined dailink id in
sof_sdw_dai_info.
We reuse the existing ids as the predefine ids. So the dailink ids will
not be changed by this commit.
With this change, we no longer need to check the adr order described in a
snd_soc_acpi_link_adr array.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 42 +++++++++++++------------
 sound/soc/intel/boards/sof_sdw_common.h |  7 ++++-
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cf12f1ae67c1..1df489c7e2bd 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -568,6 +568,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt700-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt700_init,
 			},
 		},
@@ -582,6 +583,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt711-sdca-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt711_sdca_init,
 				.exit = sof_sdw_rt711_sdca_exit,
 			},
@@ -597,6 +599,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt711-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt711_init,
 				.exit = sof_sdw_rt711_exit,
 			},
@@ -612,6 +615,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, false},
 				.dai_name = "rt1308-aif",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 			},
@@ -627,6 +631,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt1316-aif",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 			},
@@ -641,6 +646,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt1318-aif",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 			},
@@ -657,6 +663,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_sdca_init,
 			},
 		},
@@ -672,6 +679,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_sdca_init,
 			},
 		},
@@ -687,6 +695,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_init,
 			},
 		},
@@ -702,6 +711,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_rt715_init,
 			},
 		},
@@ -715,6 +725,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "max98373-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_mx8373_init,
 			},
 		},
@@ -728,6 +739,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "rt5682-sdw",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt5682_init,
 			},
 		},
@@ -742,6 +754,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = NULL,
 			},
 		},
@@ -756,6 +769,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = NULL,
 			},
 		},
@@ -770,6 +784,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {true, false},
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = NULL,
 			},
 		},
@@ -784,6 +799,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.direction = {false, true},
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = NULL,
 			},
 		},
@@ -840,7 +856,6 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 				int *sdw_be_num, int *sdw_cpu_dai_num)
 {
 	const struct snd_soc_acpi_link_adr *link;
-	int _codec_type = SOF_SDW_CODEC_TYPE_JACK;
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
 	int i;
@@ -867,12 +882,6 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 			if (codec_index < 0)
 				return codec_index;
 
-			if (codec_info_list[codec_index].codec_type < _codec_type)
-				dev_warn(dev,
-					 "Unexpected address table ordering. Expected order: jack -> amp -> mic\n");
-
-			_codec_type = codec_info_list[codec_index].codec_type;
-
 			endpoint = link->adr_d[i].endpoints;
 
 			/* count DAI number for playback and capture */
@@ -1227,19 +1236,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	if (codec_info_list[codec_index].ignore_pch_dmic)
 		*ignore_pch_dmic = true;
 
-	/* Shift the first amplifier's *link_id to SDW_AMP_DAI_ID */
-	if (codec_info_list[codec_index].codec_type == SOF_SDW_CODEC_TYPE_AMP &&
-	    *link_id < SDW_AMP_DAI_ID)
-		*link_id = SDW_AMP_DAI_ID;
-
-	/*
-	 * DAI ID is fixed at SDW_DMIC_DAI_ID for MICs to
-	 * keep sdw DMIC and HDMI setting static in UCM
-	 */
-	if (codec_info_list[codec_index].codec_type == SOF_SDW_CODEC_TYPE_MIC &&
-	    *link_id < SDW_DMIC_DAI_ID)
-		*link_id = SDW_DMIC_DAI_ID;
-
 	cpu_dai_index = *cpu_id;
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
@@ -1254,6 +1250,12 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!codec_info_list[codec_index].dais[0].direction[stream])
 			continue;
 
+		*link_id = codec_info_list[codec_index].dais[0].dailink[stream];
+		if (*link_id < 0) {
+			dev_err(dev, "Invalid dailink id %d\n", *link_id);
+			return -EINVAL;
+		}
+
 		/* create stream name according to first link id */
 		if (append_codec_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e6d539bd63ec..def2d47323bf 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -15,7 +15,11 @@
 
 #define MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
-#define SDW_AMP_DAI_ID 2
+#define SDW_UNUSED_DAI_ID -1
+#define SDW_JACK_OUT_DAI_ID 0
+#define SDW_JACK_IN_DAI_ID 1
+#define SDW_AMP_OUT_DAI_ID 2
+#define SDW_AMP_IN_DAI_ID 3
 #define SDW_DMIC_DAI_ID 4
 #define SDW_MAX_CPU_DAIS 16
 #define SDW_INTEL_BIDIR_PDI_BASE 2
@@ -68,6 +72,7 @@ struct sof_sdw_dai_info {
 	const bool direction[2]; /* playback & capture support */
 	const char *dai_name;
 	const int dai_type;
+	const int dailink[2]; /* dailink id for each direction */
 	int  (*init)(struct snd_soc_card *card,
 		     const struct snd_soc_acpi_link_adr *link,
 		     struct snd_soc_dai_link *dai_links,
-- 
2.37.2

