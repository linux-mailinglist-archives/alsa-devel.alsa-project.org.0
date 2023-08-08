Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EB8773A75
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BEB82B;
	Tue,  8 Aug 2023 15:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BEB82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501039;
	bh=QF8EbwMipU1LR9FKZfZHb7vpCgQENNaq+aRsi1iHZ9Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mx538fKiQMzwL8BCY17EIJr1De9rIoidUmyJrL/wdS2tW32ZTQuAw8FQRviR6IOXh
	 r3LoYoVZ4RB3S/LEQLGHHEX6Gl3xbMZtxN1D6wDE06fdovG9rM38ItfuRrA8/LPv9o
	 lsR/nkdzUnaEpmRhJSZDrxy4NBz0cPh/2j1jYvTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8684F805E6; Tue,  8 Aug 2023 15:20:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E3BF805E0;
	Tue,  8 Aug 2023 15:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A9EF805A1; Tue,  8 Aug 2023 15:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02D01F80557
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D01F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Wr4c0wOm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nI020848;
	Tue, 8 Aug 2023 08:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=U3Pjy+rmca+GOTT+FE3Za7JG2kU0BFtI9OUyQ4AgeWM=; b=
	Wr4c0wOmAk/jk6nd7/oaSEfoSGWblZKjrsAxTYp3Gvh+pW+Aw/y09+5zuEy7GM/R
	vW3ckedCAuTqZeRl2/aM3eOmP7Oex9W/6vd/dBdr9RjhjGyTx4bUoGpUCKnlo2e/
	4iZG9DYVG2ttA2kC6NoC1pewpJ+Z6+YheAcXyeTjzP8JRhgsUh/1qj1Y/h8wKXfP
	gIDrLyXkpt3rUfpEtHqPqAyvVPDJ/fze83fv8HmazVR5mkp5i+H7JhRf6cHDD7aC
	t9BOM6qXc4WhPbMXUtombZAo9j/Jc/hAIl3ki6vHiMtqwPF9MfevXT3edjmdRU8C
	g6WDKBswGbUQRMJ2dHzxjw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E1E63575;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 12/12] ASoC: intel: sof_sdw: Simplify get_slave_info
Date: Tue, 8 Aug 2023 14:20:13 +0100
Message-ID: <20230808132013.889419-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1x6G7uD89t_4BmCvfFyrreSxKPhRb_Cf
X-Proofpoint-ORIG-GUID: 1x6G7uD89t_4BmCvfFyrreSxKPhRb_Cf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AFZPP6T3GT4GB63HAIDGR2ZBUOSXISQS
X-Message-ID-Hash: AFZPP6T3GT4GB63HAIDGR2ZBUOSXISQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFZPP6T3GT4GB63HAIDGR2ZBUOSXISQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now the first device on a link is not treated specially there is no
need to have a separate loop to handle the current link over the
future links, as the logic is identical. Combine this all into a
single processing loop.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 38 ++++++++++----------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 296de5baee3d2..f283c0d528dfc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1265,57 +1265,43 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  int *codec_num, unsigned int *group_id,
 			  int adr_index)
 {
-	const struct snd_soc_acpi_adr_device *adr_d;
-	const struct snd_soc_acpi_link_adr *adr_next;
-	bool no_aggregation;
-	int index = 0;
+	bool no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	int i;
 
-	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
-	adr_d = &adr_link->adr_d[adr_index];
-
-	cpu_dai_id[index++] = ffs(adr_link->mask) - 1;
-	if (!adr_d->endpoints->aggregated || no_aggregation) {
+	if (!adr_link->adr_d[adr_index].endpoints->aggregated || no_aggregation) {
+		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
 		*cpu_dai_num = 1;
 		*codec_num = 1;
 		*group_id = 0;
 		return 0;
 	}
 
-	*group_id = adr_d->endpoints->group_id;
-
-	/* Count endpoints with the same group_id in the adr_link */
 	*codec_num = 0;
-	for (i = 0; i < adr_link->num_adr; i++) {
-		if (adr_link->adr_d[i].endpoints->aggregated &&
-		    adr_link->adr_d[i].endpoints->group_id == *group_id)
-			(*codec_num)++;
-	}
+	*cpu_dai_num = 0;
+	*group_id = adr_link->adr_d[adr_index].endpoints->group_id;
 
-	/* gather other link ID of slaves in the same group */
-	for (adr_next = adr_link + 1; adr_next && adr_next->num_adr; adr_next++) {
+	/* Count endpoints with the same group_id in the adr_link */
+	for (; adr_link && adr_link->num_adr; adr_link++) {
 		unsigned int link_codecs = 0;
 
-		for (i = 0; i < adr_next->num_adr; i++) {
-			if (adr_next->adr_d[i].endpoints->aggregated &&
-			    adr_next->adr_d[i].endpoints->group_id == *group_id)
+		for (i = 0; i < adr_link->num_adr; i++) {
+			if (adr_link->adr_d[i].endpoints->aggregated &&
+			    adr_link->adr_d[i].endpoints->group_id == *group_id)
 				link_codecs++;
 		}
 
 		if (link_codecs) {
 			*codec_num += link_codecs;
 
-			if (index >= SDW_MAX_CPU_DAIS) {
+			if (*cpu_dai_num >= SDW_MAX_CPU_DAIS) {
 				dev_err(dev, "cpu_dai_id array overflowed\n");
 				return -EINVAL;
 			}
 
-			cpu_dai_id[index++] = ffs(adr_next->mask) - 1;
+			cpu_dai_id[(*cpu_dai_num)++] = ffs(adr_link->mask) - 1;
 		}
 	}
 
-	*cpu_dai_num = index;
-
 	return 0;
 }
 
-- 
2.30.2

