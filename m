Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301F390586C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6C6EB1;
	Wed, 12 Jun 2024 18:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6C6EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209150;
	bh=u2prIGwh5jqmNbs4Jyq4LFMn7uSJkWnvV3kkEVVaI+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DyVV0b4ZtVifqDsLbUHUbDG24j2OgYYiwK6of9ufkX9fk8LmQJDWpopvEp0OzUglM
	 cQpHWe4v8wnfYlaZF8ueO6lbNEX3wIl7HXmBJrzTqgwQDtqmDYSjK9Wp5sn9Dhn70K
	 KWqSvqbPWPEOjrHE1YmbpfgoicxvwYOoYen37CHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7B86F80792; Wed, 12 Jun 2024 18:16:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3287AF80792;
	Wed, 12 Jun 2024 18:16:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E723F80685; Wed, 12 Jun 2024 18:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7682CF805AA
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7682CF805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DtC+uriN
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a6f1cf00b3aso6575366b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208950; x=1718813750;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOJFJF+t6lUE1cjVVqmcWFg9bqxOoxHwGyxHu2Jt5/4=;
        b=DtC+uriNpg1Zpx6rBJMZoOzahTD91WPC3Gy9Id0GqDtroPobuSTY04iymo2ODPoWC8
         pKU+Xy4ututMtVG6zWSeOiSn1IUCjEOkkO22+QwLAI0o1b8Wi6CEtVbC9U/0SKfyX3md
         g1FYPIwOojZ9YUn2uZw2keH97uslxry+mNWlxYsaKxBbD8SbeAMmpt6stDQcIMr63bJ1
         KvYUaMtz3v0rq7RI/fJEiBxnPhUsARxewvqQkbqijAmTHJFycUjq+R3jSO6vIVNlodDO
         bZrhnaXO9TGXsgOel61raykxq/bkOz6oF5lmyVPSLfyUyADp4ln537KK3dvSlYUJkBc3
         ftcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208950; x=1718813750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOJFJF+t6lUE1cjVVqmcWFg9bqxOoxHwGyxHu2Jt5/4=;
        b=JiklD3p2ZnNxnGAN2JXkhxV77fSwY4fG3W/jCxhmAtHCo3FnmxYUgbezKnDbP0I30r
         H7tt5WfcKdeO8qq/osAdeD2xFQjqM9T7U7FO9WeiW5gH0rkocmZkpyRkrq2SKm/sIM8n
         CahYJp0FBbMuWcFcsnWZohP33dRxkmF7nX8abzrVSkoL3VrPZqi8LVuJjfBFdgpRujFr
         /SISQcFLVrgOHNVzEzU4qWi9qSGZT3qCTPwbCMX2wKIoN3dzL2Njn1BUgTxAfqw+Sclc
         nX2b4oQHECDy5/9imhFJOY6VLH1pazV8sTT98mZYlUnFgImQM4D8Ti78zLHHJdWPX+Ul
         5yDQ==
X-Gm-Message-State: AOJu0YzhPDssuLeACTQIFz32Oh2c9h98IEVGWgWg3nBN4G4pnaTkJc/d
	sSvbFRZEpsvECLJiJbQT9j4elVHLzQLNbJoAF8cSro4WlZzXr9qgtv5dvYAJX8g=
X-Google-Smtp-Source: 
 AGHT+IHUF0KmidhvpAnMl83vBdXTEssqSGLDlaWZMxVn1Dusd8E2ucNDNmW4b7weNZmhLGChKPIjNg==
X-Received: by 2002:a17:907:390:b0:a6e:f655:ef29 with SMTP id
 a640c23a62f3a-a6f52414220mr7988766b.17.1718208950323;
        Wed, 12 Jun 2024 09:15:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:19 +0200
