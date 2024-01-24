Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AB83AEE1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 17:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E807F4;
	Wed, 24 Jan 2024 17:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E807F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706115440;
	bh=rFXo5D5SioFkDyK6VjhPmdr1bMROSvMpZp+Tvd6jOS0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CD2BmCWd2C8z5CwjL0BIK6f3E/NwoFx4ztxo31g5X24JfGqwnKavldpdpxN40+1BX
	 Ld/r/h4uwasVIOVh5bhIPqqyys+mAjqIamD/HXU9+z1gIfzELFDDvGUJFsdZMYc1eU
	 dDtpfkKjotTXvR3AyN1TmPVGRkkXfQvdasaJCbQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBFCBF805E8; Wed, 24 Jan 2024 17:56:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F26BF805E6;
	Wed, 24 Jan 2024 17:56:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C462F80494; Wed, 24 Jan 2024 17:56:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 64AD7F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64AD7F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c291I6d4
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O7L4kv000450;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/bB0aWLQIcUMUN+oS7zZcyIt9YxzCPVG8bPGBsbkSkE=; b=
	c291I6d4a+NvHKcJuTAtmvHKkXG8bse2IpVDpZ/QOWFV1EEKA5KdH8SZ5vK6OAgA
	MwgA+EFdnaHdOlOt6M8CbalowrFtSHpCSg9yQSSxGQqHpmhH3y1J/f1KASJK0A0Z
	CWKpdEOLOFW6/Hd4fVRKLNYmKD202v3Ew4IiKXKewP/A/z/9Sg7cdm5+BYEkfurj
	gNxMGbiq2bjF484RxotHy+WCvg24v1CZLobjVt0hQfqqixeNUTnyZt/BIzFtuUG2
	UwuZj1bP7KrV570S/sqbUQG+OMB0YHdRAIxeDfdsrL6BMWLxifp9tc8SMoTzbIoF
	Xmpsc+7/MwdSOt8e0n9Y2Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E52D4820248;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 3/7] ASoC: cs42l43: Check error from
 device_property_read_u32_array
Date: Wed, 24 Jan 2024 16:55:54 +0000
Message-ID: <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o9VnvcpiXupZQOhTmdGd170qep8uftSS
X-Proofpoint-GUID: o9VnvcpiXupZQOhTmdGd170qep8uftSS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2FYFDGHX2VKRKQ6HGS42LQLBBGJIFVCO
X-Message-ID-Hash: 2FYFDGHX2VKRKQ6HGS42LQLBBGJIFVCO
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FYFDGHX2VKRKQ6HGS42LQLBBGJIFVCO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Whilst reading cirrus,buttons-ohms the error from
device_property_read_u32_array is not checked, whilst there is a
preceding device_property_count_u32 which is checked the property read
can still fail. Add the missing check.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index d0569577a8699..147c7017fd8b6 100644
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

