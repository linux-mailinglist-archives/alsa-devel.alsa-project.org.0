Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027488C8B1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:12:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E2192C10;
	Tue, 26 Mar 2024 17:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E2192C10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469535;
	bh=vyvQeUPm2UJYX4QPwg3cG/elxp5BlodNhrVktU/ZmIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5F7c7dDdGb6SrL45WjxZTPFc10rpWHGu7p/2+UaYPKky343uUsYVucUc4GK9TGCR
	 JvhdxixvyCKdiMA7lgdpzscwEnVdRCoSw2tFvNGSs/hmakAq5UyIqmSLNcoujLZ0fP
	 7I/QW4N7tBEyOGJ9xNSUEygNA81U8rXuLqDzvPOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC1BF89701; Tue, 26 Mar 2024 17:07:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9728F8970C;
	Tue, 26 Mar 2024 17:07:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DBEF806B0; Tue, 26 Mar 2024 17:06:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D430F805D3
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D430F805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UAhFoYQe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469146; x=1743005146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vyvQeUPm2UJYX4QPwg3cG/elxp5BlodNhrVktU/ZmIs=;
  b=UAhFoYQegKYU7iXy5XmMwaCSYUChoKHWXxfSleQVY/74KazNUoQHjxQr
   dsKuBj+YaBAFptAAttpC/xdDNVX0jvWeTTfXggG6NjP6m3rGNk8S5xHB0
   TluDj3Z3ySO07RqdqqjiG6T6foPX2xcXZ509aXpgBou36PiCiyiHkw3Vr
   ml1duhYwzFhC7dO8DJJluG4sibEgqtI8CCazACx8Ccv5kWGbr4QFXdKnT
   dtgUr4cxV01iIQfLUBVFuZBBSmQrVPQ0/OKQqHNuaH2uAMTpFnORPBOIq
   dxNHJKg/T9///B660H5LSW7pBgx/ZdF6Fji3rAcDV+c8Sc/SbyLIQ0Lab
   w==;
X-CSE-ConnectionGUID: w5HwsFqJR1yPL5rt0hdPjw==
X-CSE-MsgGUID: NLSFHAKUSkeKM4bWGVLwlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260466"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260466"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482317"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:55 -0700
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
Subject: [PATCH 19/34] ASoC: Intel: sof_sdw: Move counting and codec_conf to
 new parsing
Date: Tue, 26 Mar 2024 11:04:14 -0500
Message-Id: <20240326160429.13560-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GPIAFKSGCNB2CVDLBRLX7E7NSCF2R7TO
X-Message-ID-Hash: GPIAFKSGCNB2CVDLBRLX7E7NSCF2R7TO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPIAFKSGCNB2CVDLBRLX7E7NSCF2R7TO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Use the output of the new snd_soc_acpi struct parsing for the purposes
of counting the number of SoundWire DAI links and physical devices
attached to the SoundWire. These counts are already returned by the
parser so those can just be used directly. But the population of the
codec_conf structures, is moved from the old parsing code over to the
new. As the two parsers currently co-exist it is better to not have
them both attempt to modify the same structures.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 124 ++++++-------------------------
 1 file changed, 22 insertions(+), 102 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 15bf8fbb3be9..0566ab843c2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1126,79 +1126,6 @@ static struct sof_sdw_codec_info *find_codec_info_dai(const char *dai_name,
 	return NULL;
 }
 
