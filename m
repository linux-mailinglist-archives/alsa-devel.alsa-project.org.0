Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31B76A351
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54EE7E7A;
	Mon, 31 Jul 2023 23:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54EE7E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840218;
	bh=f1XRoUR5OQs7kIKgmqGrQ4p+W2AL3vXJ5sq97FSKeNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0rJniB4cXsCrjpV/1eJxSM5i80RaKFQ4zpMZCp0V9TFoeLhrj9jyDVpwlAHpFahq
	 nDfYKNpqIOaMYTx4B/LZDVhRtX3flyju3ApUlGaca8JAmvCrbKteiu31i+NtJ5LFO8
	 d89hsfHceS5UsJiW4lulG4aidwkY0AIdbWw/pkDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7695F8067D; Mon, 31 Jul 2023 23:44:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E565BF80678;
	Mon, 31 Jul 2023 23:44:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 202CBF8057C; Mon, 31 Jul 2023 23:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1568F805B0
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1568F805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mxtUBR3w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839807; x=1722375807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f1XRoUR5OQs7kIKgmqGrQ4p+W2AL3vXJ5sq97FSKeNg=;
  b=mxtUBR3w7w7pGvI5cvSkLYtBLXuaKhlPzxwSzwM27egO/ciuO8sjv28Z
   4uC7KNDWwCh7MT1qvgkn7l2rogHwC21vDhV+f9RO3VcwjNQz5LC/l7cxo
   B5K14nSVVujPRVBIM4f6G9gUO20WZVbH46CIaxpEExpZndOlRkOOqIMkg
   x4szvGufvlN7ZCOP6YzT715N5p+unoebcy6kLCnHPVOAZ9trf0oCKYdNq
   SwZuCuk9xRdVkVQkTIZKc5MZBGrzHO0eqO3tYXZ+ueo77iJNke/JBJTq3
   idZX7YNvi6Juh6NvaYPGgBuPl7BQoBrTuhVNsWj48oXF1jOqQ6yYVguAS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449819"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523571"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523571"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/23] ASoC: intel: sof_sdw: Merge codec_conf_alloc into
 dailink_info
Date: Mon, 31 Jul 2023 16:42:56 -0500
Message-Id: <20230731214257.444605-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VKUVOCKJLLJSQVIF42HHRA6767N3GSFW
X-Message-ID-Hash: VKUVOCKJLLJSQVIF42HHRA6767N3GSFW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKUVOCKJLLJSQVIF42HHRA6767N3GSFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rename get_sdw_dailink_info to simply get_dailink_info and have it also
return the number of codecs present. Then hoist the allocation of the
codec conf structure up into sof_card_dai_links_create. This saves an
extra loop through the adr_link array, allows us to get rid of
sof_card_codec_conf_alloc and makes the allocation more explicit.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 75 ++++++++++----------------------
 1 file changed, 23 insertions(+), 52 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index dc6ea21b3341..25644eff5251 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1027,9 +1027,9 @@ static inline int find_codec_info_acpi(const u8 *acpi_id)
  * Since some sdw slaves may be aggregated, the CPU DAI number
  * may be larger than the number of BE dailinks.
  */
-static int get_sdw_dailink_info(struct device *dev,
-				const struct snd_soc_acpi_link_adr *adr_link,
-				int *sdw_be_num, int *sdw_cpu_dai_num)
+static int get_dailink_info(struct device *dev,
+			    const struct snd_soc_acpi_link_adr *adr_link,
+			    int *sdw_be_num, int *sdw_cpu_dai_num, int *codecs_num)
 {
 	bool group_visited[SDW_MAX_GROUPS];
 	bool no_aggregation;
@@ -1058,8 +1058,17 @@ static int get_sdw_dailink_info(struct device *dev,
 			codec_index = find_codec_info_part(adr);
 			if (codec_index < 0)
 				return codec_index;
+
 			codec_info = &codec_info_list[codec_index];
 
+			*codecs_num += codec_info->dai_num;
+
+			if (!adr_link->adr_d[i].name_prefix) {
+				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
+					adr_link->adr_d[i].adr);
+				return -EINVAL;
+			}
+
 			endpoint = adr_link->adr_d[i].endpoints;
 
 			for (j = 0; j < codec_info->dai_num; j++) {
@@ -1540,46 +1549,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 
 #define IDISP_CODEC_MASK	0x4
 
-static int sof_card_codec_conf_alloc(struct device *dev,
-				     struct snd_soc_acpi_mach_params *mach_params,
-				     struct snd_soc_codec_conf **codec_conf,
-				     int *codec_conf_count)
-{
-	const struct snd_soc_acpi_link_adr *adr_link;
-	struct snd_soc_codec_conf *c_conf;
-	int num_codecs = 0;
-	int codec_index;
-	int i;
-
-	adr_link = mach_params->links;
-	if (!adr_link)
-		return -EINVAL;
-
-	/* generate DAI links by each sdw link */
-	for (; adr_link->num_adr; adr_link++) {
-		for (i = 0; i < adr_link->num_adr; i++) {
-			if (!adr_link->adr_d[i].name_prefix) {
-				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
-					adr_link->adr_d[i].adr);
-				return -EINVAL;
-			}
-			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (codec_index < 0)
-				return codec_index;
-			num_codecs += codec_info_list[codec_index].dai_num;
-		}
-	}
-
-	c_conf = devm_kzalloc(dev, num_codecs * sizeof(*c_conf), GFP_KERNEL);
-	if (!c_conf)
-		return -ENOMEM;
-
-	*codec_conf = c_conf;
-	*codec_conf_count = num_codecs;
-
-	return 0;
-}
-
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1594,7 +1563,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_codec_conf *codec_conf;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
-	int codec_conf_count;
+	int codec_conf_num = 0;
 	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS];
 	int ssp_codec_index, ssp_mask;
@@ -1608,12 +1577,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int cpu_id = 0;
 	int ret;
 
-	/* allocate codec conf, will be populated when dailinks are created */
-	ret = sof_card_codec_conf_alloc(dev, mach_params, &codec_conf, &codec_conf_count);
-	if (ret < 0)
-		return ret;
-
-	ret = get_sdw_dailink_info(dev, adr_link, &sdw_be_num, &sdw_cpu_dai_num);
+	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &sdw_cpu_dai_num,
+			       &codec_conf_num);
 	if (ret < 0) {
 		dev_err(dev, "failed to get sdw link info %d\n", ret);
 		return ret;
@@ -1662,6 +1627,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!cpus)
 		return -ENOMEM;
 
+	/* allocate codec conf, will be populated when dailinks are created */
+	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
+				  GFP_KERNEL);
+	if (!codec_conf)
+		return -ENOMEM;
+
 	/* SDW */
 	if (!sdw_be_num)
 		goto SSP;
@@ -1736,7 +1707,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, sdw_cpu_dai_num, cpus,
 							 adr_link, &cpu_id, group_generated,
-							 codec_conf, codec_conf_count,
+							 codec_conf, codec_conf_num,
 							 &be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
 				if (ret < 0) {
@@ -1888,7 +1859,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->num_links = num_links;
 
 	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_count;
+	card->num_configs = codec_conf_num;
 
 	return 0;
 }
-- 
2.39.2

