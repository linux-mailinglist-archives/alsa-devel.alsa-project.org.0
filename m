Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A57687E0
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 22:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCB682B;
	Sun, 30 Jul 2023 22:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCB682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690748415;
	bh=ARXyDTZXS9uuSe30XIQ4Hw6b/bLUTuUH4JsSORXW8Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HSNV3T8F/bZejuammi5dOs0pSxOORW3pD2vJeKaxupr3A9XMBOU6BbTwWE2iRUbj/
	 xKfMJfThzwNG5F7oy630jS3d5HIqBG1CiINund56V8qj1pI/9cKW9OVYTi3xVLdmne
	 APe4GDWWYnWW30s1KwwVURQa0LZbF/3Z3JHAZGyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E219F80563; Sun, 30 Jul 2023 22:18:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 835DDF80549;
	Sun, 30 Jul 2023 22:18:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEDBEF80558; Sun, 30 Jul 2023 22:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77537F80149
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 22:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77537F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KbFiNSN3
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-997c4107d62so564560166b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690748323; x=1691353123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FVwMesUCOIw/oIaNW0vdhmcra7sPPxfypHhOLfvlxw=;
        b=KbFiNSN30/4troqbXRvnEs+OEJfFIEhrB2vHakrKfM0IQMkYs2eO6Y7mVP1S572g/V
         t4XyexKRU+BEsm/SDGcAlYMME6UE8o/8tQK6yMRdtWe1IGNkRCfNwYE76FRfIKDEmDyO
         lsX9wohvDw9knXVild53wrLOtBr1rIEX9DAzpsZuPx8+P6apMnmeTP4ypIDD2LioCWl7
         JltCgWrBZoFT6zkx9jlI6cXU8zqvznGRsn/His6ou1UY8Dbpsyo/Az9vp6diVzMBDNY8
         jWT+0dkH/FM2CSp3Kp0YB0MPT3GRbw2TzLJBDGhlhWNgOHqqZ/bQzgTE8PebwTcwdF0X
         vFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690748323; x=1691353123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FVwMesUCOIw/oIaNW0vdhmcra7sPPxfypHhOLfvlxw=;
        b=KHI+qh34jDiIYYQdkYIJPSw5a+tuc+7y4HVUdc3u16ETlRI0ZldLbly12Qmh2HITUR
         YAcGpCKRbn0wH8ZmQKASD7w/5KxgR8F+qP7AmWYsgYLvA17/AZa/p2AlGAXwCu+PdaQH
         29lCkH1tBG3ztygjhdaMERALOe5MNLJ1Cf+XvimuE+z5j09H+87rrHhf7PDTbovrHOAi
         p72Uo0h4gyJfz6OKocG33ms5BKxOuTavD3lN8Mg8vOB/qo57zxYPlvUzZa2+0SkKFjCX
         Dr0YmdnkWqsF5Huklu4KT9/JzWQzbtK8y55vgkPcYawK+KRNsX5hX0ARN+CaR7uR1GRt
         LMQQ==
X-Gm-Message-State: ABy/qLZ80adEWPgnljKV/IHdpz3xyRxgj0Q1qe0L7SjVrJpXIPL0UNJw
	u9p1DuyaNQJJFFPELi8DpDGu6w==
X-Google-Smtp-Source: 
 APBJJlFOv7We+h/tEWkht6+Fw7I0r9sAZODrUtGvFfSNBArdKH9pV6tXEs9PYaa9KXHoRv/U3VReqg==
X-Received: by 2002:a17:906:30c3:b0:993:a379:6158 with SMTP id
 b3-20020a17090630c300b00993a3796158mr5255782ejb.17.1690748323467;
        Sun, 30 Jul 2023 13:18:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b0099bc0daf3d7sm5115533ejb.182.2023.07.30.13.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 13:18:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ryan Lee <ryans.lee@maximintegrated.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ASoC: codecs: max9892x: Reformat to coding style
