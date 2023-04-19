Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64F6E8243
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899BDF12;
	Wed, 19 Apr 2023 21:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899BDF12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934350;
	bh=5f6r17BaOQbpLk3CSccJWvHfQtT62LGDiBh3Dw+H3R0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMqSF+ngBB5cfDdulqIR/ehTQAudJNbN8HPimUM03pNG8VSjVsodQqy7FinEFpaJe
	 5o8iPHwUY7DcnWzBi3tHsFJsOQEqtrnXu2HcQbHY8Jcnl1eDwOB1RRJWpyRVoWExGm
	 OHvRNgMGEtT6E2M49Xy6gdfH23/T5hUVS2hvA020=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B703F80563;
	Wed, 19 Apr 2023 21:57:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF58F80510; Wed, 19 Apr 2023 21:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB23CF804FC
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB23CF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uh+RYHKs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934168; x=1713470168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5f6r17BaOQbpLk3CSccJWvHfQtT62LGDiBh3Dw+H3R0=;
  b=Uh+RYHKs/6flCnOsBiK6FA9FnvqbM6r9DO4NXmKl24gzaNyLvwvLNayD
   zpx/Z8crmFWYsKFdsi8Bgc+cRZY0Ev+UpVR6sZQeMJJt59cnhCpqkxN7o
   j4a836mhe5Y41qaZfXjs89cXMhzHLCcRiKXMpxZQlZfYAZjg5M6P0jYpu
   w3AHrmGvlEQ3SVqc3P0TAHmDklt4xAL/1RLZisvLxg5S6hVWGjqI2fCVb
   7yJQzrYoVLPR4RJI82A/f2RB8eugCy8ey+mVK+wM9sPiyAWbLuh6dtsBM
   dR9/s9AzznqR0p0a7pIMmYzZiSwbGv5ReMmPMyYjoTdpxk9KkRZNDvDvL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434401"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434401"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728111"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728111"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: Intel: sof_sdw: support different devices on the
 same sdw link
Date: Wed, 19 Apr 2023 14:55:23 -0500
Message-Id: <20230419195524.46995-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ECRAOIDO3AZSLFYGPMNYFPEHQPMNZRYY
X-Message-ID-Hash: ECRAOIDO3AZSLFYGPMNYFPEHQPMNZRYY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECRAOIDO3AZSLFYGPMNYFPEHQPMNZRYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code assumes all devices on the same soundwire link
are the same devices. eg. all rt1316. This commit removes the
assumption and supports different devices on the same soundwire link.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 130 ++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 53 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e5729df4fd44..6a6c81df72bd 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -732,34 +732,36 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 		int stream;
 		u64 adr;
 
-		adr = link->adr_d->adr;
-		codec_index = find_codec_info_part(adr);
-		if (codec_index < 0)
-			return codec_index;
+		for (i = 0; i < link->num_adr; i++) {
+			adr = link->adr_d[i].adr;
+			codec_index = find_codec_info_part(adr);
+			if (codec_index < 0)
+				return codec_index;
 
-		if (codec_info_list[codec_index].codec_type < _codec_type)
-			dev_warn(dev,
-				 "Unexpected address table ordering. Expected order: jack -> amp -> mic\n");
+			if (codec_info_list[codec_index].codec_type < _codec_type)
+				dev_warn(dev,
+					 "Unexpected address table ordering. Expected order: jack -> amp -> mic\n");
 
-		_codec_type = codec_info_list[codec_index].codec_type;
+			_codec_type = codec_info_list[codec_index].codec_type;
 
-		endpoint = link->adr_d->endpoints;
+			endpoint = link->adr_d[i].endpoints;
 
-		/* count DAI number for playback and capture */
-		for_each_pcm_streams(stream) {
-			if (!codec_info_list[codec_index].direction[stream])
-				continue;
+			/* count DAI number for playback and capture */
+			for_each_pcm_streams(stream) {
+				if (!codec_info_list[codec_index].direction[stream])
+					continue;
 
-			(*sdw_cpu_dai_num)++;
+				(*sdw_cpu_dai_num)++;
 
-			/* count BE for each non-aggregated slave or group */
-			if (!endpoint->aggregated || no_aggregation ||
-			    !group_visited[endpoint->group_id])
-				(*sdw_be_num)++;
-		}
+				/* count BE for each non-aggregated slave or group */
+				if (!endpoint->aggregated || no_aggregation ||
+				    !group_visited[endpoint->group_id])
+					(*sdw_be_num)++;
+			}
 
-		if (endpoint->aggregated)
-			group_visited[endpoint->group_id] = true;
+			if (endpoint->aggregated)
+				group_visited[endpoint->group_id] = true;
+		}
 	}
 
 	return 0;
