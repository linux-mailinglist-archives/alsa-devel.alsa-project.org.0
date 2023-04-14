Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D26E246B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8F0E94;
	Fri, 14 Apr 2023 15:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8F0E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681479619;
	bh=aHFo3QyHJ2qASGvBIKUiPW/K4YYgWhW/sNrgj76wGko=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=SivtXcbSKt0W6y/xFx9MCftomMAiUlYDD5Y3sebkhH/wqzbQqHkhXne4zrEHHL61n
	 TwVwqfkSxer2jeLEKg/s674WugE9jd3Pjfav5qx5kTklbd0ebWaLGzesbnNso8j9MK
	 p5R+P8ipI8kpmrBTZODglokFKP0U9M+1Lyy68IVw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8AD0F8023A;
	Fri, 14 Apr 2023 15:38:16 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: cs35l56: Rework IRQ allocation
Date: Fri, 14 Apr 2023 14:37:49 +0100
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCCOPC5P2J2T76NWAK7LZDOV7LSR3JMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168147949598.26.711670799488943454@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA8FBF80529; Fri, 14 Apr 2023 15:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E1E9F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1E9F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U4VzgMte
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEAO030487;
	Fri, 14 Apr 2023 08:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Bn5+A1onNWzJ/GKMZR50/ZrnEc60nVT9dDha7GM75dQ=;
 b=U4VzgMtemfXz2LHqoAldNuLOW54APeHe7+Su7E8s2TYqKmTYrZjWrHZ3CC25Bx3dhvMe
 xRULmud8wmIHh+LoTzneBM+0/7jmcDLG0Zuxf0mWxVCLzd7Uu5k37TSqqoFUe4uvLF+f
 z762ue+JU1zf8Sl+MjpaSqLeqXjBCn/0vDMXJOonRhujyI/IMMvLl+K88v/Cj4t81QR8
 TCBtU1aI2q2qRNUtKBxpudTHyBsurRIju9/N1o8z7leG46pcys69WmnACH3ybPlfDsH6
 VT5TZ64x5T/6s87fjg7bdhPl+EOOpLMHbYMFBMLXBc4+/VF/OQjmSqLjzNg2IJNJNKUC 1g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3sexy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 08:37:57 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 08:37:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Apr 2023 08:37:54 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 00E9D15A4;
	Fri, 14 Apr 2023 13:37:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: cs35l56: Rework IRQ allocation
Date: Fri, 14 Apr 2023 14:37:49 +0100
Message-ID: <20230414133753.653139-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PddvZfZmKR_2LwvHoT0vyEK7T9tQkZO5
X-Proofpoint-GUID: PddvZfZmKR_2LwvHoT0vyEK7T9tQkZO5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YCCOPC5P2J2T76NWAK7LZDOV7LSR3JMF
X-Message-ID-Hash: YCCOPC5P2J2T76NWAK7LZDOV7LSR3JMF
X-MailFrom: prvs=94685c4d78=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCCOPC5P2J2T76NWAK7LZDOV7LSR3JMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The irq member was being set before calling the init function and then
cs35l56_irq_request() was called only when the init was successful.
However cs35l56_release() calls devm_free_irq() when the irq member is
set and therefore if init() fails then this will cause an attempted free
of an unallocated IRQ.

Instead pass the desired IRQ number to the cs35l56_irq_request()
function and set cs35l56->irq only when it has been successfully
allocated.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c |  3 +--
 sound/soc/codecs/cs35l56-spi.c |  3 +--
 sound/soc/codecs/cs35l56.c     | 11 ++++++-----
 sound/soc/codecs/cs35l56.h     |  2 +-
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 4b7f034a7670..295caad26224 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -27,7 +27,6 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	cs35l56->dev = dev;
-	cs35l56->irq = client->irq;
 	cs35l56->can_hibernate = true;
 
 	i2c_set_clientdata(client, cs35l56);
@@ -43,7 +42,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 
 	ret = cs35l56_init(cs35l56);
 	if (ret == 0)
-		ret = cs35l56_irq_request(cs35l56);
+		ret = cs35l56_irq_request(cs35l56, client->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 4b2084e85f29..996aab10500e 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -32,7 +32,6 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 	}
 
 	cs35l56->dev = &spi->dev;
-	cs35l56->irq = spi->irq;
 
 	ret = cs35l56_common_probe(cs35l56);
 	if (ret != 0)
@@ -40,7 +39,7 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 
 	ret = cs35l56_init(cs35l56);
 	if (ret == 0)
-		ret = cs35l56_irq_request(cs35l56);
+		ret = cs35l56_irq_request(cs35l56, spi->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 18e341744839..5ea7f419cda6 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -423,18 +423,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, SND_SOC_CS35L56_CORE);
 
-int cs35l56_irq_request(struct cs35l56_private *cs35l56)
+int cs35l56_irq_request(struct cs35l56_private *cs35l56, int irq)
 {
 	int ret;
 
-	if (!cs35l56->irq)
+	if (!irq)
 		return 0;
 
-	ret = devm_request_threaded_irq(cs35l56->dev, cs35l56->irq, NULL,
-					cs35l56_irq,
+	ret = devm_request_threaded_irq(cs35l56->dev, irq, NULL, cs35l56_irq,
 					IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW,
 					"cs35l56", cs35l56);
-	if (ret < 0)
+	if (!ret)
+		cs35l56->irq = irq;
+	else
 		dev_err(cs35l56->dev, "Failed to get IRQ: %d\n", ret);
 
 	return ret;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 50278dafc9ca..ac2e9237c27d 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -74,7 +74,7 @@ int cs35l56_system_resume_no_irq(struct device *dev);
 int cs35l56_system_resume_early(struct device *dev);
 int cs35l56_system_resume(struct device *dev);
 irqreturn_t cs35l56_irq(int irq, void *data);
-int cs35l56_irq_request(struct cs35l56_private *cs35l56);
+int cs35l56_irq_request(struct cs35l56_private *cs35l56, int irq);
 int cs35l56_common_probe(struct cs35l56_private *cs35l56);
 int cs35l56_init(struct cs35l56_private *cs35l56);
 int cs35l56_remove(struct cs35l56_private *cs35l56);
-- 
2.30.2

