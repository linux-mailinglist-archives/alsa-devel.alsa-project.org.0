Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD188C8B0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EFDC2C13;
	Tue, 26 Mar 2024 17:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EFDC2C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469518;
	bh=Mv4ouSSBc7noGQriz/pJ01JRgynIe96KuX9Wsjb+4qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmDPN6mqolzvky3yoyU05pvPq9XBMlpk8tMIllPt6nCHC4sYpfASRfk8e2nYnfUhV
	 RKlpWKzMjmexqsjbyZ/M28psoU85/rAKUL87Y1FTFVMq+5bRPCblgfkYUOndu2/2/9
	 UN+TPR1BCH/W/RGHn4qEkBwnqIajXtNeDhW9T1aY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C7EF896EB; Tue, 26 Mar 2024 17:07:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68046F805F8;
	Tue, 26 Mar 2024 17:07:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4949AF805AB; Tue, 26 Mar 2024 17:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 518CEF805FB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 518CEF805FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GdpJ3udt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469148; x=1743005148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mv4ouSSBc7noGQriz/pJ01JRgynIe96KuX9Wsjb+4qw=;
  b=GdpJ3udt/1TMUSzKBMvl4WHDSGzQ6WeNNaVSQBk+C9pd5NoMgInKtnI5
   ZpHsjqHWgMQSHJnovOdto54psnsrGcX5i+rLCJkoBeqm+sgBmslimaKdU
   Dr9P40ehctKhs7GHj29m9rbuzoA1fJP/VqIwyBUXlPiFDduLGUpgwVLvr
   aSL6kD9wEMigN/ybm48ERTO/Y+HwszPuV6CYp4itFvlJ+kQQq14u+C07Q
   BELMonV9kfbLlR3YlutAcuV9Z+c+eEF96niCkErTBYZtTW8xsEhHu2VwK
   UofeCtQybrtLudByzDfjfWpRUSDZY+/NVQpRahax1UX4/1GbWtNLxW0Wg
   A==;
X-CSE-ConnectionGUID: ZNzxlD2+QzS3xIPZXO7aUA==
X-CSE-MsgGUID: m5pkAj3nRjWdCRygwpMevA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260484"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260484"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482357"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/34] ASoC: Intel: sof_sdw: Move generation of DAI links to
 new parsing
Date: Tue, 26 Mar 2024 11:04:17 -0500
Message-Id: <20240326160429.13560-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BEAXBEIG6IAKQZPRT3P5MZEP63WX6AMI
X-Message-ID-Hash: BEAXBEIG6IAKQZPRT3P5MZEP63WX6AMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEAXBEIG6IAKQZPRT3P5MZEP63WX6AMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The only part left using the old parsing code is now the generation of
the actual DAI links. Move this generation over to being based on the
new parsing, which allows the removal of the last of the old parsing
code.

The new DAI link generation is a simple matter of creating a new DAI
link for each sof_sdw_dailink struct, and adding a cpu, a codec, and
a mapping for each sof_sdw_endpoint contained in that sof_sdw_dailink.
Note that the CPUs can be inferred as the endpoint list is iterated,
because the endpoints were added into the list sorted by link.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 340 +++++++------------------------
 1 file changed, 78 insertions(+), 262 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 89ce77961634..9f1c49df9cd2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1234,129 +1234,6 @@ static const char *get_codec_name(struct device *dev,
 	return NULL;
 }
 
