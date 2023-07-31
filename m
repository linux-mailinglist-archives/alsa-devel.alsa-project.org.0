Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6E76A34B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64F8E87;
	Mon, 31 Jul 2023 23:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64F8E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840167;
	bh=/W11xp7F8atWHeOawi4w/wG5hKRsAAvegMWkPEhTRlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j1KwdLyI5DvD5R2JzaGyiVyd1s2s/919SNmOnqVZGSKXH9xpklMJ8w56SkzuX7n5t
	 xiDS2dWOcUU+oaukup30j2cuS+YgCD1dO++im/O4Qr6djRKb0IrQFs/FIMxxEC2FEn
	 k+QTI4O6u1+RGuSSKfNgEKEXhMviqZ5r5eJguxAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B97AAF80544; Mon, 31 Jul 2023 23:44:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1260F8063C;
	Mon, 31 Jul 2023 23:44:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E2DF805B5; Mon, 31 Jul 2023 23:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14E10F80520
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E10F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OjA9oR89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839798; x=1722375798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/W11xp7F8atWHeOawi4w/wG5hKRsAAvegMWkPEhTRlg=;
  b=OjA9oR897FAw6U5xz3r+kSakzol0Lk5CZXIygZO9QQq8LFZMhEZ9/wMq
   YgcqVFLFRcCSY0RQ6izKWCo+8tyf+U5oxDUc0BTK39M2o0LGgHKQsivoH
   Nbh3wjH3pHL3RfBO6ShN37LLR2itVfs0X1VgIbj0V8nVjBtEI9f4psmdo
   FCE8vmGm7wDsvtA3+k6P7WNjy1uX6ZNUoaQsxRrCudhHZyhtMKtEcLauQ
   EybrWFFZGFKjHdI4CujKh8zmELWFL5VysZC6JNGwq9M2kejWNt/rjOS4K
   PBa9RgmEdd54gFz5cQJOm0pBuKMzu6dRNsKej0+Yi2+WySisCkNn3Gzor
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449762"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449762"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523539"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523539"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/23] ASoC: intel: sof_sdw: Use consistent variable naming
 for links
Date: Mon, 31 Jul 2023 16:42:43 -0500
Message-Id: <20230731214257.444605-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DYFDRDJCH6X4DYLN7CGFNOFIZHPUQBUX
X-Message-ID-Hash: DYFDRDJCH6X4DYLN7CGFNOFIZHPUQBUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYFDRDJCH6X4DYLN7CGFNOFIZHPUQBUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The driver makes extensive use of both ACPI link and ASoC DAI link
structs, often referring to both with the variable name link. Make the
code a little easier to follow by consistently using adr_link for the
ACPI bits and dai_links for the ASoC bits.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 118 ++++++++++++++++---------------
 1 file changed, 60 insertions(+), 58 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ffb0cd0700c4..6f65f45bded6 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1021,10 +1021,10 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
  * Since some sdw slaves may be aggregated, the CPU DAI number
  * may be larger than the number of BE dailinks.
  */
