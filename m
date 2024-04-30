Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2A8B782D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04DDE8E;
	Tue, 30 Apr 2024 16:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04DDE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485931;
	bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZYkTNFchiUEN5pIwAyjHb58BkxVJUXXF8f22mwALIu81fZZIyRC2HKEf3FSDmZOjK
	 +RpMrK0gIHaFpNd+sS6xXkggrS03xG2lObFiW32APLCtbBOZVH2n62O3BAVsVIixsV
	 gdoGlJVRrUikM51UTokj98fHz4uYDr2FhyRfNjKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 286B8F806C4; Tue, 30 Apr 2024 16:03:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A1CF806C6;
	Tue, 30 Apr 2024 16:03:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2690F80699; Tue, 30 Apr 2024 16:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A04B1F80602
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04B1F80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HTs1pD3N
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5883518135so651501966b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485787; x=1715090587;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=HTs1pD3NoPl4BajqKShIuHXvwpK4r5Z9TNES/Dssp4t+vNehhjqZuHUyZRrGY/iKU1
         MKoHAGkqQjvhthd7H3nvOencZFHXQbzPiLotgMGEDI/LbLeX8oQb4+7VH90theQ6awxS
         qv4cJzMH7rhb92oef+x652YJoK8aSbXMoL/meD5yZZx5hCw52zIf9MVc6dnTRTJ2xwUR
         p1hZSYISgGrR6G0GNXDmtdMqg9RwVsv/1wGhjODBZ5bJTuKYUrfjq5odlfrEuJVitLK6
         hvrtXFp2K6llXPZiZoHg42cxLFbRmYNT1KVc8sQ6l04od8mYvjOl8/xcZRI28QgWymDt
         rPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485787; x=1715090587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=lAmYbGkuZZ5WGRA+ImbGap1N2s+zN+XauHqPDWw5j6jAL4CCJm4DXCKxhCF+ryBGvp
         QjwkLyJeYJ3VMe3UUBtBKya5RNTwheiOGir3MHadSZVKKGkScW7UnGFYUheyFhnoW2Jc
         BPkaO/wdfCoquCvdWXsHQyovh6Ekoruas+Fi9wgiIWcRwzbZzpUZcKpLVy47BTDbxJKx
         CM4zjS8LvLTrxuf+PtJedcT26mZURYQmcaKXn8pdOW5fnwMvMwm8AeiscxO9eGQNBolL
         5EwUHGWNtSdylLC1tEDrqewS8JvS1xUkT5xYQJikU+wD9yzFUeXc4C++ntrawqbGh3+9
         ZgwA==
X-Gm-Message-State: AOJu0Yz23vhSqt1AAy//T+EAffYSuVdIFA6Sv+NBT/B2AEqV/mWT4hXh
	ilGtqwCHOkyA0DE3ksKq8CLp2RQ/x1I6mpPxP62HcCl6g0MnWAh+8Gd9H3I+mZ8=
X-Google-Smtp-Source: 
 AGHT+IGuEd/p4bNUH8qGU+eaFSK8VAtxB3CIFoT6x1kpuMcKSCXiGNBYxe9tpKOFHZ0t3goA5+TDFQ==
X-Received: by 2002:a17:906:5d1:b0:a52:5460:a1c6 with SMTP id
 t17-20020a17090605d100b00a525460a1c6mr8141356ejt.48.1714485786717;
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:17 +0200
Subject: [PATCH 08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-8-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn0JcifyNVMar6zygwpR2fCs5/vlSNdY5zrU
 P/gTARf59qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59AAKCRDBN2bmhouD
 1zGnD/4/+HNhnrisX+IxTCcgOIYVGlhMNGY5vKejxjMo983A81khcr7uNg3V39Ut/IpxeMUDDM2
 Rk6W37xxCNkLbnV8wmT6q0+6JYwo8P4avbWhlcyWX4f/X54F3DagobrxkUqSfNm3z/Ohm2iMNsI
 5ugz6Ay/15M8khl/LqKWzwuHNFkFgmxkcWkPSduL9KTHrRilAIDNLYrHPm02HPDdxNLtZNU+BHW
 HTvM9E0VR5hTDhkw7zVMnhr+YV3QpwCclGbZOhu0Cp0nBuhuyLS6jviuYyHCMCY6GkcreN+twHB
 cXmh7Xs1u91x/WYnyYmDtSjzvRIkkxVrWxw/QN9qTHQ1RYB/Xx60ra0zeLmBEmOfRz9SMfyGoUn
 vRlI/JhDNPgNBYSjjkyIBwajOY5i3uiToFIm6XjRwuDnhvfIY1W7C/uwA0GMStEoF+JFVDyw8pW
 XIHJD1hjJyGYX0RH/SbX84Zx3pQWMS27eL7z7lzWdJWctPFRnKSWOGotjeOgM72adhckEHzGgIF
 QJDjo4+G5LVVPbCJwrxnbN0CSfbzPMsVVru2jraEYMcMNH7CzrolNQXfdPgbEj/6nlHJvhm8a5t
 qifBptWPRDKql5mFD1fojt0Pdiv7EWmzeVOR/7d4Fw5AkjTCjcEbUzTHSDxxQlJZ3JQ4G9+PKsH
 o8NVxPN16vhnqFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: K4XJI3TOFKIS6QAVIQAI3QKJMDPCNKBN
X-Message-ID-Hash: K4XJI3TOFKIS6QAVIQAI3QKJMDPCNKBN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4XJI3TOFKIS6QAVIQAI3QKJMDPCNKBN/>
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
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index ef00792e1d49..036b42058272 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -19,7 +19,7 @@
 
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(subs);
 	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 

-- 
2.43.0

