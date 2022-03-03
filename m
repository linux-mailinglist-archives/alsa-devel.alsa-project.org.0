Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD04CC3EB
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:32:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3981A74;
	Thu,  3 Mar 2022 18:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3981A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646328772;
	bh=hHWUxJ4zzeXY+gu8KFstg7bSmRRPw5bc8mXfwI0TG1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdO+i536ibqWasjt9tI5lVYLY5ltlQqX2Z36pEFNy1xgKpLb1z1CrSH68lqYKUzjz
	 3zecf7cmM7KuQjGtnBQtJ4+Zupyrrv9mP25JH9/YUzUQw3lnbzcOOcXU87DJaEAnZI
	 VycXQ2F56XxBn3Uq77CFjwV5GwxshhZ6QrN5p4UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3241F80525;
	Thu,  3 Mar 2022 18:31:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2300F80520; Thu,  3 Mar 2022 18:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A65F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A65F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IylpRQg2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2234AADr028599;
 Thu, 3 Mar 2022 11:31:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Qv07XFTe4HkWwbJqelMKj1qLuYum+eoKoYrC22mdvX0=;
 b=IylpRQg2raMh5Hu0JEr1GXaK2W2trWRyDI4AaCyYTsWVI2ad6u7GnX0bhOIE1Jz8olig
 A3O28Dx6lI2xWS02sOTtFm8IvOLPV8pjcspbkw8lqUH2G5JkOrhcjYuVf1TPoTfNvGeh
 pa2dIjToxd5maTsQ0gSRoKE44LsN6FpB2ksOEuXxZqLppWvya8mjeXEc+hZeW6uSgGoY
 tw7d4ja9WpIMV59owATX65EZ+FItnGlhtwQJ4ecehBYjGWkOERq0sSbxR3daI0ofKnp6
 Dc+/mO5Szonc34M0+EznXhSeZpbJWO9zxq2WTMLO0GqnBJFo/TpUAWL5eTAkjTsoMLbi fQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:02 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 97C897C;
 Thu,  3 Mar 2022 17:31:02 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 01/20] ASoC: cs35l41: Fix GPIO2 configuration
Date: Thu, 3 Mar 2022 17:30:40 +0000
Message-ID: <20220303173059.269657-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JeKpKn1mwFfiEGOPY8WFpAEMD0cVcIrK
X-Proofpoint-GUID: JeKpKn1mwFfiEGOPY8WFpAEMD0cVcIrK
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: David Rhodes <drhodes@opensource.cirrus.com>

Fix GPIO2 polarity and direction configuration

Fixes: fe1024d50477b ("ASoC: cs35l41: Combine adjacent register writes")
Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 77a017694645..90c91b00288b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1035,8 +1035,8 @@ static int cs35l41_irq_gpio_config(struct cs35l41_private *cs35l41)
 
 	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO2_CTRL1,
 			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
-			   irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
-			   !irq_gpio_cfg1->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
+			   irq_gpio_cfg2->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !irq_gpio_cfg2->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
 
 	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
 			   CS35L41_GPIO1_CTRL_MASK | CS35L41_GPIO2_CTRL_MASK,
-- 
2.35.1

