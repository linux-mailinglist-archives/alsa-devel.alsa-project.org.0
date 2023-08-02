Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792176FD8C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF546868;
	Fri,  4 Aug 2023 11:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF546868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691141979;
	bh=QmLEjHmQjYXBYbfS8YtV0wsxFPWd1wZLN+iru7YHABw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uWqNYv68PuRG9HS/26qdMWLELbPCN2GT+DP+4lbNLFXH+jqASa55grtej9wOf1yQM
	 04aw8Ku3TuaZUDO0aKc6U3C2gPDV7vD6YRSC3qa18cFhWVR/3zSaCFM3dbzlhmU/FD
	 UJSt39TvCFnxzG0/piNgw/vnGkYS29rTXlaU3XNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47061F8057B; Fri,  4 Aug 2023 11:37:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5F5F80580;
	Fri,  4 Aug 2023 11:37:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 143EFF801D5; Wed,  2 Aug 2023 03:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EEC4F80163
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 03:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EEC4F80163
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D5CE2807C;
	Wed,  2 Aug 2023 09:13:32 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 09:13:33 +0800
Received: from [192.168.125.113] (183.27.98.54) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 09:13:32 +0800
Message-ID: <403e68ca-a1be-b123-fe44-b658b2484c9f@starfivetech.com>
Date: Wed, 2 Aug 2023 09:13:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 31/38] ASoC: starfive: merge DAI call back functions into
 ops
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela
	<perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
 <871qgmtg5d.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <871qgmtg5d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FQPDSPMABJNQGLJMDRWJBO4P22R3SFUD
X-Message-ID-Hash: FQPDSPMABJNQGLJMDRWJBO4P22R3SFUD
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:37:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQPDSPMABJNQGLJMDRWJBO4P22R3SFUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/8/2 8:57, Kuninori Morimoto wrote:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge thesse into one.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/starfive/jh7110_tdm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
> index 705f1420097b..8c117794b028 100644
> --- a/sound/soc/starfive/jh7110_tdm.c
> +++ b/sound/soc/starfive/jh7110_tdm.c
> @@ -463,13 +463,6 @@ static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  	return 0;
>  }
>  
> -static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
> -	.startup	= jh7110_tdm_startup,
> -	.hw_params	= jh7110_tdm_hw_params,
> -	.trigger	= jh7110_tdm_trigger,
> -	.set_fmt	= jh7110_tdm_set_dai_fmt,
> -};
> -
>  static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> @@ -479,6 +472,14 @@ static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
>  	return 0;
>  }
>  
> +static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
> +	.probe		= jh7110_tdm_dai_probe,
> +	.startup	= jh7110_tdm_startup,
> +	.hw_params	= jh7110_tdm_hw_params,
> +	.trigger	= jh7110_tdm_trigger,
> +	.set_fmt	= jh7110_tdm_set_dai_fmt,
> +};
> +
>  #define JH7110_TDM_RATES	SNDRV_PCM_RATE_8000_48000
>  
>  #define JH7110_TDM_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
> @@ -502,7 +503,6 @@ static struct snd_soc_dai_driver jh7110_tdm_dai = {
>  		.formats        = JH7110_TDM_FORMATS,
>  	},
>  	.ops = &jh7110_tdm_dai_ops,
> -	.probe = jh7110_tdm_dai_probe,
>  	.symmetric_rate = 1,
>  };
>  

I'm fine with it.

Acked-by: Walker Chen <walker.chen@starfivetech.com>
