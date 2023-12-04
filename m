Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E522A803915
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 16:45:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3874E1CF;
	Mon,  4 Dec 2023 16:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3874E1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701704728;
	bh=h+fRmwdJ3lLFam152dl7FDYb5vt6e9krqdGA0C0vdT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZG2UkUO4QmL8WMdFg1FItwMGoRRPKcm6N89NdQrCUwi8PpB5pkADLzGaqGMwZkDQ
	 +28NeZROlQsYMDpf8dil8qYrc7a9ktb8+SGHN1VBChk9UFTpNN7yZuintKX+hMw59I
	 fGh1ExzMENM3PqpMTPQuVXQB1/DOn5RSE0EWEFfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B09F80579; Mon,  4 Dec 2023 16:44:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF90F80578;
	Mon,  4 Dec 2023 16:44:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80D75F8024E; Mon,  4 Dec 2023 16:44:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 051BEF800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 16:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051BEF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GlyIMcr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701704686; x=1733240686;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h+fRmwdJ3lLFam152dl7FDYb5vt6e9krqdGA0C0vdT4=;
  b=GlyIMcr7A47rGdawlqxla7CgRTwb5/dmqH5elhBUyVgqI8vjpLNpMCF0
   VCMz6frTbF8jcxBzMM0LUzbSKts9uwIOLuqI2WUt0I+MQAQsHqpFZ8FRH
   pMNSe6ZjPgEJBRdfJyE9pzaN5DdSVsde8Swc/sOGpa3Jhxa+ZDVqJfKii
   Xz/3s1DldmbgbeyaHchOFlbqBsNpME4/DW5Xxx+9vhdmXKAaY89l87eDp
   0rudikiyzZvija5l4RGfR8BAJJ9/5fnqiCbAcYO0FEJ6MDJxhtn9qs2ya
   FT4QB9u5XnQQvo3neA9V7uhqwMlmgLsI2Xj+hDMoHkUGWT9M2DsA/uhUx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="795568"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600";
   d="scan'208";a="795568"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 07:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914474893"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600";
   d="scan'208";a="914474893"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 07:44:40 -0800
Message-ID: <053ec252-e4df-4ccb-80fd-a802dd212b15@linux.intel.com>
Date: Mon, 4 Dec 2023 16:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
 <87bkb6bvn9.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87bkb6bvn9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5HB4SMXOELDP2GLFOPBKL3HF2ZJUMGYD
