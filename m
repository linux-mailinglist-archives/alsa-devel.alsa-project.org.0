Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57305773A77
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29E45823;
	Tue,  8 Aug 2023 15:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29E45823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501077;
	bh=GRuoBMaKJLLcapRzY+Dgt6Rjo5XVJBzzCrS6Jb7spq4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WDi4cgx8C+LWdlIeW/6PbSlcsdKHU3w/HFoUvCXLy5wy9JXds1mvYGzp3m6vvFQyZ
	 fOAzlZ3EefdmHUV/fJqDrk2jrmfNZLKKzGXR0+LSIMNJ2M5jS46A0nQm3nnt8L6/8q
	 E6S+eBOa9NgpFppVhe6RrbtTAZ8tU92qjsIW9SWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B74F805F2; Tue,  8 Aug 2023 15:21:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E14F805F3;
	Tue,  8 Aug 2023 15:21:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C0CF805E0; Tue,  8 Aug 2023 15:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A398F80548
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A398F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=X1L94ZEs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3784vnaG015760;
	Tue, 8 Aug 2023 08:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=401KjO+M5L2hO5Laomj4gdXsjmHlidyKqsVAC02S+9g=; b=
	X1L94ZEs4Yt3/RB6V9Mu5JJjwUjc78hu2whvDAiiG8AG7b8IMLH8m7bOVkAvqozB
	H2DGwJrW159vGy+pBBelRZM2old2JrIQdQnYHuxa8SulDQuN/XCWfQLDqr4Unx01
	LwNGmnN5LY1O5LC6kfKq4hv8t60J6x5ldZLTP744WpT6wVFcvEjcqwDS0QVJN6Bp
	2k33gyZq4Vy6y+tmg1Wj8+MFtWnndurLzD3XoNLIgcUBhOT2b0b/Q2eGV4OetPQV
	29stFwjx5SpahJpB1EGfO0M+BjBtIvu4QiwqRDlj3XHtNFivu6znnBH1yWrUJoQR
	BzJLtciJsM9wj9qF9nvdvg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:16 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 09C6E15B7;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 05/12] ASoC: intel: sof_sdw: Add helper to create a single
 codec DLC
Date: Tue, 8 Aug 2023 14:20:06 +0100
Message-ID: <20230808132013.889419-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Xnewd0wYKIcSqROR6ceHcfo_oKHVAHvl
X-Proofpoint-ORIG-GUID: Xnewd0wYKIcSqROR6ceHcfo_oKHVAHvl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DNN3S3VHVAJ3AOQD56KAKPGSD23T7HY4
X-Message-ID-Hash: DNN3S3VHVAJ3AOQD56KAKPGSD23T7HY4
X-MailFrom: prvs=3584cdf4cd=ckeepax@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a helper function to create a single codec DAI link component
structure. This sets things up for more refactoring of the creating of
the DAI links.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 80 +++++++++++++++++---------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b250fb7be4bff..ba4775e778072 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1160,6 +1160,43 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 	return true;
 }
 
+static int fill_sdw_codec_dlc(struct device *dev,
+			      const struct snd_soc_acpi_link_adr *adr_link,
+			      struct snd_soc_dai_link_component *codec,
+			      int codec_index, int adr_index, int dai_index)
+{
+	unsigned int sdw_version, unique_id, mfg_id, link_id, part_id, class_id;
+	u64 adr = adr_link->adr_d[adr_index].adr;
+
+	sdw_version = SDW_VERSION(adr);
+	link_id = SDW_DISCO_LINK_ID(adr);
+	unique_id = SDW_UNIQUE_ID(adr);
+	mfg_id = SDW_MFG_ID(adr);
+	part_id = SDW_PART_ID(adr);
+	class_id = SDW_CLASS_ID(adr);
+
+	if (codec_info_list[codec_index].codec_name)
+		codec->name = devm_kstrdup(dev,
+					   codec_info_list[codec_index].codec_name,
+					   GFP_KERNEL);
+	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+				  class_id, adr_index))
+		codec->name = devm_kasprintf(dev, GFP_KERNEL,
+					     "sdw:%01x:%04x:%04x:%02x", link_id,
+					     mfg_id, part_id, class_id);
+	else
+		codec->name = devm_kasprintf(dev, GFP_KERNEL,
+					     "sdw:%01x:%04x:%04x:%02x:%01x", link_id,
+					     mfg_id, part_id, class_id, unique_id);
+
+	if (!codec->name)
+		return -ENOMEM;
+
+	codec->dai_name = codec_info_list[codec_index].dais[dai_index].dai_name;
+
+	return 0;
+}
+
 static int create_codec_dai_name(struct device *dev,
 				 const struct snd_soc_acpi_link_adr *adr_link,
 				 struct snd_soc_dai_link_component *codec,
@@ -1171,7 +1208,7 @@ static int create_codec_dai_name(struct device *dev,
 				 int dai_index)
 {
 	int _codec_index = -1;
-	int i;
+	int i, ret;
 
 	/* sanity check */
 	if (*codec_conf_index + adr_link->num_adr - adr_index > codec_count) {
@@ -1180,13 +1217,8 @@ static int create_codec_dai_name(struct device *dev,
 	}
 
 	for (i = adr_index; i < adr_link->num_adr; i++) {
-		unsigned int sdw_version, unique_id, mfg_id;
-		unsigned int link_id, part_id, class_id;
 		int codec_index, comp_index;
-		char *codec_str;
-		u64 adr;
-
-		adr = adr_link->adr_d[i].adr;
+		u64 adr = adr_link->adr_d[i].adr;
 
 		codec_index = find_codec_info_part(adr);
 		if (codec_index < 0)
@@ -1197,38 +1229,12 @@ static int create_codec_dai_name(struct device *dev,
 		}
 		_codec_index = codec_index;
 
-		sdw_version = SDW_VERSION(adr);
-		link_id = SDW_DISCO_LINK_ID(adr);
-		unique_id = SDW_UNIQUE_ID(adr);
-		mfg_id = SDW_MFG_ID(adr);
-		part_id = SDW_PART_ID(adr);
-		class_id = SDW_CLASS_ID(adr);
-
 		comp_index = i - adr_index + offset;
-		if (codec_info_list[codec_index].codec_name) {
-			codec[comp_index].name =
-				devm_kstrdup(dev, codec_info_list[codec_index].codec_name,
-					     GFP_KERNEL);
-		} else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-				     class_id, i)) {
-			codec_str = "sdw:%01x:%04x:%04x:%02x";
-			codec[comp_index].name =
-				devm_kasprintf(dev, GFP_KERNEL, codec_str,
-					       link_id, mfg_id, part_id,
-					       class_id);
-		} else {
-			codec_str = "sdw:%01x:%04x:%04x:%02x:%01x";
-			codec[comp_index].name =
-				devm_kasprintf(dev, GFP_KERNEL, codec_str,
-					       link_id, mfg_id, part_id,
-					       class_id, unique_id);
-		}
 
-		if (!codec[comp_index].name)
-			return -ENOMEM;
-
-		codec[comp_index].dai_name =
-			codec_info_list[codec_index].dais[dai_index].dai_name;
+		ret = fill_sdw_codec_dlc(dev, adr_link, &codec[comp_index],
+					 codec_index, i, dai_index);
+		if (ret)
+			return ret;
 
 		codec_conf[*codec_conf_index].dlc = codec[comp_index];
 		codec_conf[*codec_conf_index].name_prefix = adr_link->adr_d[i].name_prefix;
-- 
2.30.2

