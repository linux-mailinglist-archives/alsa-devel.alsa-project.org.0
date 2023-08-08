Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFF773A67
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2028829;
	Tue,  8 Aug 2023 15:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2028829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500882;
	bh=+/el0uwarQVAGcc4tBF56AyweKNlKHQ3L1r2ac2ogDk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A9tQHuxxFYdedTcibC4g6a8ORTP3EI1T8a4BCt7A07qgzNWS/0VW3sibe7UNlk1AU
	 +TKJV339O6MQ4zgfwNWwveWSoYYNNBOZifRagP/q0zLDiB6X9OZOfCxRRTEwHiphFc
	 xuBvKu/7KTeRvg/nfrUQKz7woVOhuVH65fJtHotA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55DA3F800FE; Tue,  8 Aug 2023 15:20:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B02BBF80534;
	Tue,  8 Aug 2023 15:20:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA120F8055A; Tue,  8 Aug 2023 15:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05C4AF80154
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05C4AF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cqnoZ9kQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3784vnaF015760;
	Tue, 8 Aug 2023 08:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=rkgtbgi+SCWiycXk9ralVFCH8E4FPGd1CJTOd1wVrv4=; b=
	cqnoZ9kQDYqBLAUGYy3E9bF36VoXsZPIE8uEeaMODr9ixeeoFp/31qwTF1nuY29I
	rYx/+LI/ZL6NwUmYpzX07w3YbWv68RPIoz1rOZckixgDu63zNcxLkA1IetAzlNCD
	0jwxiBY2EDYcIIQ5tmp2GwlvGOiPq1CqwIEy3pG/4csq4+ezIlkFD9UrePzeK22p
	9d05T86m2B/8jhfapshO+ghz1LGnfn1RpoCXUEgb4HZOd7Mk6LjQb5wYTii3RVBp
	Z/kJDArW70xTN3gQidOSnsCiyY+WW/78B+tdGynilvVreC5D8eWJzpF38LuoBn3+
	vGOgdhFV55gLMZPVor7LzQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:16 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 009EB357C;
	Tue,  8 Aug 2023 13:20:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 04/12] ASoC: intel: sof-sdw: Move check for valid group id to
 get_dailink_info
Date: Tue, 8 Aug 2023 14:20:05 +0100
Message-ID: <20230808132013.889419-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lbQ7XnNaUc0set8fkXSUIgn-XfDW2VzG
X-Proofpoint-ORIG-GUID: lbQ7XnNaUc0set8fkXSUIgn-XfDW2VzG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y2TRRDX2IWPZZEFIOOIP64CV6LPC4OJA
X-Message-ID-Hash: Y2TRRDX2IWPZZEFIOOIP64CV6LPC4OJA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2TRRDX2IWPZZEFIOOIP64CV6LPC4OJA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the check for a valid group id into get_dailink_info as
well. This does cause a slight change in behaviour in that the system
will return an error rather than just ignoring the link with an
invalid group id. There are presently no systems with invalid group
ids in mainline and failing seems more appropriate since it will
better highlight the code needs fixing.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 268629d5505c3..b250fb7be4bff 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1074,6 +1074,11 @@ static int get_dailink_info(struct device *dev,
 			}
 
 			endpoint = adr_link->adr_d[i].endpoints;
+			if (endpoint->aggregated && !endpoint->group_id) {
+				dev_err(dev, "invalid group id on link %x\n",
+					adr_link->mask);
+				return -EINVAL;
+			}
 
 			for (j = 0; j < codec_info->dai_num; j++) {
 				/* count DAI number for playback and capture */
@@ -1666,11 +1671,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			const struct snd_soc_acpi_endpoint *endpoint;
 
 			endpoint = adr_link->adr_d[i].endpoints;
-			if (endpoint->aggregated && !endpoint->group_id) {
-				dev_err(dev, "invalid group id on link %x\n",
-					adr_link->mask);
-				continue;
-			}
 
 			/* this group has been generated */
 			if (endpoint->aggregated &&
-- 
2.30.2

