Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99304773A71
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA82826;
	Tue,  8 Aug 2023 15:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA82826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500987;
	bh=SI1ACRW+oMXPlwVU0S1BycZMl2eOloV8st+AiyzM9yw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoPTqVaeYIZUoAR+BcaRFP78bgGlhXu5wm6UInWeTE4PMusleNPxfTr5o7Q5uOQTs
	 D3LKs1kAENkoS6wyJPnszPlmi0Il4MwNwxr5fgVZqczPkEe7iFKeTRvdBYH4wj3bBQ
	 EXOGzo7CYxHf6WRJ32SDJ0w2cxHWGQ7HNm3Ib+C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E5B6F805BA; Tue,  8 Aug 2023 15:20:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CDACF805AF;
	Tue,  8 Aug 2023 15:20:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66EBF8058C; Tue,  8 Aug 2023 15:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7910EF80544
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7910EF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WWz+iEyB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3784vnaI015760;
	Tue, 8 Aug 2023 08:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=iHPydD49TX7zhADeyyXwvU0B67z9DvHRR+iJaUDcbdM=; b=
	WWz+iEyBo5E/WoI07OmFPWvVhwzOh+cAyYMWGQk2p++CVi8dSmpX6Gk7KJeEr1WM
	x/grQpNHDTv9R1cReMWueKa8DOHttNqAdkBKk3wWJKbgEwxlNSMFWpTjjsr4Js3v
	UQyad7gw1kKG4TxIL8eAOFulQYhz+uq9XY+EanRHFH7bhJwDOUxqc5iC7Jxtodod
	H6EXCLhfAct/7/By/bogE4nQBiFIuNS8olAAaeFKc1DEsvB1gYx8FOTRcI302F02
	wU+1ME+HkpKXq7jk1M2zXVw72jm/+wiZWrrliAmHGmOmhBrVOrIisls+9JcyXPO/
	ngftGcaJA4RO5hRJxCfvsw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd2-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:18 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 59F6115B7;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 10/12] ASoC: intel: sof_sdw: Support multiple groups on the
 same link
Date: Tue, 8 Aug 2023 14:20:11 +0100
Message-ID: <20230808132013.889419-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: b1Njyk23LFVYam4g_Ye4dJBMpk0IU92g
X-Proofpoint-ORIG-GUID: b1Njyk23LFVYam4g_Ye4dJBMpk0IU92g
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TRI2E5FJA2R5O2KESBQQITLQC7UMLCNA
X-Message-ID-Hash: TRI2E5FJA2R5O2KESBQQITLQC7UMLCNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRI2E5FJA2R5O2KESBQQITLQC7UMLCNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current code checks the first device on a link and assumes
that all the other devices on the link will have the same endpoint
aggregation status and endpoint group ID.

Say for example a system looked like:

SDW0 - Amp 1 (Aggregated, Group 1), Mic 1 (Aggregated, Group 2)
SDW1 - Amp 2 (Aggregated, Group 1), Mic 2 (Aggregated, Group 2)

The current code would create the DAI link for the aggregated amps,
although it is worth noting that the only reason Mic 2 is not added is
the additional check that aborts processing the link when the device
changes. Then when processing the DAI link for the microphones, Mic
2 would not be added, as the check will only be done on the first
device, which would be Amp 2 and thus the wrong group, causing the
whole link to be skipped.

Move the endpoint check to be for each device rather than the first
device on each link.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 42 ++++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 767c49022eae4..357946365e76f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1288,25 +1288,24 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	}
 
 	/* gather other link ID of slaves in the same group */
-	for (adr_next = adr_link + 1; adr_next && adr_next->num_adr;
-		adr_next++) {
-		const struct snd_soc_acpi_endpoint *endpoint;
-
-		endpoint = adr_next->adr_d->endpoints;
-		if (!endpoint->aggregated ||
-		    endpoint->group_id != *group_id)
-			continue;
+	for (adr_next = adr_link + 1; adr_next && adr_next->num_adr; adr_next++) {
+		unsigned int link_codecs = 0;
 
-		if (index >= SDW_MAX_CPU_DAIS) {
-			dev_err(dev, "cpu_dai_id array overflows\n");
-			return -EINVAL;
-		}
-
-		cpu_dai_id[index++] = ffs(adr_next->mask) - 1;
 		for (i = 0; i < adr_next->num_adr; i++) {
 			if (adr_next->adr_d[i].endpoints->aggregated &&
 			    adr_next->adr_d[i].endpoints->group_id == *group_id)
-				(*codec_num)++;
+				link_codecs++;
+		}
+
+		if (link_codecs) {
+			*codec_num += link_codecs;
+
+			if (index >= SDW_MAX_CPU_DAIS) {
+				dev_err(dev, "cpu_dai_id array overflowed\n");
+				return -EINVAL;
+			}
+
+			cpu_dai_id[index++] = ffs(adr_next->mask) - 1;
 		}
 	}
 
@@ -1369,20 +1368,15 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	j = adr_index;
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
 	     i < cpu_dai_num; adr_link_next++) {
-		const struct snd_soc_acpi_endpoint *endpoints;
 		int _codec_index = -1;
 
-		endpoints = adr_link_next->adr_d->endpoints;
-		if (group_id && (!endpoints->aggregated ||
-				 endpoints->group_id != group_id))
-			continue;
-
 		/* skip the link excluded by this processed group */
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
 		/* j reset after loop, adr_index only applies to first link */
 		for (; j < adr_link_next->num_adr; j++) {
+			const struct snd_soc_acpi_endpoint *endpoints;
 			int codec_index;
 			u64 adr = adr_link_next->adr_d[j].adr;
 
@@ -1395,6 +1389,12 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			}
 			_codec_index = codec_index;
 
+			endpoints = adr_link_next->adr_d[j].endpoints;
+
+			if (group_id && (!endpoints->aggregated ||
+					 endpoints->group_id != group_id))
+				continue;
+
 			/* sanity check */
 			if (*codec_conf_index >= codec_count) {
 				dev_err(dev, "codec_conf array overflowed\n");
-- 
2.30.2

