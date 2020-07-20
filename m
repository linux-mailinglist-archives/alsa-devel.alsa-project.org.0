Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D9225581
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 03:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7451683;
	Mon, 20 Jul 2020 03:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7451683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595209041;
	bh=J2XGYf4y2wn+VZo6XrAdcY1Tv4nbp27OAKJLvA9/7Lc=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2aaMcvHsYviveOw9wVu7yt9R/YY7Ge6lut/PhRVL+DkDHLUXWQT/TQbT/JvXG4Ci
	 RORGh/zier+SvKo2FXVmWRgjHCws9YpmGDDX0mERiD6eGWANe+Puf2z8XQsP6NkF8b
	 gn4HiNh80DlbVPvmyFhSWJxbVIjDHnGsHToeQ/q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B846F80274;
	Mon, 20 Jul 2020 03:26:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1820F80279; Mon, 20 Jul 2020 03:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8327F800CE
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 03:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8327F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="q4MZuANs"
Received: by mail-yb1-xb4a.google.com with SMTP id x184so19761845ybx.10
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 18:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wRtuAOlPgD/NDVb7LuAhKmi8EP2ThS7Y7+6owwo8YA0=;
 b=q4MZuANsSa5McwhCYE41CzoiB1ZZnhJTxpKOKXg+wslt842Rmfc5eERwQpqhnrXOQv
 1vTA9CTLISWpuKKCpyt/YzreMN3qR2B3bzvpPtaTF+IU3Y5VV3IXPir+QbgrZUeA9OUo
 UoQiYXFfkP26jUz6VVEu3enbHZVkv5+pwmEcsZaxW4O1VqDXlEuUIfbHpRcNQ8N+Esij
 BVEPusglu0rk7nxhPJAPM4D2aZ4GFIjiPq1bNPAx+aknH+6D8CtWT0FRqF5EIDZLHgGw
 B+v4PEQH0uvgGT3m7dhGuaSj/bidK9cRTcrpqS7i+z9vgpnVBgfF2JCK5k/2pMzfZt8+
 +wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wRtuAOlPgD/NDVb7LuAhKmi8EP2ThS7Y7+6owwo8YA0=;
 b=V+sEQbTfYJ1QsD50RFJSzA4S9wcZsNUI0Camfreyo2mo3ziSmGS/tX61KJ8vs7sOHz
 8EvjLzh43cm0LG2iZWj85pp9buulr7SvTezHT+JaV9QS0eQQ9gtDesrNgJWgq95idJLV
 TTaLLEdNV2MiQ0C94RGirDeajNTfuv9EnE5ZfPpe6/R649TDnE5gF31k6PE4LsiCtIjA
 sWbQwyVWgE8GcZd69/WlzYtKWP8FgS+0K41tRmmVcLmv8ZQu8mFjYhZ9yugtjj0qkx3j
 r1GeLvqAQpnc9zcg9+jLUoolp5uba9y4G5vXJQmUOdIdpcLcVR91JZqPVBg+0MAIHnry
 E7ZA==
X-Gm-Message-State: AOAM5321j8hCYIV39Ug7dDnwC9ICjkOrJ2iBgLk7xfezYZWwkg9s7XSY
 wVhwb7IwEtHE+jDZdbVbYfxsQ+1Takag
X-Google-Smtp-Source: ABdhPJzM+eZ40Q9LmStXUpb75UmQaFxcjwMR3oLPi7UMFIO84XGNk7eEDTVurwsJlaHd15MIvGhNmdClXUVF
X-Received: by 2002:a25:3752:: with SMTP id e79mr30488518yba.263.1595208368473; 
 Sun, 19 Jul 2020 18:26:08 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:25:57 +0800
In-Reply-To: <20200720012559.906088-1-tzungbi@google.com>
Message-Id: <20200720012559.906088-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200720012559.906088-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH 1/3] ASoC: mediatek: mt8183: support left justified format for
 I2S
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

MT8183 audio platform supports EIAJ and I2S formats.  The code fixed to
use I2S format in the past.

Supports EIAJ mode via set_fmt ops and preserves to use I2S format as
the default format intentionally.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 59 +++++++++++++++++++---
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 777e93d70bea..138591d71ebd 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -49,6 +49,8 @@ struct mtk_afe_i2s_priv {
 	int mclk_id;
 	int mclk_rate;
 	int mclk_apll;
+
+	int use_eiaj;
 };
 
 static unsigned int get_i2s_wlen(snd_pcm_format_t format)
@@ -711,7 +713,7 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	unsigned int rate_reg = mt8183_rate_transform(afe->dev,
 						      rate, i2s_id);
 	snd_pcm_format_t format = params_format(params);