-static int fill_sdw_codec_dlc(struct device *dev,
-			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_dai_link_component *codec,
-			      int adr_index, int dai_index)
-{
-	u64 adr = adr_link->adr_d[adr_index].adr;
-	struct sof_sdw_codec_info *codec_info;
-
-	codec_info = find_codec_info_part(adr);
-	if (!codec_info)
-		return -EINVAL;
-
-	codec->name = get_codec_name(dev, codec_info, adr_link, adr_index);
-	if (!codec->name)
-		return -ENOMEM;
-
-	codec->dai_name = codec_info->dais[dai_index].dai_name;
-
-	return 0;
-}
-
-static int set_codec_init_func(struct snd_soc_card *card,
-			       const struct snd_soc_acpi_link_adr *adr_link,
-			       struct snd_soc_dai_link *dai_links,
-			       bool playback, int group_id, int adr_index, int dai_index)
-{
-	int i = adr_index;
-
-	do {
-		/*
-		 * Initialize the codec. If codec is part of an aggregated
-		 * group (group_id>0), initialize all codecs belonging to
-		 * same group.
-		 * The first link should start with adr_link->adr_d[adr_index]
-		 * because that is the device that we want to initialize and
-		 * we should end immediately if it is not aggregated (group_id=0)
-		 */
-		for ( ; i < adr_link->num_adr; i++) {
-			struct sof_sdw_codec_info *codec_info;
-
-			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			/* The group_id is > 0 iff the codec is aggregated */
-			if (adr_link->adr_d[i].endpoints->group_id != group_id)
-				continue;
-
-			if (codec_info->dais[dai_index].init)
-				codec_info->dais[dai_index].init(card,
-								 adr_link,
-								 dai_links,
-								 codec_info,
-								 playback);
-			if (!group_id)
-				return 0;
-		}
-
-		i = 0;
-		adr_link++;
-	} while (adr_link->mask);
-
-	return 0;
-}
-
-/*
- * check endpoint status in slaves and gather link ID for all slaves in
- * the same group to generate different CPU DAI. Now only support
- * one sdw link with all slaves set with only single group id.
- *
- * one slave on one sdw link with aggregated = 0
- * one sdw BE DAI <---> one-cpu DAI <---> one-codec DAI
- *
- * two or more slaves on one sdw link with aggregated = 0
- * one sdw BE DAI  <---> one-cpu DAI <---> multi-codec DAIs
- *
- * multiple links with multiple slaves with aggregated = 1
- * one sdw BE DAI  <---> 1 .. N CPU DAIs <----> 1 .. N codec DAIs
- */
-static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
-			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
-			  int *codec_num, unsigned int *group_id,
-			  int adr_index)
-{
-	int i;
-
-	if (!adr_link->adr_d[adr_index].endpoints->aggregated) {
-		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
-		*cpu_dai_num = 1;
-		*codec_num = 1;
-		*group_id = 0;
-		return 0;
-	}
-
-	*codec_num = 0;
-	*cpu_dai_num = 0;
-	*group_id = adr_link->adr_d[adr_index].endpoints->group_id;
-
-	/* Count endpoints with the same group_id in the adr_link */
-	for (; adr_link && adr_link->num_adr; adr_link++) {
-		unsigned int link_codecs = 0;
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			if (adr_link->adr_d[i].endpoints->aggregated &&
-			    adr_link->adr_d[i].endpoints->group_id == *group_id)
-				link_codecs++;
-		}
-
-		if (link_codecs) {
-			*codec_num += link_codecs;
-
-			if (*cpu_dai_num >= SDW_MAX_CPU_DAIS) {
-				dev_err(dev, "cpu_dai_id array overflowed\n");
-				return -EINVAL;
-			}
-
-			cpu_dai_id[(*cpu_dai_num)++] = ffs(adr_link->mask) - 1;
-		}
-	}
-
-	return 0;
-}
-
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_sdw_codec_info *codec_info;
@@ -1563,135 +1440,102 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
+			      struct sof_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
-			      const struct snd_soc_acpi_link_adr *adr_link,
-			      int *be_id, int adr_index, int dai_index)
+			      int *be_id)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
-	const struct snd_soc_acpi_link_adr *adr_link_next;
-	struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
-	struct snd_soc_dai_link_component *codecs;
-	struct snd_soc_dai_link_component *cpus;
-	struct sof_sdw_codec_info *codec_info;
-	int cpu_dai_id[SDW_MAX_CPU_DAIS];
-	int cpu_dai_num;
-	unsigned int group_id;
-	int codec_dlc_index = 0;
-	int codec_num;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct sof_sdw_endpoint *sof_end;
 	int stream;
