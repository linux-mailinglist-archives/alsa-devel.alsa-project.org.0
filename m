Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3D938EB5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 14:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30596E97;
	Mon, 22 Jul 2024 14:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30596E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721649681;
	bh=/H5dtfxa+Nw4zsSc6z5aDmVUmIULoNGWM3agejyxotY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EA7/kvbQg2kKhZQYN/h1kDwJ9NBsI5d1QO66HYb0iOvyN0+va5h+ts0e8fhefJHmH
	 j4rJ/u5uQu/hFuYYeJ4HWVAdFeQFG/5q120XBuCUhgIffEi600vCpKu7v3Q7Zzwx+/
	 qVIn51HB4LmfOrzU6hmtSsoShk4v1srLymG32ZKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0833FF8007E; Mon, 22 Jul 2024 14:00:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C151F8019B;
	Mon, 22 Jul 2024 14:00:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1304FF801F5; Mon, 22 Jul 2024 14:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D715EF8013D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 14:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D715EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nEgoNX4w
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ef2cce8c08so12500701fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721649629; x=1722254429;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=nEgoNX4wzvIeixuyLRWcd7hSyHcfJM51GQfnmWTJg6hQ6liJvpGLNbE57WYTlMAw6A
         2HDD8IWUKEyb3yk2MUr2c9VB1VckPeT6R7Z1eGEDWiOeZvXUmjVEpwz1hJcA6zGa8rPp
         BNUOfscdXr3RcEXJV7ltVRVB46r+b5sKxgcaEgBb1EJfTxVBTJJI6cA9wWKojXkYYQTE
         bhXv1vfr/CadN42aJ4cB7pyTjPeBcGIz1TxiuOh6duBgdQS1bJ9igToHI1w6RcXS3g1U
         Lj5uVf0c6MoBe+J5+ML6mpQR4fhww0gLE/K3xiRUMSa1SctzwCnZVcQil5RLbT8jF00q
         3U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649629; x=1722254429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=JRgxzBTE9Yu/QhdofL91oV4eFsR2RXT7mpKCsqktqktCWfTNbFSmkLknTmQBcSCRvE
         5lvbsPVInYRSOUZQufMBim7i17Lx51mnUqY948vdk8T5d6FE9WTz13DDiNrLQca8AgJC
         4Q9Avw6gcd/aEc5wgldaZ1MzNIt2frm+D6GTJe7Eb3dh7N33d4CAQGyrNzotPNxa5G5+
         GmozHbYuGfQ2EtKzgkxIGAJhKk6DTDHGMpwaI/AwRi21KQNsCtswZpv7O5jc7VovslwQ
         G6lNGcZM2TLHwGQPpplLo/AzupiZtFxV3TmPO1/OMLVEDhYGgZ1PIVr2j7UdWiPi90wa
         NiBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY8gcQon7QP0bxM9GKlA1RCfpeGUukYe8SrwscDRt6WsF8/hgNAIllQu5PjankLBqDppXqn/AGda5ZwzOq9JagT/CdwzZZPI9IbQs=
X-Gm-Message-State: AOJu0YzO4hZsJityLmGwq/T5WBZcBc/38GGvc6eP1+BmV+WyVqc4hsBe
	sPU7yb6vKjfBSTnAXFQKxxq/OpSoq87NN76LNAh30sgfcvrNjwS7h4zsquXnfFE=
X-Google-Smtp-Source: 
 AGHT+IHfpRkiwCwyjhMtcbqX/KMogZuiuVRMVA2GKfuTw4dL3YtZnf0Zu/Vpy6wLwRiUYsUM8T5TnQ==
X-Received: by 2002:a2e:9f57:0:b0:2ef:2006:bfb1 with SMTP id
 38308e7fff4ca-2ef2006c9e1mr40429441fa.15.1721649629135;
        Mon, 22 Jul 2024 05:00:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2eae89ecsm4705601fa.68.2024.07.22.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 05:00:28 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:00:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <jx26jgbw2appm4yvcz45lisa2nr3uf7r4lvdd3i2eazl5nwjar@mk2xug4zhb7h>
References: <20240722095147.3372-1-a39.skl@gmail.com>
 <20240722095147.3372-2-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095147.3372-2-a39.skl@gmail.com>
Message-ID-Hash: QT53YKQDZ3IB243XZ5KGGLYFLFMVTNVD
X-Message-ID-Hash: QT53YKQDZ3IB243XZ5KGGLYFLFMVTNVD
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QT53YKQDZ3IB243XZ5KGGLYFLFMVTNVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 22, 2024 at 11:51:05AM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..8971f4f5d339 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -320,6 +330,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->spkr_iomux))
>  		return PTR_ERR(data->spkr_iomux);
>  
> +	data->quin_iomux = devm_platform_ioremap_resource_byname(pdev, "quin-iomux");

This should probably handle -ENOENT (or -ENODEV?) case and set the
pointer to NULL.

> +	if (IS_ERR(data->quin_iomux))
> +		return PTR_ERR(data->quin_iomux);
> +
>  	snd_soc_card_set_drvdata(card, data);
>  
>  	add_ops(card);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