Subject: [PATCH 06/23] ASoC: codecs: wcd9335: Drop unused dmic rate
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-6-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u2prIGwh5jqmNbs4Jyq4LFMn7uSJkWnvV3kkEVVaI+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmcYazksfFeAD183iY592oj5Ey1hnxf+2W8n
 pqiTV4pmYiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnAAKCRDBN2bmhouD
 1yYVD/9xhjb8/1RHvXSBot2oW4imUHAfeV8TcbJ9t+iXnPPX9FAMldbq/LyJUFk2DfhjKJGMNFt
 SaWwA0cCxCSEAiHOfwP3I9obF3YXgm2XZKBRE+yYkdiuoEzZF66gXXHKwKTuuamcu/PPWERpGhw
 vpdXRPsyEu362gwv59jzNP38uQPZeuN3iipR8jomWaBwKH41B8muTgbo7H4FVF859fDgDPIa5fd
 ZLrvkYfXW6Nigr53w4oqLDO1iCu1KWDZZUZL+amAEI3rmr9RwD//+1eTdO2W4RPqtoGXW8VHoUw
 J9ROx43g3R3uEIsPj8A/5mWYtnU4gZaWpfWw9388o13h31KefPFFrwCT/ld9mCjRpshtOZ5yMuO
 lZB5gdQcxd2Bmz7bNujs4rVS/jl0wZNDroZnpF1oBftoFPj4VH4ocBB7zOr4FNFv0GsFb+JD7Hf
 TNB0Aef0wgTGOTOHuQloQ48Nb12NfRKR1xggnBLmHPCjwABUhfZWQtnWLHYq9kE0lobug3buf1R
 w+p5zF3v3PT99QqgQFsgYeeHFi8KVgztWZVDciFPHhXsb2v9dGR9ZT6QevnYrApTQTDYE0TC9wO
 ReXnwlyDpWIP0doK+LHywWZNaogywVzQclTIG2RjRK9lBJpLKATJwgmTD4lMET86Tco8Nbi6nzf
 6btju6azCzJ9Sfg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JM6U3NNRNLVIPDPFCTDKWQPEOSBV6F5G
X-Message-ID-Hash: JM6U3NNRNLVIPDPFCTDKWQPEOSBV6F5G
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JM6U3NNRNLVIPDPFCTDKWQPEOSBV6F5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver was prepared to adjust DMIC microphone parameters according to
DMIC clock rate which is read from platform data or Devicetree.  The
latter part never happened, so the code is always called with
dmic_clk_rate=0, prints error and uses default/fallback values.  All
this part can be simplified by dropping dead parts of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 52 +++-------------------------------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 6a1376b3b98c..f5fe2583b807 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -344,8 +344,6 @@ struct wcd9335_codec {
 	int dmic_0_1_clk_cnt;
 	int dmic_2_3_clk_cnt;
 	int dmic_4_5_clk_cnt;
-	int dmic_sample_rate;
-	int mad_dmic_sample_rate;
 };
 
 struct wcd9335_irq {
@@ -2844,52 +2842,15 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 }
 
 static u8 wcd9335_get_dmic_clk_val(struct snd_soc_component *component,
-				 u32 mclk_rate, u32 dmic_clk_rate)
+				 u32 mclk_rate)
 {
-	u32 div_factor;
 	u8 dmic_ctl_val;
 
-	/* Default value to return in case of error */
 	if (mclk_rate == WCD9335_MCLK_CLK_9P6MHZ)
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;
 	else
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_3;
 
-	if (dmic_clk_rate == 0) {
-		dev_err(component->dev,
-			"%s: dmic_sample_rate cannot be 0\n",
-			__func__);
-		goto done;
-	}
-
-	div_factor = mclk_rate / dmic_clk_rate;
-	switch (div_factor) {
-	case 2:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;
-		break;
-	case 3:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_3;
-		break;
-	case 4:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_4;
-		break;
-	case 6:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_6;
-		break;
-	case 8:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_8;
-		break;
-	case 16:
-		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_16;
-		break;
-	default:
-		dev_err(component->dev,
-			"%s: Invalid div_factor %u, clk_rate(%u), dmic_rate(%u)\n",
-			__func__, div_factor, mclk_rate, dmic_clk_rate);
-		break;
-	}
-
-done:
 	return dmic_ctl_val;
 }
 
@@ -2943,11 +2904,7 @@ static int wcd9335_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dmic_rate_val =
-			wcd9335_get_dmic_clk_val(comp,
-					wcd->mclk_rate,
-					wcd->dmic_sample_rate);
-
+		dmic_rate_val = wcd9335_get_dmic_clk_val(comp, wcd->mclk_rate);
 		(*dmic_clk_cnt)++;
 		if (*dmic_clk_cnt == 1) {
 			snd_soc_component_update_bits(comp, dmic_clk_reg,
@@ -2959,10 +2916,7 @@ static int wcd9335_codec_enable_dmic(struct snd_soc_dapm_widget *w,
 
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		dmic_rate_val =
-			wcd9335_get_dmic_clk_val(comp,
-					wcd->mclk_rate,
-					wcd->mad_dmic_sample_rate);
+		dmic_rate_val = wcd9335_get_dmic_clk_val(comp, wcd->mclk_rate);
 		(*dmic_clk_cnt)--;
 		if (*dmic_clk_cnt  == 0) {
 			snd_soc_component_update_bits(comp, dmic_clk_reg,

-- 
2.43.0