Date: Sun, 30 Jul 2023 22:18:26 +0200
Message-Id: <20230730201826.70453-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
References: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CUASFFXKYZCYNIKC5X4JYURMFYQX4CQK
X-Message-ID-Hash: CUASFFXKYZCYNIKC5X4JYURMFYQX4CQK
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUASFFXKYZCYNIKC5X4JYURMFYQX4CQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reformat the code to match Linuxn coding style: re-indent continued
lines and stop too-early line wrapping, drop unneeded {} brackets.  No
functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/codecs/max98927.c | 341 +++++++++++++++---------------------
 1 file changed, 137 insertions(+), 204 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index e20aa5b1bce9..776f23d38ac5 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -162,10 +162,8 @@ static int max98927_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0021_PCM_MASTER_MODE,
-		MAX98927_PCM_MASTER_MODE_MASK,
-		mode);
+	regmap_update_bits(max98927->regmap, MAX98927_R0021_PCM_MASTER_MODE,
+			   MAX98927_PCM_MASTER_MODE_MASK, mode);
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -178,10 +176,8 @@ static int max98927_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0020_PCM_MODE_CFG,
-		MAX98927_PCM_MODE_CFG_PCM_BCLKEDGE,
-		invert);
+	regmap_update_bits(max98927->regmap, MAX98927_R0020_PCM_MODE_CFG,
+			   MAX98927_PCM_MODE_CFG_PCM_BCLKEDGE, invert);
 
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -207,36 +203,31 @@ static int max98927_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 	if (!use_pdm) {
 		/* pcm channel configuration */
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R0018_PCM_RX_EN_A,
-			MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN,
-			MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN);
+		regmap_update_bits(max98927->regmap, MAX98927_R0018_PCM_RX_EN_A,
+				   MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN,
+				   MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN);
 
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R0020_PCM_MODE_CFG,
-			MAX98927_PCM_MODE_CFG_FORMAT_MASK,
-			format << MAX98927_PCM_MODE_CFG_FORMAT_SHIFT);
+				   MAX98927_R0020_PCM_MODE_CFG,
+				   MAX98927_PCM_MODE_CFG_FORMAT_MASK,
+				   format << MAX98927_PCM_MODE_CFG_FORMAT_SHIFT);
 
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R003B_SPK_SRC_SEL,
-			MAX98927_SPK_SRC_MASK, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R003B_SPK_SRC_SEL,
+				   MAX98927_SPK_SRC_MASK, 0);
 
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R0035_PDM_RX_CTRL,
-			MAX98927_PDM_RX_EN_MASK, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R0035_PDM_RX_CTRL,
+				   MAX98927_PDM_RX_EN_MASK, 0);
 	} else {
 		/* pdm channel configuration */
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R0035_PDM_RX_CTRL,
-			MAX98927_PDM_RX_EN_MASK, 1);
+		regmap_update_bits(max98927->regmap, MAX98927_R0035_PDM_RX_CTRL,
+				   MAX98927_PDM_RX_EN_MASK, 1);
 
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R003B_SPK_SRC_SEL,
-			MAX98927_SPK_SRC_MASK, 3);
+		regmap_update_bits(max98927->regmap, MAX98927_R003B_SPK_SRC_SEL,
+				   MAX98927_SPK_SRC_MASK, 3);
 
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R0018_PCM_RX_EN_A,
-			MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R0018_PCM_RX_EN_A,
+				   MAX98927_PCM_RX_CH0_EN | MAX98927_PCM_RX_CH1_EN,
+				   0);
 	}
 	return 0;
 }
@@ -283,9 +274,9 @@ static int max98927_set_clock(struct max98927_priv *max98927,
 			return -EINVAL;
 		}
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R0021_PCM_MASTER_MODE,
-			MAX98927_PCM_MASTER_MODE_MCLK_MASK,
-			i << MAX98927_PCM_MASTER_MODE_MCLK_RATE_SHIFT);
+				   MAX98927_R0021_PCM_MASTER_MODE,
+				   MAX98927_PCM_MASTER_MODE_MCLK_MASK,
+				   i << MAX98927_PCM_MASTER_MODE_MCLK_RATE_SHIFT);
 	}
 
 	if (!max98927->tdm_mode) {
@@ -298,9 +289,8 @@ static int max98927_set_clock(struct max98927_priv *max98927,
 		}
 
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R0022_PCM_CLK_SETUP,
-			MAX98927_PCM_CLK_SETUP_BSEL_MASK,
-			value);
+				   MAX98927_R0022_PCM_CLK_SETUP,
+				   MAX98927_PCM_CLK_SETUP_BSEL_MASK, value);
 	}
 	return 0;
 }
