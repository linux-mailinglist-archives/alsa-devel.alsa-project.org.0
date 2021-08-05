Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019953E1948
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 18:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73ED316EF;
	Thu,  5 Aug 2021 18:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73ED316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628180083;
	bh=jcoIT9i7tX7Mmp0FB+AdlHkjLdL0FLg6x/SzBHVgowc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5qbVpvOJq2QDL6Sw06knKRQetMs6NEgUcLE4d8zqlAOdezsL2jb9Mfq6UYSyZYTX
	 7d1KopVsC/JgJqTyNfumxlRcb6u4AXcCcGhlsIaBNjguIi/6SV8K/OGb9wl3N2GYl5
	 NphHln8sokcwYp+9fQXvEGySb80mvYlB2Am2HuO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F88DF804FD;
	Thu,  5 Aug 2021 18:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C44F804F3; Thu,  5 Aug 2021 18:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29ABCF802E8
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 18:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29ABCF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nIHjKxX4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175EPV3Y027692; 
 Thu, 5 Aug 2021 11:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=d3mPwDDSfaabebNz7Ge775dZvtX8lcNvZIXrc4dG88s=;
 b=nIHjKxX4LKdG+NVKHwFbXG2gg+aJbScXHz/Zgj9502KnGxhUokAg/YOJciU7fMD6LrJk
 izA+FeIWZ6K+rymOpgIEiSemY17adDfAi4if2PHAoySn3/VbFWFf40Ro8bDeCD1J/3sQ
 LdNVbzOJ+OJOzcgaSobQfwiWjCspWWDszqkjAOiPhR1Gno1xRWCHqE9XBwRNEejjFFSI
 19iSQJBAtQO3kVyUsj84Au3wo/c+6D2NeD8PKn4lvoN5uxeN0k3ERFdSNcWHNLw5jhGs
 +KZ5c7te2ryZxRPJmb6pc2mqNhlfAOYp9xjK89cTp9EYQL52p6mA3rJlHqKYrRTjYqcp bA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a8c61rku6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Aug 2021 11:11:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 5 Aug
 2021 17:11:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 5 Aug 2021 17:11:15 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.37])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D43A45D;
 Thu,  5 Aug 2021 16:11:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 7/8] ASoC: cs42l42: Assume 24-bit samples are in 32-bit slots
Date: Thu, 5 Aug 2021 17:11:10 +0100
Message-ID: <20210805161111.10410-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RFG3QrSB7Xl2CJSzzW90kCByKMC4N6lT
X-Proofpoint-ORIG-GUID: RFG3QrSB7Xl2CJSzzW90kCByKMC4N6lT
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050099
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the machine driver doesn't call snd_soc_dai_set_sysclk() the
SCLK is assumed to be sample_rate * sample_bits * 2 (that is, the
rate necessary for a standard I2S frame).

But 24-bit samples can be sent in either a 24-bit slot or a 32-bit
slot. If the PLL is configured for a 24-bit slot, but a 32-bit slot is
used, cs42l42 will be overclocked.

Ultimately it is the machine driver's responsibilty to call
snd_soc_dai_set_sysclk() if SLK will be different from the standard
I2S rate. However, it is convenient to assume 32-bit slots to allow
this common case without needing special machine driver support. The
machine driver then only has to set SCLK if the slots are 24-bit, but
if it fails to do this cs42l42 won't be overclocked.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b2ee51443a22..3677ed4670d0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -844,6 +844,13 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (channels == 1)
 		cs42l42->bclk *= 2;
 
+	/*
+	 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
+	 * more than assumed (which would result in overclocking).
+	 */
+	if (params_width(params) == 24)
+		cs42l42->bclk = (cs42l42->bclk / 3) * 4;
+
 	switch(substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
 		if (channels == 2) {
-- 
2.11.0

