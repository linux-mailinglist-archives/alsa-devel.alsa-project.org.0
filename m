Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC6773A76
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25D5857;
	Tue,  8 Aug 2023 15:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25D5857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691501055;
	bh=yHg51A1kT674YLINfzC5GUTJQHPjKh49A5wjzUVKHz4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qDBxY08/hluDv7hpOHETeozgnoMp1jwy1McgGoqD4CqbMHxvw53UN2gGBgAo8XVfK
	 P9T/5YK72X0ayU4Ud2qFuYbRtHekXU9cY1ALA7EzW0X0BGwGfkQZ2Zxqn1cQzZi+Ea
	 dQlwP4SEsl/lOSKXTDXNNSMaOUJZ7oQbw7N4LMo8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CDE4F805ED; Tue,  8 Aug 2023 15:21:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5623AF80551;
	Tue,  8 Aug 2023 15:21:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC30F805EB; Tue,  8 Aug 2023 15:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E548F8053B
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E548F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CIrry52q
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nF020848;
	Tue, 8 Aug 2023 08:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=1DjSJgcQ/Zq6f5j7edakEWMzVzSXtUfrRpnjzYN3WWI=; b=
	CIrry52qUpjZyyUaK60GvFHrjawBCd4jVGHz9g55TZwoW8hDALp7pMs0k0fR2sxQ
	oZ3EaspJfZCIjgbLmEgtf84cOpvyM6yQbYvGZY/uT8EubJ1rHHJOgGW5dranSCLZ
	RoqBoSYCNTcjTEClH4ogCgD4sWRgJO5qlweEPM+HZ9LRz2X8C+kDPsXxvxPYWC66
	vHupcZxBjvTCYzH0NtbARvBU7B/9wWZuGAWPgKt4FIDRK3Y1p5cAy1aaGuEuBT2e
	1PP6FS1Gqc/R/sLGn0jSGvGu/Jy/YWjbg5DIgpSFiLzV6PgxQ/ueFZQ3P8eMVMzE
	rJzDaCEd12ZPkYj8py2Rmw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:18 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A2CA357D;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 07/12] ASoC: intel: sof_sdw: Update DLC index each time one is
 added
Date: Tue, 8 Aug 2023 14:20:08 +0100
Message-ID: <20230808132013.889419-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rWkNOPPMtwhxUZBEAE0bP4bM6QPMxpuP
X-Proofpoint-ORIG-GUID: rWkNOPPMtwhxUZBEAE0bP4bM6QPMxpuP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VQHV4RLXVUJMAIHQFMCASBK3XTALK2BI
X-Message-ID-Hash: VQHV4RLXVUJMAIHQFMCASBK3XTALK2BI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQHV4RLXVUJMAIHQFMCASBK3XTALK2BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In create_sdw_dailink, rather than bulk updating the index into the
DAI link components array, at the end of processing a link, do so each
time the code adds a new component. This simplifies things slightly,
as an intermediate variable is no longer needed to track the current
place in the DAI link components array.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5c154628236c7..b381fb2619943 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1387,7 +1387,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		}
 
 		for (j = adr_index; j < adr_link_next->num_adr; j++) {
-			int codec_index, comp_index;
+			int codec_index;
 			u64 adr = adr_link_next->adr_d[j].adr;
 
 			codec_index = find_codec_info_part(adr);
@@ -1399,24 +1399,22 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			}
 			_codec_index = codec_index;
 
-			comp_index = j - adr_index + codec_dlc_index;
-
 			ret = fill_sdw_codec_dlc(dev, adr_link_next,
-						 &codecs[comp_index],
+						 &codecs[codec_dlc_index],
 						 codec_index, j, dai_index);
 			if (ret)
 				return ret;
 
-			codec_conf[*codec_conf_index].dlc = codecs[comp_index];
+			codec_conf[*codec_conf_index].dlc = codecs[codec_dlc_index];
 			codec_conf[*codec_conf_index].name_prefix =
 					adr_link_next->adr_d[j].name_prefix;
 
+			codec_dlc_index++;
 			(*codec_conf_index)++;
 		}
 
 		/* check next link to create codec dai in the processed group */
 		i++;
-		codec_dlc_index += adr_link_next->num_adr;
 	}
 
 	/* find codec info to create BE DAI */
-- 
2.30.2

