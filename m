Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1B4CD75C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:11:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17C31F06;
	Fri,  4 Mar 2022 16:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17C31F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406663;
	bh=b4uOhZJLi4FVT7Q8uZbtYCr7YbUSPrFgO9QuFSMtcs8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acq52KuSJ6ZYaeGwir/+Hlm/x3gTb9Nk4Xj+mL7Unt7fx2X/8eQH1jqKGuZ0F65Ih
	 1hOmAkfKkUbBJ7A3mE1DSc8hhFSqXkKWFIVidOdBjq8/IYzgCMqOhqHfWScj7z8PGr
	 +VIKWPo6ZthiaxHS0pT91VrZEhPWrSNnu4yPJ2uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00688F8054A;
	Fri,  4 Mar 2022 16:07:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C984F80533; Fri,  4 Mar 2022 16:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C3BF80311
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C3BF80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Qlm6aRYe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244w2hK013723;
 Fri, 4 Mar 2022 09:07:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=tTcpa7MzPHuc33bDZI9ZPTQ5F6Crr6js1OyCSzBY2bo=;
 b=Qlm6aRYec7UH8f5SY58AXm3ET/xiR7iqgpJoHUOh+1KGhIr4/OWc0pGARkLqdg4L674L
 kxDOhmwD5ueactTueA+KOKO9/TxMvajTKrB+WA81beOz4yL0oO2riKGgic68cCHKDM/i
 yy4gJYpxyixGmuCtBox/AAWUMd35k6GB6BHv4bL6DSVk6KvwVENzhQh5shAsawRys6dn
 DaSYhTxeIm89wNFBWsceYCzZvksuvo0AdLj7gHlOTpM2kDz+SNt85oqYxVKj7z/bToc0
 1vhwo9RK2c4I+ZtODqiciiliFTnQ6HS56njlHtZWtmGv8UVIB5dBDgvxjIlU/+OX8Q3X 9g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h414-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:07:30 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:07:28 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:07:28 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 86A99B06;
 Fri,  4 Mar 2022 15:07:28 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 14/20] hda: cs35l41: Move boost config to initialization
 code
Date: Fri, 4 Mar 2022 15:07:15 +0000
Message-ID: <20220304150721.3802-15-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kiYO3Hl6L6eTRRBsQqvG0-6RetYV7RAj
X-Proofpoint-ORIG-GUID: kiYO3Hl6L6eTRRBsQqvG0-6RetYV7RAj
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
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

Boost configuration doesn't need to be written for
every new stream, so move it to the initialization code.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h     |  1 +
 sound/pci/hda/cs35l41_hda.c | 13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index fbf38f32e36d..a8537bccedcf 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -661,6 +661,7 @@
 #define CS35L41_GLOBAL_EN_SHIFT		0
 #define CS35L41_BST_EN_MASK		0x0030
 #define CS35L41_BST_EN_SHIFT		4
+#define CS35L41_BST_DIS_FET_OFF		0x00
 #define CS35L41_BST_EN_DEFAULT		0x2
 #define CS35L41_AMP_EN_SHIFT		0
 #define CS35L41_AMP_EN_MASK		1
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index b3cc7db3fc42..3b8167d1ccc1 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -25,7 +25,6 @@ static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, // AMP_VOL_PCM  0.0 dB
 	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
-	{ CS35L41_PWR_CTRL2,		0x00000001 }, // AMP_EN = 1
 };
 
 static const struct reg_sequence cs35l41_hda_mute[] = {
@@ -34,7 +33,6 @@ static const struct reg_sequence cs35l41_hda_mute[] = {
 };
 
 static const struct reg_sequence cs35l41_hda_start_bst[] = {
-	{ CS35L41_PWR_CTRL2,		0x00000021 }, // BST_EN = 10, AMP_EN = 1
 	{ CS35L41_PWR_CTRL1,		0x00000001, 3000}, // set GLOBAL_EN = 1
 };
 
@@ -94,7 +92,6 @@ static const struct reg_sequence cs35l41_active_to_safe[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL2,		0x00000000 }, // AMP_EN = 0
 	{ CS35L41_PWR_CTRL1,		0x00000000 },
 	{ 0x0000742C,			0x00000009, 2000 },
 	{ 0x00007438,			0x00580941 },
@@ -144,6 +141,8 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 	case HDA_GEN_PCM_ACT_OPEN:
 		ret = regmap_multi_reg_write(reg, cs35l41_hda_config,
 					     ARRAY_SIZE(cs35l41_hda_config));
+		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+				   CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		if (reg_seq->prepare)
@@ -155,6 +154,8 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 			ret = regmap_multi_reg_write(reg, reg_seq->cleanup, reg_seq->num_cleanup);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
+		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
 		if (reg_seq->close)
 			ret = regmap_multi_reg_write(reg, reg_seq->close, reg_seq->num_close);
 		break;
@@ -232,8 +233,10 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 			cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
 		else
 			cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
-		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_reset_to_safe,
-					     ARRAY_SIZE(cs35l41_reset_to_safe));
+		regmap_multi_reg_write(cs35l41->regmap, cs35l41_reset_to_safe,
+				       ARRAY_SIZE(cs35l41_reset_to_safe));
+		ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
+					  CS35L41_BST_DIS_FET_OFF << CS35L41_BST_EN_SHIFT);
 		if (ret)
 			return ret;
 		break;
-- 
2.35.1

