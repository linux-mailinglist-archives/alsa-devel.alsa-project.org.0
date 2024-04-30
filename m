Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F68B80E5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 21:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D04DF8;
	Tue, 30 Apr 2024 21:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D04DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714506883;
	bh=/57uI0NnDO2LrGAjhLyCD8a8uhYqBrJbnu0u7FZxjEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gbE67KRGH2bn7jkVc2bLPKMn9MRe1NsVU/hzEEV17+UcVzE+9WM1IulBO6g/GlbOk
	 xoAinM0MRMsQhBCxqaNn6f3DrcfaGmNTeuymOF3q95H19KMo2qQzGU3G91as8287Hv
	 WQSOcoZO5mvsV6icMEiZsETXcAmey9uiFA+VcsXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7708CF805A0; Tue, 30 Apr 2024 21:54:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A3DF80589;
	Tue, 30 Apr 2024 21:54:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AB8FF80266; Tue, 30 Apr 2024 21:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F2A8F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 21:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2A8F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AsnOnxaT
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a58ebdd8b64so389103966b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714506833; x=1715111633;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=AsnOnxaT1JmFiLqoBS70sqBrZsz/Vabp96PCsj1bUX5u3Rx68Kn4GffQ3EZu2E7I3g
         xkTyMO4fpFUN/zYCU204N6m2nWfJ973sWP7zJecj2EXCJHRZkE64Rk5d47T9JVxQljVl
         voAqo9qIV1XqxfFea+xJp7Os8Xz7725YxyM8lH0Agr6Bux0Q8csCOH6ga2+zWR/HjhbZ
         TxyfuKI/aVVLHHbBxE7/TY0bLtphcLnZUCKW6kGEev6sONCwq2RXfn1gzUWWrWLrivFV
         aUfuVZBqoxnjzuJXLiSGJxecFecuBxKw64dRN8CUIxV1Yvo2PyycecPH+AW/bUgTNdB7
         W1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714506833; x=1715111633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=OdxRoW5V6Iv+jd3BnwgRA7mWKq9LtgoBlzIYYdHe+93eKwn4C3KIWoif2scN2N/9bM
         c+ZqAebK36Xv0iHe594koWMPpjbou6sn4WS39SbduZDrEjJ76IUYe379vkpzXRF7qcwg
         5YILYiO38bCl68xCgMrB2eVrzJjFGlKXmNKJWAZMefEwYr2ztEOitaVITe4rv9jVhUVl
         Hr0ApxM7m0RtNlC6ecj31i1ws8xH9xkmX0vQJvPp0UDknIzarc55g4PdvMlrZkfFv8s9
         C5euahGWCbiOLB+l+oH560tKtM3tkRGYL8sWlNCDT/BNRyWBncvFzv5EmJL2lfkgWhqM
         qHkA==
X-Gm-Message-State: AOJu0YxSwPMB8i3KEUNBUMQR8PsDepTT9g3hemAAcMwjejcfTFac8ccF
	TZGfMtON+lZMTqUgbC0qaRjGvWEenC6TeAWIS7455Y0Da+tDw1Eb
X-Google-Smtp-Source: 
 AGHT+IHcHyFMebv11hNczXbfOSBPzOfPEK56ZS5IQDWu8DzPrwNQuSSocR8UcDfVrVvZhY8lrKqE1g==
X-Received: by 2002:a17:906:a084:b0:a55:387b:eef9 with SMTP id
 q4-20020a170906a08400b00a55387beef9mr455005ejy.10.1714506832645;
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id
 13-20020a170906058d00b00a522d34fee8sm15418045ejn.114.2024.04.30.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
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
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: 
 Re: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 21:53:49 +0200
Message-ID: <3292058.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
References: 
 <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
 <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: OZJZ5IVTF2M3XXAV5Y7EUUTBPP5S6PGY
X-Message-ID-Hash: OZJZ5IVTF2M3XXAV5Y7EUUTBPP5S6PGY
X-MailFrom: jernej.skrabec@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZJZ5IVTF2M3XXAV5Y7EUUTBPP5S6PGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne torek, 30. april 2024 ob 16:02:22 GMT +2 je Krzysztof Kozlowski napisal(a):
> Do not open-code snd_soc_substream_to_rtd().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..fedfa4fc95fb 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
>  static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
>  			       struct snd_soc_dai *cpu_dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
>  
>  	/* only support capture */
> 
> 




