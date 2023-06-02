Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33573720A5D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866D0DF4;
	Fri,  2 Jun 2023 22:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866D0DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737911;
	bh=McsUco36ncHafwchx/PozhomMpOh7lN7DLArFcMZJuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pThwCNOaYaCE98W9BU8e20Sz4vsqzUVfzbhAGM1MjQGcLI8woClZsb7kx6FBH9apa
	 aVAuGOtqimrGqQjrcBOjdfRvpTFQtdelTsiSo/pUq/BIRrlOrQ9GNWsEJSsJ79yjo+
	 MYEILPgPcOQ2IJ6BqKXP04YKWLCYHD7xK5NPWCCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AB20F8059F; Fri,  2 Jun 2023 22:25:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E93F805AC;
	Fri,  2 Jun 2023 22:25:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D272AF8059F; Fri,  2 Jun 2023 22:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DDCEF80494
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DDCEF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L2qX5ji9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737388; x=1717273388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=McsUco36ncHafwchx/PozhomMpOh7lN7DLArFcMZJuE=;
  b=L2qX5ji9FY9wuPQFb2aoEU4Y96/7wyk9adBuVwTdAjC+RNydV9M0Ww2k
   qUrCAMhQhM/t0h8jEYXaV0luTZ8Y9Zi6XesVAcuDs3yBhL5F6y72KKkGu
   6Ts411eaz6iaDaOpZgfKjzLt+I/45SD0/I7yCgkyaIRmTBgwrwUMSzajT
   WwLTwiJFNmGPqeyvoH3vgamzjHTS3wrMdOEFzD+8rAVSv+qz0MjI4VtMg
   IYCq0LiYKxB2NNbEjoa7j9zXu4WW7kMM/Gu9Re7QZcl97Hte3jOA0+wp6
   1l7hITDG64JtHi2P3OaACwjy6FkfqqSW8nZREEndegc8M5qFshXe9n8XM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811217"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811217"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020012"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020012"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/28] ASoC: Intel: sof_sdw: add multi dailink support for a
 codec
Date: Fri,  2 Jun 2023 15:22:03 -0500
Message-Id: <20230602202225.249209-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QHP3TAQDQCLCL4L6RDW3OTPRVVAGXCXH
X-Message-ID-Hash: QHP3TAQDQCLCL4L6RDW3OTPRVVAGXCXH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHP3TAQDQCLCL4L6RDW3OTPRVVAGXCXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

A codec may support multiple dais for different purpose. For example,
the rt712 codec supports jack and amp on different dais and machine
driver needs to create different dailink for those dais.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 129 +++++++++++++++++++++----------
 1 file changed, 89 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6c4c05addb50..8405c3231448 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -843,6 +843,7 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
 	int i;
+	int j;
 
 	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	*sdw_cpu_dai_num = 0;
@@ -870,17 +871,19 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 
 			endpoint = link->adr_d[i].endpoints;
 
