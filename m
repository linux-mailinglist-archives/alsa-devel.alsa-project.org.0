Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A355283BEE7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E745203;
	Thu, 25 Jan 2024 11:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E745203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178804;
	bh=3c2WLm7voiPlhOCguvGRmsQTxZnmMPUZId3QqKoMQGs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WpN6PQ7b/1ZR3ibRQhSX4vzBEGqmiIp4W3CW2Soub6rs8TTTIAb0+vYEFNoUp3VjS
	 DjLMPvAK60WkLdQIstGiLabWAcBJfNp5M4GjPI0GbWhukB5qXAVkZ1Fj88Hsj7rfPG
	 jre9dwRc4InIKEmEG1hd6kP3IJvnYLcAWZMXlV/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27864F80621; Thu, 25 Jan 2024 11:31:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2592AF8063D;
	Thu, 25 Jan 2024 11:31:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4CCDF805A1; Thu, 25 Jan 2024 11:31:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6086F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6086F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MijUqIEH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ4010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=5NE00DJFrknWt0m9ssj1yTdWdZvVXFRtc5Ne25W/FF0=; b=
	MijUqIEH4wH3udgGfSed2JxAvnKmpyeu+sm4pX15RXa7q4WLla39jczzvNcrxp1j
	YK1aACM4xusRXrYrXcXoYRorw2UAOm76xkNAPifj3IwBB9LHbRyhdROcMJ0NpsyF
	Dq5fXHpl3nyIVis1MiAv4PzPxal0Q8yUMgGMFbMi4OGoFAJrG1FbkWpCzEbqRjgY
	dpXxuZFgx084jxpDZotH6otTMrISHFhUdnq9wDOvbLiNYhblcgDUQQ4wGTYYnrR9
	jC6wT2l5UfVoO7LkH4f8MyWs5yw+glxA+tUlI59ZntdIuSpn+IyPD82rzGHR+v4L
	HdGfUw3p3dRYTLCgwOEb3g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:20 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 77528820248;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 3/7] ASoC: cs42l43: Check error from
 device_property_read_u32_array()
Date: Thu, 25 Jan 2024 10:31:13 +0000
Message-ID: <20240125103117.2622095-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c3XXlWmtyJYH1UhrPLR1YCkVKEsjBD-A
X-Proofpoint-GUID: c3XXlWmtyJYH1UhrPLR1YCkVKEsjBD-A
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y5GH6SVLIVQTCAJA6NSFQ2YOR33PZ426
X-Message-ID-Hash: Y5GH6SVLIVQTCAJA6NSFQ2YOR33PZ426
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5GH6SVLIVQTCAJA6NSFQ2YOR33PZ426/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Whilst reading cirrus,buttons-ohms the error from
device_property_read_u32_array() is not checked, whilst there is a
preceding device_property_count_u32() which is checked the property
read can still fail. Add the missing check.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add () to funcs in commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 4f7a405b7e06a..67ccdc8bab6f6 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -106,8 +106,13 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 			goto error;
 		}
 
-		device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
-					       priv->buttons, ret);
+		ret = device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
+						     priv->buttons, ret);
+		if (ret < 0) {
+			dev_err(priv->dev, "Property cirrus,button-ohms malformed: %d\n",
+				ret);
+			goto error;
+		}
 	} else {
 		priv->buttons[0] = 70;
 		priv->buttons[1] = 185;
-- 
2.30.2

