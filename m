Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C88506480
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 08:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5015C16F3;
	Tue, 19 Apr 2022 08:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5015C16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650349910;
	bh=hVmsiYX30awqKUFal02yrA9ucf+MA/i6MC197IGxQ0w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PnqNQWK1LZ8meP6/3kjuhgR3FAjhglkjri7HF7yidP9KLvE2Se2HEQU+3ArW/T4ja
	 n2gyYzlgtX7W/w/ADkh9oblFC3gzuEezyWu3MGxdqA8CR3efMzOEYe8+T8N6869x08
	 AFsgc9xbLg52XnaEdy7rGmWtRpCkSBgXIZkTXyEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E48E9F8025D;
	Tue, 19 Apr 2022 08:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C036F8025D; Tue, 19 Apr 2022 08:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF995F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 08:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF995F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RWkdh0fW"
Received: by mail-pg1-x534.google.com with SMTP id k14so23140583pga.0
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 23:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGmYqg606kAg3pvf8xUnL9K7oIiJlnNVadVtLgVbgco=;
 b=RWkdh0fWRj03OC2HBnrauhCncJUjSGJ0AeHUpDr5r/cb7UVOAeXm8EQztSLv93EFEL
 D00g3C3lKxXGUGhNdXhnatXICWxg7LPef+A6Cx/445cmyUV/U40i9vfzpDbbbhTxVuby
 tJ/TZ618PcIYJVvFBrQcn/KAAAqZbf4iXF99U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGmYqg606kAg3pvf8xUnL9K7oIiJlnNVadVtLgVbgco=;
 b=3k+ajztP9NsLyyYckCNWzW0oXNxI8mVJSjvQysEEaHGygum9qc3FRzj1hzLVeVBISw
 05oofbNciWRHjPLaEea0s0gD4g8QC81bYlJ2UaAFIzNloCsuHysP6QfvBpv2iJUxguad
 Im98aivG1dho6S+orX8TPGjH7h62Ex0Tl8BRRuqxwCMjtBtqHlHl/t/5/13vn7Z0XQ9P
 heuX1DZJ5gfw/oYJN6paRuNijsPgtxtB8+elgSCJPBqEozxoiTV/+TnfIAngcRLuSXkC
 RzrwaJ0wcaVWATmsh2eC0jS1T61qKJMPGfUQ8FMMTD+Zd8ZUZsLJ3p34Vdd3XTz5N+xt
 zznQ==
X-Gm-Message-State: AOAM531q7bZ+2lB1DroM1VbNegCfgQdlbVMpfrJvhL+uC/h8B6MXC4rl
 mR9JddcG3XEp/720DNXoDeZa0w==
X-Google-Smtp-Source: ABdhPJy7pNWUWctP7Lv46n/YF3SODEnZqNA23wE38kIGlBCogjWCsgKW/AUcTAlCjeXacJM37KLXkw==
X-Received: by 2002:a05:6a00:2392:b0:4fa:dcd2:5bc1 with SMTP id
 f18-20020a056a00239200b004fadcd25bc1mr16242411pfc.8.1650349836670; 
 Mon, 18 Apr 2022 23:30:36 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:17:ff0b:b586:d329:c4f4])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a17090a394e00b001c670d67b8esm15037041pjf.32.2022.04.18.23.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 23:30:36 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
Date: Tue, 19 Apr 2022 14:29:52 +0800
Message-Id: <20220419062952.356017-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>, yuhsuan@chromium.org
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

Both MCLK and BCLK can be the clock source of sysclk via PLL
according to its datasheet.
This patch sets MCLK as the clock source as we use MCLK in the
previous projects.

Fixes: c5198db82d4c ("ASoC: qcom: Add driver support for ALC5682I-VS")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7280.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 4ef4034ba6ee..dfcb7ed44331 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -21,7 +21,7 @@
 #include "lpass.h"
 
 #define DEFAULT_MCLK_RATE              19200000
-#define RT5682_PLL1_FREQ (48000 * 512)
+#define RT5682_PLL_FREQ (48000 * 512)
 
 struct sc7280_snd_data {
 	struct snd_soc_card card;
@@ -137,15 +137,15 @@ static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 				SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_I2S);
 
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
-					1536000, RT5682_PLL1_FREQ);
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL2, RT5682S_PLL_S_MCLK,
+					DEFAULT_MCLK_RATE, RT5682_PLL_FREQ);
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
-					RT5682_PLL1_FREQ,
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL2,
+					RT5682_PLL_FREQ,
 					SND_SOC_CLOCK_IN);
 
 	if (ret) {
-- 
2.36.0.rc0.470.gd361397f0d-goog