@@ -333,9 +323,8 @@ static int max98927_dai_hw_params(struct snd_pcm_substream *substream,
 
 	max98927->ch_size = snd_pcm_format_width(params_format(params));
 
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0020_PCM_MODE_CFG,
-		MAX98927_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+	regmap_update_bits(max98927->regmap, MAX98927_R0020_PCM_MODE_CFG,
+			   MAX98927_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
 
 	dev_dbg(component->dev, "format supported %d",
 		params_format(params));
@@ -375,27 +364,24 @@ static int max98927_dai_hw_params(struct snd_pcm_substream *substream,
 		goto err;
 	}
 	/* set DAI_SR to correct LRCLK frequency */
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0023_PCM_SR_SETUP1,
-		MAX98927_PCM_SR_SET1_SR_MASK,
-		sampling_rate);
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0024_PCM_SR_SETUP2,
-		MAX98927_PCM_SR_SET2_SR_MASK,
-		sampling_rate << MAX98927_PCM_SR_SET2_SR_SHIFT);
+	regmap_update_bits(max98927->regmap, MAX98927_R0023_PCM_SR_SETUP1,
+			   MAX98927_PCM_SR_SET1_SR_MASK, sampling_rate);
+	regmap_update_bits(max98927->regmap, MAX98927_R0024_PCM_SR_SETUP2,
+			   MAX98927_PCM_SR_SET2_SR_MASK,
+			   sampling_rate << MAX98927_PCM_SR_SET2_SR_SHIFT);
 
 	/* set sampling rate of IV */
 	if (max98927->interleave_mode &&
 	    sampling_rate > MAX98927_PCM_SR_SET1_SR_16000)
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R0024_PCM_SR_SETUP2,
-			MAX98927_PCM_SR_SET2_IVADC_SR_MASK,
-			sampling_rate - 3);
+				   MAX98927_R0024_PCM_SR_SETUP2,
+				   MAX98927_PCM_SR_SET2_IVADC_SR_MASK,
+				   sampling_rate - 3);
 	else
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R0024_PCM_SR_SETUP2,
-			MAX98927_PCM_SR_SET2_IVADC_SR_MASK,
-			sampling_rate);
+				   MAX98927_R0024_PCM_SR_SETUP2,
+				   MAX98927_PCM_SR_SET2_IVADC_SR_MASK,
+				   sampling_rate);
 	return max98927_set_clock(max98927, params);
 err:
 	return -EINVAL;
