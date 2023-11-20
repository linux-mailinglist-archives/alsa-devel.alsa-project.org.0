Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C155E7F10A3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 11:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C5DA4B;
	Mon, 20 Nov 2023 11:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C5DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700477014;
	bh=0NgbIQHhT6jNt8+M2POsiChgW48IBa5vJHsMCvwWqis=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rP4W8MrkRO60r4kkys9rx48hqPLvyH0TtxoqwNwlhdO2MC0dlR5PtcIlqwXctHDer
	 M0DflDrhT4ANnVKlwW8/aKEfenhdLbyNzh5x9BnSP69HRNQBP+twI57d7jCCCi42hv
	 xKhW0wXVqm00/IWUHNw/9zY1JBADKDGhWK9IeK2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB2C4F8047D; Mon, 20 Nov 2023 11:42:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD8DF80249;
	Mon, 20 Nov 2023 11:42:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58A98F80254; Mon, 20 Nov 2023 11:42:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A84F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 11:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A84F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BTJQ//Ak
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AK6oXQc014560;
	Mon, 20 Nov 2023 04:42:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=Q
	nKDSoljUFXrzRR/u1NiJJkj1yGGpZS1WlDMjC/Kvsk=; b=BTJQ//Ak1jfYU35qu
	JPOEtG+wP9BFBc2BKoVfv6c5jrvLIumuBvTUwWCi+sF2yfHurXrEEv0+7HQ49E69
	8EEtLsYjR0ozlKBBMFu1X82IzvVx/bUhe1hiiaHPbvO0Hg9/a533TWJ1tguHT95X
	d/gYp7mlbQh5BcW2ySIWoarmM5iJU78UyvC/wEHIbSOy7txtDn70iWt9okD5P+nV
	Gay9Wsjs3Wu7XIFbEv7nKSO2idp4dBlH3Gk39zD0jAq0c2z+/u8bc2/YHOQUquiT
	IJxFcS4cUKzRNq6tSCAjQnB0Pg3wm5zQnEAIev2IbmAY4ptkbkilyBY10MomVDP+
	fQMsA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj29p3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:42:25 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 10:42:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 20 Nov 2023 10:42:23 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 978A6B12;
	Mon, 20 Nov 2023 10:42:23 +0000 (UTC)
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
Subject: [PATCH v2 6/7] ASoC: cs43130: Allow driver to work without IRQ thread
Date: Mon, 20 Nov 2023 10:41:53 +0000
Message-ID: <20231120104153.76248-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jZqzVRSxffeY3nz0j56nbOsuMT_4BWL9
X-Proofpoint-GUID: jZqzVRSxffeY3nz0j56nbOsuMT_4BWL9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BJY7VPGIOOB2JTYJRIP2X4DTJSP7J2DT
X-Message-ID-Hash: BJY7VPGIOOB2JTYJRIP2X4DTJSP7J2DT
X-MailFrom: prvs=668862412b=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJY7VPGIOOB2JTYJRIP2X4DTJSP7J2DT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is to support systems without physical IRQ connection. The device
only requires the IRQ for a couple of internal delays, this polling
mechanism is a fallback when no IRQ is specified.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
V1 -> V2: Add changelog message

 sound/soc/codecs/cs43130.c | 56 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs43130.h |  1 +
 2 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index fd39328579fb..1e7c32eedc7b 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -326,6 +326,43 @@ static int cs43130_set_pll(struct snd_soc_component *component, int pll_id, int
 	return ret;
 }

