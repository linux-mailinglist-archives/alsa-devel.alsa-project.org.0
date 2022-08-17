Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B1596E61
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 14:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A33161D;
	Wed, 17 Aug 2022 14:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A33161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660739126;
	bh=FAaBokrkz6MznhaVd2OUYsKyJbdnwkGZnz65dzhCVtY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JT2JssvLKOlGrZ/pcgO72LJwUEUbY2opE9yZvmzT63MuNkmwVHlmvWxm4+ErRBUNG
	 M9MUzqxJDE9DhZk6CxH+NrFy16O8fcv+MkZth6ScYJ3j2d0+iL5KchSKEu2hY1ShHu
	 oQRyFje7ktDIOZ2vHQ4Z0hNmWVvbsrLeRbyXTHL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F186F80088;
	Wed, 17 Aug 2022 14:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D7B2F80534; Wed, 17 Aug 2022 14:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACE8F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 14:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACE8F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZsG/wqn2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H4vLJd010755;
 Wed, 17 Aug 2022 07:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fo2EGunu8bsAB6527X+mSVSKQLth99Br3x4ca9Xnrow=;
 b=ZsG/wqn2+bIrzzJP+t/OZPsPnDjqMJZEvcfh5PZdvKYjLfCGHzTeNQQbhd3yCjFJkB98
 kYpzqSPDZrQUVqkWj1QCRqCpOjIFNgwG9AFpJ8ijEPq+MnVbjIQINEQGU/XuFvCOY9mR
 iTbPLaqx25BkbW4Kbf75fZhVsEwIJqm/SPmMkdajZ11ZLl6rVMttEU8hbrOLwyxPJrQI
 rXRCqNaNai/rWlLQx0+vHdOAarqrDijumXq8cOudmblUJv4Uypl5XAWoWW88DiPjikvj
 EYINjpUeUselpDIq5JYVTI7MtfE8CDXfOlmc1DGDH63IFOMJf3rzcjf35jNlJoJnCWlG XQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpcuec-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 07:23:49 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 17 Aug
 2022 07:23:47 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Wed, 17 Aug 2022 07:23:47 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E8290459;
 Wed, 17 Aug 2022 12:23:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: cs42l42: Use snd_soc_tdm_params_to_bclk()
Date: Wed, 17 Aug 2022 13:23:47 +0100
Message-ID: <20220817122347.1356773-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817122347.1356773-1-rf@opensource.cirrus.com>
References: <20220817122347.1356773-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: i55BiZiuETI5FMbZ4F4wNDydevJOqvag
X-Proofpoint-GUID: i55BiZiuETI5FMbZ4F4wNDydevJOqvag
X-Proofpoint-Spam-Reason: safe
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

Use the new snd_soc_tdm_params_to_bclk() helper function to
calculate the bclk. This function handles most of the previous
manipulation and makes the code tidier.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a84d873e29df..42cdb051e0fb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -893,22 +893,21 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int channels = params_channels(params);
 	unsigned int width = (params_width(params) / 8) - 1;
+	unsigned int slot_width = 0;
 	unsigned int val = 0;
 	int ret;
 
 	cs42l42->srate = params_rate(params);
-	cs42l42->bclk = snd_soc_params_to_bclk(params);
-
-	/* I2S frame always has 2 channels even for mono audio */
-	if (channels == 1)
-		cs42l42->bclk *= 2;
 
 	/*
 	 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
 	 * more than assumed (which would result in overclocking).
 	 */
 	if (params_width(params) == 24)
-		cs42l42->bclk = (cs42l42->bclk / 3) * 4;
+		slot_width = 32;
+
+	/* I2S frame always has multiple of 2 channels */
+	cs42l42->bclk = snd_soc_tdm_params_to_bclk(params, slot_width, 0, 2);
 
 	switch (substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
-- 
2.30.2