-			/* count DAI number for playback and capture */
-			for_each_pcm_streams(stream) {
-				if (!codec_info->dais[0].direction[stream])
-					continue;
+			for (j = 0; j < codec_info->dai_num; j++) {
+				/* count DAI number for playback and capture */
+				for_each_pcm_streams(stream) {
+					if (!codec_info->dais[j].direction[stream])
+						continue;
 
-				(*sdw_cpu_dai_num)++;
+					(*sdw_cpu_dai_num)++;
 
-				/* count BE for each non-aggregated slave or group */
-				if (!endpoint->aggregated || no_aggregation ||
-				    !group_visited[endpoint->group_id])
-					(*sdw_be_num)++;
+					/* count BE for each non-aggregated slave or group */
+					if (!endpoint->aggregated || no_aggregation ||
+					    !group_visited[endpoint->group_id])
+						(*sdw_be_num)++;
+				}
 			}
 
 			if (endpoint->aggregated)
@@ -956,7 +959,8 @@ static int create_codec_dai_name(struct device *dev,
 				 struct snd_soc_codec_conf *codec_conf,
 				 int codec_count,
 				 int *codec_conf_index,
-				 int adr_index)
+				 int adr_index,
+				 int dai_index)
 {
 	int _codec_index = -1;
 	int i;
@@ -1012,7 +1016,7 @@ static int create_codec_dai_name(struct device *dev,
 		_codec_index = codec_index;
 
 		codec[comp_index].dai_name =
-			codec_info_list[codec_index].dais[0].dai_name;
+			codec_info_list[codec_index].dais[dai_index].dai_name;
 
 		codec_conf[*codec_conf_index].dlc = codec[comp_index];
 		codec_conf[*codec_conf_index].name_prefix = link->adr_d[i].name_prefix;
@@ -1026,7 +1030,7 @@ static int create_codec_dai_name(struct device *dev,
 static int set_codec_init_func(struct snd_soc_card *card,
 			       const struct snd_soc_acpi_link_adr *link,
 			       struct snd_soc_dai_link *dai_links,
-			       bool playback, int group_id, int adr_index)
+			       bool playback, int group_id, int adr_index, int dai_index)
 {
 	int i = adr_index;
 
@@ -1046,11 +1050,13 @@ static int set_codec_init_func(struct snd_soc_card *card,
 
 			if (codec_index < 0)
 				return codec_index;
+
 			/* The group_id is > 0 iff the codec is aggregated */
 			if (link->adr_d[i].endpoints->group_id != group_id)
 				continue;
-			if (codec_info_list[codec_index].dais[0].init)
-				codec_info_list[codec_index].dais[0].init(card,
+
+			if (codec_info_list[codec_index].dais[dai_index].init)
+				codec_info_list[codec_index].dais[dai_index].init(card,
 						link,
 						dai_links,
 						&codec_info_list[codec_index],
@@ -1166,7 +1172,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
 			      bool append_dai_type,
-			      int adr_index)
+			      int adr_index,
+			      int dai_index)
 {
 	const struct snd_soc_acpi_link_adr *link_next;
 	struct snd_soc_dai_link_component *codecs;
@@ -1206,7 +1213,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			continue;
 
 		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx,
-					    codec_conf, codec_count, codec_conf_index, adr_index);
+					    codec_conf, codec_count, codec_conf_index,
+					    adr_index, dai_index);
 		if (ret < 0)
 			return ret;
 
@@ -1235,10 +1243,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			"SDW%d-Capture-%s",
 		};
 
-		if (!codec_info->dais[0].direction[stream])
+		if (!codec_info->dais[dai_index].direction[stream])
 			continue;
 
-		*link_id = codec_info->dais[0].dailink[stream];
+		*link_id = codec_info->dais[dai_index].dailink[stream];
 		if (*link_id < 0) {
 			dev_err(dev, "Invalid dailink id %d\n", *link_id);
 			return -EINVAL;
@@ -1248,7 +1256,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream + 2], cpu_dai_id[0],
-					      type_strings[codec_info->dais[0].dai_type]);
+					      type_strings[codec_info->dais[dai_index].dai_type]);
 		} else {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream], cpu_dai_id[0]);
@@ -1305,7 +1313,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		dai_links[*link_index].nonatomic = true;
 
 		ret = set_codec_init_func(card, link, dai_links + (*link_index)++,
-					  playback, group_id, adr_index);
+					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec %d", codec_index);
 			return ret;
@@ -1328,6 +1336,7 @@ static int sof_card_codec_conf_alloc(struct device *dev,
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct snd_soc_codec_conf *c_conf;
 	int num_codecs = 0;
+	int codec_index;
 	int i;
 
 	adr_link = mach_params->links;
@@ -1342,8 +1351,11 @@ static int sof_card_codec_conf_alloc(struct device *dev,
 					adr_link->adr_d[i].adr);
 				return -EINVAL;
 			}
+			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (codec_index < 0)
+				return codec_index;
+			num_codecs += codec_info_list[codec_index].dai_num;
 		}
