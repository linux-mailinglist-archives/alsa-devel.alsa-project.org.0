Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4F7F4911
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 15:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D84846;
	Wed, 22 Nov 2023 15:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D84846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700663747;
	bh=6JIDkCUdJB3L2M+nUUSWianx876YKQBV3WT43guMCBc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=akgVLsu/1uZ9RxPodmLwTkk57XEhhMeHnS+vxOB6LmimTWTMo3dDZCzVA1YmOFY/A
	 fYmQ98PfIqmlmdznqbqyUs2/TX8RDflbUPk1Jc2cKPZqXv4xHoKDV0dFMjFR4ETpc0
	 Ww7p8ZOLJBQLuqUSy4FwicsJujU2m1nC+GPrgtO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD91F8047D; Wed, 22 Nov 2023 15:35:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABCDF80246;
	Wed, 22 Nov 2023 15:35:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CDEBF802E8; Wed, 22 Nov 2023 15:35:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 82B0EF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 15:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82B0EF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GSnja0Fi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AMBtvdR027576;
	Wed, 22 Nov 2023 08:35:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=2
	zg8Vph7JyQ3lMnAhTy3DJBjNy3k2aXpTzfCZyGUxXs=; b=GSnja0FiYrWY/+tBo
	9zC2lpuI9g1rZ+LOUkQAoV7/QLP5QP0a/DjaWMZx/dRiEaO/rXUYWpy8PlnOO3iK
	QHGzLwydZRolt/KtNqUGMQveA55jD1vEUw8Ysw8hTBMkDW+il4u/9Aezcb9H/8MW
	ee2AyVVsybni/Jo7EDksMMk+fv1O/2scd2qwSZnZu8RQlJWF1k3mlWZsznlIDz5U
	9e48HXs53KgdAbxZH5M1SL/WDvzG3nUlxvOAJSLb4Budu+dDH/9BlRIpGS1vPEYA
	07hOwqFuEBNgPck94X/40FH6/mDjGYOcIxsZobhZjti4gxgCELts0NLmCplkvs5Q
	zYU3A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjpcjyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 08:35:02 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 22 Nov
 2023 14:35:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 22 Nov 2023 14:35:00 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A92B015B6;
	Wed, 22 Nov 2023 14:35:00 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH v4] ASoC: cs43130: Allow driver to work without IRQ connection
Date: Wed, 22 Nov 2023 14:34:59 +0000
Message-ID: <20231122143459.26861-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uP51HNjBvecpsM2cMKHTZ3OfXw42q43p
X-Proofpoint-ORIG-GUID: uP51HNjBvecpsM2cMKHTZ3OfXw42q43p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UZUETSBDRI4VO62OER7YJPVDIJNHS2PA
X-Message-ID-Hash: UZUETSBDRI4VO62OER7YJPVDIJNHS2PA
X-MailFrom: prvs=669075e529=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZUETSBDRI4VO62OER7YJPVDIJNHS2PA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a polling mechanism that will keep the driver operational even in
absence of physical IRQ connection. If IRQ line is detected, the driver
will continue working as usual, in case of missing IRQ line it will
fallback to the polling mechanism introduced in this change.
This will support users which choose not to connect an IRQ line as it
is not critical to part's operation.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
V3 -> V4:
	- Removed unnecesary else and indentation
	- Changed cs43130_wait_for_completion return codes and updated callers accordingly
	- Changed approach for checking for presence of IRQ connection: see if client->irq equals 0
	  which seems to be a standard way of checking it used by other drivers (instead of
	  inspecting devm_request_threaded_irq error code)
V2 -> V3: Amended changelog message and subject line
V1 -> V2: Add changelog message

 sound/soc/codecs/cs43130.c | 91 +++++++++++++++++++++++++++-----------
 sound/soc/codecs/cs43130.h |  1 +
 2 files changed, 65 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 02e7f45b9208..bd51bb5b6f14 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -326,6 +326,40 @@ static int cs43130_set_pll(struct snd_soc_component *component, int pll_id, int
 	return ret;
 }

+static int cs43130_wait_for_completion(struct cs43130_private *cs43130, struct completion *to_poll,
+					int time)
+{
+	int stickies, offset, flag, ret;
+
+	if (cs43130->has_irq_line) {
+		ret = wait_for_completion_timeout(to_poll, msecs_to_jiffies(time));
+		if (ret == 0)
+			return -ETIMEDOUT;
+		else
+			return 0; // Discard number of jiffies left till timeout and return success
+	}
+
+	if (to_poll == &cs43130->xtal_rdy) {
+		offset = 0;
+		flag = CS43130_XTAL_RDY_INT;
+	} else if (to_poll == &cs43130->pll_rdy) {
+		offset = 0;
+		flag = CS43130_PLL_RDY_INT;
+	} else if (to_poll == &cs43130->hpload_evt) {
+		offset = 3;
+		flag = CS43130_HPLOAD_NO_DC_INT | CS43130_HPLOAD_UNPLUG_INT |
+			CS43130_HPLOAD_OOR_INT | CS43130_HPLOAD_AC_INT |
+			CS43130_HPLOAD_DC_INT | CS43130_HPLOAD_ON_INT |
+			CS43130_HPLOAD_OFF_INT;
+	} else {
+		return -EINVAL;
+	}
+
+	return regmap_read_poll_timeout(cs43130->regmap, CS43130_INT_STATUS_1 + offset,
+					stickies, (stickies & flag),
+					1000, time * 1000);
+}
+
 static int cs43130_change_clksrc(struct snd_soc_component *component,
 				 enum cs43130_mclk_src_sel src)
 {
@@ -364,14 +398,13 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 					   CS43130_XTAL_RDY_INT_MASK, 0);
 			regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 					   CS43130_PDN_XTAL_MASK, 0);
