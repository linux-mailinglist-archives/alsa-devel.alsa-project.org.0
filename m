Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253712E11EB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:19:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DCB1733;
	Wed, 23 Dec 2020 03:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DCB1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608689937;
	bh=XC57S2E/6U4A5BTFsO9yT2N0wDA1oFFu6630l6ZodHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWImQYzI1/oI73x4tsZ0T9mYJg5TX5cSexkxqD4Yr3HIN8PiyT0oj2jlEMQCRElSH
	 5bon+yv5NMNXOVbsm2+J8eWmEvOUdjEBRn7vJPENyaeBRnWnZkKP4OprAZ1Byr80Eo
	 QTroYjiqed/RkyofZZqtNgokef+TPbBxp9iyguiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E12FAF8027D;
	Wed, 23 Dec 2020 03:18:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C72B7F8021C; Wed, 23 Dec 2020 03:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A81F8013F
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A81F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WcoZfFV3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D4FC22525;
 Wed, 23 Dec 2020 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689874;
 bh=XC57S2E/6U4A5BTFsO9yT2N0wDA1oFFu6630l6ZodHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WcoZfFV3p75rXr6N6LsuwkSTFhTjpEOwsP1ul/jF2LL3Tai3h4S3+cFPnzBjHxikO
 BA3IAQHz5qzPGbeyjl1vnc7LLNARuJ6VOVCGvMYKe/yjesBXMdm0nUIIRjs3SUbQ9H
 lm+1l3jQ6E9JlOOq3wHI5hg378SEkidxE4GRjbys3GvWNIG7t766I7pBymVFe7iLrm
 dnSxUAfN3TItNH8Oj49KgiVR5rIu/9HRGG3wBECDmZwbPaiEcnYaxlUYyF49wQ6cGR
 vStGsdSGV2rYAZw4h591yRtlo6xNmJaO01LtwDH0in2d1AlGK94XVPRdKBCtTpJPld
 h2xskRponlfIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 066/217] ASoC: Fix vaud18 power leakage of mt6359
Date: Tue, 22 Dec 2020 21:13:55 -0500
Message-Id: <20201223021626.2790791-66-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 "Shane.Chien" <shane.chien@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

From: "Shane.Chien" <shane.chien@mediatek.com>

[ Upstream commit 64a70744b77898a15d7a5b2b4dc0fa9523a75cde ]

vaud18 is power of mt6359 audio path. It
should only enable when audio is used,
instead of in boot up stage.
Once mt6359 audio path is enabled or disabled,
vaud18 is controlled by regulator supply widget
"LDO_VAUD18". Due to vaud18 is controlled by
regulator dapm macro instead of regmap, the macro
MT6359_LDO_VAUD18_CON0 and variable avdd_reg
is no used and removed from mt6359.h.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
Link: https://lore.kernel.org/r/1604975492-6142-2-git-send-email-shane.chien@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/mt6359.c | 25 +------------------------
 sound/soc/codecs/mt6359.h |  8 --------
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 81aafb553bdd9..64b26ab969ed8 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1833,9 +1833,7 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
 			      MT6359_DCXO_CW12,
 			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("LDO_VAUD18", SUPPLY_SEQ_LDO_VAUD18,
-			      MT6359_LDO_VAUD18_CON0,
-			      RG_LDO_VAUD18_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("LDO_VAUD18", 0, 0),
 	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
 			      MT6359_AUDDEC_ANA_CON13,
 			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
@@ -2697,20 +2695,6 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, priv);
 	priv->dev = &pdev->dev;
 
-	priv->avdd_reg = devm_regulator_get(&pdev->dev, "vaud18");
-	if (IS_ERR(priv->avdd_reg)) {
-		dev_err(&pdev->dev, "%s(), have no vaud18 supply: %ld",
-			__func__, PTR_ERR(priv->avdd_reg));
-		return PTR_ERR(priv->avdd_reg);
-	}
-
-	ret = regulator_enable(priv->avdd_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "%s(), failed to enable regulator!\n",
-			__func__);
-		return ret;
-	}
-
 	ret = mt6359_parse_dt(priv);
 	if (ret) {
 		dev_warn(&pdev->dev, "%s() failed to parse dts\n", __func__);
@@ -2731,13 +2715,6 @@ static int mt6359_platform_driver_remove(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "%s(), dev name %s\n",
 		__func__, dev_name(&pdev->dev));
 
-	ret = regulator_disable(priv->avdd_reg);
-	if (ret) {
-		dev_err(&pdev->dev, "%s(), failed to disable regulator!\n",
-			__func__);
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index 3792e534a91b6..e0aebf639e461 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -135,11 +135,6 @@
 /* MT6359_DCXO_CW12 */
 #define RG_XO_AUDIO_EN_M_SFT				13
 
-/* LDO_VAUD18_CON0 */
-#define RG_LDO_VAUD18_EN_SFT				0
-#define RG_LDO_VAUD18_EN_MASK				0x1
-#define RG_LDO_VAUD18_EN_MASK_SFT			(0x1 << 0)
-
 /* AUD_TOP_CKPDN_CON0 */
 #define RG_VOW13M_CK_PDN_SFT				13
 #define RG_VOW13M_CK_PDN_MASK				0x1
@@ -2132,7 +2127,6 @@
 
 #define MT6359_DCXO_CW11				0x7a6
 #define MT6359_DCXO_CW12				0x7a8
-#define MT6359_LDO_VAUD18_CON0				0x1c98
 
 #define MT6359_GPIO_MODE0				0xcc
 #define MT6359_GPIO_MODE0_SET				0xce
@@ -2469,7 +2463,6 @@ enum {
 enum {
 	/* common */
 	SUPPLY_SEQ_CLK_BUF,
-	SUPPLY_SEQ_LDO_VAUD18,
 	SUPPLY_SEQ_AUD_GLB,
 	SUPPLY_SEQ_HP_PULL_DOWN,
 	SUPPLY_SEQ_CLKSQ,
@@ -2629,7 +2622,6 @@ struct mt6359_priv {
 	int hp_gain_ctl;
 	int hp_hifi_mode;
 	int mtkaif_protocol;
-	struct regulator *avdd_reg;
 };
 
 #define CODEC_MT6359_NAME "mtk-codec-mt6359"
-- 
2.27.0

