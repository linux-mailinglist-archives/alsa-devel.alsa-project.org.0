Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 463EF3FD5BD
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 10:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67971765;
	Wed,  1 Sep 2021 10:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67971765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630485474;
	bh=nVuQUvoJEZbLulELeI+W+G9XG875NuDqoXfCdU7u6Gg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i2U91oZZy3lX7jpq2dg+1yubWw6+eblWI04uzyQviYLd56vGZVPyefvkE5OOmbLuF
	 17iq2Jjq0BLBgORmvXW5Brw06xItA9hCo9nJ3ZIAL3g+Ell9QIhzkAvSsjQlYBpQNq
	 WAAfiQXmk0w/FdUFvWTNbrbzJGvaLZGG1j8HOeMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 288D1F80256;
	Wed,  1 Sep 2021 10:36:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0343CF80254; Wed,  1 Sep 2021 10:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7867F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 10:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7867F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="z2bszKY/"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1818N5ed016055;
 Wed, 1 Sep 2021 10:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+kxNwSoYJZaoXdObemRa8WapvytEjrgDxqS8VXukWQc=;
 b=z2bszKY/bO8Kl13Tl85B0E22+MlFAqxURKP1zelLnAOw4Wn5f2wu7WlORJ/XTlSc7kA/
 Zf4t6cRJe/PnkWdVdy061zzjqAbWyOpBP5OfzLKpMWZtIeYozGks2106DUUfy5nZBRMb
 gCPMtuAkoVAX7IYYldkjUPSLlL3G0l/C0lvkYtb3XleS1pAAwGYEVcubkZKnEZLzKIAA
 x0vcW6nogFpUAqcgDTQYocFCXhHdSMs2ILiBR9YH3wJvvRjI2RF6HVhB5FLVvgoUbJkc
 Z9vo21vxulHxkFWGC1EEZY4DDcHS8Bn9UfYaO8bbbfEZmVaeBTy4Ixl5kCizinU2mv5N vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3at5y9033n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:36:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4339A100034;
 Wed,  1 Sep 2021 10:36:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 177932171D6;
 Wed,  1 Sep 2021 10:36:21 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 10:36:20 +0200
Subject: Re: [PATCH] ASoC: audio-graph: respawn Platform Support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <878s0jzrpf.wl-kuninori.morimoto.gx@renesas.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <c4032e3c-f983-3a18-cbbc-e1afdfc1d26c@foss.st.com>
Date: Wed, 1 Sep 2021 10:36:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <878s0jzrpf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_03,2021-08-31_01,2020-04-07_01
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

Thanks Kuninori

On 8/30/21 2:44 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit 63f2f9cceb09f8 ("ASoC: audio-graph: remove Platform support")
> removed Platform support from audio-graph, because it doesn't have
> "plat" support on DT (simple-card has).
> But, Platform support is needed if user is using
> snd_dmaengine_pcm_register() which adds generic DMA as Platform.
> And this Platform dev is using CPU dev.
> 
> Without this patch, at least STM32MP15 audio sound card is no more
> functional (v5.13 or later). This patch respawn Platform Support on
> audio-graph again.
> 
> Reported-by: Olivier MOYSAN <olivier.moysan@foss.st.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com

Tested-by: Olivier MOYSAN <olivier.moysan@foss.st.com>

> ---
> This patch needs Olivier's Tested-by
> 
>   sound/soc/generic/audio-graph-card.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 5e71382467e8..546f6fd0609e 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -285,6 +285,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>   	if (li->cpu) {
>   		struct snd_soc_card *card = simple_priv_to_card(priv);
>   		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
> +		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
>   		int is_single_links = 0;
>   
>   		/* Codec is dummy */
> @@ -313,6 +314,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>   			dai_link->no_pcm = 1;
>   
>   		asoc_simple_canonicalize_cpu(cpus, is_single_links);
> +		asoc_simple_canonicalize_platform(platforms, cpus);
>   	} else {
>   		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
>   		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
> @@ -366,6 +368,7 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
>   	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>   	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
>   	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
> +	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
>   	char dai_name[64];
>   	int ret, is_single_links = 0;
>   
> @@ -383,6 +386,7 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
>   		 "%s-%s", cpus->dai_name, codecs->dai_name);
>   
>   	asoc_simple_canonicalize_cpu(cpus, is_single_links);
> +	asoc_simple_canonicalize_platform(platforms, cpus);
>   
>   	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
>   	if (ret < 0)
> @@ -608,6 +612,7 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
>   
>   	li->num[li->link].cpus		= 1;
>   	li->num[li->link].codecs	= 1;
> +	li->num[li->link].platforms     = 1;
>   
>   	li->link += 1; /* 1xCPU-Codec */
>   
> @@ -630,6 +635,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
>   
>   	if (li->cpu) {
>   		li->num[li->link].cpus		= 1;
> +		li->num[li->link].platforms     = 1;
>   
>   		li->link++; /* 1xCPU-dummy */
>   	} else {
> 
