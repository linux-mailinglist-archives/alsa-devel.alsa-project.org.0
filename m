Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB31938FA2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D2B162B;
	Mon, 22 Jul 2024 15:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D2B162B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653471;
	bh=L/ApIpFJ9BfLOmjZ356/A8+sGcAzB4WiLcEPhi10XKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFYt3mdayzxjUzC8irmQohM3tmbwrrcu7OTDi+3X2VjEJkqiu+noKwY2hmrkaT3/L
	 1VA5511WQtjrQvAYYM8dtaFatYW9su0iHZKZRtn9xNMO0gM+vXR1t3zY/bXnZM2Yf3
	 j8+kZDMN13HwRFdWw60vJCYX0NO8x2POK13tAfT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BEBDF8085E; Mon, 22 Jul 2024 15:01:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2383AF80854;
	Mon, 22 Jul 2024 15:01:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC4CF8057A; Mon, 22 Jul 2024 11:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6740DF800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6740DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OrlUY+Zu
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f04c1e58eso704130e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641945; x=1722246745;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl6ci1X9H1bocspAYVTPwqDYk40+i0zlUVaPzwxman8=;
        b=OrlUY+ZuJeSz3tVC7FO0oBmS5j0C72UC2Ysw2DRUh4va5TY97qK+TwIetZ6NxR7wwB
         hoRJjW3dLQ8MGBd5mQ/y9AsmAyMANEC0vgYM2q+4K7StlF1xRgwsQxp66WN19i0jk3VE
         /yVoMnRJDGbRPTtaRxgO2wB9dxiK/XObYKUdjmyM7+tgM0ktcib6128wf8LyXoEDPB8y
         9rK9dGTN2jA7bBT2NWKUOexyFNQlRz/UZucgRzVIyuxoveGbLzDxeuZsOWOTXa9HCRzO
         q4VD90n6GzVJQrmsERdzKCR4YAxc83O+xORHUq/V5S3ojeeY1mnR1L9++09hbirg7GiS
         K6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641945; x=1722246745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dl6ci1X9H1bocspAYVTPwqDYk40+i0zlUVaPzwxman8=;
        b=OXQmcvo1CtLInXd+890TeK2NsnU3+08aH08yAmnqeE1oKMw++s9Z2kAoowGT5ekjXL
         RPPD4fLT5Q+aXv83Xx1HDb66PFwL5TlBX8uF+UeMvHtBskbF0WSFbeFUX8ug37hq1hJI
         TsWhlbzYS6Tb0HtNc5ys1V+MU0t4abz51OvJa175goRxlxuIYtHF+PR9XFqsuInKYsc4
         qPFqr7/zSAAnH7nyWeRAkVAGgmN9tp/W8uFRIBTi3T9PZ5M7+hwQsyrqielcuHOMv1j8
         so+G8UetJOVfKWXLF+SJssk+b0HzgPrKCPmKNxpB2/bE0aZQodSOPxiENJOqexwQUu+g
         geIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXokeBc3q9gEWW4UBc30efnVXAEmcdYDLOwke9B7N31wYVOc/KFacobaeFeD74/aOi/fAsKDfN3wDhnQgUpXln6URqLSLoP4vEY02Y=
X-Gm-Message-State: AOJu0YyMvF0qX3yjKj4arpa9BOPc/VutZG4WD4qFCzUFa3Ky0zP4Utrm
	wqkBIhVaUrDx5ba2lzW5zSHql8R7yUTFdoGR/s+MsF603qKAxD3/
X-Google-Smtp-Source: 
 AGHT+IHiwNvnwn1Ldydw+/A3gbnMJ79+Ia18db3RGXJpSUtCeRrxw/7o90BQd8QswtyBBxDk+Uh7pg==
X-Received: by 2002:a05:6512:1250:b0:52c:db76:2a7a with SMTP id
 2adb3069b0e04-52efb74c166mr4664718e87.34.1721641944859;
        Mon, 22 Jul 2024 02:52:24 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl.
 [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:24 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 4/4] ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976
 SoC
Date: Mon, 22 Jul 2024 11:51:08 +0200
Message-ID: <20240722095147.3372-5-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K3MHKQBVNXZR72CVXDHVMHULQO5IFB56
X-Message-ID-Hash: K3MHKQBVNXZR72CVXDHVMHULQO5IFB56
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3MHKQBVNXZR72CVXDHVMHULQO5IFB56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Introduce support for audio card on MSM8953/MSM8976 platform.
Main difference between those two is Q6AFE CLK API supported by firmware
which influence way we enable digital codec clock.
Either inside machine driver or outside via q6afe-clocks driver.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add MSM8976, rename functions, add mclk setting,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 66 ++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 8971f4f5d339..51efefefe0a1 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -22,6 +22,11 @@
 
 #define MI2S_COUNT  (MI2S_QUINARY + 1)
 
+enum afe_clk_api {
+	Q6AFE_CLK_V1,
+	Q6AFE_CLK_V2
+};
+
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
@@ -29,6 +34,8 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	}
 }
 
+static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
+{
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
+		switch (mi2s_id) {
+		case MI2S_PRIMARY:
+			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+		case MI2S_SECONDARY:
+			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+		case MI2S_TERTIARY:
+			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+		case MI2S_QUATERNARY:
+			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
+		case MI2S_QUINARY:
+			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+		default:
+			break;
+		}
+	}
+	/* If AFE CLK isn't V2 return V1 */
+	return LPAIF_BIT_CLK;
+}
+
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -214,8 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,9 +273,15 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -279,6 +322,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+	msm8916_qdsp6_add_ops(card);
+}
+
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+	msm8916_qdsp6_add_ops(card);
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -343,6 +403,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
-- 
2.45.2

