Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0683BEE9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 279EA857;
	Thu, 25 Jan 2024 11:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 279EA857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178815;
	bh=74xy6bXGMuQCFhfauhIX2FmqVaxkq835O7ubysl9X9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BuiAaRXW4AOtHQT/RseXcLVZIKrQ8DoFqC5R1pFaXLmHwduzmJ/ZPfh2KHhpKdfUc
	 NXa3QG8RVwwUhtSJKDq90Hfx7tA/PyiUHR4/bm+mWNeoBy696v67V/OheMxY/IvUC9
	 HC1Zm14gGViHia8y5kt4k9gHNYgQBmi2xb+/xruY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D274F80672; Thu, 25 Jan 2024 11:32:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8DFF8067E;
	Thu, 25 Jan 2024 11:32:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60FBDF805D9; Thu, 25 Jan 2024 11:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35AD4F804E7
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35AD4F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JQdrJRU4
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ8010841;
	Thu, 25 Jan 2024 04:31:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=b00fmaNr6KFnOua3z2NJYeD2LfAVRCQxrGXVQrSrW00=; b=
	JQdrJRU4kja38XML6pj9OvE9rwJaCDeDGq6eVaiPHhjUQNiHxhEt2WGDu7zisE8k
	z/Meeoc1g5+PDiZ5w4ZRwOcjT+D22vuaYDaHc794ojAvnP4fEf0iWLOyXhEBH8Oi
	z2mvjigUiAQFvy/sxLqly5dq+NeCEYOEk7Z6MYdNAESTdUWYp9SEIFNgOeL7alai
	jbcQ0o2254aunOp6r8fpfPYKgRcomstEeOhR36Pf72lPibR4XjPLoyyukGiMbze8
	h7AlTlUsGObGE5EhyhTxstBBu4cTtsNITroWByLMi6UbcyuS5MrD0VsI0/29sTpW
	qX1ST5ip7xFKMl6CvFe/rA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AA5D5820270;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider
 for the PLL
Date: Thu, 25 Jan 2024 10:31:17 +0000
Message-ID: <20240125103117.2622095-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wTqMl6uxuAiMH9BltiOe4Yhf_F3B6Eqw
X-Proofpoint-GUID: wTqMl6uxuAiMH9BltiOe4Yhf_F3B6Eqw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KXZNA77E2ILRD3CIJUY34CBL47VAR2TH
X-Message-ID-Hash: KXZNA77E2ILRD3CIJUY34CBL47VAR2TH
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXZNA77E2ILRD3CIJUY34CBL47VAR2TH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use fls to calculate the pre-divider and input frequency for the PLL,
this is marginally faster than the previous loop.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Change / into >>

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 23e9557494afa..2c402086924d3 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1338,10 +1338,9 @@ static int cs42l43_enable_pll(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Enabling PLL at %uHz\n", freq);
 
-	while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq) {
-		div++;
-		freq /= 2;
-	}
+	div = fls(freq) -
+	      fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq);
+	freq >>= div;
 
 	if (div <= CS42L43_PLL_REFCLK_DIV_MASK) {
 		int i;
-- 
2.30.2

