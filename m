Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD87F158B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 15:19:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5492FA4A;
	Mon, 20 Nov 2023 15:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5492FA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700489945;
	bh=Vgd6qN7Mcmk+xTkilzrrlT0OGGEPNELONyVzFveV7/4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hl7Dux+N0PRHXmj2iex1qSR1itnla6TZ/1JLLGzCDVvNc7p9ikpRrBRCbb4NzNFQI
	 KgEx+kZ3tuKMMSUMn6kRu038PAq2VYM0nGTZVMIFjQFpgG2+O7c3nEH77mFu4IUrmY
	 hWepRsC0vHsBgmadQ+ED61shylWQGkv2lJ0gc5rY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96002F80249; Mon, 20 Nov 2023 15:18:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F4DF80249;
	Mon, 20 Nov 2023 15:18:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709F0F80254; Mon, 20 Nov 2023 15:18:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4062CF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 15:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4062CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bghR0rJb
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AK7gLvc013978;
	Mon, 20 Nov 2023 08:17:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=M
	2IHF0tk12GZj3YAbzn33ZWKXZjVhQ4APZRmBFKGdYg=; b=bghR0rJbKddrRZML8
	gCVGdA6NLA80PobxV0ymyZTAP67EFQsD/TCArc+SRq/joRpwU1+xJwCyAM7Y34Hz
	GJX1qDI+EEz4noCncEU08iy1OLBJ15BpPVokcGftNWBsCmMvhgcxXGspQscNVs0+
	9c6bhUSln52Gz1IefkOKG6lo1/foZIS8t6D8dn+8wkw1cc0NhTjY6B6MWxC++UKL
	4n2jz/FmWeGOHrsqA3b9NAsBxvmnb4BfKYzurjvGymSeklP2kUw8cO5uDyjuLOJ6
	iVsCfJJETlLs1FMny3lOb8xVOc3FLoZUyW5ycy6CfFlc9pNZsHb5+vjs6GSuIsbM
	74iuQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj29vac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 08:17:41 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 14:17:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 20 Nov 2023 14:17:39 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31C6115B6;
	Mon, 20 Nov 2023 14:17:39 +0000 (UTC)
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
Subject: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ connection
Date: Mon, 20 Nov 2023 14:17:34 +0000
Message-ID: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: n6W9nEu8gRDEmlx73Nu4MNDOqZCArYFE
X-Proofpoint-GUID: n6W9nEu8gRDEmlx73Nu4MNDOqZCArYFE
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SISLBFDCE7DCNAOPPXAWX6B5UD2CJX5A
X-Message-ID-Hash: SISLBFDCE7DCNAOPPXAWX6B5UD2CJX5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SISLBFDCE7DCNAOPPXAWX6B5UD2CJX5A/>
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
V2 -> V3: Amended changelog message and subject line
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

