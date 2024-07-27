Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E397E94299B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 058262BC6;
	Wed, 31 Jul 2024 10:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 058262BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415892;
	bh=EFy7tExuqG9na7Q+Y80CJaISj3tjIZbe4+zf3f1TTaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hEwOw9T6cTrQZn3fjNNu86QK1WTFCU/U2+7joqkjnvINsxNSVB6IfnTSmHzmhT9tT
	 qu8azvWrv1JcfZy4WjfaKaFTDX8tqs7AOin81+hxHFe6exaB6NSUGst1k5JdNhnKd/
	 +DqtMQ7vqtQHt6gyJaJ/nbaWc3bOCZyqNjeIt7JI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 152A9F805D7; Wed, 31 Jul 2024 10:49:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5632F80694;
	Wed, 31 Jul 2024 10:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6927FF8026D; Sat, 27 Jul 2024 20:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45E12F801F5
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 20:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E12F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ar1n7SzY
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f035ae0fd1so26359571fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104452; x=1722709252;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=Ar1n7SzY/FlNFd7vyowz9lJFFj/8F2gLk3wmuXyw/m763uRjL2K/506rYEZsZiwTTI
         E5P1Apr4cpmFzES5uJvjDcCtAvVGhxTicGfZXYE6D15YF/0AFPZ0lOY+4Z9ERKnz6VEJ
         VKMFp4Hi5TSrHkOzwjA/99GkU5zwzFwiVq3rwTnJJNgG8cKvLPYFdlxAoRqm0uob2WGM
         D1qj6b40OdORlsPpzYmMqm6jYgPkwa2QytyggviptSae5UjYlfLAvEoi15MI1Th50BqM
         rN+slxuhvKOhOUKvQ1L1SN4/mLjqUhKOxhA7ruAMe1cflsJRILZe2TYsywB2EKulgQEX
         TbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104452; x=1722709252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=Cru0iJV2hvl2tyADV64DSSwUQV8VG6RIoE8SXk6PVfMuxEc6Y8HeNlnRwjDHXFu91D
         pN6Y8Am3nWaMHCpUzHUC/Z+PiJeY2Mr/p3iKRJRBLD0Jq41GfmHC71HuO7T5KizPqw5j
         1pokO8soQfRc/vUZsgXLapPGupJZdyQyO20Zcsr46g8g8Y6gCQJyvauVNYh8xXloovtx
         PjDpEvmtRekOxWIHU51Hx3fXKj/hrH9McrZ6flCq8HJMpHNUkzc5+0DTa/ojhKaEGEtD
         6AaNPA91PrvkJLji5Db1Lxw6s80opXd8jyH8as0ZPwU0E2BAIxeUmcPYDQF0txZHbMME
         umBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx8VwuOoqpILU3O6HMqeXowuf3ynh4lv/Im49rFqEa9wwuum6zOoBBZ2DFQuLgJweyq68P76jbuIoGepCajjb77YgbDcSOCP3zYMY=
X-Gm-Message-State: AOJu0Yyz7MQJVyVB9tdTbXKOAcrYcudL0W8iDhUaMKAbIyDehxovYBuo
	MpwPSoY/uUqX4uMnsGOubTJ2dfySaXgPJSYQihE9Tx8I8I3YeCA6
X-Google-Smtp-Source: 
 AGHT+IEm/COoGFbHv82FK7uvxWXcLwKhJWA1hhbjMFP9GYJUO820ubZBT+LuGLrHoMr/gFZyfg3itg==
X-Received: by 2002:a2e:3a19:0:b0:2ee:4c2e:3d3b with SMTP id
 38308e7fff4ca-2f12ee02fa2mr19973671fa.4.1722104451431;
        Sat, 27 Jul 2024 11:20:51 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl.
 [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:50 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2
 support
Date: Sat, 27 Jul 2024 20:20:25 +0200
Message-ID: <20240727182031.35069-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ORPBNGCNQZKWG2SUUTFZK6IUWFUZ3RRN
X-Message-ID-Hash: ORPBNGCNQZKWG2SUUTFZK6IUWFUZ3RRN
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORPBNGCNQZKWG2SUUTFZK6IUWFUZ3RRN/>
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

