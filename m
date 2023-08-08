Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194DE773F7C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649D284A;
	Tue,  8 Aug 2023 18:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649D284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513348;
	bh=kEIvGx02mnYC0fvMC3nd1mpaBEoilP90qlpZS1tqaf4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tGp9AX+c/9LQZsglGMu+1VPMRjKd6nZZrQlBINKjJvXcV5X/1ab0O2J7M+Z1p1T4i
	 6zDwzYg1y4bvrGpUxv4Am1UbeT1dr5sAARBuicIpC7TH5N7uiIFbktygcsYLXaA+3g
	 GiDgWPW+7yw52PLTfKlU/YY12/95ZXPvuaopy4VY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F47F8057D; Tue,  8 Aug 2023 18:47:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BEC2F8056F;
	Tue,  8 Aug 2023 18:47:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35D51F80534; Tue,  8 Aug 2023 18:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FFADF800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FFADF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oPIzpcGV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378GfYwE012826;
	Tue, 8 Aug 2023 11:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Mt28dTgZ7PN6kO/FpAGHcn+lAjxM4yoMpXnoYmoEICM=; b=
	oPIzpcGViEhf22/FDG+vD+CfVPnzGYPiXgctTKouarGtNDf6G2s3sLxE5s72H2Ef
	bpm1w1jZOwk5mLqZgXOePSh/DcFG4n+TsefJhSugbBEuvVsX7ZaFlmV4Vk7jCWT7
	4bI+6Ki1oGnbl7ZPY5sK2DwgFJvnviWgJMB4x2cyxBdtmhZ/q7CyPSYW87ZA5XoA
	f92toe1BTCFqlixXNH8M9SIDZou9IOMteAIk4SPW9Nc6a4j0DPHS/e1oliqS0gwE
	drYNJZdfgTEsYT7FbFhyqoxp5vCOiyxbK6PPTW3CPd1mVD1+iacz1HAbh6Q09T/k
	CB/WncpoeOiz/AgOz9LiOQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:06 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 17:47:04 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A41F515B7;
	Tue,  8 Aug 2023 16:47:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/5] ASoC: cs35l56: Avoid uninitialized variable in
 cs35l56_set_asp_slot_positions()
Date: Tue, 8 Aug 2023 17:46:58 +0100
Message-ID: <20230808164702.21272-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5TEVI71sAI4bd-azc_I1dsY-qWuAlvMR
X-Proofpoint-ORIG-GUID: 5TEVI71sAI4bd-azc_I1dsY-qWuAlvMR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VX7HXNZ3YIIVGNK5ITG7TGRFBZGZCMCQ
X-Message-ID-Hash: VX7HXNZ3YIIVGNK5ITG7TGRFBZGZCMCQ
X-MailFrom: prvs=3584a5a98c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VX7HXNZ3YIIVGNK5ITG7TGRFBZGZCMCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Re-implement setting of ASP TDM slots so that only the common loop to
build the register word is factored out.

The original cs35l56_set_asp_slot_positions() had an apparent
uninitialized variable if the passed register address was neither of the
ASP slot registers. In fact this would never happen because the calling
code passed valid registers.

While it's trivial to initialize the variable or add a default case,
actually the only common code was the loop at the end of the function,
which simply manipulates some mask values and is identical for either
register. Factoring out the regmap_write() didn't really gain anything.

So instead re-implement the code to replace the original function with
cs35l56_make_tdm_config_word() that only does the loop, and change the
calling code to call regmap_write() directly.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 19b6b4fbe5de..be400208205a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -358,22 +358,11 @@ static int cs35l56_asp_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int f
 	return 0;
 }
 
-static void cs35l56_set_asp_slot_positions(struct cs35l56_private *cs35l56,
-					   unsigned int reg, unsigned long mask)
+static unsigned int cs35l56_make_tdm_config_word(unsigned int reg_val, unsigned long mask)
 {
-	unsigned int reg_val, channel_shift;
+	unsigned int channel_shift;
 	int bit_num;
 
-	/* Init all slots to 63 */
-	switch (reg) {
-	case CS35L56_ASP1_FRAME_CONTROL1:
-		reg_val = 0x3f3f3f3f;
-		break;
-	case CS35L56_ASP1_FRAME_CONTROL5:
-		reg_val = 0x3f3f3f;
-		break;
-	}
-
 	/* Enable consecutive TX1..TXn for each of the slots set in mask */
 	channel_shift = 0;
 	for_each_set_bit(bit_num, &mask, 32) {
@@ -382,7 +371,7 @@ static void cs35l56_set_asp_slot_positions(struct cs35l56_private *cs35l56,
 		channel_shift += 8;
 	}
 
-	regmap_write(cs35l56->base.regmap, reg, reg_val);
+	return reg_val;
 }
 
 static int cs35l56_asp_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
@@ -418,8 +407,11 @@ static int cs35l56_asp_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx
 	if (rx_mask == 0)
 		rx_mask = 0xf;	// ASPTX1..TX4 in slots 0..3
 
-	cs35l56_set_asp_slot_positions(cs35l56, CS35L56_ASP1_FRAME_CONTROL1, rx_mask);
-	cs35l56_set_asp_slot_positions(cs35l56, CS35L56_ASP1_FRAME_CONTROL5, tx_mask);
+	/* Default unused slots to 63 */
+	regmap_write(cs35l56->base.regmap, CS35L56_ASP1_FRAME_CONTROL1,
+		     cs35l56_make_tdm_config_word(0x3f3f3f3f, rx_mask));
+	regmap_write(cs35l56->base.regmap, CS35L56_ASP1_FRAME_CONTROL5,
+		     cs35l56_make_tdm_config_word(0x3f3f3f, tx_mask));
 
 	dev_dbg(cs35l56->base.dev, "tdm slot width: %u count: %u tx_mask: %#x rx_mask: %#x\n",
 		cs35l56->asp_slot_width, cs35l56->asp_slot_count, tx_mask, rx_mask);
-- 
2.30.2