-			ret = wait_for_completion_timeout(&cs43130->xtal_rdy,
-							  msecs_to_jiffies(100));
+			ret = cs43130_wait_for_completion(cs43130, &cs43130->xtal_rdy, 100);
 			regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 					   CS43130_XTAL_RDY_INT_MASK,
 					   1 << CS43130_XTAL_RDY_INT_SHIFT);
-			if (ret == 0) {
-				dev_err(cs43130->dev, "Timeout waiting for XTAL_READY interrupt\n");
-				return -ETIMEDOUT;
+			if (ret) {
+				dev_err(cs43130->dev, "Error waiting for XTAL_READY interrupt: %d\n", ret);
+				return ret;
 			}
 		}

@@ -400,14 +433,13 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 					   CS43130_XTAL_RDY_INT_MASK, 0);
 			regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 					   CS43130_PDN_XTAL_MASK, 0);
-			ret = wait_for_completion_timeout(&cs43130->xtal_rdy,
-							  msecs_to_jiffies(100));
+			ret = cs43130_wait_for_completion(cs43130, &cs43130->xtal_rdy, 100);
 			regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 					   CS43130_XTAL_RDY_INT_MASK,
 					   1 << CS43130_XTAL_RDY_INT_SHIFT);
-			if (ret == 0) {
-				dev_err(cs43130->dev, "Timeout waiting for XTAL_READY interrupt\n");
-				return -ETIMEDOUT;
+			if (ret) {
+				dev_err(cs43130->dev, "Error waiting for XTAL_READY interrupt: %d\n", ret);
+				return ret;
 			}
 		}

@@ -416,14 +448,13 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 				   CS43130_PLL_RDY_INT_MASK, 0);
 		regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 				   CS43130_PDN_PLL_MASK, 0);
-		ret = wait_for_completion_timeout(&cs43130->pll_rdy,
-						  msecs_to_jiffies(100));
+		ret = cs43130_wait_for_completion(cs43130, &cs43130->pll_rdy, 100);
 		regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 				   CS43130_PLL_RDY_INT_MASK,
 				   1 << CS43130_PLL_RDY_INT_SHIFT);
-		if (ret == 0) {
-			dev_err(cs43130->dev, "Timeout waiting for PLL_READY interrupt\n");
-			return -ETIMEDOUT;
+		if (ret) {
+			dev_err(cs43130->dev, "Error waiting for PLL_READY interrupt: %d\n", ret);
+			return ret;
 		}

 		regmap_update_bits(cs43130->regmap, CS43130_SYS_CLK_CTL_1,
@@ -2048,12 +2079,12 @@ static int cs43130_hpload_proc(struct cs43130_private *cs43130,
 	regmap_multi_reg_write(cs43130->regmap, seq,
 			       seq_size);

-	ret = wait_for_completion_timeout(&cs43130->hpload_evt,
-					  msecs_to_jiffies(1000));
+	ret = cs43130_wait_for_completion(cs43130, &cs43130->hpload_evt, 1000);
+
 	regmap_read(cs43130->regmap, CS43130_INT_MASK_4, &msk);
-	if (!ret) {
-		dev_err(cs43130->dev, "Timeout waiting for HPLOAD interrupt\n");
-		return -1;
+	if (ret) {
+		dev_err(cs43130->dev, "Timeout waiting for HPLOAD interrupt: %d\n", ret);
+		return ret;
 	}

 	dev_dbg(cs43130->dev, "HP load stat: %x, INT_MASK_4: %x\n",
@@ -2548,13 +2579,19 @@ static int cs43130_i2c_probe(struct i2c_client *client)
 	init_completion(&cs43130->pll_rdy);
 	init_completion(&cs43130->hpload_evt);

-	ret = devm_request_threaded_irq(cs43130->dev, client->irq,
-					NULL, cs43130_irq_thread,
-					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-					"cs43130", cs43130);
-	if (ret != 0) {
-		dev_err(cs43130->dev, "Failed to request IRQ: %d\n", ret);
-		goto err;
+	if (!client->irq) {
+		dev_dbg(cs43130->dev, "IRQ not found, will poll instead\n");
+		cs43130->has_irq_line = 0;
+	} else {
+		ret = devm_request_threaded_irq(cs43130->dev, client->irq,
+						NULL, cs43130_irq_thread,
+						IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+						"cs43130", cs43130);
+		if (ret != 0) {
+			dev_err(cs43130->dev, "Failed to request IRQ: %d\n", ret);
+			goto err;
+		}
+		cs43130->has_irq_line = 1;
 	}

 	cs43130->mclk_int_src = CS43130_MCLK_SRC_RCO;
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index d3f595bbd3ba..dbdb5b262f1b 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -508,6 +508,7 @@ struct	cs43130_private {
 	struct gpio_desc		*reset_gpio;
 	unsigned int			dev_id; /* codec device ID */
 	int				xtal_ibias;
+	bool				has_irq_line;

 	/* shared by both DAIs */
 	struct mutex			clk_mutex;
--
2.34.1