@@ -829,17 +831,19 @@ static int create_codec_dai_name(struct device *dev,
 				 int offset,
 				 struct snd_soc_codec_conf *codec_conf,
 				 int codec_count,
-				 int *codec_conf_index)
+				 int *codec_conf_index,
+				 int adr_index)
 {
+	int _codec_index = -1;
 	int i;
 
 	/* sanity check */
-	if (*codec_conf_index + link->num_adr > codec_count) {
+	if (*codec_conf_index + link->num_adr - adr_index > codec_count) {
 		dev_err(dev, "codec_conf: out-of-bounds access requested\n");
 		return -EINVAL;
 	}
 
-	for (i = 0; i < link->num_adr; i++) {
+	for (i = adr_index; i < link->num_adr; i++) {
 		unsigned int sdw_version, unique_id, mfg_id;
 		unsigned int link_id, part_id, class_id;
 		int codec_index, comp_index;
@@ -855,7 +859,7 @@ static int create_codec_dai_name(struct device *dev,
 		part_id = SDW_PART_ID(adr);
 		class_id = SDW_CLASS_ID(adr);
 
-		comp_index = i + offset;
+		comp_index = i - adr_index + offset;
 		if (is_unique_device(link, sdw_version, mfg_id, part_id,
 				     class_id, i)) {
 			codec_str = "sdw:%01x:%04x:%04x:%02x";
@@ -877,6 +881,11 @@ static int create_codec_dai_name(struct device *dev,
 		codec_index = find_codec_info_part(adr);
 		if (codec_index < 0)
 			return codec_index;
+		if (_codec_index != -1 && codec_index != _codec_index) {
+			dev_dbg(dev, "Different devices on the same sdw link\n");
+			break;
+		}
+		_codec_index = codec_index;
 
 		codec[comp_index].dai_name =
 			codec_info_list[codec_index].dai_name;
@@ -943,16 +952,16 @@ static int set_codec_init_func(struct snd_soc_card *card,
 static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
 			  int *codec_num, unsigned int *group_id,
-			  bool *group_generated)
+			  bool *group_generated, int adr_index)
 {
 	const struct snd_soc_acpi_adr_device *adr_d;
 	const struct snd_soc_acpi_link_adr *adr_next;
 	bool no_aggregation;
 	int index = 0;
+	int i;
 
 	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
-	*codec_num = adr_link->num_adr;
-	adr_d = adr_link->adr_d;
+	adr_d = &adr_link->adr_d[adr_index];
 
 	/* make sure the link mask has a single bit set */
 	if (!is_power_of_2(adr_link->mask))
@@ -968,6 +977,14 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 
 	*group_id = adr_d->endpoints->group_id;
 
+	/* Count endpoints with the same group_id in the adr_link */
+	*codec_num = 0;
+	for (i = 0; i < adr_link->num_adr; i++) {
+		if (adr_link->adr_d[i].endpoints->aggregated &&
+		    adr_link->adr_d[i].endpoints->group_id == *group_id)
+			(*codec_num)++;
+	}
+
 	/* gather other link ID of slaves in the same group */
 	for (adr_next = adr_link + 1; adr_next && adr_next->num_adr;
 		adr_next++) {
@@ -988,7 +1005,11 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 		}
 
 		cpu_dai_id[index++] = ffs(adr_next->mask) - 1;
-		*codec_num += adr_next->num_adr;
+		for (i = 0; i < adr_next->num_adr; i++) {
+			if (adr_next->adr_d[i].endpoints->aggregated &&
+			    adr_next->adr_d[i].endpoints->group_id == *group_id)
+				(*codec_num)++;
+		}
 	}
 
 	/*
@@ -1011,7 +1032,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct snd_soc_codec_conf *codec_conf,
 			      int codec_count, int *link_id,
 			      int *codec_conf_index,
-			      bool *ignore_pch_dmic)
+			      bool *ignore_pch_dmic,
+			      int adr_index)
 {
 	const struct snd_soc_acpi_link_adr *link_next;
 	struct snd_soc_dai_link_component *codecs;
@@ -1027,7 +1049,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	int k;
 
 	ret = get_slave_info(link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
-			     &group_id, group_generated);
+			     &group_id, group_generated, adr_index);
 	if (ret)
 		return ret;
 
@@ -1050,7 +1072,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			continue;
 
 		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx,
-					    codec_conf, codec_count, codec_conf_index);
+					    codec_conf, codec_count, codec_conf_index, adr_index);
 		if (ret < 0)
 			return ret;
 
@@ -1060,7 +1082,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	}
 
 	/* find codec info to create BE DAI */
-	codec_index = find_codec_info_part(link->adr_d[0].adr);
+	codec_index = find_codec_info_part(link->adr_d[adr_index].adr);
 	if (codec_index < 0)
 		return codec_index;
 
@@ -1303,29 +1325,31 @@ static int sof_card_dai_links_create(struct device *dev,
 
 	/* generate DAI links by each sdw link */
 	for (; adr_link->num_adr; adr_link++) {
-		const struct snd_soc_acpi_endpoint *endpoint;
+		for (i = 0; i < adr_link->num_adr; i++) {
+			const struct snd_soc_acpi_endpoint *endpoint;
 
-		endpoint = adr_link->adr_d->endpoints;
-		if (endpoint->aggregated && !endpoint->group_id) {
-			dev_err(dev, "invalid group id on link %x",
-				adr_link->mask);
-			continue;
-		}
+			endpoint = adr_link->adr_d[i].endpoints;
+			if (endpoint->aggregated && !endpoint->group_id) {
+				dev_err(dev, "invalid group id on link %x",
+					adr_link->mask);
+				continue;
+			}
 
-		/* this group has been generated */
-		if (endpoint->aggregated &&
-		    group_generated[endpoint->group_id])
-			continue;
+			/* this group has been generated */
+			if (endpoint->aggregated &&
+			    group_generated[endpoint->group_id])
+				continue;
 
-		ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
-					 sdw_cpu_dai_num, cpus, adr_link,
-					 &cpu_id, group_generated,
-					 codec_conf, codec_conf_count,
-					 &be_id, &codec_conf_index,
-					 &ignore_pch_dmic);
-		if (ret < 0) {
-			dev_err(dev, "failed to create dai link %d", link_index);
-			return ret;
+			ret = create_sdw_dailink(card, dev, &link_index, links, sdw_be_num,
+						 sdw_cpu_dai_num, cpus, adr_link,
+						 &cpu_id, group_generated,
+						 codec_conf, codec_conf_count,
+						 &be_id, &codec_conf_index,
+						 &ignore_pch_dmic, i);
+			if (ret < 0) {
+				dev_err(dev, "failed to create dai link %d", link_index);
+				return ret;
+			}
 		}
 	}
 
-- 
2.37.2

