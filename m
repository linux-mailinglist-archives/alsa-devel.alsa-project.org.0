Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601C773A72
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF69829;
	Tue,  8 Aug 2023 15:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF69829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501006;
	bh=zdceYwQhE2oKHL7ATZ0RdEvyo90r8XrMTWVGbtOg7Lg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cwe8433fgMqi5TXoysfz6yDFr1L3zHcGY3gSxLOQY7swVpigXdyKZtpV8I+hyuo8u
	 v67h8eKI2q2ukMhxbhTNlqNfJCbsmYd7oLV8gx24Fx56gNGzunX8CZLuCK7jiXaPRZ
	 m1xCUxKOqk2aSHXIAobioR5UyTL5PqjPOI3/hEHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F27CF805CB; Tue,  8 Aug 2023 15:20:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0C2F805C3;
	Tue,  8 Aug 2023 15:20:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932ADF80549; Tue,  8 Aug 2023 15:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07619F80549
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07619F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=d0RQqhNC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nG020848;
	Tue, 8 Aug 2023 08:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=XSeQhKgiGoVdbgVtQlA4ObxFusKabkoscLME7nRT0DU=; b=
	d0RQqhNCotWQTAAPiNXrlJO+dyAemst6b0xZFbrQ1wuqBIK5uUbPqwY1CWXVxFnf
	8AZC5caqX1FvNAyD5B1BeMMui3HOpsSDKlFnCcsd78njkLnYiLg41fMC8YekgLMJ
	u74Hg+jB/E2y17IeatSUgMDMVHlUK7d+SRv056GGKoB+YP8CcwFVFPJu93bY4B5p
	DoOk85OSyeFiGV8Ph+38hAMq9BsYf/yWw8qiSXlqHjzZ0Palst1ZkxSL6HaMmOdf
	Yn6XKrxzqxK5i747Xz2Vs1Ssm042jtv7+lg7h0KKC8XHBiPj5fVlx1C/hqcbyZ/W
	TghWLblHKDTYxggPf+9Bpg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:19 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1B85E3575;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 06/12] ASoC: intel: sof_sdw: Pull device loop up into
 create_sdw_dailink
Date: Tue, 8 Aug 2023 14:20:07 +0100
Message-ID: <20230808132013.889419-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: P7jn4U0-nrnLAxeykCiwaEjKezGTylcd
X-Proofpoint-ORIG-GUID: P7jn4U0-nrnLAxeykCiwaEjKezGTylcd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CSW27QQSRPD2WFXNKOHLU34ZPMGSQ4C5
X-Message-ID-Hash: CSW27QQSRPD2WFXNKOHLU34ZPMGSQ4C5
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSW27QQSRPD2WFXNKOHLU34ZPMGSQ4C5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The loops which fill the codec DAI link component structures are split
across create_sdw_dailink and create_codec_dai_name. This causes the
code to be rather confusing, needing to return out the function to allow
the upper loop to iterate. Remove the create_codec_dai_name helper and
pull its code up into create_sdw_dailink, this makes it more obvious
what is happening in the code. This patch makes no functional change
just hoists the code up a level.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 89 +++++++++++++-------------------
 1 file changed, 35 insertions(+), 54 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ba4775e778072..5c154628236c7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1197,54 +1197,6 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	return 0;
 }
 
-static int create_codec_dai_name(struct device *dev,
-				 const struct snd_soc_acpi_link_adr *adr_link,
-				 struct snd_soc_dai_link_component *codec,
-				 int offset,
-				 struct snd_soc_codec_conf *codec_conf,
-				 int codec_count,
-				 int *codec_conf_index,
-				 int adr_index,
-				 int dai_index)
-{
-	int _codec_index = -1;
-	int i, ret;
-
-	/* sanity check */
-	if (*codec_conf_index + adr_link->num_adr - adr_index > codec_count) {
-		dev_err(dev, "codec_conf: out-of-bounds access requested\n");
-		return -EINVAL;
-	}
-
-	for (i = adr_index; i < adr_link->num_adr; i++) {
-		int codec_index, comp_index;
-		u64 adr = adr_link->adr_d[i].adr;
-
-		codec_index = find_codec_info_part(adr);
-		if (codec_index < 0)
-			return codec_index;
-		if (_codec_index != -1 && codec_index != _codec_index) {
-			dev_dbg(dev, "Different devices on the same sdw link\n");
-			break;
-		}
-		_codec_index = codec_index;
-
-		comp_index = i - adr_index + offset;
-
-		ret = fill_sdw_codec_dlc(dev, adr_link, &codec[comp_index],
-					 codec_index, i, dai_index);
-		if (ret)
-			return ret;
-
-		codec_conf[*codec_conf_index].dlc = codec[comp_index];
-		codec_conf[*codec_conf_index].name_prefix = adr_link->adr_d[i].name_prefix;
-
-		++*codec_conf_index;
-	}
-
-	return 0;
-}
-
 static int set_codec_init_func(struct snd_soc_card *card,
 			       const struct snd_soc_acpi_link_adr *adr_link,
 			       struct snd_soc_dai_link *dai_links,
@@ -1401,8 +1353,8 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	int codec_num;
 	int stream;
 	int i = 0;
+	int j, k;
 	int ret;
-	int k;
 
 	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
 			     &group_id, adr_index);
@@ -1417,6 +1369,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
 	     i < cpu_dai_num; adr_link_next++) {
 		const struct snd_soc_acpi_endpoint *endpoints;
+		int _codec_index = -1;
 
 		endpoints = adr_link_next->adr_d->endpoints;
 		if (group_id && (!endpoints->aggregated ||
@@ -1427,11 +1380,39 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
-		ret = create_codec_dai_name(dev, adr_link_next, codecs, codec_dlc_index,
-					    codec_conf, codec_count, codec_conf_index,
-					    adr_index, dai_index);
-		if (ret < 0)
-			return ret;
+		/* sanity check */
+		if (*codec_conf_index + adr_link_next->num_adr - adr_index > codec_count) {
+			dev_err(dev, "codec_conf: out-of-bounds access requested\n");
+			return -EINVAL;
+		}
+
+		for (j = adr_index; j < adr_link_next->num_adr; j++) {
+			int codec_index, comp_index;
+			u64 adr = adr_link_next->adr_d[j].adr;
+
+			codec_index = find_codec_info_part(adr);
+			if (codec_index < 0)
+				return codec_index;
+			if (_codec_index != -1 && codec_index != _codec_index) {
+				dev_dbg(dev, "Different devices on the same sdw link\n");
+				break;
+			}
+			_codec_index = codec_index;
+
+			comp_index = j - adr_index + codec_dlc_index;
+
+			ret = fill_sdw_codec_dlc(dev, adr_link_next,
+						 &codecs[comp_index],
+						 codec_index, j, dai_index);
+			if (ret)
+				return ret;
+
+			codec_conf[*codec_conf_index].dlc = codecs[comp_index];
+			codec_conf[*codec_conf_index].name_prefix =
+					adr_link_next->adr_d[j].name_prefix;
+
+			(*codec_conf_index)++;
+		}
 
 		/* check next link to create codec dai in the processed group */
 		i++;
-- 
2.30.2

