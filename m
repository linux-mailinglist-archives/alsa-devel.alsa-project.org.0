Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F98B7812
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662B8F53;
	Tue, 30 Apr 2024 16:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662B8F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485849;
	bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VRrz4IHhE94R+1tFdrbNT48HpOQ/ut9ZbWDxfTRU9Q0ai3oZ2riXTEmXL87s3ug+C
	 hFoitC67ZFFZVKVOJhu3C+5zQACTH8Pvc4jNDl6xpMdJ1dIAg4nOETfBAy+Bv0Ho7L
	 lBXw1g06/9Hg6AAO+PMlYj7l7Z7JyQ5/76QyFOKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64CA1F80601; Tue, 30 Apr 2024 16:03:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12AFEF805FB;
	Tue, 30 Apr 2024 16:03:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B530F805BE; Tue, 30 Apr 2024 16:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32576F80266
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32576F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Li0iIfBa
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a55b93f5540so776253466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485764; x=1715090564;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=Li0iIfBaRAr1uZ1f8QxmdwaqijyUuEiIidBKEF5ECeUgqmTsL1CRm0WJd3EUSr1pBb
         mck7DN7ZtwGukdOhJStKoKo+Pw1DO083TWY+6ZjgQyVoDowQ6xxldcGxTvd2Kg7kUj/6
         5f+UBZLrHgf62ttukAM4AXX7juiRov6kffSsRZNGrL83stZ/AiyN+6UjYiJ6Bj4jpgND
         +lmejBkFr0CznV1IbbG+Lil7NnQQi4tZ3TA2zt3McDLo/kx9xgD59ZS8nTmz4he3NPF+
         6dcYP75nUiLrXiu0IkyfE15XZxkgS6163QI7w87JANcL4r4vxIUKATIO/qwzhBl9QEQx
         ZHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485764; x=1715090564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=HBJDbCF6/Fwda9CpB00FXjT+iEwaztC9iPQfQ8Hc25LUTLd6mWCDbofPILYpaApHRy
         VMdRQo4YUbKHzRXEiY0yZLvJk9XdbyhGS7KnvR/k1K7sLVHH+ai5x6bPmwl+pbnXhgny
         YRhazXTlmHFOWCIBKnk/L8/MSFQdrqSBMeZUmRlkfMBrfUACs3mZMGRgqbHiD8aZHA4g
         Bg6rb0Nu5NZuIq0O8ORIjnnYtk70YIEBkUzzBOhVFrlCBeQ6+umq3YqPoiDWm0KM5d2w
         tDLfJYJMcXv/ZPJSGAdBsy3pig5aXh2L/p+OEGRw6lSRX4cw4hqZu2RVjOVNAXQRHyZC
         y6HA==
X-Gm-Message-State: AOJu0Yym+zdRJjUhLAgxgv1gTxzYJorP3XPrG5/xhnrnPEHtzeIMZIrz
	GELygkuBnITuUhEan0mK26/XNiJJ+uGVbdU58JOERXtN0CEUS/SpMUQ17mNf408=
X-Google-Smtp-Source: 
 AGHT+IEe6L8iR4uGhiIxTqGIW4asn+4q9EAd3lfdb1piiCjrm73a/9Wg4NOc67T8NvbSyWss22Ri9g==
X-Received: by 2002:a17:906:ff42:b0:a55:b345:63ec with SMTP id
 zo2-20020a170906ff4200b00a55b34563ecmr2134852ejb.15.1714485764472;
        Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:12 +0200
Subject: [PATCH 03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-3-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnvj78Se5sQ1IGtmZPj3Apt3l8lrraNbdATP
 5UZknZzzu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57wAKCRDBN2bmhouD
 1/rKEACNiDDDmi+VKdGySua5uR69g1WVV9N9njkaGa6BQYvqocDTXh2A5T950fbqbmHniXfNShS
 JZsCqqwu5KxhFaDGF7+cJT9d8h+f+7+N7XdkXJiLCDqED/vhEdXSK+RJxvjyb2UGCtkF2vXvq3I
 qq11t/wIu9DJwANQ/5NqaRpQUsdJGIYQrngiCXGTVr86HT4kWz6cB50Fq2Rc1Nwer1MNbFgNXPD
 EjdcTuqvqRJxRoo0qJQ1uv5PK8ANQ1WI38IhHUgC9cSPyb8BjmRNwBk/6M8bqGZXxd2GI3h0DzD
 8V7Ep+O/4i5WkC/o/RdS0k/Jvzkfl794WdVSrh5ko0yoTWBfgLKB0pDzT5Td5wsGDLH4nLzQX/V
 5FUZJy3lvXFB5nrv9g3mS+E8KOagd4bqA8hkkVqkp5amB7IyjqR87us8YZTtD99ZhtHJ8VBMkd+
 fbJwxHjx4G4Tlbdh0zvD3QybwWSvS6+wPWtlX37WjHLAiWt8YIsZU7wDGSPZJGubhB71ork6bJk
 ATYI7HLcuqJT/iIWO4n1K+oIgsMbXTSo/c+WM1q9Tc22MWyviROO784jazEoZ1HWS2txtvOqMzf
 OBzZt/XtPghj+yRRLI6/+9SDQsMxuhH//frbs22BShcGa8gdvXz3dj2VkoB0xwDtpQ8OPZ7XHdl
 o8rt6UoEwW2rmsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: UI227L6CP4OUYNZPZGJNBNLNXQV42HEY
X-Message-ID-Hash: UI227L6CP4OUYNZPZGJNBNLNXQV42HEY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI227L6CP4OUYNZPZGJNBNLNXQV42HEY/>
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
 sound/soc/ti/omap-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 4513b527ab97..639bc83f4263 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -40,7 +40,7 @@ struct hdmi_audio_data {
 static
 struct hdmi_audio_data *card_drvdata_substream(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_card_get_drvdata(rtd->card);
 }

-- 
2.43.0

