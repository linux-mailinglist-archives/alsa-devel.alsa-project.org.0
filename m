Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B123D944E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 19:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3F6B1F99;
	Wed, 28 Jul 2021 19:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3F6B1F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627493250;
	bh=m/mdjhga+UZQ2T4EV5JWPI6QguTKbhGj8EhZo7lPp5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cQQRTbOe0YZ98HAQY1H+WNjqyTpLrBe1f2JJRIi7/q+h5O2H1T8Jb2rjQoP7M5mt8
	 9uVoQc4LH+fzyqmjFyGwAbaY4ZWT4GBiFcJxFzKx4INSUtg0bGMqXFqbIBINwMe65M
	 VBVUh3/IDkPImLCIgaHCLwVvZ+MG9si7Ts8b57y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD13F80212;
	Wed, 28 Jul 2021 19:26:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36FB3F8025A; Wed, 28 Jul 2021 19:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80183F8020D
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 19:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80183F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WWj/mDct"
Received: by mail-lj1-x234.google.com with SMTP id a7so3947030ljq.11
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p27TKDYYHFYhqzphe1Tkc5vZ8HgmZG7DuroJKQvx2Sk=;
 b=WWj/mDctJd0LpDmEI37j9jLpw6K4K1KbxlqbiEIUddGBG3xkRVf1C+tV6dUf4WWRSr
 VJi0DBlFdu2SJfYzD1ksSUAhoYx3PCYc74k5DkjZEs631HteGfoI+v2tS548JkmuZy/D
 X+1lvGD8/v5s4G1AR1UxzcCbI0vPoVn83L6w0P7Wza/pY/LT4ikvuZSsRUjdQ3373GjZ
 YCWt+1RZ4v40k+5n0psTFV8Np2qwpEbN3wPdEvLYjfnD8t8kdpdCDg5Vg91rUfSx0IKV
 js9DFL7PvV/2t3aoAA/ZXRJoT2F12PJJPWAdkkdq+K3aQiyF9grX9B64vBdJW5EF0wuE
 Wddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p27TKDYYHFYhqzphe1Tkc5vZ8HgmZG7DuroJKQvx2Sk=;
 b=SzKZG+qV5LVac3+cn9K/8wBmuLHZwCFNP1wZDOjNcE+TmzaPYMZcZnoEMdC5SE3li1
 4cbFiJ+GKVsr9/ipv6TJ6YejoSune7uATzStWx/XQK1AYC0Pf8DT/auMIiCyE9FwAOp2
 zc6tKeKyx3jh/Wgb6GDiiUMWRkr1QlqG2kQXscbuzjGJAuGy//lc7q1jLyi2NsjUpmOc
 QFx0ypON1HJ0e5orDKD6/9e4E8jzprlvB747D8ZOA1bsG+6/N3emverjQveOrytB2sH3
 ap8LgNejow3G62wu1M/rE4TZrJXEqK5Vibgtj69k9Is70y/h9LV5edbZQBZLdGRghhal
 L37w==
X-Gm-Message-State: AOAM531+XBNncL3iOuY40NPcijlFIRKzDKyaiyQ+LrEMvNhJBXWYyUwe
 Ag/d/O4tRHOQze0J4+g/200=
X-Google-Smtp-Source: ABdhPJwk6hc8tfxVgzbhLBEds+OOA+ylsWUJ6Hpwt7z/ofZyVmY0/X3MdFSq2Ltpe5M+UiHNIh04oQ==
X-Received: by 2002:a2e:9794:: with SMTP id y20mr477915lji.417.1627493155518; 
 Wed, 28 Jul 2021 10:25:55 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id p28sm55974lfo.117.2021.07.28.10.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 10:25:55 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: samsung: Constify static snd_soc_ops
Date: Wed, 28 Jul 2021 19:25:48 +0200
Message-Id: <20210728172548.234943-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
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

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/samsung/aries_wm8994.c   | 2 +-
 sound/soc/samsung/arndale.c        | 4 ++--
 sound/soc/samsung/h1940_uda1380.c  | 2 +-
 sound/soc/samsung/littlemill.c     | 2 +-
 sound/soc/samsung/midas_wm1811.c   | 2 +-
 sound/soc/samsung/neo1973_wm8753.c | 4 ++--
 sound/soc/samsung/rx1950_uda1380.c | 2 +-
 sound/soc/samsung/smartq_wm8987.c  | 2 +-
 sound/soc/samsung/smdk_wm8580.c    | 2 +-
 sound/soc/samsung/smdk_wm8994.c    | 2 +-
 sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
 sound/soc/samsung/tm2_wm5110.c     | 6 +++---
 sound/soc/samsung/tobermory.c      | 2 +-
 13 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0ac5956ba270..313ab650f8d9 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -310,7 +310,7 @@ static int aries_hw_free(struct snd_pcm_substream *substream)
 /*
  * Main DAI operations
  */
-static struct snd_soc_ops aries_ops = {
+static const struct snd_soc_ops aries_ops = {
 	.hw_params = aries_hw_params,
 	.hw_free = aries_hw_free,
 };
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 28587375813a..606ac5e33a8e 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -48,7 +48,7 @@ static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops arndale_rt5631_ops = {
+static const struct snd_soc_ops arndale_rt5631_ops = {
 	.hw_params = arndale_rt5631_hw_params,
 };
 
@@ -80,7 +80,7 @@ static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
 					rclk + 1, SND_SOC_CLOCK_IN);
 }
 
