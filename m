Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9850773A69
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5620D84D;
	Tue,  8 Aug 2023 15:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5620D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500940;
	bh=Rcu1PiGJBbZXTk8fmFMLsn/+tnmtZYYlgouBHTqJTZw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csNxEcXZ94+Ph1KyeuoXyqIOxT9uiHX7Mt323ORtRd9gW+DiIi4gwq3ltFr1go8nS
	 VO5tNGtt7IOmcN3I1UUa8K5Oiiwo530A5Rr8MVZ371eL2JSSXb0bQpnHVEm3OSgCHb
	 0E72wK2ikrAupdAlgD+xQmbLpTM5OX9rY2/dUSrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82384F80589; Tue,  8 Aug 2023 15:20:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C54BF80570;
	Tue,  8 Aug 2023 15:20:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A63EDF80553; Tue,  8 Aug 2023 15:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 221CAF80538
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 221CAF80538
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lnetuvUQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3784vnaH015760;
	Tue, 8 Aug 2023 08:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=tkIAOeQHOoIEjCY4hlyCiVh+R7/oqBh0ZDj+O6aGNO0=; b=
	lnetuvUQAIFC8re8iLmfcb2Hh3AP3Xz7DFDaE4z0Pa/etI5X/vA2eCCGOW8m3/Zq
	IpmsMcgnysqtGM0GC60V0cB7JmHY9SXlle9ZapOMREEw5jpB7mz9D6var65WH6VF
	oPUgpVAw8h6Ou2uq5KkPTn77uqrDqb5upcwVHDB2Sa7UN1JXsGc2YEEwrifEj8T0
	f19aZXA6z/3EvsWH/+O9LU2VusWvegcpd/KdMI7gyS+229tPV402jOvgiXpXkQpS
	c6DclQQu0fVNuBUZ6l1PeQ8gFRG33eSQsl5g3SCSaCkUYT3HjdlKUP3vfuqGziFW
	LDW5aatSc0+Tqp94RVZIYQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd2-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3BC0315B4;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 08/12] ASoC: intel: sof_sdw: Move range check of codec_conf
 into inner loop
Date: Tue, 8 Aug 2023 14:20:09 +0100
Message-ID: <20230808132013.889419-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: K1k8vZPKHmi1gJljhkOVx385sAHUnXDS
X-Proofpoint-ORIG-GUID: K1k8vZPKHmi1gJljhkOVx385sAHUnXDS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: G4R7VGMFC2LVORZXQAULAUMIVUT6JGCF
X-Message-ID-Hash: G4R7VGMFC2LVORZXQAULAUMIVUT6JGCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4R7VGMFC2LVORZXQAULAUMIVUT6JGCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two problems with the current range check on the codec_conf
array.

Firstly, adr_link_next->num_adr refers to the number of devices
on the current SoundWire link, but adr_index refers to the first
SoundWire link involved in the DAI link. This means that subtracting
these two numbers is only meaningful on the first SoundWire link in the
DAI and broken on later links.

Secondly, the intention of the range check is to add the number
of remaining devices on the currently link to the current index
and ensure enough space remains. However, this assumes that all
remaining devices on the SoundWire link will be added to the current
DAI link. Ideally this would not be the case, and devices could be
grouped as the user desired.

Moving the range check into the inner loop both simplifies the code (no
need to add and subtract offsets) and allows future refactoring such
that devices on a single SoundWire link don't have to all be grouped onto
a single DAI link. The check will be processed slightly more often since
it is processed for each device rather each link but this is probe time
and the numbers involved are very small here (4 links, likely no more
than 2-4 devices per link).

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b381fb2619943..0401516f35de6 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1380,12 +1380,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
-		/* sanity check */
-		if (*codec_conf_index + adr_link_next->num_adr - adr_index > codec_count) {
-			dev_err(dev, "codec_conf: out-of-bounds access requested\n");
-			return -EINVAL;
-		}
-
 		for (j = adr_index; j < adr_link_next->num_adr; j++) {
 			int codec_index;
 			u64 adr = adr_link_next->adr_d[j].adr;
@@ -1399,6 +1393,12 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			}
 			_codec_index = codec_index;
 
+			/* sanity check */
+			if (*codec_conf_index >= codec_count) {
+				dev_err(dev, "codec_conf array overflowed\n");
+				return -EINVAL;
+			}
+
 			ret = fill_sdw_codec_dlc(dev, adr_link_next,
 						 &codecs[codec_dlc_index],
 						 codec_index, j, dai_index);
-- 
2.30.2

