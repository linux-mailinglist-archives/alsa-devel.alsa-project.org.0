Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46E985579
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 10:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2BD1F4;
	Wed, 25 Sep 2024 10:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2BD1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727252917;
	bh=nF0sfFBbFYVla7AI5yaRpMtwDZALqbKLpYtZvnb2IXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jmCJISR//FVys2P/hfSsHrd+MxFAgidkkxwh4eILmXCAb7JbkI15i4pAaO0SARzQz
	 EFht9rqjdwn34iA60x+Edh0D8xKUD08NBi0InPm9XVX/wyi/ttcwJsypYCuL4PbtUs
	 f7P6UYJ+HkZu3SjBo12Qz7a0Ue9cTTm5OeyWvPn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B919F80508; Wed, 25 Sep 2024 10:28:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B368BF802DB;
	Wed, 25 Sep 2024 10:28:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2461AF802DB; Wed, 25 Sep 2024 10:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61B63F80074
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 10:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B63F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MpUiOg10
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53568ffc525so7589114e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Sep 2024 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252878; x=1727857678;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=MpUiOg10Zs2ZwTOkqDYtGM8bi7ZbKXaVcWeS+fDAGOCu1cQd+aZ0aJ2MjnjPiVR5tw
         Vh7c2qZOk1goELGeAI5ckHAt/sSb80UnHvdLDhJXxIIq/Z8lk4CqIWSp/XFRwl92UQaW
         g0Nkrng0jyHZIhwa9ba4xeuFn0nBMOGf3NlRw78Vg40K2BFeoWvKUp4hNLY/azrGXgvW
         ZSyhcWUVxqCtyxzSzbMBQoZU/zgnzoJs+b297S0vejQoKjW5QLg/a3vD3GAGuoq34qnJ
         g+/Lxmml6zzd/STI+uJED+oI51/c7iTTOSjbM0bdMdDQC3OVq5CDehj+jJmyK50YjxiC
         RWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252878; x=1727857678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=Q0lB85o/EF/32odWBUyZZxriWm8NTJbJiKjl0QNCD87ZEzCmj1QP4TZzyjmYONF5Wm
         tLTtW3iBb3F947xVPSg/7VgFaqfHz6eLAjLey78s52P2cZnK1UJZYVf18EwHEX2ATnaT
         Hgvc4G7IJh1y7p2VqUZ9A5UkzAU1Sa0siCikb2D/P9rUe1dZoevF0KVM2TJUuzVYag1s
         O9T4ZURdoYiyNoERnrXVb5nvprELl6iOnb3dTxD1SErGGVsYer5f46V5V9BcLmNXlsko
         6OkTcHzAjtN2bqyyiayR3fvdDUv/GCbbnxgHYHFJh6IzAVA3XzaTx+4j1GikAsRFIwrY
         55vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbX8q7oGZcE3c75uD/V3hg3ZkxY1FjnXRhHS1ennvLYavp0joseLXH81lyLrAjrL9gChM5ujC9gWXO@alsa-project.org
X-Gm-Message-State: AOJu0YzYL3Nzo/4Z6DWbLzRi6LBIqXp6EGj8BIdHmZRd29FnUk8rGHeA
	Np5va0C9lO7I7CQXVcDBPB5+DqWNoqU8JVM9fjXMSNdp32u/Orj+Z83vaawm1ik=
X-Google-Smtp-Source: 
 AGHT+IEyNLlNKNPuzVS6L2iBVgd1PBFlzz4yy5yLc0ujoQhajP1DHMelGTZ6NiiUvdGv3ibmtbdefA==
X-Received: by 2002:a05:6512:1101:b0:52e:eacd:bc05 with SMTP id
 2adb3069b0e04-538801ac047mr976428e87.61.1727252877875;
        Wed, 25 Sep 2024 01:27:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e5c0bsm452613e87.82.2024.09.25.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:27:56 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:27:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
Message-ID: <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
Message-ID-Hash: LHMTGZ6GT2IMKHAUZSAS4SIRP6W6RUAL
X-Message-ID-Hash: LHMTGZ6GT2IMKHAUZSAS4SIRP6W6RUAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHMTGZ6GT2IMKHAUZSAS4SIRP6W6RUAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory.
> So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with RX2 path
> it will also add 2 * rxn_reg_stride2 on top.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 71e0d3bffd3f..9288ddb705fe 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -202,12 +202,14 @@
>  #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
>  #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
>  #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
> -#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)

This is a nice hack to rule out n=0 and n=1, but maybe we can be more
obvious here:

(0x0434 + stride * n + (n > 2) ? stride2 : 0)

>  #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
>  #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
> -#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
> +	(0x0440 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)
>  #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
>  #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)

-- 
With best wishes
Dmitry
