Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D15773A74
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3DF3E7;
	Tue,  8 Aug 2023 15:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3DF3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501026;
	bh=dpVROW53dR0ue55HSwbJCP/YYB2qAmqJIYh1iheyIY8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3HaSY7NQS/s0BAyzCxwiRKP/PkhPUWMB4dS4grpvXLmsAZz5WJQaqWDgU4uEfZa0
	 smI4ZZsc5GViGBPpulsEerbZ4dfCvYecHQWcXHLKjQqPsZqHR0xu11TnHYk8OD+aJu
	 Ss4yczRgM21uONZ6nlhG9T5qf0usryrCw14Lx+A4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1950F805CA; Tue,  8 Aug 2023 15:20:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2945DF805D3;
	Tue,  8 Aug 2023 15:20:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F5B9F805AC; Tue,  8 Aug 2023 15:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 897EFF80552
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897EFF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=af/oXLka
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nH020848;
	Tue, 8 Aug 2023 08:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=g1rELq1bBk1wUdOwq9UGJq+tXYx476aIPwe7TrfbhqI=; b=
	af/oXLkaCx/VtFDSurbzkO6jn7+c80t2SybLh3Q2Ks+MlAxLQYuCrFFLSu/J0NON
	g4t9FjDn6S2PYesfiFE//Ko5AUjj8Fp0N2HviRo6ODDRJrOUI+1OOpKZSRJ9ZfsB
	EWtJ2v1CUdCAw8fqLFjqpaBUniL4c/tefb5Vpm3mVS/DTr9E9d0PJkyC9Ul9VJS2
	npOWdilIr8ZjxGX291xjMbVhycmmKFCo8JF/zVHsln1xl8TT0fzqqbKRnokgSU9b
	o7cKXK5Mwf9XUJL0Orw8+VLs1mGeX2abhGZvlYA04lvRHnVTCb3/DImBtiirWOrc
	9swVRP8I5JybKCVEA+X6Mg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-6
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
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4A02F3578;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 09/12] ASoC: intel: sof_sdw: Device loop should not always
 start at adr_index
Date: Tue, 8 Aug 2023 14:20:10 +0100
Message-ID: <20230808132013.889419-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SusC8_Jdx_yx1uWW-wUT5xPUJ-ZmQJWO
X-Proofpoint-ORIG-GUID: SusC8_Jdx_yx1uWW-wUT5xPUJ-ZmQJWO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PPVOG7VYZFLZW3IMBEVYDII6CLNDQUIP
X-Message-ID-Hash: PPVOG7VYZFLZW3IMBEVYDII6CLNDQUIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPVOG7VYZFLZW3IMBEVYDII6CLNDQUIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current loops at the top of create_sdw_dailink process the devices
on each link starting from device index adr_index. But adr_index is only
meaningful on the first on these SoundWire links, as it is the index of
the current device on that link. This means devices will be skipped on
later links.

Say for example the system looks like this:

SDW0 - Codec (Not Aggregated), Amp 1 (Aggregated, Group 1)
SDW1 - Amp 2 (Aggregated, Group 1), Amp 3 (Aggregated, Group 1)

The code should create 2 DAI links, one for the CODEC and one for the
aggregated amps. It will create the DAI link for the codec no problem.
When it creates the DAI link for Group 1 however, create_sdw_dailink
will be called with an adr_index of 1, since that is the index of Amp
1 on SDW0.  However, as the loop in create_sdw_dailink moves onto SDW1
it will again start from adr_index, skipping Amp 2. Resulting in the amp
DAI link only have amps 1 and 3 in it.

It is reasonable to start at adr_index on the first link, since
earlier devices have by definition already been processed. However,
update the code when processing later links to handle all devices.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0401516f35de6..767c49022eae4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1366,6 +1366,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		return -ENOMEM;
 
 	/* generate codec name on different links in the same group */
+	j = adr_index;
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
 	     i < cpu_dai_num; adr_link_next++) {
 		const struct snd_soc_acpi_endpoint *endpoints;
@@ -1380,7 +1381,8 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
-		for (j = adr_index; j < adr_link_next->num_adr; j++) {
+		/* j reset after loop, adr_index only applies to first link */
+		for (; j < adr_link_next->num_adr; j++) {
 			int codec_index;
 			u64 adr = adr_link_next->adr_d[j].adr;
 
@@ -1412,6 +1414,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			codec_dlc_index++;
 			(*codec_conf_index)++;
 		}
+		j = 0;
 
 		/* check next link to create codec dai in the processed group */
 		i++;
-- 
2.30.2

