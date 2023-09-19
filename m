Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7777A5FB4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BEDAE95;
	Tue, 19 Sep 2023 12:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BEDAE95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119660;
	bh=TBV7VBlbSg+AyI9gJvcQKM0umpAUUUn/foxc0duA4lM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o1EFeCMqk70KVVEiTBrQANAv1nmMtahP310U4cW82b/RgeWyDkLgtM2U5M6bcRTKG
	 tndDgiFS91ADe75ztpWVula3HgtyfmjnK2TNPsppGHRirri0UZkpa4b2an6tJ1+yGm
	 O6Ihv957mDiXdV98DiwdMLojQFAGeBvgjugnRgFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E20F805C6; Tue, 19 Sep 2023 12:31:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B547AF805C4;
	Tue, 19 Sep 2023 12:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BDCF805A1; Tue, 19 Sep 2023 12:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C0DAF80558
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C0DAF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=q+X/DsTj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J4RRCb031661;
	Tue, 19 Sep 2023 05:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Owv3MGKxi43WD2sBuhitoE9k62iaoJnCTY7E9ZslEyc=; b=
	q+X/DsTjY0qdwFjSHgLivZRNEuPSlguJo7x6uRQ6ECsiu4QPFfqWrjtklP82gsIX
	5p2zdlpZRVoLCdmCE96G71TIFLzBKQ0TRYvAyssYwS6Op2QIbbO1HDdp+WmP3gra
	oOWAUfqTUr2L/yS8tJWv7wn8C/RT61jKlerAwbPfclECAp/Dkg5j2Rko0hsP8TNf
	xzH/n8z5LO998/leyKpNkthpRugIG2n2UCHObDUGpHwAsXx0svpk1rHDiKKdgoiu
	VovEjXiNNlwGYBnD2xPaJ2f2Aanv9kI+hJ6zlZJbUH3r/U22iffUFxz5FAAPYWeb
	51Tm6AQQhfBiqI1zYhxNzw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry3p1h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 05:31:20 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 11:31:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 11:31:16 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 97D92357E;
	Tue, 19 Sep 2023 10:31:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 5/5] ASoC: cs42l43: Extend timeout on bias sense timeout
Date: Tue, 19 Sep 2023 11:31:16 +0100
Message-ID: <20230919103116.580305-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
References: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TBnGqPNena2gfzHQHpLl-HTcDJpprhtk
X-Proofpoint-ORIG-GUID: TBnGqPNena2gfzHQHpLl-HTcDJpprhtk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZCILIU6PRIXCPQDE4KS76J3RW37FUPL2
X-Message-ID-Hash: ZCILIU6PRIXCPQDE4KS76J3RW37FUPL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCILIU6PRIXCPQDE4KS76J3RW37FUPL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For very slow removals the current bias sense timeout is sometimes too
short and unclamps the mic bias before the jack removal is properly
detected by the tip detect, causing a pop. As bias sense should be
tuned to deliver very few false positives, increase the timeout fairly
dramatically to cover all but the most exaggerated removals.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 66923cf2fdaff..861f9ee671cdf 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -290,7 +290,7 @@ irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data)
 	struct cs42l43_codec *priv = data;
 
 	queue_delayed_work(system_wq, &priv->bias_sense_timeout,
-			   msecs_to_jiffies(250));
+			   msecs_to_jiffies(1000));
 
 	return IRQ_HANDLED;
 }
-- 
2.39.2

