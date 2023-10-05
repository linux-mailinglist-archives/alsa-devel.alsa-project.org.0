Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144047B9DE6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 15:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F9EDE5;
	Thu,  5 Oct 2023 15:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F9EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696514246;
	bh=Clk1zZLcTD1RtS8dpxd9g0bTbs5O9DBW/U2ou7FQ7F8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sl9Cixenrl9ZQ5ANYTISnQiHiIAy3+JmrlRMFP8Wm/Zyt0z2w9HniNfVVd+719Nfh
	 mYRqx+LSZ8Xruw1ROUlBU15wE8Og1dH85Vu5a834XopUFHqlMB2ixmS671ZN9OrhON
	 Ahoh1DxJ3ie4SZch05eJx//N91J7FEVFKShU88ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF1DBF80310; Thu,  5 Oct 2023 15:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 367FAF80310;
	Thu,  5 Oct 2023 15:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5763EF80549; Thu,  5 Oct 2023 15:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15895F801EB
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 15:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15895F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=muxLXexF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 395B5dCC026417;
	Thu, 5 Oct 2023 08:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=B/JJ0o25OMiXh7ZKoyzaRdrsMaOHfw5utqUGnF502pg=; b=
	muxLXexFQVaTYS+OUnvK+vD3ePXj5MQNUN2XBNgkrDRrFPVVrN3ako5UbCtH6NjX
	32FUqjFQvsP9n1UFGThiuoKX5e8h0CKPi7b3bUEy4ST29eOgV8dQvPPDfv4ZKAUg
	230V/zLzHQble3AuLa5ICZT47+qjqXMcNYCD3PNyrqvAFl4IPosut2ZYbzld8SRf
	q6pDBhwg0xqPlMQijO/cpQbChqFWcdx2/ggoXv3Pu1i6hr7+Rrp5JcPeOUg36hTG
	Xl3yAWv5DSDPGBtR7WAcHUdGt1CRNnxRQ2OEwmgtbLiJe80oOV2FuV941Yh4Ck+V
	rF58WUtAnsUOwHQdJ4ezVw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k6uxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 08:56:01 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 5 Oct
 2023 14:56:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 5 Oct 2023 14:55:59 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDDB9356C;
	Thu,  5 Oct 2023 13:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs42l43: Update values for bias sense
Date: Thu, 5 Oct 2023 14:55:59 +0100
Message-ID: <20231005135559.3117994-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
References: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2cXeees9VrZ9_8QpEIge3kkBQw2I4eKL
X-Proofpoint-ORIG-GUID: 2cXeees9VrZ9_8QpEIge3kkBQw2I4eKL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3JBD6VYXKL6OGHZIGOSFWWNLLV2EEMV6
X-Message-ID-Hash: 3JBD6VYXKL6OGHZIGOSFWWNLLV2EEMV6
X-MailFrom: prvs=5642f9fbf5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JBD6VYXKL6OGHZIGOSFWWNLLV2EEMV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to an error in the datasheet the bias sense values currently don't
match the hardware. Whilst this is a change to the binding no devices
have yet shipped so updating the binding will not cause any issues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 861f9ee671cdf..73454de068cf8 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -34,7 +34,7 @@ static const unsigned int cs42l43_accdet_db_ms[] = {
 static const unsigned int cs42l43_accdet_ramp_ms[] = { 10, 40, 90, 170 };
 
 static const unsigned int cs42l43_accdet_bias_sense[] = {
-	14, 23, 41, 50, 60, 68, 86, 95, 0,
+	14, 24, 43, 52, 61, 71, 90, 99, 0,
 };
 
 static int cs42l43_find_index(struct cs42l43_codec *priv, const char * const prop,
-- 
2.39.2

