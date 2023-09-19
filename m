Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF607A5FB6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D1EE81;
	Tue, 19 Sep 2023 12:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D1EE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119679;
	bh=zCHigkz5qOmu6rN79FyQw65XeVR/xpE7sBdujr8tkVc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XwbTZBCEH1ySN2OjCriugzYIE27D8Z9eHVIPUOaHhjdE23MMkTxeUEiNR7SXeQoBO
	 dUwj20coBU0+SL0g+NvBaiLLgMM7Xcdk7CaB9jQgWYf/Rv9T/1LwCGTXCKGFggT8Sx
	 PdUCcEwPBS43U8MufRFiCW0ml8gVuSgXuC/wnfmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4878FF805D7; Tue, 19 Sep 2023 12:31:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9A6F805CB;
	Tue, 19 Sep 2023 12:31:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF983F8055A; Tue, 19 Sep 2023 12:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0381DF8047D
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0381DF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iZPbnpn2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J4KMC1022193;
	Tue, 19 Sep 2023 05:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=MbOsx33jbJnId1a0yXiSgaIvJzBImpYmPhK8ywUm6mE=; b=
	iZPbnpn2LtAtBzFPymC+b0xXoKy46tWczjE36zRaO7kKIF0uDC3IbHTRTYF7MltF
	z7Um84RLthPa6T48jYqweFK5t1ivVTDZ79ZzNpcm1fmkrmp/JLTeZgEzW/+2GX5B
	Ho6Zq9TzTqY65Ob6D1Y9LmkkhKg9nB9Xp1Zsj+rg4JoSumdzuMhnQDm00L5722U1
	/TYm47D4/eXelP236gxtL/jluDS329O7jxRwtcQfcdwY2GEWBOBzOFslZXCAwERh
	sLWQ0L7x/V3V7xQ93r3HM6kMlZgHazCGsqo0QPMwzn/uFbnUE8cRpPNrZh1PM48J
	ThK+wwGURS8c7abuVvfqMQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry3p1j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 05:31:20 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 11:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 11:31:16 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77FEC3575;
	Tue, 19 Sep 2023 10:31:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 3/5] ASoC: cs42l43: Enable bias sense by default
Date: Tue, 19 Sep 2023 11:31:14 +0100
Message-ID: <20230919103116.580305-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
References: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E7BJ5zT0d4cvrFZhzOkZSQth-GatEada
X-Proofpoint-ORIG-GUID: E7BJ5zT0d4cvrFZhzOkZSQth-GatEada
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HTELTYBQZT5BH77S2IWFYBWBV62LMEPD
X-Message-ID-Hash: HTELTYBQZT5BH77S2IWFYBWBV62LMEPD
X-MailFrom: prvs=4626caf035=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTELTYBQZT5BH77S2IWFYBWBV62LMEPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve the default pop performance on jack removal by enabling bias
sense on the least sensitive level by default.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 7008e50eded96..7bd7cc1779506 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -127,7 +127,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 
 	hs2 |= ret << CS42L43_HSBIAS_RAMP_SHIFT;
 
-	ret = cs42l43_find_index(priv, "cirrus,bias-sense-microamp", 0,
+	ret = cs42l43_find_index(priv, "cirrus,bias-sense-microamp", 14,
 				 &priv->bias_sense_ua, cs42l43_accdet_bias_sense,
 				 ARRAY_SIZE(cs42l43_accdet_bias_sense));
 	if (ret < 0)
-- 
2.39.2