X-Message-ID-Hash: 5HB4SMXOELDP2GLFOPBKL3HF2ZJUMGYD
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HB4SMXOELDP2GLFOPBKL3HF2ZJUMGYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/4/2023 2:31 AM, Kuninori Morimoto wrote:
> Many ASoC drivers define CPU/Codec/Platform dai_link by below macro.
> 
> 	SND_SOC_DAILINK_DEFS(link,
> (A)		     DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai")),
> (B)		     DAILINK_COMP_ARRAY(COMP_CODEC("codec", "dai1"),
> (B)					COMP_CODEC("codec", "dai2")),
> (C)		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> In this case, this macro will be converted to like below
> 
> 	[o] = static struct snd_soc_dai_link_component
> 
> (A)	[o] link_cpus[]      = {{ .dai_name = "cpu_dai" }};
> (B)	[o] link_codecs[]    = {{ .dai_name = "dai1", .name = "codec" },
> 				{ .dai_name = "dai2", .name = "codec" }}
> (C)	[o] link_platforms[] = {{ }};
> 
> CPU and Codec info will be filled by COMP_CPU() / COMP_CODEC (= A,B),
> and Platform will have empty data by COMP_EMPTY() (= C) in this case.
> 
> Platform empty info will be filled when driver probe()
> (most of case, CPU info will be copied to use soc-generic-dmaengine-pcm).
> 
> For example in case of DPCM FE/BE, it will be like below.
> Codec will be dummy Component / DAI in this case (X).
> 
> 	SND_SOC_DAILINK_DEFS(link,
> 		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
> (X)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> (X) part will converted like below
> 
> 	[o] link_codecs[]    = {{ .name = "snd-soc-dummy",
> 				  .dai_name = "snd-soc-dummy-dai", }}
> 
> Even though we already have common asoc_dummy_dlc for dummy
> Component / DAI, this macro will re-create new dummy dlc.
> Some drivers defines many dai_link info via SND_SOC_DAILINK_DEFS(),
> this means many dummy dlc also will be re-created. This is waste of
> memory.
> 
> If we can use existing common asoc_dummy_dlc at (X),
> we can avoid to re-creating dummy dlc, then, we can save the memory.
> 
> At that time, we want to keep existing code as much as possible, because
> too many drivers are using this macro. But because of its original style,
> using common asoc_dummy_dlc from it is very difficult or impossible.
> 
> So let's change the mind. The macro is used like below
> 
> 	SND_SOC_DAILINK_DEFS(link,
> 		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
> (x)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> 	static struct snd_soc_dai_link dai_links[] = {
> 	{
> 		.name = ...,
> 		.stream_name = ...,
> (y)		SND_SOC_DAILINK_REG(link),
> 	},
> 
> (y) part will be like below
> 
>          static struct snd_soc_dai_link dai_links[] = {
>          {
>                  .name = ...,
>                  .stream_name = ...,
>   ^		...
>   |		.codecs		= link_codecs,
> (y)		.num_codecs	= ARRAY_SIZE(link_codecs),
>   v		...
> 	}
> 
> This patch try to use trick on COMP_DUMMY()
> 
> -	#define COMP_DUMMY()	{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
> +	#define COMP_DUMMY()
> 
> By this tric, (x) part will be like below.
> 
> before
> 	[o] link_codecs[] = {{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }}
> after
> 	[o] link_codecs[] = { };
> 
> This is same as below
> 
> 	[o] link_codecs[0];
> 
> This means it has pointer (link_codecs), but the array size is 0.
> (y) part will be like below.
> 
> 	static struct snd_soc_dai_link dai_links[] = {
> 	{
> 		...
> 		.codecs		= link_codecs,
> 		.num_codecs	= 0,
> 		...
> 	},
> 
> This is very special settings that normal use usually not do,
> but new macro do.
> We can find this special settings on soc-core.c and fill it as
> "dummy DAI" (= asoc_dummy_dlc). By this tric, we can avoid to re-create
> dummy dlc and save the memory.
> 
> This patch add tric at COMP_DUMMY() and add snd_soc_fill_dummy_dai()
> to fill dummy DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc.h  |  2 +-
>   sound/soc/soc-core.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index f3803c2dc349..7cbe85ca040d 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -938,7 +938,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
>   #define COMP_PLATFORM(_name)		{ .name = _name }
>   #define COMP_AUX(_name)			{ .name = _name }
>   #define COMP_CODEC_CONF(_name)		{ .name = _name }
> -#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
> +#define COMP_DUMMY()			/* see snd_soc_fill_dummy_dai() */

Isn't it effectively making COMP_DUMMY same as COMP_EMPTY, or am I not 
seeing something? I guess next step could be to just remove all 
COMP_DUMMY and replace them with COMP_EMPTY to avoid two definitions 
which are same thing?

>   
>   extern struct snd_soc_dai_link_component null_dailink_component[0];
>   extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 132946f82a29..88de4c5a376f 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -576,6 +576,34 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   	return NULL;
>   }
>   
> +static void snd_soc_fill_dummy_dai(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	/*
> +	 * COMP_DUMMY() creates size 0 array for CPU/Codec on dai_link.
> +	 * This function fill it as dummy DAI.
> +	 *
> +	 * size = 0, but has pointer means created by COMP_DUMMY()
> +	 */
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->num_cpus == 0 && dai_link->cpus) {
> +			dai_link->num_cpus	= 1;
> +			dai_link->cpus		= &snd_soc_dummy_dlc;
> +		}
> +		if (dai_link->num_codecs == 0 && dai_link->codecs) {
> +			dai_link->num_codecs	= 1;
> +			dai_link->codecs	= &snd_soc_dummy_dlc;
> +		}
> +		if (dai_link->num_platforms == 0 && dai_link->platforms) {
> +			dev_warn(card->dev, "platform don't need dummy Component/DAI\n");

I would just replace above print with code comment, no need to spam dmesg.

> +			dai_link->num_platforms	= 0;
> +			dai_link->platforms	= NULL;
> +		}
> +	}
> +}
> +
>   static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
>   {
>   	struct snd_soc_pcm_runtime *rtd;
> @@ -2131,6 +2159,8 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   	mutex_lock(&client_mutex);
>   	snd_soc_card_mutex_lock_root(card);
>   
> +	snd_soc_fill_dummy_dai(card);
> +
>   	snd_soc_dapm_init(&card->dapm, card, NULL);
>   
>   	/* check whether any platform is ignore machine FE and using topology */