-static struct snd_soc_ops arndale_wm1811_ops = {
+static const struct snd_soc_ops arndale_wm1811_ops = {
 	.hw_params = arndale_wm1811_hw_params,
 };
 
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index 8aa78ff640f5..c994e67d1eaf 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -112,7 +112,7 @@ static int h1940_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops h1940_ops = {
+static const struct snd_soc_ops h1940_ops = {
 	.startup	= h1940_startup,
 	.hw_params	= h1940_hw_params,
 };
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index a1ff1400857e..390f2dd735ad 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -130,7 +130,7 @@ static int littlemill_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops littlemill_ops = {
+static const struct snd_soc_ops littlemill_ops = {
 	.hw_params = littlemill_hw_params,
 };
 
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 1f9a553edf19..a2019535a0b1 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -129,7 +129,7 @@ static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 	return midas_start_fll1(rtd, pll_out);
 }
 
-static struct snd_soc_ops midas_aif1_ops = {
+static const struct snd_soc_ops midas_aif1_ops = {
 	.hw_params = midas_aif1_hw_params,
 };
 
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 9266070e0181..c98b68567a89 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -106,7 +106,7 @@ static int neo1973_hifi_hw_free(struct snd_pcm_substream *substream)
 /*
  * Neo1973 WM8753 HiFi DAI opserations.
  */
-static struct snd_soc_ops neo1973_hifi_ops = {
+static const struct snd_soc_ops neo1973_hifi_ops = {
 	.hw_params = neo1973_hifi_hw_params,
 	.hw_free = neo1973_hifi_hw_free,
 };
@@ -158,7 +158,7 @@ static int neo1973_voice_hw_free(struct snd_pcm_substream *substream)
 	return snd_soc_dai_set_pll(codec_dai, WM8753_PLL2, 0, 0, 0);
 }
 
-static struct snd_soc_ops neo1973_voice_ops = {
+static const struct snd_soc_ops neo1973_voice_ops = {
 	.hw_params = neo1973_voice_hw_params,
 	.hw_free = neo1973_voice_hw_free,
 };
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index 400a7f77c711..6ea1c8cc9167 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -62,7 +62,7 @@ static struct snd_soc_jack_gpio hp_jack_gpios[] = {
 	},
 };
 
-static struct snd_soc_ops rx1950_ops = {
+static const struct snd_soc_ops rx1950_ops = {
 	.startup	= rx1950_startup,
 	.hw_params	= rx1950_hw_params,
 };
diff --git a/sound/soc/samsung/smartq_wm8987.c b/sound/soc/samsung/smartq_wm8987.c
index c95629becbc3..cee39ad16667 100644
--- a/sound/soc/samsung/smartq_wm8987.c
+++ b/sound/soc/samsung/smartq_wm8987.c
@@ -70,7 +70,7 @@ static int smartq_hifi_hw_params(struct snd_pcm_substream *substream,
 /*
  * SmartQ WM8987 HiFi DAI operations.
  */
-static struct snd_soc_ops smartq_hifi_ops = {
+static const struct snd_soc_ops smartq_hifi_ops = {
 	.hw_params = smartq_hifi_hw_params,
 };
 
diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index ed753a2f202e..78703d095a6f 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -86,7 +86,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 /*
  * SMDK WM8580 DAI operations.
  */
-static struct snd_soc_ops smdk_ops = {
+static const struct snd_soc_ops smdk_ops = {
 	.hw_params = smdk_hw_params,
 };
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 39a7a449f554..7661b637946d 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -73,7 +73,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 /*
  * SMDK WM8994 DAI operations.
  */
-static struct snd_soc_ops smdk_ops = {
+static const struct snd_soc_ops smdk_ops = {
 	.hw_params = smdk_hw_params,
 };
 
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index a01640576f71..029448f5bedb 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -85,7 +85,7 @@ static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops smdk_wm8994_pcm_ops = {
+static const struct snd_soc_ops smdk_wm8994_pcm_ops = {
 	.hw_params = smdk_wm8994_pcm_hw_params,
 };
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 84c2c63d5a87..a2c77e6defec 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -126,7 +126,7 @@ static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
 	return tm2_start_sysclk(rtd->card);
 }
 
-static struct snd_soc_ops tm2_aif1_ops = {
+static const struct snd_soc_ops tm2_aif1_ops = {
 	.hw_params = tm2_aif1_hw_params,
 };
 
@@ -200,7 +200,7 @@ static int tm2_aif2_hw_free(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static struct snd_soc_ops tm2_aif2_ops = {
+static const struct snd_soc_ops tm2_aif2_ops = {
 	.hw_params = tm2_aif2_hw_params,
 	.hw_free = tm2_aif2_hw_free,
 };
@@ -254,7 +254,7 @@ static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tm2_hdmi_ops = {
+static const struct snd_soc_ops tm2_hdmi_ops = {
 	.hw_params = tm2_hdmi_hw_params,
 };
 
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index c962d2c2a7f7..15223d860cb7 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -105,7 +105,7 @@ static int tobermory_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tobermory_ops = {
+static const struct snd_soc_ops tobermory_ops = {
 	.hw_params = tobermory_hw_params,
 };
 
-- 
2.32.0

