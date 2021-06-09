Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369B3A0D5E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 09:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B800016D3;
	Wed,  9 Jun 2021 09:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B800016D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623222802;
	bh=89wXSVQlS43EZyafg08NVPMM6xcIubSVLlwVUzy/v5g=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVAiSOKvUCXa1lgM023fZvcSQWXNDSM+ncgixMYbwL0jOXZAVqKZt9rtAqykvSe7X
	 x4kcL4QsgYhYLzmLtMKoRm3V3Wgtc+DkEsR1JXQht0JeBdckxiELKjbu4IFsUabj8K
	 ztvhlaPay/QhC6Z7FfBUMDUnIT4+0orNh/Xjq8pU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA91F800F4;
	Wed,  9 Jun 2021 09:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B5EF8026C; Wed,  9 Jun 2021 09:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22AE2F8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 09:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22AE2F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="swhdumkL"
Received: by mail-ej1-x636.google.com with SMTP id ci15so36776519ejc.10
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=EZJp9zOehIko5t4uubArbt+07NlOr9djpJPtl7qPgLs=;
 b=swhdumkLHlYoJCLgI24mR14Np3kR/+bmonVOf+HXAJ0g9Vx8S5qb/jcS4TvZ/PxE4M
 UQPBimvDHsNJ756SUjr1pVxxuhjg3nPH9WFq/kj6wLtVWilB6n1U2K3otkLp+aEEhMVq
 ZZUyX0GaC1eOMQsxfuAWO9UaZ+yMbjP60b74+/tVo6E/kHBTG3hG1IaZ3AoSYVMtP1NN
 aV/tcFEghrhBgTbZXprs8dGmjcc6K0VQY7N14LmlDFwpnrzTY/La26gwzpBi7uqUmyTC
 obyYgfVZRtLJdEmXxYs/jgrHBQpCmEzwf1SGZuWHC+qsG6wkdCvdF4Ftqemv/ZwTJbjJ
 139A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=EZJp9zOehIko5t4uubArbt+07NlOr9djpJPtl7qPgLs=;
 b=sVEsVpOgsjqavIqC7LDYOeRwQfZbfnH/P1ijumnS/Pju3sXysJp1qy3IxzgfoejUZL
 j6Ci3I6p6fyRRAukyWkhfkG+ekON7pBHcAkNp6Ks69G4q7VD1Ie2XvrC5NxNn395yyBd
 vOVPgnaOdjpDGNZhjm/K4vFWLadZ7dav9rQLIsfFgjivAHf0CHAj9qPkZjODnMlzwRqx
 VN59vTkVz43sWvS7HtmJ/9AGFrGSuDJahVkFXA+Ocw21D7PnsAyLtf4UxW5mdLYh5nM3
 3TPTNww+SR9R4MGxu47Terz9juagWdtjeB9qe4PFT4CSDyTBpaWoUSPyk6EIkNmkiMyn
 TA/A==
X-Gm-Message-State: AOAM5318wjSyCVYU4WEg7/ZWVsrPbPw7SggSYNfirSuyorcDRcpOVNMS
 vkbKy/quOtLjY7yyFIn14xikgg==
X-Google-Smtp-Source: ABdhPJxyyLoBglUWq3zI0nm/vqt7y01oL/+3wRRfAh0Hhb8ZiUOH+TYOEIdAF5uty/norNePPld8GQ==
X-Received: by 2002:a17:907:2149:: with SMTP id
 rk9mr11606ejb.229.1623222705582; 
 Wed, 09 Jun 2021 00:11:45 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id x3sm686556ejw.69.2021.06.09.00.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 00:11:45 -0700 (PDT)
References: <87czsvdc4o.wl-kuninori.morimoto.gx@renesas.com>
 <874ke7dbpj.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/8] ASoC: meson: switch to use
 snd_soc_daifmt_parse_format/clock_provider()
In-reply-to: <874ke7dbpj.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1ja6nz1phr.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 09 Jun 2021 09:11:44 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>
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


On Wed 09 Jun 2021 at 04:16, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switch to use snd_soc_daifmt_parse_format/clock_provider() from
> snd_soc_of_parse_daifmt().
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/meson-card-utils.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 300ac8be46ef..779ac282e36d 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -118,24 +118,25 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
>  	struct device_node *bitclkmaster = NULL;
>  	struct device_node *framemaster = NULL;
>  	unsigned int daifmt;
> +	unsigned int daiclk;

Why did you need to add this local ? 

>  
> -	daifmt = snd_soc_of_parse_daifmt(node, "",
> -					 &bitclkmaster, &framemaster);
> -	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
> +	daifmt = snd_soc_daifmt_parse_format(node, NULL);
> +
> +	snd_soc_daifmt_parse_clock_provider_as_phandle(node, NULL, &bitclkmaster, &framemaster);
>

Thanks for this

>  	/* If no master is provided, default to cpu master */
>  	if (!bitclkmaster || bitclkmaster == cpu_node) {
> -		daifmt |= (!framemaster || framemaster == cpu_node) ?
> +		daiclk = (!framemaster || framemaster == cpu_node) ?
>  			SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBS_CFM;
>  	} else {
> -		daifmt |= (!framemaster || framemaster == cpu_node) ?
> +		daiclk = (!framemaster || framemaster == cpu_node) ?
>  			SND_SOC_DAIFMT_CBM_CFS : SND_SOC_DAIFMT_CBM_CFM;
>  	}
>  
>  	of_node_put(bitclkmaster);
>  	of_node_put(framemaster);
>  
> -	return daifmt;
> +	return daifmt | daiclk;

These 3 last changes does seem to necessary

>  }
>  EXPORT_SYMBOL_GPL(meson_card_parse_daifmt);

