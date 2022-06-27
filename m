Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7855BA89
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EA416A9;
	Mon, 27 Jun 2022 16:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EA416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656340569;
	bh=aNArNio5+VHq853bPOk+qa+emi60afc9C5YSGC7PYTg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLAkG45oEBr1PsGmRSqkIebkCU2JafPpdP+IFYZSJaLEQ/VvehfpoNqRU3DnqNuen
	 PfL4BCQrMcTpZazYzlX4NekbSOvMIWjbW3q24YsSjLhTRRJAL13aH+zU9ds4FO8lrd
	 qvFoS9ztp2JII3Y6iXCz7a8f9/B6UrYI3gcq0vqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F15A0F804FC;
	Mon, 27 Jun 2022 16:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F16F8028D; Mon, 27 Jun 2022 16:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9DEEF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9DEEF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AJIzkWdz"
Received: by mail-wr1-x42d.google.com with SMTP id q9so13353520wrd.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xB8UF+1tDPAXFYTIVsS3DO5NWz4Ya+4+jwXr4K8uGY4=;
 b=AJIzkWdzmwXuWsgoUh3V1S5FPxgkiqaYzCMmPzq9XHPYalj6+qW1saZG+4HGJvDpq5
 HQ/HgHzM3wZHOha2ru5LyYryCnTjySxFhBKaajcE4rUiwrXLapHvNI77u2cHDrW0/IUZ
 BQR4/vIpZ9Aq+c/cHH2bAmAy2/C4keJKdsu3ISRg6kkr7MyAgl+VIAlYIM+v+Na7f6HL
 RWTjq3f/mwZSNu0abZ/OjlPU1D9D+vTh03SpjxTWxhuwuRYVisIp6uZEwL2l/hLj67ce
 2drkMNUGf5DZWYarBPLirlKWQBoGI8dsW6t4XnumEE6thSCclo6GBQIzBQky8cOwIyWE
 6DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xB8UF+1tDPAXFYTIVsS3DO5NWz4Ya+4+jwXr4K8uGY4=;
 b=adAC2IUiIfOUcLA41wF2X+CE9JLdmiJfETNfU9jbhEpo0R+wIsp94esH/NiO0fgNzs
 MobRS3vSHiyuosCI2tclf3aUo+05A1QEwpDq9+KI98KUkraqXM1Gk2hI9lypIHaSnhSO
 XcUDbwPBl2VDHLgGqUqjivf1XnDQ1iV5nmK4TzlwXb+xrUe5HulDVcxOE0SIFK6OoBI/
 w28Sf1v3LEKG0LcY5AYdHgEVwztEjSRV3yVZk9wfeBN3o0f5bKG7uBIkXHjpti5DMY03
 fp+Ay/6pMxze0mhaZLHRc75zgm4YW5KaNG0lyMZ7Fj1MpFu66JJ0iHCV7vBQy8mKq6V/
 rCLw==
X-Gm-Message-State: AJIora9919KmfjXfLrdQFkJiB8H2ZntsbPC2wQKJgSeErpen1kFz2V/0
 oxW+NwxnKhxBoB97qzMnTPBICw==
X-Google-Smtp-Source: AGRyM1tdNzfJe35MBV2efHUhsb8vXnQsyopl2HbpGBgoVC7JyGAAsXWe4v9sCz1BfXZPfaDNT+3wiQ==
X-Received: by 2002:a05:6000:1865:b0:21b:a408:b474 with SMTP id
 d5-20020a056000186500b0021ba408b474mr12677672wri.674.1656340474592; 
 Mon, 27 Jun 2022 07:34:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b0021a39f5ba3bsm10662853wrw.7.2022.06.27.07.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:34:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: samsung: Enable compile test
Date: Mon, 27 Jun 2022 16:34:12 +0200
Message-Id: <20220627143412.477226-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627143412.477226-1-krzysztof.kozlowski@linaro.org>
References: <20220627143412.477226-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Allow compile testing of Samsung SoC Sound drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/Kconfig | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index a2221ebb1b6a..2a61e620cd3b 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -33,7 +33,8 @@ config SND_SAMSUNG_I2S
 
 config SND_SOC_SAMSUNG_NEO1973_WM8753
 	tristate "Audio support for Openmoko Neo1973 Smartphones (GTA02)"
-	depends on MACH_NEO1973_GTA02
+	depends on MACH_NEO1973_GTA02 || COMPILE_TEST
+	depends on SND_SOC_I2C_AND_SPI
 	select SND_S3C24XX_I2S
 	select SND_SOC_WM8753
 	select SND_SOC_BT_SCO
@@ -43,7 +44,8 @@ config SND_SOC_SAMSUNG_NEO1973_WM8753
 
 config SND_SOC_SAMSUNG_JIVE_WM8750
 	tristate "SoC I2S Audio support for Jive"
-	depends on MACH_JIVE && I2C
+	depends on MACH_JIVE && I2C || COMPILE_TEST && ARM
+	depends on SND_SOC_I2C_AND_SPI
 	select SND_SOC_WM8750
 	select SND_S3C2412_SOC_I2S
 	help
@@ -69,7 +71,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
 
 config SND_SOC_SAMSUNG_S3C24XX_UDA134X
 	tristate "SoC I2S Audio support UDA134X wired to a S3C24XX"
-	depends on ARCH_S3C24XX
+	depends on ARCH_S3C24XX || COMPILE_TEST
 	select SND_S3C24XX_I2S
 	select SND_SOC_L3
 	select SND_SOC_UDA134X
@@ -81,21 +83,24 @@ config SND_SOC_SAMSUNG_SIMTEC
 
 config SND_SOC_SAMSUNG_SIMTEC_TLV320AIC23
 	tristate "SoC I2S Audio support for TLV320AIC23 on Simtec boards"
-	depends on ARCH_S3C24XX && I2C
+	depends on ARCH_S3C24XX || COMPILE_TEST
+	depends on I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_TLV320AIC23_I2C
 	select SND_SOC_SAMSUNG_SIMTEC
 
 config SND_SOC_SAMSUNG_SIMTEC_HERMES
 	tristate "SoC I2S Audio support for Simtec Hermes board"
-	depends on ARCH_S3C24XX && I2C
+	depends on ARCH_S3C24XX || COMPILE_TEST
+	depends on I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_TLV320AIC3X
 	select SND_SOC_SAMSUNG_SIMTEC
 
 config SND_SOC_SAMSUNG_H1940_UDA1380
 	tristate "Audio support for the HP iPAQ H1940"
-	depends on ARCH_H1940 && I2C
+	depends on ARCH_H1940 || COMPILE_TEST
+	depends on I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_UDA1380
 	help
@@ -103,7 +108,8 @@ config SND_SOC_SAMSUNG_H1940_UDA1380
 
 config SND_SOC_SAMSUNG_RX1950_UDA1380
 	tristate "Audio support for the HP iPAQ RX1950"
-	depends on MACH_RX1950 && I2C
+	depends on MACH_RX1950 || COMPILE_TEST
+	depends on I2C
 	select SND_S3C24XX_I2S
 	select SND_SOC_UDA1380
 	help
-- 
2.34.1