-		num_codecs += adr_link->num_adr;
 	}
 
 	c_conf = devm_kzalloc(dev, num_codecs * sizeof(*c_conf), GFP_KERNEL);
@@ -1380,6 +1392,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	int total_cpu_dai_num;
 	int sdw_cpu_dai_num;
 	int i, j, be_id = 0;
+	int codec_index;
 	int cpu_id = 0;
 	int comp_num;
 	int ret;
@@ -1468,6 +1481,14 @@ static int sof_card_dai_links_create(struct device *dev,
 		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
 		 */
 		for (i = 0; i < adr_link->num_adr; i++) {
+			/* find codec info to get dai_num */
+			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (codec_index < 0)
+				return codec_index;
+			if (codec_info_list[codec_index].dai_num > 1) {
+				append_dai_type = true;
+				goto out;
+			}
 			for (j = 0; j < i; j++) {
 				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
 				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
@@ -1498,15 +1519,22 @@ static int sof_card_dai_links_create(struct device *dev,
 			    group_generated[endpoint->group_id])
 				continue;
 
-			ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
-						 sdw_cpu_dai_num, cpus, adr_link,
-						 &cpu_id, group_generated,
-						 codec_conf, codec_conf_count,
-						 &be_id, &codec_conf_index,
-						 &ignore_pch_dmic, append_dai_type, i);
-			if (ret < 0) {
-				dev_err(dev, "failed to create dai link %d", link_index);
-				return ret;
+			/* find codec info to get dai_num */
+			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (codec_index < 0)
+				return codec_index;
+
+			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
+				ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
+							 sdw_cpu_dai_num, cpus, adr_link,
+							 &cpu_id, group_generated,
+							 codec_conf, codec_conf_count,
+							 &be_id, &codec_conf_index,
+							 &ignore_pch_dmic, append_dai_type, i, j);
+				if (ret < 0) {
+					dev_err(dev, "failed to create dai link %d", link_index);
+					return ret;
+				}
 			}
 		}
 	}
@@ -1545,6 +1573,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		ssp_components->name = codec_name;
+		/* TODO: support multi codec dai on SSP when it is needed */
 		ssp_components->dai_name = info->dais[0].dai_name;
 		cpus[cpu_id].dai_name = cpu_name;
 
@@ -1686,6 +1715,24 @@ static struct snd_soc_card card_sof_sdw = {
 	.late_probe = sof_sdw_card_late_probe,
 };
 
+/* helper to get the link that the codec DAI is used */
+static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
+						       const char *dai_name)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+	int j;
+
+	for_each_card_prelinks(card, i, link) {
+		for (j = 0; j < link->num_codecs; j++) {
+			/* Check each codec in a link */
+			if (!strcmp(link->codecs[j].dai_name, dai_name))
+				return link;
+		}
+	}
+	return NULL;
+}
+
 static void mc_dailink_exit_loop(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -1693,16 +1740,18 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 	int i, j;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		if (!codec_info_list[i].dais[0].exit)
-			continue;
-		/*
-		 * We don't need to call .exit function if there is no matched
-		 * dai link found.
-		 */
-		for_each_card_prelinks(card, j, link) {
-			if (!strcmp(link->codecs[0].dai_name,
-				    codec_info_list[i].dais[0].dai_name)) {
-				ret = codec_info_list[i].dais[0].exit(card, link);
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			/* Check each dai in codec_info_lis to see if it is used in the link */
+			if (!codec_info_list[i].dais[j].exit)
+				continue;
+			/*
+			 * We don't need to call .exit function if there is no matched
+			 * dai link found.
+			 */
+			link = mc_find_codec_dai_used(card, codec_info_list[i].dais[j].dai_name);
+			if (link) {
+				/* Do the .exit function if the codec dai is used in the link */
+				ret = codec_info_list[i].dais[j].exit(card, link);
 				if (ret)
 					dev_warn(card->dev,
 						 "codec exit failed %d\n",
-- 
2.37.2

