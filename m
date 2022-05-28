Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116953748D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 09:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDA11AB7;
	Mon, 30 May 2022 09:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDA11AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653895326;
	bh=tatRnW+6yqId1U/sVr+3qb4BoLjUck7cL6S9wZkIHaQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvPxiw3RZfF7+gs59rtQ4DtyJt8VSyEX6FFfvU3QyK0g1bmiOqyRMcCCUQ64qH6BU
	 JqJCz4vvHAqF5rxSL+zvURKHx/n6OXTyj43KSbaaOlIggSyd2flUYMKCXRPjZ+CDPh
	 cxHMXjN2ZDzJjZ3HDUpzWQzm9LFgv6uztLVa41Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B097F804EC;
	Mon, 30 May 2022 09:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0AD4F80279; Sat, 28 May 2022 11:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB847F80124
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 11:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB847F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="emBIciAF"
Received: by mail-lj1-x22b.google.com with SMTP id a23so7114460ljd.9
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
 b=emBIciAFdQnHcKQSohgcuqMQM4xd/Tz5hPJWkxKaoqpZiunJ9s/OTs4WGMG95NSW4L
 IgZczc+9GJXxJcHaJPXn5wGWSwvNNr7NK0iPiKDna7ZgvHSU3H+3cqKDq++bLMIID/pg
 WGi2IGkojhYGQUTThKK+rMJIPdLBixIvgKrHxkmswTwOqRnEJD7L5yQqGEaEOrvK5lk+
 qkpbzv53N91WJdtTRf68St7YDzO4K7K4CZ379sj7xnW+IFrVVRAmkaJKxBPwkYKBzJkg
 l3Y5YpoNbKupcj3Ag1FqEF0wqmBD5ctEDUT8y+jgldf7YfuRmpnjc1XtWB+r4HJU6Val
 yWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
 b=GCbdac7N1W9wGG3QWFAgS5Hg2HEaiUWFIHh8RZDuF6XxgEUc0KszYlH1wwQoghSrDk
 51+1+4qCIPhcjqb1/SKMJNHUlzKt1XuNit9bccsWhT7u+1qRVqa9YjflNBnnKuzxg+hq
 4a42VGDwTTIrlD5tYeORlkIgVhXjUlZO6xirrUqgP0eQgqSnvNECv6pPjn8DjuPkg/Cb
 Wt92d2tGRX4vuXQNSeXEH8AIWUuohebo30+RC2/benbgm1Nq0dATY9aEPA26Voo+8S0j
 Brcfx/4IysJd5eRzp80S9GV6O7IhgXP5/wRmRH8oP76E5T+9rm4mdzqY7l6msf55vYjg
 fi/Q==
X-Gm-Message-State: AOAM533lzpEOrqARxRv+ZGT0Pg6Z/454sXSbpC/AvB4C8qWUrkhtXiiM
 gTX5Qct/Zsdd533lM5tSSJI=
X-Google-Smtp-Source: ABdhPJxNkzG4eousUKAj15zHH6g3YqSnU9H8B29bmyYBmgxkfeUg1JCXHoHxE95njq7TczFOLpZl7Q==
X-Received: by 2002:a2e:a5ca:0:b0:253:c604:647c with SMTP id
 n10-20020a2ea5ca000000b00253c604647cmr27577549ljp.403.1653729487689; 
 Sat, 28 May 2022 02:18:07 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2ea449000000b0024f3d1daee2sm1402828ljn.106.2022.05.28.02.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 02:18:07 -0700 (PDT)
Message-ID: <454f31e4-12ce-2bee-8e95-d75854b34380@gmail.com>
Date: Sat, 28 May 2022 12:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 09:20:34 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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



On 19/05/2022 18:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/ti/davinci-i2s.c   | 2 +-
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  sound/soc/ti/omap-mcbsp.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index c7368d5296688..fe572b720b094 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.prepare	= davinci_i2s_prepare,
>  	.trigger	= davinci_i2s_trigger,
>  	.hw_params	= davinci_i2s_hw_params,
> -	.set_fmt_new	= davinci_i2s_set_dai_fmt,
> +	.set_fmt	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
>  
>  };
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 961bac6963652..e2aab4729f3ab 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
>  	.trigger	= davinci_mcasp_trigger,
>  	.delay		= davinci_mcasp_delay,
>  	.hw_params	= davinci_mcasp_hw_params,
> -	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
> +	.set_fmt	= davinci_mcasp_set_dai_fmt,
>  	.set_clkdiv	= davinci_mcasp_set_clkdiv,
>  	.set_sysclk	= davinci_mcasp_set_sysclk,
>  	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 5bfb56d4ff844..58d8e200a7b97 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
>  	.trigger	= omap_mcbsp_dai_trigger,
>  	.delay		= omap_mcbsp_dai_delay,
>  	.hw_params	= omap_mcbsp_dai_hw_params,
> -	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
> +	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
>  	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
>  	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
>  };

-- 
Péter
