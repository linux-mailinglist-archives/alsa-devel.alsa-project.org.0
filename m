Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC69773A78
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E57084D;
	Tue,  8 Aug 2023 15:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E57084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501088;
	bh=ndY5+wDP5ITjBsMAiGohZfNtWk/MvL/IVZNz5RPPDzA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Si4oHHdpcqz8g+DYxxIQ1542YsHaGGRUjysIJZuGCzKa96jhcAgZjotlQVYtz2BaA
	 1HmF5+NCYS12Gzv+UgqniTOT8r4jw6+b8XLrRTQbKbuGhA5nTQmtvsMUhRRcc65LmV
	 6uNv3YqFGkTreb8wG/Yt9cR3WEoUtV7xZ0QYgOpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75CF4F80601; Tue,  8 Aug 2023 15:21:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC85FF805F9;
	Tue,  8 Aug 2023 15:21:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F7C3F8055B; Tue,  8 Aug 2023 15:21:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C82D9F80551
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82D9F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KVMqaTRs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3784vnaJ015760;
	Tue, 8 Aug 2023 08:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=HwEDV4nN2N+kyEvOW8yIZpDp6MQOtKaLzLR+fxPBGmw=; b=
	KVMqaTRsJpPiRwXCwjeA66TP0uOmrh+9BSR1rcewPOKmU07CCyTgHmLZBKEy1NFv
	+EneCwnmeBp06y8Glccqpd6hQKkl4V7AKwrBF451mzutBhvwQdISH/FnN7Xa9CK/
	cW6Ag17VYqEQHCLzdl/N6buZWGk4A3X8te2GaFjZ5LuV7Ei7Q4jfAopbomvjksUI
	r2yRXAeSkLCiptIqJoVZEouR8QBMBJG9d+RTHtyYBuMgkf79Q9mkNVEyhacmT+YH
	NR/8OOOfkY8pY7uTy4mJOSBpHIhjC51CVyj0PYSfiXMwKjj96KdBWzRNOeP2+Vnb
	jIoTAxfNUkzoWPoahOoyzA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd2-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:19 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5FC0E357C;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 11/12] ASoC: intel: sof_sdw: Allow different devices on the
 same link
Date: Tue, 8 Aug 2023 14:20:12 +0100
Message-ID: <20230808132013.889419-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XXGl8-WYITvLsf5tg5Fn_NBNpBpECeQ4
X-Proofpoint-ORIG-GUID: XXGl8-WYITvLsf5tg5Fn_NBNpBpECeQ4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: A5DQAEZ7JAZEUBO3LQ3KI3ECYZS72XE5
X-Message-ID-Hash: A5DQAEZ7JAZEUBO3LQ3KI3ECYZS72XE5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A5DQAEZ7JAZEUBO3LQ3KI3ECYZS72XE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the current code encounters a new type of device on a SoundWire
link, it will abort processing that link and move onto the next
link. However, there is no reason to disallow this setup, it would
appear this was being disallowed to work around issues introduced
by only the first endpoint on each link being checked, which is now
fixed.

The device type shouldn't determine which DAI link it is connected to,
the group ID and aggregation status should.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 357946365e76f..296de5baee3d2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1163,10 +1163,15 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 static int fill_sdw_codec_dlc(struct device *dev,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_dai_link_component *codec,
-			      int codec_index, int adr_index, int dai_index)
+			      int adr_index, int dai_index)
 {
 	unsigned int sdw_version, unique_id, mfg_id, link_id, part_id, class_id;
 	u64 adr = adr_link->adr_d[adr_index].adr;
+	int codec_index;
+
+	codec_index = find_codec_info_part(adr);
+	if (codec_index < 0)
+		return codec_index;
 
 	sdw_version = SDW_VERSION(adr);
 	link_id = SDW_DISCO_LINK_ID(adr);
@@ -1368,8 +1373,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	j = adr_index;
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
 	     i < cpu_dai_num; adr_link_next++) {
-		int _codec_index = -1;
-
 		/* skip the link excluded by this processed group */
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
@@ -1377,17 +1380,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		/* j reset after loop, adr_index only applies to first link */
 		for (; j < adr_link_next->num_adr; j++) {
 			const struct snd_soc_acpi_endpoint *endpoints;
-			int codec_index;
-			u64 adr = adr_link_next->adr_d[j].adr;
-
-			codec_index = find_codec_info_part(adr);
-			if (codec_index < 0)
-				return codec_index;
-			if (_codec_index != -1 && codec_index != _codec_index) {
-				dev_dbg(dev, "Different devices on the same sdw link\n");
-				break;
-			}
-			_codec_index = codec_index;
 
 			endpoints = adr_link_next->adr_d[j].endpoints;
 
@@ -1403,7 +1395,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 
 			ret = fill_sdw_codec_dlc(dev, adr_link_next,
 						 &codecs[codec_dlc_index],
-						 codec_index, j, dai_index);
+						 j, dai_index);
 			if (ret)
 				return ret;
 
-- 
2.30.2