-/*
- * get BE dailink number and CPU DAI number based on sdw link adr.
- * Since some sdw slaves may be aggregated, the CPU DAI number
- * may be larger than the number of BE dailinks.
- */
-static int get_dailink_info(struct device *dev,
-			    const struct snd_soc_acpi_link_adr *adr_link,
-			    int *sdw_be_num, int *codecs_num)
-{
-	bool group_visited[SDW_MAX_GROUPS];
-	int i;
-	int j;
-
-	*sdw_be_num  = 0;
-
-	if (!adr_link)
-		return -EINVAL;
-
-	for (i = 0; i < SDW_MAX_GROUPS; i++)
-		group_visited[i] = false;
-
-	for (; adr_link->num_adr; adr_link++) {
-		const struct snd_soc_acpi_endpoint *endpoint;
-		struct sof_sdw_codec_info *codec_info;
-		int stream;
-		u64 adr;
-
-		/* make sure the link mask has a single bit set */
-		if (!is_power_of_2(adr_link->mask))
-			return -EINVAL;
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			adr = adr_link->adr_d[i].adr;
-			codec_info = find_codec_info_part(adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			*codecs_num += codec_info->dai_num;
-
-			if (!adr_link->adr_d[i].name_prefix) {
-				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
-					adr_link->adr_d[i].adr);
-				return -EINVAL;
-			}
-
-			endpoint = adr_link->adr_d[i].endpoints;
-			if (endpoint->aggregated && !endpoint->group_id) {
-				dev_err(dev, "invalid group id on link %x\n",
-					adr_link->mask);
-				return -EINVAL;
-			}
-
-			for (j = 0; j < codec_info->dai_num; j++) {
-				/* count DAI number for playback and capture */
-				for_each_pcm_streams(stream) {
-					if (!codec_info->dais[j].direction[stream])
-						continue;
-
-					/* count BE for each non-aggregated slave or group */
-					if (!endpoint->aggregated ||
-					    !group_visited[endpoint->group_id])
-						(*sdw_be_num)++;
-				}
-			}
-
-			if (endpoint->aggregated)
-				group_visited[endpoint->group_id] = true;
-		}
-	}
-
-	return 0;
-}
-
 static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 			  int *be_id, char *name, int playback, int capture,
 			  struct snd_soc_dai_link_component *cpus, int cpus_num,
@@ -1528,6 +1455,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
@@ -1559,6 +1487,13 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_name)
 				return -ENOMEM;
 
+			codec_conf->dlc.name = codec_name;
+			codec_conf->name_prefix = adr_dev->name_prefix;
+			codec_conf++;
+
+			dev_dbg(dev, "Adding prefix %s for %s\n",
+				adr_dev->name_prefix, codec_name);
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct sof_sdw_dai_info *dai_info;
@@ -1614,13 +1549,14 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 		}
 	}
 
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
+
 	return num_dais;
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct snd_soc_dai_link **dai_links,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_codec_conf **codec_conf,
 			      int *be_id, int adr_index, int dai_index)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -1672,26 +1608,16 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 					 endpoints->group_id != group_id))
 				continue;
 
-			/* sanity check */
-			if (*codec_conf >= card->codec_conf + card->num_configs) {
-				dev_err(dev, "codec_conf array overflowed\n");
-				return -EINVAL;
-			}
-
 			ret = fill_sdw_codec_dlc(dev, adr_link_next,
 						 &codecs[codec_dlc_index],
 						 j, dai_index);
 			if (ret)
 				return ret;
 
-			(*codec_conf)->dlc = codecs[codec_dlc_index];
-			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
-
 			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
 			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
 
 			codec_dlc_index++;
-			(*codec_conf)++;
 		}
 		j = 0;
 
@@ -1913,7 +1839,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct sof_sdw_codec_info *ssp_info;
 	struct sof_sdw_endpoint *sof_ends;
 	struct sof_sdw_dailink *sof_dais;
-	int codec_conf_num = 0;
 	int num_devs = 0;
 	int num_ends = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
@@ -1942,15 +1867,21 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
+	/* will be populated when acpi endpoints are parsed */
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
+
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
+
 	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
 	if (ret < 0)
 		goto err_end;
 
-	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
-	if (ret < 0) {
-		dev_err(dev, "failed to get sdw link info %d\n", ret);
-		goto err_end;
-	}
+	sdw_be_num = ret;
 
 	/*
 	 * on generic tgl platform, I2S or sdw mode is supported
@@ -1991,18 +1922,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 	}
 
-	/* allocate codec conf, will be populated when dailinks are created */
-	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
-				  GFP_KERNEL);
-	if (!codec_conf) {
-		ret = -ENOMEM;
-		goto err_end;
-	}
-
 	card->dai_link = dai_links;
 	card->num_links = num_links;
-	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_num;
 
 	/* SDW */
 	if (!sdw_be_num)
@@ -2065,8 +1986,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				int current_be_id;
 
 				ret = create_sdw_dailink(card, &dai_links, adr_link,
-							 &codec_conf, &current_be_id,
-							 i, j);
+							 &current_be_id, i, j);
 				if (ret < 0) {
 					dev_err(dev,
 						"failed to create dai link %d on 0x%x\n",
-- 
2.40.1

