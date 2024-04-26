Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5E8B3B51
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7ECE9D;
	Fri, 26 Apr 2024 17:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7ECE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145151;
	bh=/Q5k951MfI29ZAL5D5tRdzssa6I65w19r08aEgCu76Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qKoopx0HSS18p/LzeJPGZRhk4mL3Kx58j0P4g1n2WzRut2FdHl3D79PWmNdGxgi3K
	 U9/gxftoigB1OyX01dazyZ8RZlx3PBws3LvVVgfEvmnlxavfQweaEZuAE3JclBff1g
	 1J/2dLWXPj0deA6b6IQPpR1/kzr3/FT0wo0HXbmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6DA0F807A6; Fri, 26 Apr 2024 17:22:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3058F807A2;
	Fri, 26 Apr 2024 17:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA03F80685; Fri, 26 Apr 2024 17:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6BBDF80570
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BBDF80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=joRblwcB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144912; x=1745680912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Q5k951MfI29ZAL5D5tRdzssa6I65w19r08aEgCu76Y=;
  b=joRblwcBdkbs+1BEeKCKm3KHEavyNrrqbL0hjK6qxV4LF35P5fCJyuMo
   BQYsNGgevFJQQvF9W8ZIAGHGvGNTCPdSkvscHamMQhD84cSjI778uFxyQ
   r6OYMvyA1yDTtYToI8WVMCKFD2oqn+N+5MeYxVO9ASHkyEyDNFGiKqRDV
   1QamKMxIkBPHpMokrHGUg+z2hfu60RGaeEhJ6cjVxFvXdKmT/7F+H9DhK
   GzNETotxhATYiGE/npHGnbLUEkdKCrTHj6zImh5cBlWdnNgy0Eq4WxUQE
   O4byMaq10rIvditlpDwqDgs3/+dmtlhOjSAgFL2hl1s/0BJRLt99+UNZK
   g==;
X-CSE-ConnectionGUID: ry8pMEe2SkKYoMKX7dRpcg==
X-CSE-MsgGUID: mVvX45kCQxWb1l961V5CZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290641"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:45 -0700
X-CSE-ConnectionGUID: RD49e2H4TWOHLoDjzogJVA==
X-CSE-MsgGUID: PRT5lEO8TNSBWTG8n0TS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259035"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/12] ASoC: Intel: sof_sdw: Delay update of the codec_conf
 array
Date: Fri, 26 Apr 2024 10:21:21 -0500
Message-Id: <20240426152123.36284-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MK5YRFUN36BNMHOONEQ6DCO3CCMCAIDR
X-Message-ID-Hash: MK5YRFUN36BNMHOONEQ6DCO3CCMCAIDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MK5YRFUN36BNMHOONEQ6DCO3CCMCAIDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Move the population of the codec_conf array from endpoint parsing
time to link creation time. This is slightly cleaner as the
population is done whilst the DAI links are also being populated,
putting all population together. However, primarily this facilitates
allowing additional non-SoundWire devices to be easily added into
the array in future feature additions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 48 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 86bbf1c66ce8..bf5f46a4c4aa 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1279,6 +1279,7 @@ struct sof_sdw_endpoint {
 
 	u32 link_mask;
 	const char *codec_name;
+	const char *name_prefix;
 
 	struct sof_sdw_codec_info *codec_info;
 	const struct sof_sdw_dai_info *dai_info;
@@ -1340,7 +1341,6 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
@@ -1376,13 +1376,11 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_name)
 				return -ENOMEM;
 
-			codec_conf->dlc.name = codec_name;
-			codec_conf->name_prefix = adr_dev->name_prefix;
-			codec_conf++;
-
 			dev_dbg(dev, "Adding prefix %s for %s\n",
 				adr_dev->name_prefix, codec_name);
 
+			sof_end->name_prefix = adr_dev->name_prefix;
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct sof_sdw_dai_info *dai_info;
@@ -1443,21 +1441,27 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 		ctx->append_dai_type |= (num_link_dailinks > 1);
 	}
 
-	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
-
 	return num_dais;
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct sof_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
-			      int *be_id)
+			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct sof_sdw_endpoint *sof_end;
 	int stream;
 
+	list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+		if (sof_end->name_prefix) {
+			(*codec_conf)->dlc.name = sof_end->codec_name;
+			(*codec_conf)->name_prefix = sof_end->name_prefix;
+			(*codec_conf)++;
+		}
+	}
+
 	for_each_pcm_streams(stream) {
 		static const char * const sdw_stream_name[] = {
 			"SDW%d-Playback",
@@ -1569,7 +1573,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct sof_sdw_dailink *sof_dais)
+			       struct sof_sdw_dailink *sof_dais,
+			       struct snd_soc_codec_conf **codec_conf)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret, i;
@@ -1581,7 +1586,8 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	while (sof_dais->initialised) {
 		int current_be_id;
 
-		ret = create_sdw_dailink(card, sof_dais, dai_links, &current_be_id);
+		ret = create_sdw_dailink(card, sof_dais, dai_links,
+					 &current_be_id, codec_conf);
 		if (ret)
 			return ret;
 
@@ -1751,16 +1757,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	/* will be populated when acpi endpoints are parsed */
-	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
-	if (!codec_conf) {
-		ret = -ENOMEM;
-		goto err_end;
-	}
-
-	card->codec_conf = codec_conf;
-	card->num_configs = num_devs;
-
 	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
 	if (ret < 0)
 		goto err_end;
@@ -1798,6 +1794,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		sdw_be_num, ssp_num, dmic_num,
 		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
+
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
@@ -1806,12 +1808,15 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 	}
 
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
 	/* SDW */
 	if (sdw_be_num) {
-		ret = create_sdw_dailinks(card, &dai_links, &be_id, sof_dais);
+		ret = create_sdw_dailinks(card, &dai_links, &be_id,
+					  sof_dais, &codec_conf);
 		if (ret)
 			goto err_end;
 	}
@@ -1847,6 +1852,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			goto err_end;
 	}
 
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
 	WARN_ON(dai_links != card->dai_link + card->num_links);
 
 err_end:
-- 
2.40.1

