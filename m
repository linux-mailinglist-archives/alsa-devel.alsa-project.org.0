Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E935532532
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 10:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C64216E4;
	Tue, 24 May 2022 10:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C64216E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653380685;
	bh=7nZCH0meapQJuvt1hFIr4C2Muy5vmwV4miK44qp7qL8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+GVgY/Jl6ObdnuEJB4HysFxEaiQJ8iwOj+JqZ1Y2PHt2RwoWYc/AuLKeWUxGmCXs
	 R7X+7IibcdJsC6Q2epN5iq4X+xZmNntsC20ZzYNzCLVIObqjPWqWSPndH5HZyrLk2x
	 1FfX5G5vmi+oBcpku/Ok4+iyUmmJwP6zSeJ9r7W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7939BF804D6;
	Tue, 24 May 2022 10:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1BEBF804D1; Tue, 24 May 2022 10:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706D0F80116
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 10:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706D0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hjfi/bsx"
Received: by mail-pj1-x102f.google.com with SMTP id l14so16171598pjk.2
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+larJ7nq7JK1vyPKnLdToeIWpVaeV3SSZmGzzK3NxpU=;
 b=Hjfi/bsxpvtOj5ibIxW7QV1UXNWXZ3j+WPxFX0ax8ZrUh0RPs8QC568O0UgD6G6Ogv
 ndcIE6gyBNkd0AbcPeQo7ScE2ML8q6Ro4ETRTJK0nTutbhAKuns2SGVmzM35SkVopLqG
 cYHxvWq8lFsPR/kL3rDy7sbWniskvBbLORHiJYR+k4xiXwOthoFShLZYIajUenHHNabI
 DQhHkAFOrqq9FeW7Nh/v38P3r6+1VS35jhsUaDuKakx4MmNeLuY4iaEfLUv+ggUKbCDb
 aY7FI4GzWD1A2zPiFimAgMUbL4LQiSGDUXk6D7EHX99W2g5VXF5bayJPKONnaO6OrAls
 iiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+larJ7nq7JK1vyPKnLdToeIWpVaeV3SSZmGzzK3NxpU=;
 b=iRHowjr0DRV9fwiMfRiFTi1nmtrdgsjMeLPBYvCWyVbp+wrrO0TO2KoV9pCXPBZ7MQ
 4zSigcXKzULI+sAtFP5/JqvLGVpr/GoJqa+Xfh45ISKVK2m80eDgU0KyRtA8xTzVvxvN
 fklGAAN+X0cQIE9HXlXBbgG4NPN9hQfqwO5m4ewbf0bRpD1zDntv7c6oLC/STwZ9A+9G
 0+oyYGMmbO/zb1YxczRK3vKmuidWePNUC2rvILkFQTndL2lRCtF8SkUvnbnLUTUHGyl1
 gy2KPFaBz7FzxYaA6gK2urL1rdRO3xO2K0ta0kYzjCPvgo4fdzMsAvSil/J90InUr2UG
 WU+A==
X-Gm-Message-State: AOAM532cJvcBBI7Qt28kOMzHsY2+mOKvTRwWTz92OYsSrnoNFqeg7iBW
 E6pPRxt602BhalcvKrBQkIs=
X-Google-Smtp-Source: ABdhPJx4xKspBjYM5xB7VxKTTQRn3YEwEqw+GFtULeIlQz+atvFBcYlqUBtJQqjFwCf15MlnwXTXkA==
X-Received: by 2002:a17:902:e2d2:b0:161:a6d8:3a0e with SMTP id
 l18-20020a170902e2d200b00161a6d83a0emr25833910plc.79.1653380613721; 
 Tue, 24 May 2022 01:23:33 -0700 (PDT)
Received: from [192.168.0.103] (39-13-101-104.adsl.fetnet.net. [39.13.101.104])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a938100b001d960eaed66sm1082449pjo.42.2022.05.24.01.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 01:23:33 -0700 (PDT)
Message-ID: <f64b1172-d9e8-e1ed-f90b-722147c213e2@gmail.com>
Date: Tue, 24 May 2022 16:23:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ASoC: nau8822: choose the best master clock prescalar
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220524033309.30289-1-hui.wang@canonical.com>
From: David Lin <ctlin0.linux@gmail.com>
In-Reply-To: <20220524033309.30289-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, David Lin <CTLIN0@nuvoton.com>, SJLIN0@nuvoton.com,
 kchsu0@nuvoton.com, YHCHuang@nuvoton.com
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

On 2022/5/24 上午 11:33, Hui Wang wrote:
> We have an imx6sx EVB with the codec nau8822, when playing the audio
> with 48k sample rate, the audio sounds distorted and obviously faster
> than expected.
>
> The codec input MCLK is 24000000Hz on our board, if the target sample
> rate is 48000Hz, with the current algorithm, the computed prescalar
> will result in 62500Hz, with the patched algorithm, the sample rate
> will be 46875Hz which is nearer the target sample rate.
>
> And for other sample rate like 44100, 22050, 11025 or 8000, the
> patched algorithm has no difference with the current algorithm, they
> will generate the same prescalar and the same sample rate.
>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/soc/codecs/nau8822.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> index 66bbd8f4f1ad..b67fdf64ddab 100644
> --- a/sound/soc/codecs/nau8822.c
> +++ b/sound/soc/codecs/nau8822.c
> @@ -668,21 +668,24 @@ static int nau8822_config_clkdiv(struct snd_soc_dai *dai, int div, int rate)
>   	struct snd_soc_component *component = dai->component;
>   	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
>   	struct nau8822_pll *pll = &nau8822->pll;
> +	int diff = INT_MAX;
>   	int i, sclk, imclk;
>   
>   	switch (nau8822->div_id) {
>   	case NAU8822_CLK_MCLK:
>   		/* Configure the master clock prescaler div to make system
>   		 * clock to approximate the internal master clock (IMCLK);
> -		 * and large or equal to IMCLK.
> +		 * and find the nearest value to IMCLK.
>   		 */
>   		div = 0;
>   		imclk = rate * 256;
>   		for (i = 1; i < ARRAY_SIZE(nau8822_mclk_scaler); i++) {
>   			sclk = (nau8822->sysclk * 10) /	nau8822_mclk_scaler[i];
> -			if (sclk < imclk)
> +			if (abs(sclk - imclk) < diff) {
> +				diff = abs(sclk - imclk);
> +				div =  i;
> +			} else
>   				break;
> -			div = i;
>   		}
>   		dev_dbg(component->dev, "master clock prescaler %x for fs %d\n",
>   			div, rate);
Regarding to your environment with input MCLK is 24 MHz, I think you 
should enable PLL for the internal process of codec.

So you should do the following calls/operations from machine driver.

//PLL
     ret = snd_soc_dai_set_sysclk(codec_dai, NAU8822_CLK_PLL,
                       24000000, SND_SOC_CLOCK_IN);
     if (ret < 0 )
         dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);

     ret = snd_soc_dai_set_pll(codec_dai, 0, 0,
                   24000000, 256 * params_rate(params));
     if (ret < 0 )

         dev_err(card->dev, "failed to set codec pll: %d\n", ret);

David
