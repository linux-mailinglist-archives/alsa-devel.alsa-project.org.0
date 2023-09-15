Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34CF7A17CD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3794CDF0;
	Fri, 15 Sep 2023 09:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3794CDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764308;
	bh=mw20YhJyAHc6SThIK0dBc6/8Yv71y25ywM0qfzjCdqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RM2QvwvYymrV3LXkLPWwkJiQrTUte3ZWiFekDxujbiTsRr82aj0Mlu+FJk07YHXBV
	 ClUdJSXVv++WtARqaK5X+cCIBGAXwZ5+DHMyAPMqRIiUpkSonYndiUPWexvI+qaYwN
	 utMheK6kMVnyI4LAAB6aXSEWRWsj/nS5IPCwfjgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CC9CF805B1; Fri, 15 Sep 2023 09:49:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0D89F805A9;
	Fri, 15 Sep 2023 09:49:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D82F805AE; Fri, 15 Sep 2023 09:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B2FFF80431
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B2FFF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kuL40a44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764147; x=1726300147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mw20YhJyAHc6SThIK0dBc6/8Yv71y25ywM0qfzjCdqo=;
  b=kuL40a44BepalTUZfF3QPQlPOLlTWcI2l7CvRGxK9jfbnkpBDiIYY31F
   SzGVWCNk4fiLCK6CDdU0UcuoStEoJy2ItsEgKYg28nCalbXkgFUgsr9su
   mmqkJ5apKfvoQsuhEOqTppKAjugWasjCBiJyIS1RXZDnsEU575uz4I7+I
   J/z2JnuPtyvx2XmnH4kzhSKokUMbn14pU5HvjpkZhWzbhqcek9XO6hZVo
   24Exs92wfQArriNKeTGN5r8jDkeRBop0ecNCC548Zu1BJhq9/4ZL8SGG6
   dnAgHrFatXIbug02ITzBWfDassqkJBML95zjpCvlZnDAX4dv28sgyrukN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376527551"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="376527551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779998539"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="779998539"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:47:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: intel: sof_sdw: Make create_sdw_dailink allocate
 link components
