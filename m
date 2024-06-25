Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6118916E1A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 18:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCCD846;
	Tue, 25 Jun 2024 18:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCCD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719332847;
	bh=1qbtk3OuDsg5JykbAutMiYplR43VIqHxiBteHho3YMo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IOWBr/KK12cPa4sbKar1q/E5agG07nPnIYIytbWBLyZsJWBJI5uXef8SNWLgi7B4y
	 OceGBmeRb54RYPk2ECl+xoMF8mIQMGse5YR6qgb6XyFWHcwR1lI+vJkr/khTWiUooo
	 fv/jHQ0v6e56t7PJ1cdK7HLyh7ABxi7rBSVLUw4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4E21F805AD; Tue, 25 Jun 2024 18:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A9DF805C6;
	Tue, 25 Jun 2024 18:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65C4EF80495; Tue, 25 Jun 2024 18:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C59D1F80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59D1F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eSZEK3fc
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso40244125e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719331663; x=1719936463;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSwASthEsdX2DteIZwJkoH24oLk9aUfOcBU7wEUFdws=;
        b=eSZEK3fc2TuesKvJWodwX1SHfprOGYrDOGvAK3SC3qzSarxG3XTKPvxc8r6cS4se2q
         48DorcfIcsHrnh94qscF/GGx50Op+G3xfA9ochT2p4Yjoj4VjzVbB5e1shQ8gc0eGMV3
         zOJZN4UWQKyIbeH41EuIErcIlBnN9f3W0K1dl2eA7fNm7awYbrYHs1+Kl1siNokZdDzx
         rCuay6fFhFs1wHEb0CvSkqIIkbkH4QCFOMM2G6twAxPLfcekTcQ3FL/gIG5vCNCN2IXd
         HjStebpT08YGIuIWZDN/fDikEvt2SLknCeKO62Qirf6NZe8KX58sv7tLC8wxV29TF+8E
         c0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331663; x=1719936463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSwASthEsdX2DteIZwJkoH24oLk9aUfOcBU7wEUFdws=;
        b=AGxi85JGuKz54P9QfqUlmKTHQf/vzSZlAV3h2cL9yM6uMyyAV9pWtxNLmJLDIvgyl2
         foDxl6MEqOtS6dO/Qt1p20M0tfF47oa7VCjhIly88MxUpENjs1/jVi3wikNUDI2BLLYx
         ubUYg5uwLg0VOZvQzJ1/ynz2Isrb3PuNy3g/tSdZ8P8Bg9754k+6avt39NFmjqpe9WlF
         MJ3xKpPHEIlhIG7P7mMZJvLwCRF0v1/KQk6nRoaA6Kmf5MBh0DVr0wD2MCLP50MUogk1
         ekmU5/URBZLLi/TcBxYyQ9YaxWG5CNC6dGVErA3nPkMcnNslgfJT6WioWS3VgK2P5yvC
         HiMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeoHINT8YJCKoViSc0/b3HVsy2uIrOaCbvdKIZpA1HInUJ2hpb+IcoWkdTksT6OnBq5XfKb9qaTb0kdZVImjQ/oitNnyNNcHnHxPU=
X-Gm-Message-State: AOJu0YyJsoR4+IytMvodGKuwwVlJkIFdgiEwCqjF4OfVRbQvyeOqWcTt
	1yU6o2sQxalbp7asTymTND1p403/Muhwae9cQ7fAVeY4a/gP6nObGOT7bkft7aI=
X-Google-Smtp-Source: 
 AGHT+IED6hiE5o69v1WtTL3k7eeJk/2D8bpFnp51OGCzoqszKUCYkFDiXdUwLJ7ZvcRqmEegoDc1WQ==
X-Received: by 2002:a05:600c:4618:b0:424:a401:f012 with SMTP id
 5b1f17b1804b1-424a401f0d8mr16656025e9.3.1719331663402;
        Tue, 25 Jun 2024 09:07:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424819224fasm182691185e9.46.2024.06.25.09.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 09:07:42 -0700 (PDT)
Message-ID: <a2b8296f-66d0-4b9a-ab3f-895f9ef647a4@linaro.org>
Date: Tue, 25 Jun 2024 17:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TE44CEOTVKSXH7T7MNXFASLMT7ZWFGUG
X-Message-ID-Hash: TE44CEOTVKSXH7T7MNXFASLMT7ZWFGUG
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TE44CEOTVKSXH7T7MNXFASLMT7ZWFGUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 25/06/2024 17:06, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/lpass-rx-macro.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 00ecc470ba8b..1c3429f004ed 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -1601,6 +1601,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		return rx_pre_2_5_is_rw_register(dev, reg);
>   	case LPASS_CODEC_VERSION_2_5:
>   	case LPASS_CODEC_VERSION_2_6:
> @@ -3639,6 +3640,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		controls = rx_macro_def_snd_controls;
>   		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
>   		widgets = rx_macro_def_dapm_widgets;
> @@ -3812,6 +3814,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>   	case LPASS_CODEC_VERSION_1_1:
>   	case LPASS_CODEC_VERSION_1_2:
>   	case LPASS_CODEC_VERSION_2_0:
> +	case LPASS_CODEC_VERSION_2_1:
>   		rx->rxn_reg_stride = 0x80;
>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
>   		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