-static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_link_adr *links,
+static int get_sdw_dailink_info(struct device *dev,
+				const struct snd_soc_acpi_link_adr *adr_link,
 				int *sdw_be_num, int *sdw_cpu_dai_num)
 {
-	const struct snd_soc_acpi_link_adr *link;
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
 	int i;
@@ -1034,27 +1034,27 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 	*sdw_cpu_dai_num = 0;
 	*sdw_be_num  = 0;
 
-	if (!links)
+	if (!adr_link)
 		return -EINVAL;
 
 	for (i = 0; i < SDW_MAX_GROUPS; i++)
 		group_visited[i] = false;
 
-	for (link = links; link->num_adr; link++) {
+	for (; adr_link->num_adr; adr_link++) {
 		const struct snd_soc_acpi_endpoint *endpoint;
 		struct sof_sdw_codec_info *codec_info;
 		int codec_index;
 		int stream;
 		u64 adr;
 
-		for (i = 0; i < link->num_adr; i++) {
-			adr = link->adr_d[i].adr;
+		for (i = 0; i < adr_link->num_adr; i++) {
+			adr = adr_link->adr_d[i].adr;
 			codec_index = find_codec_info_part(adr);
 			if (codec_index < 0)
 				return codec_index;
 			codec_info = &codec_info_list[codec_index];
 
-			endpoint = link->adr_d[i].endpoints;
+			endpoint = adr_link->adr_d[i].endpoints;
 
 			for (j = 0; j < codec_info->dai_num; j++) {
 				/* count DAI number for playback and capture */
@@ -1102,7 +1102,7 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->ops = ops;
 }
 
-static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
+static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 			     unsigned int sdw_version,
 			     unsigned int mfg_id,
 			     unsigned int part_id,
@@ -1112,7 +1112,7 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
 {
 	int i;
 
-	for (i = 0; i < link->num_adr; i++) {
+	for (i = 0; i < adr_link->num_adr; i++) {
 		unsigned int sdw1_version, mfg1_id, part1_id, class1_id;
 		u64 adr;
 
@@ -1120,7 +1120,7 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
 		if (i == index_in_link)
 			continue;
 
-		adr = link->adr_d[i].adr;
+		adr = adr_link->adr_d[i].adr;
 
 		sdw1_version = SDW_VERSION(adr);
 		mfg1_id = SDW_MFG_ID(adr);
@@ -1138,7 +1138,7 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
 }
 
 static int create_codec_dai_name(struct device *dev,
-				 const struct snd_soc_acpi_link_adr *link,
+				 const struct snd_soc_acpi_link_adr *adr_link,
 				 struct snd_soc_dai_link_component *codec,
 				 int offset,
 				 struct snd_soc_codec_conf *codec_conf,
@@ -1151,19 +1151,19 @@ static int create_codec_dai_name(struct device *dev,
 	int i;
 
 	/* sanity check */
-	if (*codec_conf_index + link->num_adr - adr_index > codec_count) {
+	if (*codec_conf_index + adr_link->num_adr - adr_index > codec_count) {
 		dev_err(dev, "codec_conf: out-of-bounds access requested\n");
 		return -EINVAL;
 	}
 
-	for (i = adr_index; i < link->num_adr; i++) {
+	for (i = adr_index; i < adr_link->num_adr; i++) {
 		unsigned int sdw_version, unique_id, mfg_id;
 		unsigned int link_id, part_id, class_id;
 		int codec_index, comp_index;
 		char *codec_str;
 		u64 adr;
 
-		adr = link->adr_d[i].adr;
+		adr = adr_link->adr_d[i].adr;
 
 		sdw_version = SDW_VERSION(adr);
 		link_id = SDW_DISCO_LINK_ID(adr);
@@ -1173,7 +1173,7 @@ static int create_codec_dai_name(struct device *dev,
 		class_id = SDW_CLASS_ID(adr);
 
 		comp_index = i - adr_index + offset;
-		if (is_unique_device(link, sdw_version, mfg_id, part_id,
+		if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
 				     class_id, i)) {
 			codec_str = "sdw:%01x:%04x:%04x:%02x";
 			codec[comp_index].name =
@@ -1204,7 +1204,7 @@ static int create_codec_dai_name(struct device *dev,
 			codec_info_list[codec_index].dais[dai_index].dai_name;
 
 		codec_conf[*codec_conf_index].dlc = codec[comp_index];
-		codec_conf[*codec_conf_index].name_prefix = link->adr_d[i].name_prefix;
+		codec_conf[*codec_conf_index].name_prefix = adr_link->adr_d[i].name_prefix;
 
 		++*codec_conf_index;
 	}
@@ -1213,7 +1213,7 @@ static int create_codec_dai_name(struct device *dev,
 }
 
 static int set_codec_init_func(struct snd_soc_card *card,
-			       const struct snd_soc_acpi_link_adr *link,
+			       const struct snd_soc_acpi_link_adr *adr_link,
 			       struct snd_soc_dai_link *dai_links,
 			       bool playback, int group_id, int adr_index, int dai_index)
 {
@@ -1224,34 +1224,35 @@ static int set_codec_init_func(struct snd_soc_card *card,
 		 * Initialize the codec. If codec is part of an aggregated
 		 * group (group_id>0), initialize all codecs belonging to
 		 * same group.
-		 * The first link should start with link->adr_d[adr_index]
+		 * The first link should start with adr_link->adr_d[adr_index]
 		 * because that is the device that we want to initialize and
 		 * we should end immediately if it is not aggregated (group_id=0)
 		 */
-		for ( ; i < link->num_adr; i++) {
+		for ( ; i < adr_link->num_adr; i++) {
 			int codec_index;
 
-			codec_index = find_codec_info_part(link->adr_d[i].adr);
+			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
 
 			if (codec_index < 0)
 				return codec_index;
 
 			/* The group_id is > 0 iff the codec is aggregated */
-			if (link->adr_d[i].endpoints->group_id != group_id)
+			if (adr_link->adr_d[i].endpoints->group_id != group_id)
 				continue;
 
 			if (codec_info_list[codec_index].dais[dai_index].init)
 				codec_info_list[codec_index].dais[dai_index].init(card,
-						link,
+						adr_link,
 						dai_links,
 						&codec_info_list[codec_index],
 						playback);
 			if (!group_id)
 				return 0;
 		}
+
 		i = 0;
-		link++;
-	} while (link->mask);
+		adr_link++;
+	} while (adr_link->mask);
 
 	return 0;
 }
@@ -1361,7 +1362,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct snd_soc_dai_link *dai_links,
 			      int sdw_be_num, int sdw_cpu_dai_num,
 			      struct snd_soc_dai_link_component *cpus,
-			      const struct snd_soc_acpi_link_adr *link,
+			      const struct snd_soc_acpi_link_adr *adr_link,
 			      int *cpu_id, bool *group_generated,
 			      struct snd_soc_codec_conf *codec_conf,
 			      int codec_count, int *be_id,
@@ -1371,7 +1372,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int adr_index,
 			      int dai_index)
 {
-	const struct snd_soc_acpi_link_adr *link_next;
+	const struct snd_soc_acpi_link_adr *adr_link_next;
 	struct snd_soc_dai_link_component *codecs;
 	struct sof_sdw_codec_info *codec_info;
 	int cpu_dai_id[SDW_MAX_CPU_DAIS];
@@ -1385,7 +1386,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	int ret;
 	int k;
 
-	ret = get_slave_info(link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
+	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
 			     &group_id, group_generated, adr_index);
 	if (ret)
 		return ret;
@@ -1395,20 +1396,20 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	/* generate codec name on different links in the same group */
-	for (link_next = link; link_next && link_next->num_adr &&
-	     i < cpu_dai_num; link_next++) {
+	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
+	     i < cpu_dai_num; adr_link_next++) {
 		const struct snd_soc_acpi_endpoint *endpoints;
 
-		endpoints = link_next->adr_d->endpoints;
+		endpoints = adr_link_next->adr_d->endpoints;
 		if (group_id && (!endpoints->aggregated ||
 				 endpoints->group_id != group_id))
 			continue;
 
 		/* skip the link excluded by this processed group */
-		if (cpu_dai_id[i] != ffs(link_next->mask) - 1)
+		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
-		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx,
+		ret = create_codec_dai_name(dev, adr_link_next, codecs, codec_idx,
 					    codec_conf, codec_count, codec_conf_index,
 					    adr_index, dai_index);
 		if (ret < 0)
@@ -1416,11 +1417,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		/* check next link to create codec dai in the processed group */
 		i++;
-		codec_idx += link_next->num_adr;
+		codec_idx += adr_link_next->num_adr;
 	}
 
 	/* find codec info to create BE DAI */
-	codec_index = find_codec_info_part(link->adr_d[adr_index].adr);
+	codec_index = find_codec_info_part(adr_link->adr_d[adr_index].adr);
 	if (codec_index < 0)
 		return codec_index;
 	codec_info = &codec_info_list[codec_index];
@@ -1516,7 +1517,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
 		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
-		ret = set_codec_init_func(card, link, dai_links + (*link_index)++,
+		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec %d", codec_index);
@@ -1589,7 +1590,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS];
 	int ssp_codec_index, ssp_mask;
-	struct snd_soc_dai_link *links;
+	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
 	char *name, *cpu_name;
 	int total_cpu_dai_num;
@@ -1650,14 +1651,14 @@ static int sof_card_dai_links_create(struct device *dev,
 
 	/* allocate BE dailinks */
 	num_links = comp_num + sdw_be_num;
-	links = devm_kcalloc(dev, num_links, sizeof(*links), GFP_KERNEL);
+	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
 
 	/* allocated CPU DAIs */
 	total_cpu_dai_num = comp_num + sdw_cpu_dai_num;
 	cpus = devm_kcalloc(dev, total_cpu_dai_num, sizeof(*cpus),
 			    GFP_KERNEL);
 
-	if (!links || !cpus)
+	if (!dai_links || !cpus)
 		return -ENOMEM;
 
 	/* SDW */
@@ -1731,9 +1732,9 @@ static int sof_card_dai_links_create(struct device *dev,
 				return codec_index;
 
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
-				ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
-							 sdw_cpu_dai_num, cpus, adr_link,
-							 &cpu_id, group_generated,
+				ret = create_sdw_dailink(card, dev, &link_index, dai_links,
+							 sdw_be_num, sdw_cpu_dai_num, cpus,
+							 adr_link, &cpu_id, group_generated,
 							 codec_conf, codec_conf_count,
 							 &be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
@@ -1785,13 +1786,13 @@ static int sof_card_dai_links_create(struct device *dev,
 
 		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
-		init_dai_link(dev, links + link_index, be_id, name,
+		init_dai_link(dev, dai_links + link_index, be_id, name,
 			      playback, capture,
 			      cpus + cpu_id, 1,
 			      ssp_components, 1,
 			      NULL, info->ops);
 
-		ret = info->dais[0].init(card, NULL, links + link_index, info, 0);
+		ret = info->dais[0].init(card, NULL, dai_links + link_index, info, 0);
 		if (ret < 0)
 			return ret;
 
@@ -1806,7 +1807,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			goto HDMI;
 		}
 		cpus[cpu_id].dai_name = "DMIC01 Pin";
-		init_dai_link(dev, links + link_index, be_id, "dmic01",
+		init_dai_link(dev, dai_links + link_index, be_id, "dmic01",
 			      0, 1, // DMIC only supports capture
 			      cpus + cpu_id, 1,
 			      dmic_component, 1,
@@ -1814,7 +1815,7 @@ static int sof_card_dai_links_create(struct device *dev,
 		INC_ID(be_id, cpu_id, link_index);
 
 		cpus[cpu_id].dai_name = "DMIC16k Pin";
-		init_dai_link(dev, links + link_index, be_id, "dmic16k",
+		init_dai_link(dev, dai_links + link_index, be_id, "dmic16k",
 			      0, 1, // DMIC only supports capture
 			      cpus + cpu_id, 1,
 			      dmic_component, 1,
@@ -1857,7 +1858,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, links + link_index, be_id, name,
+		init_dai_link(dev, dai_links + link_index, be_id, name,
 			      1, 0, // HDMI only supports playback
 			      cpus + cpu_id, 1,
 			      idisp_components + i, 1,
@@ -1878,11 +1879,11 @@ static int sof_card_dai_links_create(struct device *dev,
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, links + link_index, be_id, name, 1, 1,
-				cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
+		init_dai_link(dev, dai_links + link_index, be_id, name, 1, 1,
+			      cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
 	}
 
-	card->dai_link = links;
+	card->dai_link = dai_links;
 	card->num_links = num_links;
 
 	card->codec_conf = codec_conf;
@@ -1925,15 +1926,15 @@ static struct snd_soc_card card_sof_sdw = {
 static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
 						       const char *dai_name)
 {
-	struct snd_soc_dai_link *link;
+	struct snd_soc_dai_link *dai_link;
 	int i;
 	int j;
 
-	for_each_card_prelinks(card, i, link) {
-		for (j = 0; j < link->num_codecs; j++) {
+	for_each_card_prelinks(card, i, dai_link) {
+		for (j = 0; j < dai_link->num_codecs; j++) {
 			/* Check each codec in a link */
-			if (!strcmp(link->codecs[j].dai_name, dai_name))
-				return link;
+			if (!strcmp(dai_link->codecs[j].dai_name, dai_name))
+				return dai_link;
 		}
 	}
 	return NULL;
@@ -1941,7 +1942,7 @@ static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card
 
 static void mc_dailink_exit_loop(struct snd_soc_card *card)
 {
-	struct snd_soc_dai_link *link;
+	struct snd_soc_dai_link *dai_link;
 	int ret;
 	int i, j;
 
@@ -1954,10 +1955,11 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 			 * We don't need to call .exit function if there is no matched
 			 * dai link found.
 			 */
-			link = mc_find_codec_dai_used(card, codec_info_list[i].dais[j].dai_name);
-			if (link) {
+			dai_link = mc_find_codec_dai_used(card,
+							  codec_info_list[i].dais[j].dai_name);
+			if (dai_link) {
 				/* Do the .exit function if the codec dai is used in the link */
-				ret = codec_info_list[i].dais[j].exit(card, link);
+				ret = codec_info_list[i].dais[j].exit(card, dai_link);
 				if (ret)
 					dev_warn(card->dev,
 						 "codec exit failed %d\n",
-- 
2.39.2