-	int i = 0;
-	int j, k;
-	int ret;
-
-	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
-			     &group_id, adr_index);
-	if (ret)
-		return ret;
-
-	codecs = devm_kcalloc(dev, codec_num, sizeof(*codecs), GFP_KERNEL);
-	if (!codecs)
-		return -ENOMEM;
-
-	sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
-					 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
-	if (!sdw_codec_ch_maps)
-		return -ENOMEM;
-
-	/* generate codec name on different links in the same group */
-	j = adr_index;
-	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
-	     i < cpu_dai_num; adr_link_next++) {
-		/* skip the link excluded by this processed group */
-		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
-			continue;
-
-		/* j reset after loop, adr_index only applies to first link */
-		for (; j < adr_link_next->num_adr && codec_dlc_index < codec_num; j++) {
-			const struct snd_soc_acpi_endpoint *endpoints;
-
-			endpoints = adr_link_next->adr_d[j].endpoints;
-
-			if (group_id && (!endpoints->aggregated ||
-					 endpoints->group_id != group_id))
-				continue;
-
-			ret = fill_sdw_codec_dlc(dev, adr_link_next,
-						 &codecs[codec_dlc_index],
-						 j, dai_index);
-			if (ret)
-				return ret;
-
-			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
-			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
-
-			codec_dlc_index++;
-		}
-		j = 0;
-
-		/* check next link to create codec dai in the processed group */
-		i++;
-	}
-
-	/* find codec info to create BE DAI */
-	codec_info = find_codec_info_part(adr_link->adr_d[adr_index].adr);
-	if (!codec_info)
-		return -EINVAL;
 
 	for_each_pcm_streams(stream) {
-		char *name, *cpu_name;
-		int playback, capture;
 		static const char * const sdw_stream_name[] = {
 			"SDW%d-Playback",
 			"SDW%d-Capture",
 			"SDW%d-Playback-%s",
 			"SDW%d-Capture-%s",
 		};
+		struct snd_soc_dai_link_ch_map *codec_maps;
+		struct snd_soc_dai_link_component *codecs;
+		struct snd_soc_dai_link_component *cpus;
+		int num_cpus = hweight32(sof_dai->link_mask[stream]);
+		int num_codecs = sof_dai->num_devs[stream];
+		int playback, capture;
+		int cur_link = 0;
+		int i = 0, j = 0;
+		char *name;
 
-		if (!codec_info->dais[dai_index].direction[stream])
+		if (!sof_dai->num_devs[stream])
 			continue;
 
-		*be_id = codec_info->dais[dai_index].dailink[stream];
+		sof_end = list_first_entry(&sof_dai->endpoints,
+					   struct sof_sdw_endpoint, list);
+
+		*be_id = sof_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
 			dev_err(dev, "Invalid dailink id %d\n", *be_id);
 			return -EINVAL;
 		}
 
 		/* create stream name according to first link id */
-		if (ctx->append_dai_type) {
+		if (ctx->append_dai_type)
 			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream + 2], cpu_dai_id[0],
-					      type_strings[codec_info->dais[dai_index].dai_type]);
-		} else {
+					      sdw_stream_name[stream + 2],
+					      ffs(sof_end->link_mask) - 1,
+					      type_strings[sof_end->dai_info->dai_type]);
+		else
 			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream], cpu_dai_id[0]);
-		}
+					      sdw_stream_name[stream],
+					      ffs(sof_end->link_mask) - 1);
 		if (!name)
 			return -ENOMEM;
 
