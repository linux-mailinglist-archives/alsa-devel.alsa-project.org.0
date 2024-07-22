Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A461B938FA0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:04:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 516F414E3;
	Mon, 22 Jul 2024 15:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 516F414E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653453;
	bh=EFy7tExuqG9na7Q+Y80CJaISj3tjIZbe4+zf3f1TTaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PPF8PEiy3k1hgnj1Cxy6bxqVou0h+aQoSpygI43IYfFKIbnEcVWVdDUxcmW0QZwrC
	 VhJ0bJ74Bkc37drIBxeN0gByTScCsuo9E0CBoR91LcAqY5gb6G9rdxO3T0Ix/+3Cms
	 EwJbnJh8TKu5r0M4fKhP4SBl2Hh+Z0zQmcFfwdaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 263D4F8083F; Mon, 22 Jul 2024 15:01:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62500F8080C;
	Mon, 22 Jul 2024 15:01:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5A2F8058C; Mon, 22 Jul 2024 11:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75B9EF8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B9EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hTkpwgWe
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efd855adbso1983374e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641938; x=1722246738;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=hTkpwgWeDCag1p5fFusFZHqpJ5+YNF3/+MVlhwwAT3vflkEcatuqJtWpFMjUWFP2RM
         y391mtSqVUo17i5v4JrI3ASkQvFPoErzVurH+LVe/Pb/FBwTod5+CWJ2e0K+CC9eSYSK
         dmZlibfirE1UIH+VqiJI8OwVGvkIdGaWetvGpkSDSkf0b/11kwxxXNwjD9FuYhwRTDg8
         BJM35Nln3u0Ul4E64McHUW4QTPaX37QtgM0YsISVxMLOY3DJRcJdjKx1VbTgZPy4G5Ke
         Rdlx8NOKwOT2npb2XX1Ha9w/oIeds2LKEzfsyKAI7tV7+B1HO+QVJgObVS+DVwyrZQau
         OESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641938; x=1722246738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=Lx2l1xSxqSFw4C89U1B3Q5q1i1r0k5LtpTn3vzXAYDz1w+la2GbE3UbRBLbkG8nJHz
         +CLzDnAxti1p6C/j2LmLWNyCqycI9tLkG7f3HK7cYLHhYT1+gCL1jHcmQio2hpdND+s6
         iymA5uiN+RPMqSfG9VY/kxyXPY22qYC6H0DEvu4pG19xF+JmM0V6rKDdX63+AkVA65/p
         WYFt1BaiYE8ATZqb1mT2EOkWAaAywOilC7gWppUDRoP2TPqFOwzpKtVSHD91EzI7BhDf
         Irtr6kVPHgM+gr4Ic+AM/DXEbkXL/R0lGBKxAwzVgifX4UW8gX3yf1NY9FyV4trFInPg
         dx4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCbOY/I04BGkHQ2WFte4dQvaYndz8oYljEZbhECa1zKmD6ssPOhmn11dwadTJhthTC5K2ERmORosq+jBMydHkqVAFlZTLjn2HdgiA=
X-Gm-Message-State: AOJu0YzRhA8wap4CT/4V8DSc7bG7/2IZmtmZ2FGOEmy4sm1KjClIdWwb
	/DwWm2y4KQbZ9ecZB77Y2GR3MwOaTOc4MioCMv9n0nVImOTlXL0/
X-Google-Smtp-Source: 
 AGHT+IGMjXFxraEsXHIkxYNkndbJxB9/sBbeVo4mr3BgdM9QyhZYaPDjmM+IUr8WAtpuoBhZAJ6eTg==
X-Received: by 2002:a05:6512:1327:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-52efb7bf318mr4451648e87.40.1721641938089;
        Mon, 22 Jul 2024 02:52:18 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl.
 [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:17 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
Date: Mon, 22 Jul 2024 11:51:06 +0200
Message-ID: <20240722095147.3372-3-a39.skl@gmail.com>
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
Message-ID-Hash: QPEZSAYH7RUA4TJDCCQG655TBZR2RHTU
X-Message-ID-Hash: QPEZSAYH7RUA4TJDCCQG655TBZR2RHTU
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPEZSAYH7RUA4TJDCCQG655TBZR2RHTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for Cajon(PM8952) and Cajon v2(PM8953) codecs.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add Cajon support,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 +++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..daf65f5d4e99 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -250,6 +250,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,12 +265,15 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
 #define CDC_A_PERPH_RESET_CTL3		(0xf1DA)
 #define CDC_A_PERPH_RESET_CTL4		(0xf1DB)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define MSM8916_WCD_ANALOG_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000)
 #define MSM8916_WCD_ANALOG_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
@@ -715,6 +719,50 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct reg_default wcd_reg_defaults_cajon[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct reg_default wcd_reg_defaults_cajon_2_0[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0xA2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -738,9 +786,18 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	if (priv->codec_version == 4)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon_2_0[reg].reg,
+					wcd_reg_defaults_cajon_2_0[reg].def);
+	else if (priv->codec_version == 3)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon[reg].reg,
+					wcd_reg_defaults_cajon[reg].def);
+	else
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
+					wcd_reg_defaults_2_0[reg].def);
 
 	priv->component = component;
 
-- 
2.45.2

