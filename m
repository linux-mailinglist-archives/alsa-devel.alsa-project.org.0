Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A68B780E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29FF8E0F;
	Tue, 30 Apr 2024 16:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29FF8E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485827;
	bh=eDseprbctVXAhiZOvRsQsRjQ1srjlolDCUwu7Poiuqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yfhgi8Oj5EKqclbo5zSRue59nulU06cBsnbeZBDnG3UzFEDCQT8Q7luju/RP+HS3c
	 FR0VmBJvk3UpK02uJ5FiRO98Z6mx6u2K1iew6jRyVegDaSacczMrOioFlzFvR1pT+r
	 w00UUc+xsMcvXLLRoYKVFsVtdlq/cq/QTeXkJpCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10E9F805C1; Tue, 30 Apr 2024 16:03:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0397F805D3;
	Tue, 30 Apr 2024 16:03:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BA2F8003C; Tue, 30 Apr 2024 16:02:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F210F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F210F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RI60T2AE
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e78970853so11148406a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485767; x=1715090567;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=RI60T2AEvjtzXA1/ZBJUM/OtKCTLMA3LcO/LI1hIUXFUjEt4V2d05tK05sJp3KpFN7
         p4ikOw6Wggmhi+8s8koyNmgmWT00aWORl/iS4743Nioete0Sdd9cmBfIsTp2Q9uZXTLp
         VCk+IQ33ZG8OcsLTOa5358XDIERf93X602RAiMDQujZ/yDJonXT84ddw/lxOVi66YkQv
         bP2YV4Nbwgh+pO6S12ME7M8atOTJlv8oKlPM7yoowY66NV/3lLkFlrPqRYgHz5rITOtN
         ZQ5glz8zVwm6kG+/jE+nDfG1slstZKXCs4urwMpbHr7GhLC/Fmec9zebUpQQ/vaukk9q
         +A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485767; x=1715090567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=doYh9jTMw4dmlFWnfEQhdH/HFesbH2kCIcxQ4UhKQOkVtG5BbRsGk63jVSjnCRHLyX
         RTRSyXilv4EfgyU4VwRGZefKHVbGV/dLcuhxg3xFLpOdX69feShvRf/af0aTEIUcIYKR
         acFc2TMgzPdTl/WMy3lfZGm5/tYm8GUD+/NAYzTW+sB4+8SNlDgxyzpJRXB164Nv8/7W
         gRA/P8UNrOpJaH3oXJN36iRcaiXaRszj9kf1LZdqpMZwIWnc8Ma0Vc6pnW8hLQeJNY75
         9W8d6ZdJLbQQh+U97OSLtr7G1eEJmNu/Symx4pWxVkVJGZLtIhqEEL6qftcdXStr3bKi
         rtHg==
X-Gm-Message-State: AOJu0YzLqY6OTfSo8rKrfouToQmXeGi1Cmm9ZHO07HosbiGOtweBgVFN
	W3VZh8mEDT8LbqpYbJEN9D0qrYCseDhUgawO3KAdlHtkeehhugEKfMX3VXlpY0Y=
X-Google-Smtp-Source: 
 AGHT+IFp03X1JFPDrIujOHhWiOUjRy/996U+B0l6yK76tZHW13kgA6dvKPQweqrNY0l31/l3LaTzjw==
X-Received: by 2002:a17:906:3ac3:b0:a58:ebdd:8aa4 with SMTP id
 z3-20020a1709063ac300b00a58ebdd8aa4mr2360562ejd.20.1714485766998;
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:13 +0200
Subject: [PATCH 04/13] ASoC: arm: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-4-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eDseprbctVXAhiZOvRsQsRjQ1srjlolDCUwu7Poiuqc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnwqTKqjOWhyghuqcWCQALMCLVh7T8zMCEGN
 dvM+Z0GdNKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58AAKCRDBN2bmhouD
 18RiD/4qLIFwqpuprQ1tMuUxq4zKnCWe3121KK341e3C6K9aJyN/BTLnFTKGCeHCS8O34sFL66W
 T7sO0tVkpzvEVFOfhdAxTxVSNxk8b8r6nlylo9rzqkM9QzU1SQsGJxog0QKojxAO0I6sntjpOI1
 C4eLl6KKsV1j1hvxU76kJP6e32eMeIdiZaAxMmQsQSK0v013+TK6DZ0Pzoka7GW21s3JFCovROF
 vXxmHvtZZeMHmbCCg5y/XZBWunSMfsNrjjgO+mIu7XV7gkK7P9MQYjLZJqqQZ+vhoD2Qg9UAnk7
 OQE9DLavtk9A5wwayHHudVq/E4K3OsGqYV+1R5o5G1+IXBsr5pk5VcYEwd60z1VKxXXSO/b83Yc
 ENbgYWPE1yLUGcTgo4uG5za0uVWxDFi/b7wDRbmmROHuH09+9ryGv2cvKPGHQDn8f6u5L/cH8NS
 Ks+CcsLhi9wVjDnpMDTWNA/8OLpqgOgk1oqEI3Ef0cIjYKbQDoqPj8qg/30LXXJWsi3ixd/UGXX
 LNNqCHmIDRExk6Qjid/ky+fQP2yP3ITflnWYCAlkkGB6jsfhk/qkiIbv4uytjIVSSs+x9OJUdPk
 73ZmPvgfk/AnUFwJpDnK2XdUlBKSk6Z3H5g0na7JWMYATpXKrxMAJjcyW1bMqbdfGqkv8gNWzrz
 mSfEosfDuUmcoLg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: ISGYYQQ6OYW5ILPKYK3MJUZNOZKYIC35
X-Message-ID-Hash: ISGYYQQ6OYW5ILPKYK3MJUZNOZKYIC35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISGYYQQ6OYW5ILPKYK3MJUZNOZKYIC35/>
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
 sound/arm/pxa2xx-pcm-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 51d2ff80df16..571e9d909cdf 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -33,7 +33,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	struct dma_slave_config config;
 	int ret;
@@ -79,7 +79,7 @@ EXPORT_SYMBOL(pxa2xx_pcm_prepare);
 
 int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	int ret;

-- 
2.43.0

