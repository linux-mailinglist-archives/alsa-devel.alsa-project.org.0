Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877208B7841
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20465E76;
	Tue, 30 Apr 2024 16:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20465E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485999;
	bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lebWxCzIW/vOL4A/uL1LXLyf0/FcWSEeWczZIXFg9FeOqqhuxnXHYzvt1lz7HRp7Z
	 LuRSCUlo1Z+1XBEnM2V6SwL0gDtU2UHtaNCD1ALWwUaC0Mm7YDE+jmVhNB3m+c3TfY
	 GhR0w9yF9hbX/oqlgo31GLPJaXCMXzFYxI36GpjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 488CCF805C9; Tue, 30 Apr 2024 16:03:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2FEF805D4;
	Tue, 30 Apr 2024 16:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC13F80266; Tue, 30 Apr 2024 16:03:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D004F806AE
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D004F806AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RXTM9bLA
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso10096565e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485790; x=1715090590;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=RXTM9bLA+A734JrSHGFUbTKwtT90eYs58vSHJWMTCsnxIEqN18V3Lsa/JStmRShn9q
         nvBdnD81uqluMQf46AcTX7zxRpLsjyWC3LgisbxfPbGjc0CJj4LW5IXeySsjsiJmwZWx
         vzOVW5dmxqXCewdJuoTqt4NhnqcQW4dxvw2N/xQV/PDNDDDfvt7Pbl+VYg/v4Kvhpibx
         oRO5wHsJqN6pEZGgyPn15neb00quGX7QArRjZLCYUk8wmrWK0TAb807/hyJQQ8lTXuzN
         RlxlYcwwbTH5PYD/bn8n63rxIwnkCQEMgqJmxMMYpiOBMEph2W8VQ+vl1DsV50sRvaaj
         fa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485790; x=1715090590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=FBoTmtAedTzleIRFE0Zy44HPyYDq2erCD1VOYLBrn8N/shTg2KqLM9GSh5ebZ2rJg4
         ARC00IsYCu+zRbmKr6khLkHSF5hwVDD3P3Q4WVF0almsqIes1M7vYS03bhu+UnM2tM4w
         MUZ2QN4JdPWJKzuEF0g4PmInk9U5a4Izt3G/pqdhchkamYWwU4wUIWnHDOUOmZobgYLV
         HO25mdSyFZKLdPUmqtpdwLvc5fJo7g0m443agWPW9ebG9iBo13Zps0I1fTzVfVWyN2+M
         ebylKquRY240ohFtMrY3HGY06iA2tyi/FMc8yKlgiYXGQVWHjIzyYnpoecWhdjs9cOUb
         ktoQ==
X-Gm-Message-State: AOJu0YwsOhvrSw9AjpywQl9HEZYVnu+T0vqjWYZEDIQw6m3g2li3WJzf
	dZ4yf7fgvAGPHr0KXGM/Mm9q/U9rXXQs43xX0TZ9sdaTJVGxkktxWvHoyvX/ZmQ=
X-Google-Smtp-Source: 
 AGHT+IHF9BCm3Hpto4qRWqGnR6LWsHIvsR6psO89D0oVIbNwL85POL6TwPmXMEZNmxvO3lf19inFfA==
X-Received: by 2002:a05:6512:3982:b0:519:166a:d217 with SMTP id
 j2-20020a056512398200b00519166ad217mr13782162lfu.32.1714485789720;
        Tue, 30 Apr 2024 07:03:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:18 +0200
Subject: [PATCH 09/13] ASoC: loongson: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-9-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn1MXBzjTFYW1vw+HGX+bgAlb8xjIeAN12qT
 8heTgZA8qOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59QAKCRDBN2bmhouD
 18asD/sG4cfwm5/cvMuyWs/KhNg7FPcNnM4eFOVtUPz5xnRqVF4pt6jUcKqDJjRfrq3s5JoYJ3c
 vBUD9jgSmkuB8tYCeWM/fFAOimxAXRa1keWd3xM/+KL3qsLAqkpXIdkHwS20hkhT7fIF+E2cU34
 35Ajyyg+q/q32ZXoeF+z7chz0oMLOUq3jDN4mGTO2PE/l4xWHZqC30HaBVtVZLYOr2WdfJN14l+
 YsJUUR1UBA5aXsr++f01Vf/m5pPIFSvYtRQcrp5YyZeaWVGm24AD0kDXcfdaYuSD6hlnoVB1j9K
 LlP/ODUgDC6zWb68dtVEkLXAfru4YUdiN9M9PLsBzBz0IIoe1aPihWRNB80Uyu2Z/lWy8ceeaX/
 rMUdGMoXE+1AcbqrE0sZvujjGVmL/5axnumRcAJRvAi4jE27qyDapAyfgL2FTvrC5fHHC0WF/Pe
 zkWTZpTx4al2ZotNljcAD9imjfQSGKB+Iovem2sQW+eZIGnWm6EeDiADskK/J5bROpHvWbfLRMM
 rXaqxY9WzOy+EFocuuu+Vq9ckAOOUcikB/3Y6YS/odwg7AZZA9hLSefMdTXWrnaJnScqKcP/bAw
 gRWnITyzDhtzuAN/vsyQ5gi3lbBmCYNL5XhK6oDlLe5BamoqScRwdbTHBthRDUiaLtaYXHQGkXj
 jOwKVSiBpozJEaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M4Q7H4PDRZPPXCBAFPJTG4EAU74EDBAK
X-Message-ID-Hash: M4Q7H4PDRZPPXCBAFPJTG4EAU74EDBAK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4Q7H4PDRZPPXCBAFPJTG4EAU74EDBAK/>
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
 sound/soc/loongson/loongson_card.c | 2 +-
 sound/soc/loongson/loongson_dma.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index e8432d466f60..fae5e9312bf0 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -23,7 +23,7 @@ struct loongson_card_data {
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 8090662e8ff2..4fcc2868160b 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -226,7 +226,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd;
 	struct loongson_dma_data *dma_data;

-- 
2.43.0

