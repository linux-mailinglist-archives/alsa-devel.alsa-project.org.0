Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E65E3F882C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 14:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4382C16A6;
	Thu, 26 Aug 2021 14:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4382C16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629982651;
	bh=Uaf+6VPcK/+1n1/6ghx8OsoHf1Qlc3Zzn6OiuRIbBeY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XlUDWyE/BKW8DYBMghHNrTTFJrxbFShNAk95EL7RTaenlwJKyu+wGBnGAvIvt9R9O
	 HD+i7aIniMTVqnEuk42o/c+p1HnGkgROwvRffxoiWyTEXnsRIeDhlsz3+Q6xsFWNq3
	 DqjrgI2H33PwXcYSaSIviQL2sD0batQyF7ayElqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E53EF800FD;
	Thu, 26 Aug 2021 14:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B367EF8020C; Wed, 25 Aug 2021 09:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 379B9F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 09:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379B9F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="O6AhOMUC"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P06RWH020057;
 Wed, 25 Aug 2021 09:18:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=maUQzvvOkFz82xwKHUYLuPBuW4OzTUvm496H7RaoqwY=;
 b=O6AhOMUClfkoQIcfSAL1GTu9j98x2UzjXysV+lEUPfOOklH3kjMXhk85ywIm21xUnmqJ
 eveENb7zTJWfyfIjNWCAsunvNpLYLBj/OndoQcl2cGuL8mhMg5rLOKh1sK6DYfOIf3rl
 esnOiG6dgAe1u7W6JC14QhPStmDTjI1Dv+flXgq0xC6b0GofMiRXSzsHG/EfHBYTaj7n
 1abWTRx4njvIWPvgUihGbKZ/DTpJWfLeJicfpowTl/eY4WhEVCkj8B3CCEthYAfctDed
 S/QQ+lT1mpQgDDHqBIcWWQPmSvrkDwo82jzg9b08hwZVSjnakZS2RDQLFOU7YyuT/+OG bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3anb1d22kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 09:18:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC1D6100034;
 Wed, 25 Aug 2021 09:18:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23E7221F136;
 Wed, 25 Aug 2021 09:18:14 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 09:18:13 +0200
Subject: Re: [PATCH 6/6] ASoC: audio-graph: remove Platform support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <871rb758x7.wl-kuninori.morimoto.gx@renesas.com>
 <87sg3n3ubg.wl-kuninori.morimoto.gx@renesas.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <bc95a045-b370-8d7f-1167-34bd68e39165@foss.st.com>
Date: Wed, 25 Aug 2021 09:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87sg3n3ubg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_02,2021-08-25_01,2020-04-07_01
X-Mailman-Approved-At: Thu, 26 Aug 2021 14:56:12 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Hello Kuninori,

I have seen that the STM32MP15 audio sound card is no more functional 
with recent kernels (5.13 or 5.14)
The sound card is registered, but the all devices are issuing an error 
at runtime. These devices are using stm32_sai.c or stm32_i2s.c drivers.

I found that the regression is linked to the commit 
63f2f9cceb09f8e5f668e36c1cf764eea468ebed "ASoC: audio-graph: remove 
Platform support", as reverting this commit fixes the issue.

When the platform component is missing the pcm_construct ops in the pcm 
dmaengine, is never called, resulting in an incomplete initialization of 
the sound card.
I can't figure out what is the right way to handle this change, however.
Do I need to update the CPU drivers to work without a platform component
or does the audio-graph card has to be changed in some way ?
What do you mean "We can respawn it when we need it", in the commit 
message ?

Thanks for your help
regards
Olivier


On 4/19/21 4:02 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Platform was one of mandatory component on ASoC before,
> and audio-graph-card was assuming that CPU and Platform were
> same driver.
> 
> But it is no longer mandatory on ASoC.
> Current ASoC will just ignore if Platform and CPU were same
> or doplicated component.
> 
> Of course ASoC is supporting Platform, but current
> audio-graph-card doesn't support detecting it from DT.
> 
> This means current audio-graph-card operation for Platform so far
> is 100% useless. This patch removes it.
> We can respawn it when we need it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/generic/audio-graph-card.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 5594eab9902e..3c4915d1e528 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -223,7 +223,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>   	struct asoc_simple_dai *dai;
>   	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
>   	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
> -	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
>   	int ret;
>   
>   	port	= of_get_parent(ep);
> @@ -275,7 +274,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>   
>   		/* card->num_links includes Codec */
>   		asoc_simple_canonicalize_cpu(cpus, is_single_links);
> -		asoc_simple_canonicalize_platform(platforms, cpus);
>   	} else {
>   		struct snd_soc_codec_conf *cconf;
>   
> @@ -354,7 +352,6 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
>   	struct asoc_simple_dai *codec_dai = simple_props_to_dai_codec(dai_props, 0);
>   	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
>   	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
> -	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
>   	int ret, single_cpu = 0;
>   
>   	dev_dbg(dev, "link_of (%pOF)\n", cpu_ep);
> @@ -405,7 +402,6 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
>   	dai_link->init = asoc_simple_dai_init;
>   
>   	asoc_simple_canonicalize_cpu(cpus, single_cpu);
> -	asoc_simple_canonicalize_platform(platforms, cpus);
>   
>   	return 0;
>   }
> @@ -621,7 +617,6 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
>   
>   	li->num[li->link].cpus		= 1;
>   	li->num[li->link].codecs	= 1;
> -	li->num[li->link].platforms	= 1;
>   
>   	li->link += 1; /* 1xCPU-Codec */
>   
> @@ -644,7 +639,6 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
>   
>   	if (li->cpu) {
>   		li->num[li->link].cpus		= 1;
> -		li->num[li->link].platforms	= 1;
>   
>   		li->link++; /* 1xCPU-dummy */
>   	} else {
> 
