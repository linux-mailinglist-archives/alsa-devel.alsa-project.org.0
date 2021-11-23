Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A1459E33
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:34:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874B816BD;
	Tue, 23 Nov 2021 09:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874B816BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656496;
	bh=M5NS5qNIUh+63sbSD4imHq8SlNBwm2vPrZvIBG0Cars=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zajf3Esx1h2LA1BWzJPH9UDIpoJ0f2zkfekU9e8brpnov8Q5i39w/pgW3GGB5zTUs
	 Mr+Xb33fzJya+Js/SXNhSEUZLgYjdhPKH5bTh7D2NACNsyl/02lX8GCg46hyNSdvJw
	 FBvhyly86Lg80iQnZElvW5zB1iJo9D+RZpEEbyqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC8CF80602;
	Tue, 23 Nov 2021 09:22:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67E24F804AB; Tue, 23 Nov 2021 03:31:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBCD5F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 03:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCD5F800E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.b="hUP5zzcu"
Received: by mail-pj1-x102a.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so1574812pjb.1
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 18:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=SjomYuB3mIAoDTZTLD8mciVKT6P5jd4lu7zRg4g2c0U=;
 b=hUP5zzcu//8p8k+qE4WlnWahTuqbbCvHLQ9fnky+e4uVeBF0XqPnWlMBZZs3WqSINz
 WkhLiQI3BLakJcSvrF8GLKKS8M1xl2c2MVW8r9NjyFFUy6pZmtx5WfUEVNSJwwTOAZT4
 PLBd2zsfN6AZaxBJWXz1TPnTGXL0KwvevH8tH/fsL1p+l7vUfxGaS2JMP3gXdSncEKZi
 wiXpEr837+09E8/JSoJ/Z62rw+Vq5Y9tVYoCihJKfN7WcM5pa8HluV7cmI3kU8Z9a4H1
 BppziX6KqeeDBa46miBZPIaxYjcU+1hAPvNA25NdeL36w02Vvdj1ikYoLC4LYNBlZ8O4
 Arog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SjomYuB3mIAoDTZTLD8mciVKT6P5jd4lu7zRg4g2c0U=;
 b=aYKdkcWwK54LhNTDFrMR1IXFic5Gw4Rs/jASjXH8dvwFn4qHIUmDX1zWoU/pqzHaW3
 /HDhRjUvKLNVMBUFxst1/VWDosW13dQaJoHRDcbbQhuHrHqFdKOodFj/VHrfEKO0q7ac
 Uv4MjlKVEiBCMJ37FI9VUBv4wvz5NU27kx+t8K74Vq6XDwhineaRPnOrLrSxITwO5boX
 zywAoyqQJxZ8RQb2dNnXgkdDBOzeoJ5aaAyakaYm64h0+Gk/gMCaAJ4FzTmrWl947Tb3
 dWpb6F97/Mi7sD/NA/2fxViCa6pVLESnhqVd0ru+Vu8f+j8b9vsdHvNasc6wEUm2gJUR
 N4Bg==
X-Gm-Message-State: AOAM532IqzxtsU0a1cpMkMfRU2mMRGRa31NFo4xf4yR+KigupEEtBWN9
 Ylc/JdNrwyIBLSsSGTHjhc8Sgg==
X-Google-Smtp-Source: ABdhPJwsYwE1E8I84MR8vDMI0LgKBmDRgpGRGLngbGFYLHHpoYyiGhYY6KHmfdeSBDtMw0b0pM6+JQ==
X-Received: by 2002:a17:903:41cb:b0:142:62a:4d86 with SMTP id
 u11-20020a17090341cb00b00142062a4d86mr2526195ple.43.1637634700096; 
 Mon, 22 Nov 2021 18:31:40 -0800 (PST)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id g21sm10912147pfc.95.2021.11.22.18.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 18:31:38 -0800 (PST)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [PATCH] ASoC: qcom: Add support for ALC5682I-VS codec
Date: Tue, 23 Nov 2021 10:31:14 +0800
Message-Id: <20211123023114.20514-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, judyhsiao@google.com,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>,
 albertchen@realtek.com, derek.fang@realtek.com
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

Qcom machine driver adds rt5682s support in this patch.
Card name can be specified from dts by model property, and driver makes
use of the name to distinguish which headset codec is on the board.

Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 sound/soc/qcom/Kconfig  |  1 +
 sound/soc/qcom/sc7180.c | 24 +++++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index b2173847dc47..cf3e151bb635 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -169,6 +169,7 @@ config SND_SOC_SC7180
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_ADAU7002
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 768566bb57a5..2fff764a00a7 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -17,6 +17,7 @@
 #include <uapi/linux/input-event-codes.h>
 
 #include "../codecs/rt5682.h"
+#include "../codecs/rt5682s.h"
 #include "common.h"
 #include "lpass.h"
 
@@ -128,7 +129,21 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int ret;
+	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
+
+	if (!(strcmp(card->name, "sc7180-rt5682-max98357a-1mic"))) {
+		pll_source = RT5682_PLL1_S_MCLK;
+		pll_id = 0;
+		clk_id = RT5682_SCLK_S_PLL1;
+		pll_out = RT5682_PLL1_FREQ;
+		pll_in = DEFAULT_MCLK_RATE;
+	} else if (!(strcmp(card->name, "sc7180-rt5682s-max98357a-1mic"))) {
+		pll_source = RT5682S_PLL_S_MCLK;
+		pll_id = RT5682S_PLL2;
+		clk_id = RT5682S_SCLK_S_PLL2;
+		pll_out = RT5682_PLL1_FREQ;
+		pll_in = DEFAULT_MCLK_RATE;
+	}
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -145,16 +160,15 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 				    SND_SOC_DAIFMT_I2S);
 
 		/* Configure PLL1 for codec */
-		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
-					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
+		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source,
+					  pll_in, pll_out);
 		if (ret) {
 			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
 			return ret;
 		}
 
 		/* Configure sysclk for codec */
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
-					     RT5682_PLL1_FREQ,
+		ret = snd_soc_dai_set_sysclk(codec_dai, clk_id, pll_out,
 					     SND_SOC_CLOCK_IN);
 		if (ret)
 			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
-- 
2.17.1

