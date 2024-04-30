Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8678B783A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30CEEAB;
	Tue, 30 Apr 2024 16:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30CEEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485971;
	bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HpAhlgj3Bbgn13lOb/7ud12LAduLnsLgY7DrNxNXKJ9vddGlhqePWWchDDcLEm36j
	 TtpmBWJXRIcjhh98F0c9IVZ/6Btem8i7NuHiod4VyJkjDtvbYGRWJak5sV7wJ7YuwK
	 2J6CAGS+b4F2xRnx+V4nxenIWaBTlfKNsVdxxnkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D340EF80710; Tue, 30 Apr 2024 16:03:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80291F8070C;
	Tue, 30 Apr 2024 16:03:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1344F806CF; Tue, 30 Apr 2024 16:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2D8CF80649
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D8CF80649
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qnUKsZvB
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a58fbbcd77aso301152466b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485797; x=1715090597;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=qnUKsZvBHM/nSYT8tVtsAwHAu9gjEKUXEraWOb5vngvqrwCUDMS3cd74l1z10B/z6W
         BPbDG0iFxPB9ZsAyOXMbVorYlXXDWo7r1wwn0NGJzgsGJAJRIbcW26iTi84ZgJkTSIQu
         d9Kt1IzlcXZRps5sKlLrZ8ODZFJXg6U3Nyft/ZCMf0vLOxBgJNUNCOrxQRnDtIG94vCB
         OqBDVKT/zcBu/SDvjtymsdCRa2yNShp7ffBZQi2Wn0GkeezCHAV60eM4UgM1nt8Wi0k9
         dOSTTJtOnQgcaIrl/9Ripghae29Szs/mzHq9En0UvD++0+bl89Eo0Sfe/rxt5J7Xu9vf
         V3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485797; x=1715090597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=sLtgCoEW79JHXTyxR3Kge5ANsH+gZ2EJEf7TBbZBHfVLiCCFhaimU9T/xE4oLUJE7/
         cW16b3T+wvy35KRZ8ODcvhKp95tLEI86J40ACvKHarNPAyRxhoshx5ABGkL2YaOvCniu
         cjK78fHlv/N19pXfGMappBxx9Wdd0qM+AYr6opInwIzhXjBI/LJcLJAaqGMsUDLuuZNC
         2t/CCKWKhBhZnbN9+5EmnRAxU7W6sb3ToswpSiPtSDM06DUSac1/2u5PzdW97I1XPAOd
         f4bPUXqG45xpYEnSJ11SrnqE+gyYlAJySjfTKlJnuJEu6+T8q+smSrsWOi6pGzOVyjaD
         gDYw==
X-Gm-Message-State: AOJu0YzOOZhEX9hlUEuSNIZCOoyNWFMbUyzW6GAaNCSIRGV+FiwS6g00
	BSFStErwVHlxzLz7ZCgdssvY4ghD0xn8erL39xuS8Ix3HsgVhI9N7iBU4Wh/5bw=
X-Google-Smtp-Source: 
 AGHT+IGzpv19AvraaJONqek/5WZ+vpK0ygTzaKpESURpr1fKUPncz+rrCHoTLxWTmS70O2gF9usxBg==
X-Received: by 2002:a17:906:fb19:b0:a46:cef3:4aba with SMTP id
 lz25-20020a170906fb1900b00a46cef34abamr6908081ejb.75.1714485797197;
        Tue, 30 Apr 2024 07:03:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:20 +0200
Subject: [PATCH 11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-11-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2JvN54IaqcYA5GLEuMvhDQe+mNVTJTI3Tr
 QdG3HJ5mpaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 197sD/4lVw4vRS0TaJQoEqN1/VKp4Q9D5lysYmYFjuJDSklcrh+mHGjmHyG95rjuMpfUp5WdZ9F
 iytvncSSC/Cuz5v/Jf8fvm3m9JjwXFFBP5Lc4SMyVJAeiWnSKjzxXSJpUg4BiTtCWCFACQ+V2Bb
 YGk8kFBRlLhu+hIsRVvO7YExMVKSyWC+LUviOI2MtzsH1IZm+J1MJ32ygUWTM2XfMun8P6JaMaS
 zdUyUnJjZrzCI9/u7V7zlNe7qD1tuI5xufOqCOiAa6z0lCBNjRJeSVaVzniiHsE9d/ko9UTugjE
 fj2ylpg5b6Vgg5XqItpdB+YsDKsAIWOpQw+4DM9EyACs1+eZoj3ODueF18BqqnON9iBFHyQC+PS
 tFWPcxkNUPvKTgBAo35M7FSPkECi12I5S4WqPZrRjoTs1lUtOhRGq3DjzGjtxPPe1fgDGvsk4Mf
 4VM/tTJWrMOhnmX9/Vm3iZWKyJcLwmff0kZYETc6VVP4YKbsUIvlZbkhmLuh4EY05gpbzW/i98e
 2SqiRpAD6/3HhVAbX7RcNsQAFGYv0XBd6/7ewRdKkn2ly0KIqT3t5dloWm1fn8iCmzLrSnDN+mR
 h9asUnfi+hgioFVTE27PhDIzW+cxFlTOVreYfN8Fh5JIFmJW8FNL9xUzP6zwTdjGwt18Z9Ey1s3
 y25Qq5uL4jC7B2Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: ZCXHTNOPQIIU7VNEVCBBXR2WNROBVDNI
X-Message-ID-Hash: ZCXHTNOPQIIU7VNEVCBBXR2WNROBVDNI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCXHTNOPQIIU7VNEVCBBXR2WNROBVDNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/meson/aiu-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4041ff8e437f..b222bde1f61b 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -25,7 +25,7 @@
 
 static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..1ead5ebc84c4 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -46,7 +46,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 
 static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }

-- 
2.43.0