Date: Fri, 15 Sep 2023 15:56:10 +0800
Message-Id: <20230915075611.1619548-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
References: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7F5R3NORYKIAFABK7IVO366WC7IC3HX
X-Message-ID-Hash: F7F5R3NORYKIAFABK7IVO366WC7IC3HX
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7F5R3NORYKIAFABK7IVO366WC7IC3HX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Now only the SoundWire part of the code uses the global cpus array,
remove it and have create_sdw_dailink allocate its own link components.
This removes a lot of state being passed around in the driver, which
simplifies things a fair bit.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 65 ++++++++++----------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f64bf8b2377c..335048dfae53 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -20,7 +20,7 @@ static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
-#define INC_ID(BE, CPU, LINK)	do { (BE)++; (CPU)++; (LINK)++; } while (0)
+#define INC_ID(BE, LINK)	do { (BE)++; (LINK)++; } while (0)
 
 static void log_quirks(struct device *dev)
 {
@@ -1017,7 +1017,7 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
  */
 static int get_dailink_info(struct device *dev,
 			    const struct snd_soc_acpi_link_adr *adr_link,
-			    int *sdw_be_num, int *sdw_cpu_dai_num, int *codecs_num)
+			    int *sdw_be_num, int *codecs_num)
 {
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
@@ -1025,7 +1025,6 @@ static int get_dailink_info(struct device *dev,
 	int j;
 
 	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
-	*sdw_cpu_dai_num = 0;
 	*sdw_be_num  = 0;
 
 	if (!adr_link)
@@ -1074,8 +1073,6 @@ static int get_dailink_info(struct device *dev,
 					if (!codec_info->dais[j].direction[stream])
 						continue;
 
-					(*sdw_cpu_dai_num)++;
-
 					/* count BE for each non-aggregated slave or group */
 					if (!endpoint->aggregated || no_aggregation ||
 					    !group_visited[endpoint->group_id])
@@ -1332,11 +1329,9 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
 static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
-			      struct snd_soc_dai_link *dai_links,
-			      int sdw_be_num, int sdw_cpu_dai_num,
-			      struct snd_soc_dai_link_component *cpus,
+			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      int *cpu_id, struct snd_soc_codec_conf *codec_conf,
+			      struct snd_soc_codec_conf *codec_conf,
 			      int codec_count, int *be_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
@@ -1348,9 +1343,10 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	struct device *dev = card->dev;
 	const struct snd_soc_acpi_link_adr *adr_link_next;
 	struct snd_soc_dai_link_component *codecs;
+	struct snd_soc_dai_link_component *cpus;
 	struct sof_sdw_codec_info *codec_info;
 	int cpu_dai_id[SDW_MAX_CPU_DAIS];
-	int cpu_dai_num, cpu_dai_index;
+	int cpu_dai_num;
 	unsigned int group_id;
 	int codec_dlc_index = 0;
 	int codec_index;
@@ -1421,7 +1417,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	if (codec_info->ignore_pch_dmic)
 		*ignore_pch_dmic = true;
 
-	cpu_dai_index = *cpu_id;
 	for_each_pcm_streams(stream) {
 		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
@@ -1459,6 +1454,10 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		if (!name)
 			return -ENOMEM;
 
+		cpus = devm_kcalloc(dev, cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
+		if (!cpus)
+			return -ENOMEM;
+
 		/*
 		 * generate CPU DAI name base on the sdw link ID and
 		 * PIN ID with offset of 2 according to sdw dai driver.
@@ -1470,13 +1469,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			if (!cpu_name)
 				return -ENOMEM;
 
-			if (cpu_dai_index >= sdw_cpu_dai_num) {
-				dev_err(dev, "invalid cpu dai index %d\n",
-					cpu_dai_index);
-				return -EINVAL;
-			}
-
-			cpus[cpu_dai_index++].dai_name = cpu_name;
+			cpus[k].dai_name = cpu_name;
 		}
 
 		/*
@@ -1488,17 +1481,11 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			return -EINVAL;
 		}
 
-		if (*cpu_id >= sdw_cpu_dai_num) {
-			dev_err(dev, "invalid cpu dai index %d\n", *cpu_id);
-			return -EINVAL;
-		}
-
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
+
 		init_dai_link(dev, dai_links + *link_index, (*be_id)++, name,
-			      playback, capture,
-			      cpus + *cpu_id, cpu_dai_num,
-			      codecs, codec_num,
+			      playback, capture, cpus, cpu_dai_num, codecs, codec_num,
 			      NULL, &sdw_ops);
 
 		/*
@@ -1515,8 +1502,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			dev_err(dev, "failed to init codec %d\n", codec_index);
 			return ret;
 		}
-
-		*cpu_id += cpu_dai_num;
 	}
 
 	return 0;
@@ -1533,7 +1518,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_codec_conf *codec_conf;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
@@ -1545,15 +1529,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int num_links, link_index = 0;
 	char *name, *cpu_dai_name;
 	char *codec_name, *codec_dai_name;
-	int total_cpu_dai_num;
-	int sdw_cpu_dai_num;
 	int i, j, be_id = 0;
 	int codec_index;
-	int cpu_id = 0;
 	int ret;
 
-	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &sdw_cpu_dai_num,
-			       &codec_conf_num);
+	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
 	if (ret < 0) {
 		dev_err(dev, "failed to get sdw link info %d\n", ret);
 		return ret;
@@ -1596,12 +1576,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!dai_links)
 		return -ENOMEM;
 
-	/* allocated CPU DAIs */
-	total_cpu_dai_num = sdw_cpu_dai_num + ssp_num + dmic_num + hdmi_num + bt_num;
-	cpus = devm_kcalloc(dev, total_cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
-	if (!cpus)
-		return -ENOMEM;
-
 	/* allocate codec conf, will be populated when dailinks are created */
 	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
 				  GFP_KERNEL);
@@ -1663,8 +1637,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
 				ret = create_sdw_dailink(card, &link_index, dai_links,
-							 sdw_be_num, sdw_cpu_dai_num, cpus,
-							 adr_link, &cpu_id,
+							 sdw_be_num, adr_link,
 							 codec_conf, codec_conf_num,
 							 &be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
@@ -1712,7 +1685,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret < 0)
 			return ret;
 
-		INC_ID(be_id, cpu_id, link_index);
+		INC_ID(be_id, link_index);
 	}
 
 DMIC:
@@ -1730,7 +1703,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, cpu_id, link_index);
+		INC_ID(be_id, link_index);
 
 		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, "dmic16k",
 					   0, 1, // DMIC only supports capture
@@ -1740,7 +1713,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, cpu_id, link_index);
+		INC_ID(be_id, link_index);
 	}
 
 HDMI:
@@ -1765,7 +1738,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, cpu_id, link_index);
+		INC_ID(be_id, link_index);
 	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-- 
2.25.1

