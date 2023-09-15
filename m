Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4367A2142
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 16:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82DF084B;
	Fri, 15 Sep 2023 16:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82DF084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694789044;
	bh=JYIfXSMC3ZtsR7/tBWzb89PzDKyntXAteR10MCY/3C4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bwevHyQTs9g+JQW/t/B+Knu//tu43t2jpMaS54HCBtpIk0hybn7fO+gGEcaYA5t52
	 hlKIZx9EGJFKKBfCHcV5ELHDtdoDA38af/6rEtjKuYvz8+yxdJIJp6qjFRd4XT6aY1
	 nk/4vrp/0kJ3te7OYpmvcA+xaY4Orul1paYVysSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D876BF80537; Fri, 15 Sep 2023 16:43:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A49ADF80246;
	Fri, 15 Sep 2023 16:43:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E21F0F80425; Fri, 15 Sep 2023 16:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB25F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 16:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB25F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GD0mDKo+
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38FC4miS013581;
	Fri, 15 Sep 2023 09:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=G
	T5Vdfnkcw9OIn7rJWqwyX1jyD3Vm372bDhkWPX2Nyw=; b=GD0mDKo+FZ9RnETNL
	rFqieRq9asLQstxyG9kAHRxpn0csz8RwdcsitxwYktrfw9fTmmj1rmH3OFIIeetJ
	RaBDQTkhsJ/re013/EMWXj5NaGVBknmFOBra/IXvG0D/U5PS7eQrt0w8WSRroy4L
	c9LzSnXiI+Oan+53qc1XzZDpNJvRrltLYGCh8HP0gq54qHC/M0t0/Xrgu9i7kprc
	3PBLF/DIQCVjgeA0bV5daPz4iXl2wi7mQF7/z0rZvHeCDkBSbwxGgX0BbQJ57HgG
	JdmWbfRQI4IMgkhey7tfOsJaeNF5U/7tg0dw99hV9IpePeLIDGmpjBr/QnJVqyTa
	hhCsA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7skjfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 09:43:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 15 Sep
 2023 15:43:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 15 Sep 2023 15:43:00 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 79B653563;
	Fri, 15 Sep 2023 14:43:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Add shared IRQ flag for shutters
Date: Fri, 15 Sep 2023 15:43:00 +0100
Message-ID: <20230915144300.120100-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dglpjfAuKTM7yQbwY9fHv0xIgJQnzyoG
X-Proofpoint-ORIG-GUID: dglpjfAuKTM7yQbwY9fHv0xIgJQnzyoG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AERAFOTUJKNHXL7N7DI2Z5RBVDJJ44OR
X-Message-ID-Hash: AERAFOTUJKNHXL7N7DI2Z5RBVDJJ44OR
X-MailFrom: prvs=4622e418f9=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AERAFOTUJKNHXL7N7DI2Z5RBVDJJ44OR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The microphone and speaker shutters on cs42l43 can be configured to
trigger from the same GPIO, in this case the current code returns an
error as we attempt to request two IRQ handlers for the same IRQ. Fix
this by always requesting the shutter IRQs with the IRQF_SHARED flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1a95c370fc4c9..5643c666d7d04 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2077,7 +2077,8 @@ static const struct cs42l43_irq cs42l43_irqs[] = {
 
 static int cs42l43_request_irq(struct cs42l43_codec *priv,
 			       struct irq_domain *dom, const char * const name,
-			       unsigned int irq, irq_handler_t handler)
+			       unsigned int irq, irq_handler_t handler,
+			       unsigned long flags)
 {
 	int ret;
 
@@ -2087,8 +2088,8 @@ static int cs42l43_request_irq(struct cs42l43_codec *priv,
 
 	dev_dbg(priv->dev, "Request IRQ %d for %s\n", ret, name);
 
-	ret = devm_request_threaded_irq(priv->dev, ret, NULL, handler, IRQF_ONESHOT,
-					name, priv);
+	ret = devm_request_threaded_irq(priv->dev, ret, NULL, handler,
+					IRQF_ONESHOT | flags, name, priv);
 	if (ret)
 		return dev_err_probe(priv->dev, ret, "Failed to request IRQ %s\n", name);
 
@@ -2124,11 +2125,11 @@ static int cs42l43_shutter_irq(struct cs42l43_codec *priv,
 		return 0;
 	}
 
-	ret = cs42l43_request_irq(priv, dom, close_name, close_irq, handler);
+	ret = cs42l43_request_irq(priv, dom, close_name, close_irq, handler, IRQF_SHARED);
 	if (ret)
 		return ret;
 
-	return cs42l43_request_irq(priv, dom, open_name, open_irq, handler);
+	return cs42l43_request_irq(priv, dom, open_name, open_irq, handler, IRQF_SHARED);
 }
 
 static int cs42l43_codec_probe(struct platform_device *pdev)
@@ -2178,7 +2179,8 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, dom, cs42l43_irqs[i].name,
-					  cs42l43_irqs[i].irq, cs42l43_irqs[i].handler);
+					  cs42l43_irqs[i].irq,
+					  cs42l43_irqs[i].handler, 0);
 		if (ret)
 			goto err_pm;
 	}
-- 
2.30.2