-	unsigned int i2s_con = 0;
+	unsigned int i2s_con = 0, fmt_con = I2S_FMT_I2S << I2S_FMT_SFT;
 	int ret = 0;
 
 	dev_info(afe->dev, "%s(), id %d, rate %d, format %d\n",
@@ -719,17 +721,21 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 		 i2s_id,
 		 rate, format);
 
-	if (i2s_priv)
+	if (i2s_priv) {
 		i2s_priv->rate = rate;
-	else
+
+		if (i2s_priv->use_eiaj)
+			fmt_con = I2S_FMT_EIAJ << I2S_FMT_SFT;
+	} else {
 		dev_warn(afe->dev, "%s(), i2s_priv == NULL", __func__);
+	}
 
 	switch (i2s_id) {
 	case MT8183_DAI_I2S_0:
 		regmap_update_bits(afe->regmap, AFE_DAC_CON1,
 				   I2S_MODE_MASK_SFT, rate_reg << I2S_MODE_SFT);
 		i2s_con = I2S_IN_PAD_IO_MUX << I2SIN_PAD_SEL_SFT;
-		i2s_con |= I2S_FMT_I2S << I2S_FMT_SFT;
+		i2s_con |= fmt_con;
 		i2s_con |= get_i2s_wlen(format) << I2S_WLEN_SFT;
 		regmap_update_bits(afe->regmap, AFE_I2S_CON,
 				   0xffffeffe, i2s_con);
@@ -737,7 +743,7 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	case MT8183_DAI_I2S_1:
 		i2s_con = I2S1_SEL_O28_O29 << I2S2_SEL_O03_O04_SFT;
 		i2s_con |= rate_reg << I2S2_OUT_MODE_SFT;
-		i2s_con |= I2S_FMT_I2S << I2S2_FMT_SFT;
+		i2s_con |= fmt_con;
 		i2s_con |= get_i2s_wlen(format) << I2S2_WLEN_SFT;
 		regmap_update_bits(afe->regmap, AFE_I2S_CON1,
 				   0xffffeffe, i2s_con);
@@ -745,21 +751,21 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	case MT8183_DAI_I2S_2:
 		i2s_con = 8 << I2S3_UPDATE_WORD_SFT;
 		i2s_con |= rate_reg << I2S3_OUT_MODE_SFT;
-		i2s_con |= I2S_FMT_I2S << I2S3_FMT_SFT;
+		i2s_con |= fmt_con;
 		i2s_con |= get_i2s_wlen(format) << I2S3_WLEN_SFT;
 		regmap_update_bits(afe->regmap, AFE_I2S_CON2,
 				   0xffffeffe, i2s_con);
 		break;
 	case MT8183_DAI_I2S_3:
 		i2s_con = rate_reg << I2S4_OUT_MODE_SFT;
-		i2s_con |= I2S_FMT_I2S << I2S4_FMT_SFT;
+		i2s_con |= fmt_con;
 		i2s_con |= get_i2s_wlen(format) << I2S4_WLEN_SFT;
 		regmap_update_bits(afe->regmap, AFE_I2S_CON3,
 				   0xffffeffe, i2s_con);
 		break;
 	case MT8183_DAI_I2S_5:
 		i2s_con = rate_reg << I2S5_OUT_MODE_SFT;
-		i2s_con |= I2S_FMT_I2S << I2S5_FMT_SFT;
+		i2s_con |= fmt_con;
 		i2s_con |= get_i2s_wlen(format) << I2S5_WLEN_SFT;
 		regmap_update_bits(afe->regmap, AFE_I2S_CON4,
 				   0xffffeffe, i2s_con);
@@ -841,9 +847,46 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8183_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	switch (dai->id) {
+	case MT8183_DAI_I2S_0:
+	case MT8183_DAI_I2S_1:
+	case MT8183_DAI_I2S_2:
+	case MT8183_DAI_I2S_3:
+	case MT8183_DAI_I2S_5:
+		break;
+	default:
+		dev_warn(afe->dev, "%s(), id %d not support\n",
+			 __func__, dai->id);
+		return -EINVAL;
+	}
+	i2s_priv = afe_priv->dai_priv[dai->id];
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_LEFT_J:
+		i2s_priv->use_eiaj = 1;
+		break;
+	case SND_SOC_DAIFMT_I2S:
+		i2s_priv->use_eiaj = 0;
+		break;
+	default:
+		dev_warn(afe->dev, "%s(), DAI format %d not support\n",
+			 __func__, fmt & SND_SOC_DAIFMT_FORMAT_MASK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
 	.hw_params = mtk_dai_i2s_hw_params,
 	.set_sysclk = mtk_dai_i2s_set_sysclk,
+	.set_fmt = mtk_dai_i2s_set_fmt,
 };
 
 /* dai driver */
-- 
2.28.0.rc0.105.gf9edc3c819-goog