+static int cs43130_wait_for_completion(struct cs43130_private *cs43130, struct completion *to_poll,
+					int time)
+{
+	int stickies, offset, flag;
+	int ret = 0;
+
+	if (cs43130->has_irq_line) {
+		ret = wait_for_completion_timeout(to_poll, msecs_to_jiffies(time));
+	} else {
+		if (to_poll == &cs43130->xtal_rdy) {
+			offset = 0;
+			flag = CS43130_XTAL_RDY_INT;
+		} else if (to_poll == &cs43130->pll_rdy) {
+			offset = 0;
+			flag = CS43130_PLL_RDY_INT;
+		} else if (to_poll == &cs43130->hpload_evt) {
+			offset = 3;
+			flag = CS43130_HPLOAD_NO_DC_INT | CS43130_HPLOAD_UNPLUG_INT |
+				CS43130_HPLOAD_OOR_INT | CS43130_HPLOAD_AC_INT |
+				CS43130_HPLOAD_DC_INT | CS43130_HPLOAD_ON_INT |
+				CS43130_HPLOAD_OFF_INT;
+		} else {
+			return 0;
+		}
+
+		ret = regmap_read_poll_timeout(cs43130->regmap, CS43130_INT_STATUS_1 + offset,
+					       stickies, (stickies & flag),
+					       1000, time * 1000);
+
+		/*
+		 * Return 0 for an timeout/error to be consistent with wait_for_completion_timeout
+		 */
+		ret = !ret;
+	}
+	return ret;
+}
+
 static int cs43130_change_clksrc(struct snd_soc_component *component,
 				 enum cs43130_mclk_src_sel src)
 {
@@ -364,8 +401,7 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 					   CS43130_XTAL_RDY_INT_MASK, 0);
 			regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 					   CS43130_PDN_XTAL_MASK, 0);
-			ret = wait_for_completion_timeout(&cs43130->xtal_rdy,
-							  msecs_to_jiffies(100));
+			ret = cs43130_wait_for_completion(cs43130, &cs43130->xtal_rdy, 100);
 			regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 					   CS43130_XTAL_RDY_INT_MASK,
 					   1 << CS43130_XTAL_RDY_INT_SHIFT);
@@ -400,8 +436,7 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 					   CS43130_XTAL_RDY_INT_MASK, 0);
 			regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 					   CS43130_PDN_XTAL_MASK, 0);
-			ret = wait_for_completion_timeout(&cs43130->xtal_rdy,
-							  msecs_to_jiffies(100));
+			ret = cs43130_wait_for_completion(cs43130, &cs43130->xtal_rdy, 100);
 			regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 					   CS43130_XTAL_RDY_INT_MASK,
 					   1 << CS43130_XTAL_RDY_INT_SHIFT);
@@ -416,8 +451,7 @@ static int cs43130_change_clksrc(struct snd_soc_component *component,
 				   CS43130_PLL_RDY_INT_MASK, 0);
 		regmap_update_bits(cs43130->regmap, CS43130_PWDN_CTL,
 				   CS43130_PDN_PLL_MASK, 0);
-		ret = wait_for_completion_timeout(&cs43130->pll_rdy,
-						  msecs_to_jiffies(100));
+		ret = cs43130_wait_for_completion(cs43130, &cs43130->pll_rdy, 100);
 		regmap_update_bits(cs43130->regmap, CS43130_INT_MASK_1,
 				   CS43130_PLL_RDY_INT_MASK,
 				   1 << CS43130_PLL_RDY_INT_SHIFT);
@@ -2040,8 +2074,8 @@ static int cs43130_hpload_proc(struct cs43130_private *cs43130,
 	regmap_multi_reg_write(cs43130->regmap, seq,
 			       seq_size);

-	ret = wait_for_completion_timeout(&cs43130->hpload_evt,
-					  msecs_to_jiffies(1000));
+	ret = cs43130_wait_for_completion(cs43130, &cs43130->hpload_evt, 1000);
+
 	regmap_read(cs43130->regmap, CS43130_INT_MASK_4, &msk);
 	if (!ret) {
 		dev_err(cs43130->dev, "Timeout waiting for HPLOAD interrupt\n");
@@ -2545,8 +2579,10 @@ static int cs43130_i2c_probe(struct i2c_client *client)
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					"cs43130", cs43130);
 	if (ret != 0) {
-		dev_err(cs43130->dev, "Failed to request IRQ: %d\n", ret);
-		goto err;
+		dev_dbg(cs43130->dev, "Failed to request IRQ: %d, will poll instead\n", ret);
+		cs43130->has_irq_line = 0;
+	} else {
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

