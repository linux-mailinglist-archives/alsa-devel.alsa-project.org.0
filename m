Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A32944B08
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B7C3F27;
	Thu,  1 Aug 2024 14:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B7C3F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514353;
	bh=rmwwYOUTvCDddLDjHz/8Ej1d+CDtpGbxfwCt2PfUiuw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CpiVnC/CH2dVHadCX8QPu93zpz3PeXA4yx7NXu0JTjVPPZuLTJROsU+YlV4uxL5W9
	 7plAt9z1wCmme0pW18ZXSUYJoNZ/3joxxN7R6BsSwdSwIAbmVO3ueVV6TfErWnJCN5
	 a5PVAB7mEHxkkdXwfQfSnpVK2MwayA1UMqmATfuU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DADA5F805EC; Thu,  1 Aug 2024 14:11:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 073D0F805EE;
	Thu,  1 Aug 2024 14:11:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E262BF8057A; Wed, 31 Jul 2024 17:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED653F800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED653F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dSxnb6aQ
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42812945633so38785465e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439579; x=1723044379;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WuGgWX4JRf3ODe4Tn035HhTlH91E7fm9nkBF1QertU=;
        b=dSxnb6aQRcsfUXGqY8CxH4H0MdXGou4OE0KIi2ej+fDkz5Me/h1oS1rIWbY4H6o+b0
         KrCb8by5hKyyMskEsKUe6nUNE2cTMkgxUOjoRfdiSqlB6uM8vCPoNR4vAJQTripZXgxu
         p6UwSdG6QfWvLXJWfSYfzWGGIPiNWxlESFXhih1GaXM9Vn0VYyf5XwX76w3BSK0lSB0u
         8pcBVd8IAbOJ6V5IBrAsI4B3TBidIxDLSHIdsCWVLLFPspRab+BkDaKDBeJBZF88lLsm
         gL7I3UvXX2jAMWx2D3i7dpN/ebjx6gvPwQvLFFeCk5Hr0xLNLKPKCqMXfIbz8St2BDPJ
         fVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439579; x=1723044379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WuGgWX4JRf3ODe4Tn035HhTlH91E7fm9nkBF1QertU=;
        b=wUqS5oLtfP6QndOdRlo0XRGKks+6FXuk2NTkIQaUh1EY8PeQ1GqQhI2l+hU29dn9/7
         5c5HdxyOTyZ4F7v/7JVpJSM74/yAcWGXqUApy6XCNOBL3taM6pN9I3k6jofEEtZagtTN
         O82WN012X0Tm6LuC5zDXvh8S1X2Choa971lc9ONeXgsMh5xMP0FuUhZAUuJ4iCoTN8YF
         a+ZFFaphp5/55Lm8KGIdUWFfeyx9LAYvxvnmWJ8fypBnXeK24dmbf0Rb6LmKpBQsbMEe
         /PYmAi2ROZFZW20N0VgBXdgd7T/1CRBoXEfaj3kEHSl/EbQ71f1GSbyDrWDulOXkSjCF
         LSPg==
X-Gm-Message-State: AOJu0Yyc4oaFiEjlAXz2Ef0pjIvt8afq8RXy/Nacd+rUWG+6yhpAKx0f
	REHwHhF95r6oGkP1qpczef+vqLKTSwPHeAElyNH0iRHLe56DhwNS
X-Google-Smtp-Source: 
 AGHT+IGH0/A9VV9XmlFr+VqIo2r5LTMx1mKaXlbbJoBz7UKepQPkmCu2QIQblz8in7UpA4OPhwqRFg==
X-Received: by 2002:a05:600c:4fc8:b0:426:593c:935f with SMTP id
 5b1f17b1804b1-42811d6c45bmr96433365e9.1.1722439578523;
        Wed, 31 Jul 2024 08:26:18 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:18 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:32 +0200
Subject: [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
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
Message-ID-Hash: G4JXE7FDBJ72CT27FIHT6ACQQBC55MY2
X-Message-ID-Hash: G4JXE7FDBJ72CT27FIHT6ACQQBC55MY2
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4JXE7FDBJ72CT27FIHT6ACQQBC55MY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add descriptions and controls to toggle lineout output

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..38949556f7d9 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -233,6 +233,8 @@
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
 #define CDC_A_RX_EAR_STATUS		(0xf1A1)
+#define CDC_A_RX_LO_DAC_CTL		(0xf1AC)
+#define CDC_A_RX_LO_EN_CTL		(0xf1AD)
 
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
@@ -327,6 +329,8 @@ static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
 static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
 static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
 static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
+static const struct snd_kcontrol_new lineout_mux = SOC_DAPM_ENUM("LINEOUT",
+								 hph_enum);
 
 /* ADC2 MUX */
 static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
@@ -630,6 +634,46 @@ static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_lineout_dac(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol,
+					 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x20, 0x20);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x80, 0x80);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x08);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x40, 0x40);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x80, 0x80);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		usleep_range(20000, 20100);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x80, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x40, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x80, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x20, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static int pm8916_wcd_analog_enable_spk_pa(struct snd_soc_dapm_widget *w,
 					    struct snd_kcontrol *kcontrol,
 					    int event)
@@ -917,6 +961,13 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"SPK PA", NULL, "SPK DAC"},
 	{"SPK DAC", "Switch", "PDM_RX3"},
 
+	{"LINEOUT_OUT", NULL, "LINEOUT PA"},
+	{"LINEOUT PA", NULL, "RX_BIAS"},
+	{"LINEOUT PA", NULL, "SPKR_CLK"},
+	{"LINEOUT PA", NULL, "LINEOUT"},
+	{"LINEOUT", "Switch", "LINEOUT DAC"},
+	{"LINEOUT DAC", NULL, "PDM_RX3"},
+
 	{"MIC_BIAS1", NULL, "INT_LDO_H"},
 	{"MIC_BIAS2", NULL, "INT_LDO_H"},
 	{"MIC_BIAS1", NULL, "vdd-micbias"},
@@ -978,6 +1029,19 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DAC_REF", CDC_A_RX_COM_BIAS_DAC, 0, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
 
+	/* Lineout */
+	SND_SOC_DAPM_OUTPUT("LINEOUT_OUT"),
+
+	SND_SOC_DAPM_PGA_E("LINEOUT PA", CDC_A_RX_LO_EN_CTL,
+			   6, 0, NULL, 0, NULL, 0),
+
+	SND_SOC_DAPM_DAC_E("LINEOUT DAC", NULL, SND_SOC_NOPM, 0, 0,
+			   pm8916_wcd_analog_enable_lineout_dac,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("LINEOUT", SND_SOC_NOPM, 0, 0, &lineout_mux),
+
 	/* TX */
 	SND_SOC_DAPM_SUPPLY("MIC_BIAS1", CDC_A_MICB_1_EN, 7, 0,
 			    pm8916_wcd_analog_enable_micbias1,

-- 
2.45.2

