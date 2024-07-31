Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1137944B0C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59CC83FC9;
	Thu,  1 Aug 2024 14:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59CC83FC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514412;
	bh=cAiwEYPyhie5YN0PaVJrgMAafcZxhlOZNQ26oDH/bMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SbdUXaiDqxAWK/Oj+otUa4ha0Udosz3mERDYGZH/XoeXdx4uMmimOKzgpPAfFGwLt
	 u5rSYCLru36M6fQdmPaRCH+RVQBhTTTVuS1j1X/4KbI8XQsH/GpMRlk6VWdLYA1+xo
	 dKurkao8cjKeco2V6sF/NO0GomWTWO+oyXPs7sGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB25F8069E; Thu,  1 Aug 2024 14:11:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3260F80683;
	Thu,  1 Aug 2024 14:11:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A6CBF8026A; Wed, 31 Jul 2024 17:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DEBEF80448
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DEBEF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WALn5UDy
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef23d04541so71017861fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439570; x=1723044370;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNjd7IUt9Z8kpFWJyPP/P05dyp4sHdu+T/jMNypx4g4=;
        b=WALn5UDy/TD9OIU7Dnw+5ipElaUnGVirQn3pMqsa+mlqSqwYxRsPq3N7NadE7+BUQS
         kK8qxsoiIV2xniMmhM8hThHe183Jyun2Zjm66poQP0BPmoggYB95ZBLQEdGah8GWKExC
         /IM6WML6Qb0srVCPiqNDcnG1t0CqtwxvtS9IXf6tyhlzC3Nbbd0Tx9MSLx159xDMhtaM
         eUr8r/eVA4KzhEsIt7OKWVDPe6xL/sHjU+V7BucmE93Qqw7SL423o36Kc/Js2Z8XMOya
         voXEEtdLFvrLG54yIKStkQTmLWpFY98jnbReE8bQl+c7i53MXYcOKGv6KJu6VvH/VbSp
         LOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439570; x=1723044370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNjd7IUt9Z8kpFWJyPP/P05dyp4sHdu+T/jMNypx4g4=;
        b=sVl4BkBZaeKkI5v4d3epFF2dy6XNMNX9720uGCd9pjJ4XZw+VBaE770ivrJjlLWnlm
         tuewONCS8D70NhhGweeE80zjBrTWT9q+v1pfoN5drXamAcnhkrpe27HAsIzb1U1Tu3zl
         hf0+M63RPnXDBDHeKgSy7LjKiPIc33CrFzTTZTTnjgSjAihtA3XqMFlCJ/ZfwOiMS4BQ
         w+UYjI+qUzGno/F0UyX5bkdWfL0ZIvfWtlNc4vPPY2STxVj2r4TPR4RiO4ohoPfqgwre
         rQ1uQz18XJ6AAZUslyNb9rkq51hiYjxb73cW0spBVXUNLcOEC2R8Gs6yRWkZIoRAinRs
         ZSKA==
X-Gm-Message-State: AOJu0YyjuUtEWQ9LoGjc0nPoirzuqWxVhh3xQP04f6QNDmG7MsXseYTq
	DkGKxTVSb3+q3AN34j19qLx/Wo3ethaCzTk+penumPtVy3/ZOxE7
X-Google-Smtp-Source: 
 AGHT+IFQXiJjYzgQhwbnofWVANeBtgbuGWzLTcGQFaQNCs4mjjL1q369HZTUzjEqcwg8HucG/ozxpQ==
X-Received: by 2002:a05:651c:545:b0:2f0:1fd5:2f29 with SMTP id
 38308e7fff4ca-2f12edfef11mr114493221fa.19.1722439570019;
        Wed, 31 Jul 2024 08:26:10 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:28 +0200
Subject: [PATCH v3 4/8] ASoC: msm8916-wcd-analog: add pm8953 codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com>
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
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4M6CQRO7VKUZNQ5RPYADORQXES5OPYFE
X-Message-ID-Hash: 4M6CQRO7VKUZNQ5RPYADORQXES5OPYFE
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4M6CQRO7VKUZNQ5RPYADORQXES5OPYFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 

-- 
2.45.2

