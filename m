Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B4944B0E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCBEE3FF4;
	Thu,  1 Aug 2024 14:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCBEE3FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514428;
	bh=7ih/twfj7Vu9/nowcpH2q0+GyQypwWFRSVqFIt9jL5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjGFDEbBx3ux2k1nA0Yxwqs0xyzAljViO2V352JDEx/GN5wTC10Ei3YK+v0izIyWo
	 7wk5lpcWidSn6c4cc1MtPDi9A7OAitVrdi6zDhDf4183ktWRT7auLA7elN45/d5Lkn
	 14GJ6nVJ1c5Qp4GOiCQ898uTTrVRwwy5LN0XeYWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 131BCF806B6; Thu,  1 Aug 2024 14:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 438E0F806B9;
	Thu,  1 Aug 2024 14:11:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F3C5F8026A; Wed, 31 Jul 2024 17:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D1AAF80580
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D1AAF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LAZ4TZb5
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso67289201fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439577; x=1723044377;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiPIHigZUWEy/gTiB3EmC11NKGqz88RzfHr+wLDLdBQ=;
        b=LAZ4TZb5IPhfjmQwm1yqFEoIf52CZmbYqToInHnnigScnh7157UCOKKSOqAkHKeaEw
         cR6u7jXWJRi1CatUvEI+oXXpbI0MecSdJya+UYwiz6+ilfAsbk3D5BHJ43YzlupO5dDG
         BRKGvh+RxigN1oHXgIrb4W8LVWOHW8U3lPJfCd5NgzU2SRdNCx/b6hiGY3a2OppbSaYg
         PSsBM35t8xuMA2IMnILadZh+RWiQXHCL4nfcbHQ2JkWsMQGyD/BkibvnQNl7iJdHn2e7
         wl/Ca8gDuEZI8PPuqs18q3yoOHZ2LkzPrBnshXnApFIjNyomnxL6ubHHVpCSmqfvmNGD
         ZAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439577; x=1723044377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiPIHigZUWEy/gTiB3EmC11NKGqz88RzfHr+wLDLdBQ=;
        b=UCNcIH6vk38gjgzP6UFwxRUJfOFtZ4jsQEWXLEuNIX00rZuVBXGOQbEUVsKK3W4f5x
         ZSUcoi+0QNak7HdRseSTe2kXkY5IoMUjVSUa2GApLCcH8N37b/b28crLOOdu4HwH1CQ5
         R7N5C4UMpbfBx9+apGaa7tfQaiUdGz+IncQ1um2a2TCYqQ6d1wazqEG27BzSjd3avmQP
         6BuL1o1LsxggeLKZ9W2UPHVssmCogU9842cDOp1LRUb7XtmtY6TVTYP7eo7WY4fGSBZY
         Sp+WCDpjNF9rdW4ah1JbEm0D6HFegsykb5ZAFUDXy4vX5EqetF55rkiUI0fC+/1EcaCj
         QBew==
X-Gm-Message-State: AOJu0YyO3I+INIzRaYAR+MuA+8J/+/p2p1ZmZhoWRB8dmhgrAIW+/j4C
	BP8EMkOH1iskhvAatk+hGeiqeTxxYY4AbWCGEa1ZVE+EWAeJvjNL
X-Google-Smtp-Source: 
 AGHT+IGfiiY8nEDh5Jy5pRnrx5JgptFO0aaTdFxWxnCuI2DfwVrpN841vJxt9dac7N5AxkUuFMo2zw==
X-Received: by 2002:a2e:7d13:0:b0:2ef:2b38:879c with SMTP id
 38308e7fff4ca-2f12edf02b2mr97756941fa.3.1722439576327;
        Wed, 31 Jul 2024 08:26:16 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:15 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:31 +0200
Subject: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TVSN3IGVA4L6WUJ5LGGLZIH7TZ7YGO23
X-Message-ID-Hash: TVSN3IGVA4L6WUJ5LGGLZIH7TZ7YGO23
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVSN3IGVA4L6WUJ5LGGLZIH7TZ7YGO23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce support for audio card on MSM8976 platform.
While MSM8976 falls into v1 category with MSM8916, digitial codec clock
is not available in GCC so we have to set it in machine driver.
For that reason for V1 clocks new boolean is added to check
if we need to enable codec clock.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3ed35beb671a..8219d4d55625 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -35,6 +35,7 @@ struct apq8016_sbc_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
+	    data->dig_cdc_mclk_en) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
+	}
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
@@ -267,6 +278,13 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
+	    data->dig_cdc_mclk_en) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+	}
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -317,6 +335,15 @@ static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
 	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
 }
 
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	msm8916_qdsp6_add_ops(card);
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -383,6 +410,7 @@ static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
 	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);

-- 
2.45.2

