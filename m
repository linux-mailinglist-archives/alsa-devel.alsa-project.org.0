Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9A533EE2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8427D16F6;
	Wed, 25 May 2022 16:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8427D16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487905;
	bh=d4U1akJ30immRjUp+EMs18BTfYEpfiNrMRaUuPh7mU0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwLdaHzzCxh6+JpAX9aeGojp2+kjWrtYS6brJ0/cV+kMnJh7Htv4OOVrLuK40L2AA
	 +LAl9M8Az9idK0XwZDsFShSbqWHfqAPyCNmk/1q4fdNGcRrA+/Nx/rb7SKHKH0f15U
	 pXOJ/uz9OAYpkVIHJZVq6veP0P4SmhAIPJuZu1SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BA5F80539;
	Wed, 25 May 2022 16:08:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED861F804D1; Tue, 24 May 2022 10:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B64E3F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 10:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64E3F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LMaffPBD"
Received: by mail-pf1-x42b.google.com with SMTP id v11so15798392pff.6
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X3gS5w+yc+z8mlTwEJOM2B4Sxx9AktXCC3K5ZpOXIhU=;
 b=LMaffPBDwHynYXsfxp+uCT7ohVDVNK9Vjs4bhDm9AOuDGFs1AZjRzpTfbTHYnIK+ov
 NVzcFXBqxc6/ndYU6V5V8TL9xCsb8vTurdkl8Q/hg388qUY47UAwuivzPGNH/oS+p4mN
 FAr68T+aJBM07iAYphiomYFOzvcQRyA8nR1Kw2HrDr/4TRvrm3CxlerBSdlDHWFT0opk
 W1GaFiGzPkSkhsA6IYL9stCD9SfwYDh1Bhb0gLByES1+Z4T0pA982bmY9gdW//BcRzrb
 Tut5TXnn9f65K9kadu07Uk9U2UHRZAK2om4Sj/1loI2Tr7TG8OnyzB1Ch+r3z8ullmoe
 ad5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3gS5w+yc+z8mlTwEJOM2B4Sxx9AktXCC3K5ZpOXIhU=;
 b=fjAlLx3jaaQYa7DCB4evQ2LS+JCia5l229A+vBwUIMuj8/Lk7pcsV1n1suIf6ezINP
 a77jMqocsZNGxd0Wb2I+jeknEt1pX6BbQPAedIdsn8DTXB5/NqXdIaH/PKAWvoLAPWMS
 RIGXN9ZVU9E8IKJWVlBB70kqmaNle2rzC1/4ayR6sUklK0aZUZbcVVlLxEkSPXi87sNl
 LRdC0WGOcUhGMQiB1sa4nvmN+DzL6QUpW4GwtLdTXfu+oL5b00ibGxfmvf+Z3upvHvg1
 Nf9JbzT3GMWe622xd6bVw/xRVhVhiNo9rqKDYQ9TwdylnKmMTbco3PYbKasjcOv32AKm
 YiOQ==
X-Gm-Message-State: AOAM533QUw0zbV+4sWF/5ZAtKozI3yv9GMzXO2+Ev7JjbKdWgzUwUjVr
 aFKT7WIdhL01BK/4EymggLU=
X-Google-Smtp-Source: ABdhPJyPFNp8GhXOQqfZfybfGeEG25WGMp64GBhgC3/kKfvSDRePWJoSXuUO+u2BzEymVjz0xoZCGQ==
X-Received: by 2002:a65:6854:0:b0:3fa:ad92:15f0 with SMTP id
 q20-20020a656854000000b003faad9215f0mr1573022pgt.12.1653379677215; 
 Tue, 24 May 2022 01:07:57 -0700 (PDT)
Received: from [192.168.0.103] (39-13-101-104.adsl.fetnet.net. [39.13.101.104])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a928600b001df82551cf2sm1016181pjo.44.2022.05.24.01.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 01:07:56 -0700 (PDT)
Message-ID: <9e1eb15c-ca3a-dc04-1f8d-4ea71e32cce8@gmail.com>
Date: Tue, 24 May 2022 16:07:53 +0800
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
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
Cc: wtli@nuvoton.com, YHCHuang@nuvoton.com, SJLIN0@nuvoton.com,
 kchsu0@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

So you should do the following calls/operations:

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