-		cpus = devm_kcalloc(dev, cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
+		cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
 		if (!cpus)
 			return -ENOMEM;
 
-		/*
-		 * generate CPU DAI name base on the sdw link ID and
-		 * PIN ID with offset of 2 according to sdw dai driver.
-		 */
-		for (k = 0; k < cpu_dai_num; k++) {
-			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
-						  "SDW%d Pin%d", cpu_dai_id[k],
-						  ctx->sdw_pin_index[cpu_dai_id[k]]++);
-			if (!cpu_name)
-				return -ENOMEM;
-
-			cpus[k].dai_name = cpu_name;
+		codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
+		if (!codecs)
+			return -ENOMEM;
+
+		codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
+		if (!codec_maps)
+			return -ENOMEM;
+
+		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+			if (!sof_end->dai_info->direction[stream])
+				continue;
+
+			if (cur_link != sof_end->link_mask) {
+				int link_num = ffs(sof_end->link_mask) - 1;
+				int pin_num = ctx->sdw_pin_index[link_num]++;
+
+				cur_link = sof_end->link_mask;
+
+				cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "SDW%d Pin%d",
+								  link_num, pin_num);
+				if (!cpus[i].dai_name)
+					return -ENOMEM;
+				i++;
+			}
+
+			codec_maps[j].cpu = i - 1;
+			codec_maps[j].codec = j;
+
+			codecs[j].name = sof_end->codec_name;
+			codecs[j].dai_name = sof_end->dai_info->dai_name;
+			j++;
 		}
 
+		WARN_ON(i != num_cpus || j != num_codecs);
+
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
 
 		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
-			      cpus, cpu_dai_num, codecs, codec_num,
+			      cpus, num_cpus, codecs, num_codecs,
 			      sof_sdw_rtd_init, &sdw_ops);
 
 		/*
@@ -1699,13 +1543,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
 		(*dai_links)->nonatomic = true;
-		(*dai_links)->ch_maps = sdw_codec_ch_maps;
+		(*dai_links)->ch_maps = codec_maps;
 
-		ret = set_codec_init_func(card, adr_link, *dai_links,
-					  playback, group_id, adr_index, dai_index);
-		if (ret < 0) {
-			dev_err(dev, "failed to init codec 0x%x\n", codec_info->part_id);
-			return ret;
+		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+			if (sof_end->dai_info->init)
+				sof_end->dai_info->init(card, sof_end->adr_link,
+							*dai_links,
+							sof_end->codec_info,
+							playback);
 		}
 
 		(*dai_links)++;
@@ -1839,18 +1684,15 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, bt_num = 0;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	struct snd_soc_codec_conf *codec_conf;
-	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
 	struct sof_sdw_endpoint *sof_ends;
 	struct sof_sdw_dailink *sof_dais;
 	int num_devs = 0;
 	int num_ends = 0;
-	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
-	int i, j, be_id = 0;
+	int i, be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
 	int ret;
@@ -1939,44 +1781,18 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
 	/* generate DAI links by each sdw link */
-	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
-		for (i = 0; i < adr_link->num_adr; i++) {
-			const struct snd_soc_acpi_endpoint *endpoint;
+	while (sof_dais->initialised) {
+		int current_be_id;
 
-			endpoint = adr_link->adr_d[i].endpoints;
+		ret = create_sdw_dailink(card, sof_dais, &dai_links, &current_be_id);
+		if (ret)
+			goto err_end;
 
-			/* this group has been generated */
-			if (endpoint->aggregated &&
-			    group_generated[endpoint->group_id])
-				continue;
+		/* Update the be_id to match the highest ID used for SDW link */
+		if (be_id < current_be_id)
+			be_id = current_be_id;
 
-			/* find codec info to get dai_num */
-			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info) {
-				ret = -EINVAL;
-				goto err_end;
-			}
-
-			for (j = 0; j < codec_info->dai_num ; j++) {
-				int current_be_id;
-
-				ret = create_sdw_dailink(card, &dai_links, adr_link,
-							 &current_be_id, i, j);
-				if (ret < 0) {
-					dev_err(dev,
-						"failed to create dai link %d on 0x%x\n",
-						j, codec_info->part_id);
-					return ret;
-				}
-
-				/* Update the be_id to match the highest ID used for SDW link */
-				if (be_id < current_be_id)
-					be_id = current_be_id;
-			}
-
-			if (endpoint->aggregated)
-				group_generated[endpoint->group_id] = true;
-		}
+		sof_dais++;
 	}
 
 SSP:
-- 
2.40.1

