Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F4459E34
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A1716D9;
	Tue, 23 Nov 2021 09:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A1716D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656516;
	bh=M5NS5qNIUh+63sbSD4imHq8SlNBwm2vPrZvIBG0Cars=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cCObxxB4U+zqR1qxs7GjcMe+63SMn2db66LGXImo0wAuT69gitRhb13j9k13x61D8
	 vzNAWzcARrOKDClUcuU+00G5LBLLKhusixJO5hpREkoBMensL3lgIi3/rAWgLoTl9G
	 qsbv6GweopU95m+/tR2iCHUHdjiU8bMHNkb+IkV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE69F804FC;
	Tue, 23 Nov 2021 09:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD056F8049E; Tue, 23 Nov 2021 03:43:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F6FF80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 03:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F6FF80087
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.b="NcAryMbf"
Received: by mail-pf1-x435.google.com with SMTP id z6so17891887pfe.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 18:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=SjomYuB3mIAoDTZTLD8mciVKT6P5jd4lu7zRg4g2c0U=;
 b=NcAryMbfNMlnzLFMptuGQjwoETrpRyp7wrlNtt0VE03uNXCKmk0JMS5ZHyec7L0D7g
 MGf9Wb9BYPqM/GTaqu3qixWcdHKQYK4l+iFcB0fDoSSmPq79pFaBwCyD3uqbbMX8KdJr
 BDTZn2mtXVCEHgBcs+KH2F/nWg4dNHvpCR5OEJBXdIcwd3Kug/Zi3ykoiAe5YwzPREBW
 cnefVTHzBqmITVq9TZ/RTWjdEOQwnCD/KBzHI0OPEP5HwLM291aPKMk8itdIc9zf0/Is
 4UB0nvHI/UNb5gsC67oox0p0JeQA/NRpoa1/2JKUzj0HnQpEWq53yrXAS3oi6J4nlUXq
 RAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SjomYuB3mIAoDTZTLD8mciVKT6P5jd4lu7zRg4g2c0U=;
 b=KeFGrcchNQ+kOTPZvKH/zWyqUnUoLYSpx/IgSFJu6v9BNUjVDtl9tbCcI2mJh7uJhW
 33aNq/S6AGeHssdxQiduv5E0Tdjbo8+RcHFT3QZviJzPXmslaKpMf97qvAchOUKLwEO5
 ZeDelaFDsQAC/HJfaS2GMqe3l1u8Bzmf1V/XvsrfXDU1stT1QM/+PQCiqwGZeGeQzTTW
 xpA/8ps0HgWaMNNlD/GbLFJLdWGo/6uO9VVFCeH98eT+DmxmmV557bxj2LD9BZ7K6yPs
 PlTMJxuJvuyPAMvKLBDwwiJL6X5tWubjeF3ftl+IzNk11BEKNWhuUO5+ggPRRoHP0XNm
 Vh1Q==
X-Gm-Message-State: AOAM5307cT1GEay23maxHgoY2uigiB16ZlUz8/oSgWtEKKwq8MLgANPf
 7LLwBdB0hryaRhb5KRnBkrBONQ==
X-Google-Smtp-Source: ABdhPJwtKTye1la96+6/qm4xdH8KimvoN04jghntv4ZyBBeShZImnpIt8kI3NV6oHCpQlTBw56aLCA==
X-Received: by 2002:aa7:9511:0:b0:49f:e35c:f6f1 with SMTP id
 b17-20020aa79511000000b0049fe35cf6f1mr1769722pfp.45.1637635420096; 
 Mon, 22 Nov 2021 18:43:40 -0800 (PST)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id j15sm10387380pfh.35.2021.11.22.18.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 18:43:39 -0800 (PST)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [PATCH] ASoC: qcom: Add support for ALC5682I-VS codec
Date: Tue, 23 Nov 2021 10:43:29 +0800
Message-Id: <20211123024329.21998-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, judyhsiao@google.com,
 linux-kernel@vger.kernel.org,
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

