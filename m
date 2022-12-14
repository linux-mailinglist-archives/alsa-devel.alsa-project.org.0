Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5BE64C929
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 13:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F65E29FC;
	Wed, 14 Dec 2022 13:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F65E29FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671021591;
	bh=d4at/HI/YF852u+T4AVn4E4xQUTlAvyEpNN1i1/2zew=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LMx8rauaHCAWW+zXdtBKt9OeTm4PKzXLpPxLAsLikZfztWZ3cYddrKoyQXjvdcAtf
	 96iMEVWmrZ3aQ1Bu3O5uH9ndXJM1/Vk1BrqhlPEzzqi8FfM2Ij6nextC2ynNrjYAJ1
	 jDv83pMnMWgy9BU1zcPNNByNq7+JHvQHRrX/PGRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C80B5F80520;
	Wed, 14 Dec 2022 13:38:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A296DF80520; Wed, 14 Dec 2022 13:38:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99DA9F804D7
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 13:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99DA9F804D7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=geY+9KKL
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AE0DE85112;
 Wed, 14 Dec 2022 13:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671021486;
 bh=abd1MpTy2Dv7NXLZctEyPw0kePkmyEM/uEvzbgu2gpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=geY+9KKLM0h2RZND9Py7wjG0DwsT68/LnsKJmP7k4omOm3tmyCYT2S1mR2IuRFcRh
 3GhfNkhi82QkYov0fRY0Ic4RK6ohZLJHLKRlmFYKoT5mD4k9AoFu/ueH90kfnrBmYq
 mgpWoXBAJFn5gneZiNZErc38qnUJ8APyE/ltUMiX+GY1HOtWbMqLMFjNCuFRYJxSqI
 8nxFCcjgZzkWNy6rdwps9X/neVdSX6Tg4fd0Psywytstk6s132TtZMPXX4FIobcKB8
 logZoRTGWjcJVlWT6R1e3pmiYFOrLmNnb7wquV6vBw6hWgUOmY1LeFH1Mg91fww+01
 k67UudxYytTTg==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Stephen Kitt <steve@sk2.org>
Subject: [PATCH 2/4] ASoC: wm8940: Rewrite code to set proper clocks
Date: Wed, 14 Dec 2022 13:37:41 +0100
Message-Id: <20221214123743.3713843-3-lukma@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221214123743.3713843-1-lukma@denx.de>
References: <20221214123743.3713843-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Without this change, the wm8940 driver is not working when
set_sysclk callback (wm8940_set_dai_sysclk) is called with
frequency not listed in the switch clause.

This change adjusts this driver to allow non-standard frequency
set (just after the boot) being adjusted afterwards by the sound
system core code.

Moreover, support for internal wm8940's PLL is provided, so it
can generate clocks when HOST system is not able to do it.

Code in this commit is based on previous change done for wm8974
(SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99).

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 sound/soc/codecs/wm8940.c | 103 ++++++++++++++++++++++++++++++--------
 1 file changed, 83 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 0b59020d747f..094e74905df9 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -37,7 +37,9 @@
 #include "wm8940.h"
 
 struct wm8940_priv {
-	unsigned int sysclk;
+	unsigned int mclk;
+	unsigned int fs;
+
 	struct regmap *regmap;
 };
 
@@ -387,17 +389,24 @@ static int wm8940_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static int wm8940_update_clocks(struct snd_soc_dai *dai);
 static int wm8940_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wm8940_priv *priv = snd_soc_component_get_drvdata(component);
 	u16 iface = snd_soc_component_read(component, WM8940_IFACE) & 0xFD9F;
 	u16 addcntrl = snd_soc_component_read(component, WM8940_ADDCNTRL) & 0xFFF1;
 	u16 companding =  snd_soc_component_read(component,
 						WM8940_COMPANDINGCTL) & 0xFFDF;
 	int ret;
 
+	priv->fs = params_rate(params);
+	ret = wm8940_update_clocks(dai);
+	if (ret)
+		return ret;
+
 	/* LoutR control */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE
 	    && params_channels(params) == 2)
@@ -496,7 +505,6 @@ static int wm8940_set_bias_level(struct snd_soc_component *component,
 				return ret;
 			}
 		}
-
 		/* ensure bufioen and biasen */
 		pwr_reg |= (1 << 2) | (1 << 3);
 		/* set vmid to 300k for standby */
@@ -611,24 +619,6 @@ static int wm8940_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return 0;
 }
 
-static int wm8940_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-				 int clk_id, unsigned int freq, int dir)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	struct wm8940_priv *wm8940 = snd_soc_component_get_drvdata(component);
-
-	switch (freq) {
-	case 11289600:
-	case 12000000:
-	case 12288000:
-	case 16934400:
-	case 18432000:
-		wm8940->sysclk = freq;
-		return 0;
-	}
-	return -EINVAL;
-}
-
 static int wm8940_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 				 int div_id, int div)
 {
@@ -653,6 +643,79 @@ static int wm8940_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	return ret;
 }
 
+static unsigned int wm8940_get_mclkdiv(unsigned int f_in, unsigned int f_out,
+				       int *mclkdiv)
+{
+	unsigned int ratio = 2 * f_in / f_out;
+
+	if (ratio <= 2) {
+		*mclkdiv = WM8940_MCLKDIV_1;
+		ratio = 2;
+	} else if (ratio == 3) {
+		*mclkdiv = WM8940_MCLKDIV_1_5;
+	} else if (ratio == 4) {
+		*mclkdiv = WM8940_MCLKDIV_2;
+	} else if (ratio <= 6) {
+		*mclkdiv = WM8940_MCLKDIV_3;
+		ratio = 6;
+	} else if (ratio <= 8) {
+		*mclkdiv = WM8940_MCLKDIV_4;
+		ratio = 8;
+	} else if (ratio <= 12) {
+		*mclkdiv = WM8940_MCLKDIV_6;
+		ratio = 12;
+	} else if (ratio <= 16) {
+		*mclkdiv = WM8940_MCLKDIV_8;
+		ratio = 16;
+	} else {
+		*mclkdiv = WM8940_MCLKDIV_12;
+		ratio = 24;
+	}
+
+	return f_out * ratio / 2;
+}
+
+static int wm8940_update_clocks(struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct wm8940_priv *priv = snd_soc_component_get_drvdata(codec);
+	unsigned int fs256;
+	unsigned int fpll = 0;
+	unsigned int f;
+	int mclkdiv;
+
+	if (!priv->mclk || !priv->fs)
+		return 0;
+
+	fs256 = 256 * priv->fs;
+
+	f = wm8940_get_mclkdiv(priv->mclk, fs256, &mclkdiv);
+	if (f != priv->mclk) {
+		/* The PLL performs best around 90MHz */
+		fpll = wm8940_get_mclkdiv(22500000, fs256, &mclkdiv);
+	}
+
+	wm8940_set_dai_pll(dai, 0, 0, priv->mclk, fpll);
+	wm8940_set_dai_clkdiv(dai, WM8940_MCLKDIV, mclkdiv);
+
+	return 0;
+}
+
+static int wm8940_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+				 unsigned int freq, int dir)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct wm8940_priv *priv = snd_soc_component_get_drvdata(codec);
+
+	if (dir != SND_SOC_CLOCK_IN)
+		return -EINVAL;
+
+	priv->mclk = freq;
+
+	return wm8940_update_clocks(dai);
+}
+
+
 #define WM8940_RATES SNDRV_PCM_RATE_8000_48000
 
 #define WM8940_FORMATS (SNDRV_PCM_FMTBIT_S8 |				\
-- 
2.20.1

