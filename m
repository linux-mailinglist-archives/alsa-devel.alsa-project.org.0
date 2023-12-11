Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD880D058
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 17:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0804AA4E;
	Mon, 11 Dec 2023 17:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0804AA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702310469;
	bh=Wk/PTSFEppRPRUETNitQCtkOeMv8VYQlXsJk9vLqBV0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DZCsqqeedzb/f9Td1EHDa3JIJrAb9hPh5+v/xRubc2A7PR6AchlIaPUS8rM8mcJ5F
	 caEWzNnS54bpWzBOze2zDtN2c0UHWH+mCYMcY9FIQq96qTay8yi1lzzMOzSvKQormi
	 B6zwtT/iZeQFTj22FhI/W6buLQxfBTrsgb85L0WY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B451AF805B6; Mon, 11 Dec 2023 17:00:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D16AF80571;
	Mon, 11 Dec 2023 17:00:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3029DF8016E; Mon, 11 Dec 2023 17:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B367F8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 17:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B367F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LppkKUfN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BB7Pkm8007446;
	Mon, 11 Dec 2023 10:00:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=b
	jafRYMH50f4UYPaGwaOk891K4A13df3CXIAj5UGVu8=; b=LppkKUfNnelw3yJNd
	Mq+u2Y4kPHZ35uPx0MADfDAXbvd4+ivMVdBWhWnM3qm4RgrjVjZ7kHYUkZN2LaKW
	itadxt/S+C7bLIyOPt0hnfGm4MhFKL7FgMo0ZVotS9M/GHDFKLwOA6T+6vHjOHu3
	2NxbOzha/pE0jZuKCdC45msYvvTaoo1sWRcJrdHM/Eq+qzXf0qAso2/8mmyfvYOu
	Pw6aVF63aycHhT3gzLDFX/wd0xel/7LQKCXD4gIJzEqiuCJZRlvAfLAFQ5p4in52
	xANV/6Th7S0UuUsSh6MOaVSZZSgzPOf9XFDt0meyPIo+m/+IwzJKeNB0ynReXoKr
	877BQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpj0qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:00:20 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 16:00:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 11 Dec 2023 16:00:19 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4682F11D1;
	Mon, 11 Dec 2023 16:00:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: cs42l43: Don't enable bias sense during type detect
Date: Mon, 11 Dec 2023 16:00:18 +0000
Message-ID: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: k78qko08HQbejdWxkef4n-PsXyhMSK24
X-Proofpoint-ORIG-GUID: k78qko08HQbejdWxkef4n-PsXyhMSK24
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZAHBRH5AKU4JCEFPVTXJ67T6GHBJRU36
X-Message-ID-Hash: ZAHBRH5AKU4JCEFPVTXJ67T6GHBJRU36
X-MailFrom: prvs=77093359cb=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAHBRH5AKU4JCEFPVTXJ67T6GHBJRU36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Alas on some headsets the bias sense can cause problems with the
type detection. It can occasionally be falsely triggered by the type
detect itself and as the clamp is applied when this happens, it will
cause a headset to be incorrectly identified as headphones. As
such it should be disabled whilst running type detect. This does
mean a jack removal during type detect will cause a larger click
but that is unfortunately unavoidable.

Fixes: 1e4ce0d5c023 ("ASoC: cs42l43: Move headset bias sense enable earlier in process")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 73454de068cf8..54a3ea6064438 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -237,7 +237,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 	return ret;
 }
 
-static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool force_high)
+static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool type_detect)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 	unsigned int val = 0x3 << CS42L43_HSBIAS_MODE_SHIFT;
@@ -247,16 +247,17 @@ static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool force_high)
 	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
 			   CS42L43_HS_CLAMP_DISABLE_MASK, CS42L43_HS_CLAMP_DISABLE_MASK);
 
-	if (!force_high && priv->bias_low)
-		val = 0x2 << CS42L43_HSBIAS_MODE_SHIFT;
-
-	if (priv->bias_sense_ua) {
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_HSBIAS_SENSE_EN_MASK |
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
-				   CS42L43_HSBIAS_SENSE_EN_MASK |
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+	if (!type_detect) {
+		if (priv->bias_low)
+			val = 0x2 << CS42L43_HSBIAS_MODE_SHIFT;
+
+		if (priv->bias_sense_ua)
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_HSBIAS_SENSE_EN_MASK |
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
+					   CS42L43_HSBIAS_SENSE_EN_MASK |
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
 	}
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_MIC_DETECT_CONTROL_1,
-- 
2.39.2