@@ -420,10 +406,8 @@ static int max98927_dai_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0022_PCM_CLK_SETUP,
-		MAX98927_PCM_CLK_SETUP_BSEL_MASK,
-		bsel);
+	regmap_update_bits(max98927->regmap, MAX98927_R0022_PCM_CLK_SETUP,
+			   MAX98927_PCM_CLK_SETUP_BSEL_MASK, bsel);
 
 	/* Channel size configuration */
 	switch (slot_width) {
@@ -442,33 +426,26 @@ static int max98927_dai_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(max98927->regmap,
-		MAX98927_R0020_PCM_MODE_CFG,
-		MAX98927_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+	regmap_update_bits(max98927->regmap, MAX98927_R0020_PCM_MODE_CFG,
+			   MAX98927_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
 
 	/* Rx slot configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R0018_PCM_RX_EN_A,
-		rx_mask & 0xFF);
-	regmap_write(max98927->regmap,
-		MAX98927_R0019_PCM_RX_EN_B,
-		(rx_mask & 0xFF00) >> 8);
+	regmap_write(max98927->regmap, MAX98927_R0018_PCM_RX_EN_A,
+		     rx_mask & 0xFF);
+	regmap_write(max98927->regmap, MAX98927_R0019_PCM_RX_EN_B,
+		     (rx_mask & 0xFF00) >> 8);
 
 	/* Tx slot configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R001A_PCM_TX_EN_A,
-		tx_mask & 0xFF);
-	regmap_write(max98927->regmap,
-		MAX98927_R001B_PCM_TX_EN_B,
-		(tx_mask & 0xFF00) >> 8);
+	regmap_write(max98927->regmap, MAX98927_R001A_PCM_TX_EN_A,
+		     tx_mask & 0xFF);
+	regmap_write(max98927->regmap, MAX98927_R001B_PCM_TX_EN_B,
+		     (tx_mask & 0xFF00) >> 8);
 
 	/* Tx slot Hi-Z configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
-		~tx_mask & 0xFF);
-	regmap_write(max98927->regmap,
-		MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
-		(~tx_mask & 0xFF00) >> 8);
+	regmap_write(max98927->regmap, MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
+		     ~tx_mask & 0xFF);
+	regmap_write(max98927->regmap, MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
+		     (~tx_mask & 0xFF00) >> 8);
 
 	return 0;
 }
@@ -506,20 +483,16 @@ static int max98927_dac_event(struct snd_soc_dapm_widget *w,
 		max98927->tdm_mode = false;
 		break;
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R003A_AMP_EN,
-			MAX98927_AMP_EN_MASK, 1);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R00FF_GLOBAL_SHDN,
-			MAX98927_GLOBAL_EN_MASK, 1);
+		regmap_update_bits(max98927->regmap, MAX98927_R003A_AMP_EN,
+				   MAX98927_AMP_EN_MASK, 1);
+		regmap_update_bits(max98927->regmap, MAX98927_R00FF_GLOBAL_SHDN,
+				   MAX98927_GLOBAL_EN_MASK, 1);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R00FF_GLOBAL_SHDN,
-			MAX98927_GLOBAL_EN_MASK, 0);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R003A_AMP_EN,
-			MAX98927_AMP_EN_MASK, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R00FF_GLOBAL_SHDN,
+				   MAX98927_GLOBAL_EN_MASK, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R003A_AMP_EN,
+				   MAX98927_AMP_EN_MASK, 0);
 		break;
 	default:
 		return 0;
@@ -532,8 +505,8 @@ static const char * const max98927_switch_text[] = {
 
 static const struct soc_enum dai_sel_enum =
 	SOC_ENUM_SINGLE(MAX98927_R0025_PCM_TO_SPK_MONOMIX_A,
-		MAX98927_PCM_TO_SPK_MONOMIX_CFG_SHIFT,
-		3, max98927_switch_text);
+			MAX98927_PCM_TO_SPK_MONOMIX_CFG_SHIFT, 3,
+			max98927_switch_text);
 
 static const struct snd_kcontrol_new max98927_dai_controls =
 	SOC_DAPM_ENUM("DAI Sel", dai_sel_enum);
@@ -543,17 +516,17 @@ static const struct snd_kcontrol_new max98927_vi_control =
 
 static const struct snd_soc_dapm_widget max98927_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback", MAX98927_R003A_AMP_EN,
-		0, 0, max98927_dac_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+			   0, 0, max98927_dac_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,
-		&max98927_dai_controls),
+			 &max98927_dai_controls),
 	SND_SOC_DAPM_OUTPUT("BE_OUT"),
 	SND_SOC_DAPM_AIF_OUT("Voltage Sense", "HiFi Capture",  0,
-		MAX98927_R003E_MEAS_EN, 0, 0),
+			     MAX98927_R003E_MEAS_EN, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("Current Sense", "HiFi Capture",  0,
-		MAX98927_R003E_MEAS_EN, 1, 0),
+			     MAX98927_R003E_MEAS_EN, 1, 0),
 	SND_SOC_DAPM_SWITCH("VI Sense", SND_SOC_NOPM, 0, 0,
-		&max98927_vi_control),
+			    &max98927_vi_control),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON"),
 };
@@ -623,20 +596,19 @@ static SOC_ENUM_SINGLE_DECL(max98927_current_limit,
 		max98927_current_limit_text);
 
 static const struct snd_kcontrol_new max98927_snd_controls[] = {
-	SOC_SINGLE_TLV("Speaker Volume", MAX98927_R003C_SPK_GAIN,
-		0, 6, 0,
-		max98927_spk_tlv),
+	SOC_SINGLE_TLV("Speaker Volume", MAX98927_R003C_SPK_GAIN, 0, 6, 0,
+		       max98927_spk_tlv),
 	SOC_SINGLE_TLV("Digital Volume", MAX98927_R0036_AMP_VOL_CTRL,
-		0, (1<<MAX98927_AMP_VOL_WIDTH)-1, 0,
-		max98927_digital_tlv),
+		       0, (1 << MAX98927_AMP_VOL_WIDTH) - 1, 0,
+		       max98927_digital_tlv),
 	SOC_SINGLE("Amp DSP Switch", MAX98927_R0052_BROWNOUT_EN,
-		MAX98927_BROWNOUT_DSP_SHIFT, 1, 0),
+		   MAX98927_BROWNOUT_DSP_SHIFT, 1, 0),
 	SOC_SINGLE("Ramp Switch", MAX98927_R0037_AMP_DSP_CFG,
-		MAX98927_AMP_DSP_CFG_RMP_SHIFT, 1, 0),
-	SOC_SINGLE("DRE Switch", MAX98927_R0039_DRE_CTRL,
-		MAX98927_DRE_EN_SHIFT, 1, 0),
+		   MAX98927_AMP_DSP_CFG_RMP_SHIFT, 1, 0),
+	SOC_SINGLE("DRE Switch", MAX98927_R0039_DRE_CTRL, MAX98927_DRE_EN_SHIFT,
+		   1, 0),
 	SOC_SINGLE("Volume Location Switch", MAX98927_R0036_AMP_VOL_CTRL,
-		MAX98927_AMP_VOL_SEL_SHIFT, 1, 0),
+		   MAX98927_AMP_VOL_SEL_SHIFT, 1, 0),
 	SOC_ENUM("Boost Output Voltage", max98927_boost_voltage),
 	SOC_ENUM("Current Limit", max98927_current_limit),
 };
@@ -682,117 +654,82 @@ static int max98927_probe(struct snd_soc_component *component)
 	max98927->component = component;
 
 	/* Software Reset */
-	regmap_write(max98927->regmap,
-		MAX98927_R0100_SOFT_RESET, MAX98927_SOFT_RESET);
+	regmap_write(max98927->regmap, MAX98927_R0100_SOFT_RESET,
+		     MAX98927_SOFT_RESET);
 
 	/* IV default slot configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
-		0xFF);
-	regmap_write(max98927->regmap,
-		MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
-		0xFF);
-	regmap_write(max98927->regmap,
-		MAX98927_R0025_PCM_TO_SPK_MONOMIX_A,
-		0x80);
-	regmap_write(max98927->regmap,
-		MAX98927_R0026_PCM_TO_SPK_MONOMIX_B,
-		0x1);
+	regmap_write(max98927->regmap, MAX98927_R001C_PCM_TX_HIZ_CTRL_A, 0xFF);
+	regmap_write(max98927->regmap, MAX98927_R001D_PCM_TX_HIZ_CTRL_B, 0xFF);
+	regmap_write(max98927->regmap, MAX98927_R0025_PCM_TO_SPK_MONOMIX_A,
+		     0x80);
+	regmap_write(max98927->regmap, MAX98927_R0026_PCM_TO_SPK_MONOMIX_B,
+		     0x1);
 	/* Set inital volume (+13dB) */
-	regmap_write(max98927->regmap,
-		MAX98927_R0036_AMP_VOL_CTRL,
-		0x38);
-	regmap_write(max98927->regmap,
-		MAX98927_R003C_SPK_GAIN,
-		0x05);
+	regmap_write(max98927->regmap, MAX98927_R0036_AMP_VOL_CTRL, 0x38);
+	regmap_write(max98927->regmap, MAX98927_R003C_SPK_GAIN, 0x05);
 	/* Enable DC blocker */
-	regmap_write(max98927->regmap,
-		MAX98927_R0037_AMP_DSP_CFG,
-		0x03);
+	regmap_write(max98927->regmap, MAX98927_R0037_AMP_DSP_CFG, 0x03);
 	/* Enable IMON VMON DC blocker */
-	regmap_write(max98927->regmap,
-		MAX98927_R003F_MEAS_DSP_CFG,
-		0xF7);
+	regmap_write(max98927->regmap, MAX98927_R003F_MEAS_DSP_CFG, 0xF7);
 	/* Boost Output Voltage & Current limit */
-	regmap_write(max98927->regmap,
-		MAX98927_R0040_BOOST_CTRL0,
-		0x1C);
-	regmap_write(max98927->regmap,
-		MAX98927_R0042_BOOST_CTRL1,
-		0x3E);
+	regmap_write(max98927->regmap, MAX98927_R0040_BOOST_CTRL0, 0x1C);
+	regmap_write(max98927->regmap, MAX98927_R0042_BOOST_CTRL1, 0x3E);
 	/* Measurement ADC config */
-	regmap_write(max98927->regmap,
-		MAX98927_R0043_MEAS_ADC_CFG,
-		0x04);
-	regmap_write(max98927->regmap,
-		MAX98927_R0044_MEAS_ADC_BASE_MSB,
-		0x00);
-	regmap_write(max98927->regmap,
-		MAX98927_R0045_MEAS_ADC_BASE_LSB,
-		0x24);
+	regmap_write(max98927->regmap, MAX98927_R0043_MEAS_ADC_CFG, 0x04);
+	regmap_write(max98927->regmap, MAX98927_R0044_MEAS_ADC_BASE_MSB, 0x00);
+	regmap_write(max98927->regmap, MAX98927_R0045_MEAS_ADC_BASE_LSB, 0x24);
 	/* Brownout Level */
-	regmap_write(max98927->regmap,
-		MAX98927_R007F_BROWNOUT_LVL4_AMP1_CTRL1,
-		0x06);
+	regmap_write(max98927->regmap, MAX98927_R007F_BROWNOUT_LVL4_AMP1_CTRL1,
+		     0x06);
 	/* Envelope Tracking configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R0082_ENV_TRACK_VOUT_HEADROOM,
-		0x08);
-	regmap_write(max98927->regmap,
-		MAX98927_R0086_ENV_TRACK_CTRL,
-		0x01);
-	regmap_write(max98927->regmap,
-		MAX98927_R0087_ENV_TRACK_BOOST_VOUT_READ,
-		0x10);
+	regmap_write(max98927->regmap, MAX98927_R0082_ENV_TRACK_VOUT_HEADROOM,
+		     0x08);
+	regmap_write(max98927->regmap, MAX98927_R0086_ENV_TRACK_CTRL, 0x01);
+	regmap_write(max98927->regmap, MAX98927_R0087_ENV_TRACK_BOOST_VOUT_READ,
+		     0x10);
 
 	/* voltage, current slot configuration */
-	regmap_write(max98927->regmap,
-		MAX98927_R001E_PCM_TX_CH_SRC_A,
-		(max98927->i_l_slot<<MAX98927_PCM_TX_CH_SRC_A_I_SHIFT|
-		max98927->v_l_slot)&0xFF);
+	regmap_write(max98927->regmap, MAX98927_R001E_PCM_TX_CH_SRC_A,
+		     (max98927->i_l_slot << MAX98927_PCM_TX_CH_SRC_A_I_SHIFT | max98927->v_l_slot) & 0xFF);
 
 	if (max98927->v_l_slot < 8) {
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
-			1 << max98927->v_l_slot, 0);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R001A_PCM_TX_EN_A,
-			1 << max98927->v_l_slot,
-			1 << max98927->v_l_slot);
+				   MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
+				   1 << max98927->v_l_slot, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R001A_PCM_TX_EN_A,
+				   1 << max98927->v_l_slot,
+				   1 << max98927->v_l_slot);
 	} else {
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
-			1 << (max98927->v_l_slot - 8), 0);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R001B_PCM_TX_EN_B,
-			1 << (max98927->v_l_slot - 8),
-			1 << (max98927->v_l_slot - 8));
+				   MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
+				   1 << (max98927->v_l_slot - 8), 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R001B_PCM_TX_EN_B,
+				   1 << (max98927->v_l_slot - 8),
+				   1 << (max98927->v_l_slot - 8));
 	}
 
 	if (max98927->i_l_slot < 8) {
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
-			1 << max98927->i_l_slot, 0);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R001A_PCM_TX_EN_A,
-			1 << max98927->i_l_slot,
-			1 << max98927->i_l_slot);
+				   MAX98927_R001C_PCM_TX_HIZ_CTRL_A,
+				   1 << max98927->i_l_slot, 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R001A_PCM_TX_EN_A,
+				   1 << max98927->i_l_slot,
+				   1 << max98927->i_l_slot);
 	} else {
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
-			1 << (max98927->i_l_slot - 8), 0);
-		regmap_update_bits(max98927->regmap,
-			MAX98927_R001B_PCM_TX_EN_B,
-			1 << (max98927->i_l_slot - 8),
-			1 << (max98927->i_l_slot - 8));
+				   MAX98927_R001D_PCM_TX_HIZ_CTRL_B,
+				   1 << (max98927->i_l_slot - 8), 0);
+		regmap_update_bits(max98927->regmap, MAX98927_R001B_PCM_TX_EN_B,
+				   1 << (max98927->i_l_slot - 8),
+				   1 << (max98927->i_l_slot - 8));
 	}
 
 	/* Set interleave mode */
 	if (max98927->interleave_mode)
 		regmap_update_bits(max98927->regmap,
-			MAX98927_R001F_PCM_TX_CH_SRC_B,
-			MAX98927_PCM_TX_CH_INTERLEAVE_MASK,
-			MAX98927_PCM_TX_CH_INTERLEAVE_MASK);
+				   MAX98927_R001F_PCM_TX_CH_SRC_B,
+				   MAX98927_PCM_TX_CH_INTERLEAVE_MASK,
+				   MAX98927_PCM_TX_CH_INTERLEAVE_MASK);
 	return 0;
 }
 
