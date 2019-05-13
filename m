Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A37461B8CE
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 16:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B72916F0;
	Mon, 13 May 2019 16:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B72916F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557758649;
	bh=V85Hn4RLli199o8e2XppVBk44A/Qbo8XhPHA4vc7Knw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZMsHbv/l5u+jSo/M+OYOfYzSDMcR0+3UFIZIdem5he28Sr+Lqne/iwBSKoVTut6L
	 orw48uDyGbm6flYP2B18JrMTphL0MdqC7v2M2KtBXR4KBzsc7E1+kddWSVtKK5xQKr
	 dtie5VAd/LrCaE/FpuicDZSgcIkUxtHg1UxdpCKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B26F8961A;
	Mon, 13 May 2019 16:41:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE1FF89713; Mon, 13 May 2019 16:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=T_FILL_THIS_FORM_SHORT
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A832CF89633
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 16:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A832CF89633
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 07:41:37 -0700
X-ExtLoop1: 1
Received: from younghwa-mobl.amr.corp.intel.com (HELO [10.254.176.76])
 ([10.254.176.76])
 by fmsmga005.fm.intel.com with ESMTP; 13 May 2019 07:41:37 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87o94daivm.wl-kuninori.morimoto.gx@renesas.com>
 <87mujxaiuo.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ea411ee1-f3c9-c98e-48d2-005c9e7034fe@linux.intel.com>
Date: Mon, 13 May 2019 08:47:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87mujxaiuo.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc.h: add sound dai_link
	connection macro
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sorry about the delays in reviewing.

> +/*
> + * Sample 1 : Single CPU/Codec/Platform
> + *
> + * SND_SOC_DAILINK_DEFS(test,
> + *	DAILINK_COMPONENT_ARRAY(COMPONENT_FE("cpu_dai")),
> + *	DAILINK_COMPONENT_ARRAY(COMPONENT_BE("codec", "codec_dai")),
> + *	DAILINK_COMPONENT_ARRAY(COMPONENT_DMA("platform")));

the syntax looks fine, but the _FE/_BE/_DMA suffix is a bit misleading. 
The _FE in the examples is actually a DPCM BE, and the _BE is really a 
codec which isn't related to DPCM at all, and platform has typically 
nothing to do with DMA?

Why not keep the initial conventions and use e.g. COMPONENT_CPU, 
COMPONENT_CODEC, COMPONENT_PLATFORM to avoid introducing new concepts? 
If it's starting to be too many letters, then we can use the COMP 
acronym e.g DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai"))

Thanks
-Pierre




> + *
> + * struct snd_soc_dai_link link = {
> + *	...
> + *	SND_SOC_DAILINK_REG(test),
> + * };
> + *
> + * Sample 2 : Multi CPU/Codec, no Platform
> + *
> + * SND_SOC_DAILINK_DEFS(test,
> + *	DAILINK_COMPONENT_ARRAY(COMPONENT_FE("cpu_dai1"),
> + *				COMPONENT_FE("cpu_dai2")),
> + *	DAILINK_COMPONENT_ARRAY(COMPONENT_BE("codec1", "codec_dai1"),
> + *				COMPONENT_BE("codec2", "codec_dai2")));
> + *
> + * struct snd_soc_dai_link link = {
> + *	...
> + *	SND_SOC_DAILINK_REG(test),
> + * };
> + *
> + * Sample 3 : Define each CPU/Codec/Platform manually
> + *
> + * SND_SOC_DAILINK_DEF(test_cpu,
> + *		DAILINK_COMPONENT_ARRAY(COMPONENT_FE("cpu_dai1"),
> + *					COMPONENT_FE("cpu_dai2")));
> + * SND_SOC_DAILINK_DEF(test_codec,
> + *		DAILINK_COMPONENT_ARRAY(COMPONENT_BE("codec1", "codec_dai1"),
> + *					COMPONENT_BE("codec2", "codec_dai2")));
> + * SND_SOC_DAILINK_DEF(test_platform,
> + *		DAILINK_COMPONENT_ARRAY(COMPONENT_DMA("platform")));
> + *
> + * struct snd_soc_dai_link link = {
> + *	...
> + *	SND_SOC_DAILINK_REG(test_cpu,
> + *			    test_codec,
> + *			    test_platform),
> + * };
> + *
> + * Sample 4 : Sample3 without platform
> + *
> + * struct snd_soc_dai_link link = {
> + *	...
> + *	SND_SOC_DAILINK_REG(test_cpu,
> + *			    test_codec);
> + * };
> + */
> +
> +#define SND_SOC_DAILINK_REG1(name)	 SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
> +#define SND_SOC_DAILINK_REG2(cpu, codec) SND_SOC_DAILINK_REG3(cpu, codec, null_dailink_component)
> +#define SND_SOC_DAILINK_REG3(cpu, codec, platform)	\
> +	.cpus		= cpu,				\
> +	.num_cpus	= ARRAY_SIZE(cpu),		\
> +	.codecs		= codec,			\
> +	.num_codecs	= ARRAY_SIZE(codec),		\
> +	.platforms	= platform,			\
> +	.num_platforms	= ARRAY_SIZE(platform)
> +
> +#define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
> +#define SND_SOC_DAILINK_REG(...) \
> +	SND_SOC_DAILINK_REGx(__VA_ARGS__,		\
> +			SND_SOC_DAILINK_REG3,	\
> +			SND_SOC_DAILINK_REG2,	\
> +			SND_SOC_DAILINK_REG1)(__VA_ARGS__)
> +
> +#define SND_SOC_DAILINK_DEF(name, def...)		\
> +	static struct snd_soc_dai_link_component name[]	= { def }
> +
> +#define SND_SOC_DAILINK_DEFS(name, cpu, codec, platform...)	\
> +	SND_SOC_DAILINK_DEF(name##_cpus, cpu);			\
> +	SND_SOC_DAILINK_DEF(name##_codecs, codec);		\
> +	SND_SOC_DAILINK_DEF(name##_platforms, platform)
> +
> +#define DAILINK_COMPONENT_ARRAY(param...)	param
> +#define COMPONENT_EMPTY()			{ }
> +#define COMPONENT_FE(_dai)			{ .dai_name = _dai, }
> +#define COMPONENT_BE(_name, _dai)		{ .name = _name, .dai_name = _dai, }
> +#define COMPONENT_DMA(_name)			{ .name = _name }
> +#define COMPONENT_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
> +
> +extern struct snd_soc_dai_link_component null_dailink_component[0];
> +
> +
>   struct snd_soc_codec_conf {
>   	/*
>   	 * specify device either by device name, or by
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index f6765b0..dd0c625 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -58,6 +58,12 @@ static LIST_HEAD(unbind_card_list);
>   	list_for_each_entry(component, &component_list, list)
>   
>   /*
> + * This is used if driver don't need to have CPU/Codec/Platform
> + * dai_link. see soc.h
> + */
> +struct snd_soc_dai_link_component null_dailink_component[0];
> +
> +/*
>    * This is a timeout to do a DAPM powerdown after a stream is closed().
>    * It can be used to eliminate pops between different playback streams, e.g.
>    * between two audio tracks.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