@@ -809,8 +746,8 @@ static int max98927_resume(struct device *dev)
 {
 	struct max98927_priv *max98927 = dev_get_drvdata(dev);
 
-	regmap_write(max98927->regmap,
-		MAX98927_R0100_SOFT_RESET, MAX98927_SOFT_RESET);
+	regmap_write(max98927->regmap, MAX98927_R0100_SOFT_RESET,
+		     MAX98927_SOFT_RESET);
 	regcache_cache_only(max98927->regmap, false);
 	regcache_sync(max98927->regmap);
 	return 0;
@@ -869,9 +806,7 @@ static int max98927_i2c_probe(struct i2c_client *i2c)
 	int reg = 0;
 	struct max98927_priv *max98927 = NULL;
 
-	max98927 = devm_kzalloc(&i2c->dev,
-		sizeof(*max98927), GFP_KERNEL);
-
+	max98927 = devm_kzalloc(&i2c->dev, sizeof(*max98927), GFP_KERNEL);
 	if (!max98927) {
 		ret = -ENOMEM;
 		return ret;
@@ -897,9 +832,9 @@ static int max98927_i2c_probe(struct i2c_client *i2c)
 			"Failed to allocate regmap: %d\n", ret);
 		return ret;
 	}
-	
-	max98927->reset_gpio 
-		= devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
+
+	max98927->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset",
+						       GPIOD_OUT_HIGH);
 	if (IS_ERR(max98927->reset_gpio)) {
 		ret = PTR_ERR(max98927->reset_gpio);
 		return dev_err_probe(&i2c->dev, ret, "failed to request GPIO reset pin");
@@ -912,8 +847,7 @@ static int max98927_i2c_probe(struct i2c_client *i2c)
 	}
 
 	/* Check Revision ID */
-	ret = regmap_read(max98927->regmap,
-		MAX98927_R01FF_REV_ID, &reg);
+	ret = regmap_read(max98927->regmap, MAX98927_R01FF_REV_ID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c->dev,
 			"Failed to read: 0x%02X\n", MAX98927_R01FF_REV_ID);
@@ -938,9 +872,8 @@ static void max98927_i2c_remove(struct i2c_client *i2c)
 {
 	struct max98927_priv *max98927 = i2c_get_clientdata(i2c);
 
-	if (max98927->reset_gpio) {
+	if (max98927->reset_gpio)
 		gpiod_set_value_cansleep(max98927->reset_gpio, 1);
-	}
 }
 
 static const struct i2c_device_id max98927_i2c_id[] = {
-- 
2.34.1

