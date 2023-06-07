Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9972654E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 17:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DE0843;
	Wed,  7 Jun 2023 17:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DE0843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686153538;
	bh=Wan8PyW/zSLmtXBh3fweJVq6WoiC0LRbCWdSR5qb9rU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mTXfGLO24c3jjRdjV6SQIgOxHmSrqXBIa8J/ENRB24K6o2xYK6zKAoza/xeipQCR3
	 cbh3lxZaVfKS69jwQH7s5W/11rJ6MzKP8yxVspBbUhhkSZv7y16oLDG3uR9sclGfKM
	 H8fYWsQq/EN+ba3SuErjLDIfJSxenQbIFbnJdQs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65719F80564; Wed,  7 Jun 2023 17:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4AC2F8055C;
	Wed,  7 Jun 2023 17:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F8EF80548; Wed,  7 Jun 2023 17:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE706F8016C
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 17:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE706F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HA6o9eCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686153427; x=1717689427;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wan8PyW/zSLmtXBh3fweJVq6WoiC0LRbCWdSR5qb9rU=;
  b=HA6o9eCCxvj6wdTY26nS+NPA+Twq7Beg/IVWgR/DG5c/vWS8tJIvKfKV
   dNDL3XNH9atrlQ0rKmkeNq5i0AoVgmXRq0HTsWLkkkFq2cLdL6pihc3HP
   au0aqyHRVphyeDvooZPnWaw+rpu9zz9FZ+68m0h8zbFvGjfdJ8hAzfVH7
   LEzgq4Ss/oPl+Hik8AS0OGw8daz2nVe1XXVU8R7gw1BYpaMKegbNr1Uvc
   d0vIRMlzcFejvZT7O0PE8affZMpcqInV6Clc3Tks381ZzDMrhPQk8cqTh
   /j8SprxxKMK1AYXkOY/Y0Dp5/3jnECuqYBzvZxD0bVEybP+zkioAVG0OX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360360073"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="360360073"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739335802"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="739335802"
Received: from sorrin-mobl3.amr.corp.intel.com (HELO [10.209.124.63])
 ([10.209.124.63])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:52 -0700
Message-ID: <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
Date: Wed, 7 Jun 2023 10:10:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
Cc: alsa-devel@alsa-project.org, bard.liao@intel.com,
 - <patches@opensource.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SG3RGXIGBUEIFTBNRJV4CSOJASV6GA5I
X-Message-ID-Hash: SG3RGXIGBUEIFTBNRJV4CSOJASV6GA5I
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG3RGXIGBUEIFTBNRJV4CSOJASV6GA5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/23 04:29, Richard Fitzgerald wrote:
> On 07/06/2023 04:12, Bard Liao wrote:
>> Currently, ASoC supports dailinks with the following mappings: 1 cpu
>> DAI to N codec DAIs N cpu DAIs to N codec DAIs But the mapping
>> between N cpu DAIs and M codec DAIs is not supported. The reason is
>> that we didn't have a mechanism to map cpu and codec DAIs
>>
>> This series suggests a new snd_soc_dai_link_codec_ch_map struct in
>> struct snd_soc_dai_link{} which provides codec DAI to cpu DAI
>> mapping information used to implement N cpu DAIs to M codec DAIs
>> support.
>>
>> And add the codec_ch_maps to SOF SoundWire machine driver.
>>
> 
> I think there is a much simpler way to handle this. The existing ASoC
> code is trying to map CPU to CODEC to match the physical connection. But
> the physical connection is not important. The dailink represents the
> _logical_ link.

Humm, that's not really true. Each SoundWire link and the CPU DAI they
expose are handled by different auxiliary devices with their own
pm_runtime handling.

> You are declaring that all the CPU and CODEC in the dailink behave as a
> single logical link. So you can just connect all CPUs to all CODECS.
> 
> That also fixes a problem with the existing N CPU to N CODEC mapping. It
> assumes that means CPU0 is connected to CODEC0, CPU1 is connected to
> CODEC1, ... But that isn't necessarily true. You could have an N:N
> mapping where multiple CPUs have been combined to create a multi-channel
> stream that is sent to all CODECs. 

This is questionable when the CPUs are connected to different links.
SoundWire is not a giant switch matrix, there's a clear parent-child
dependency and limited scope.

Example topology for a 2 link/4 amplifier solution.

link1 CPU DAI1 - Codec1 DAI1 - Codec2 DAI1
link2 CPU DAI1 - Codec1 DAI1 - Codec2 DAI1

There is no physical or logical connection between link2 CPU DAI1 and
the two Codec1 DAI1 and Codec2 DAI1.

I don't think it's wise to make DAPM connections between devices that
are not on the same link. Each link is clock- and powered-managed
separately, I only see trouble ahead with such virtual connections.

But the existing N:N code won't hook
> that up correctly.
> 
> I suggest that the simple fix is this:
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 5d9a671e50f1..f4f955a991d5 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4423,8 +4423,8 @@ static void soc_dapm_dai_stream_event(struct
> snd_soc_dai *dai, int stream,
>  void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
>  {
>      struct snd_soc_pcm_runtime *rtd;
> -    struct snd_soc_dai *codec_dai;
> -    int i;
> +    struct snd_soc_dai *codec_dai, *cpu_dai;
> +    int i, j;
> 
>      /* for each BE DAI link... */
>      for_each_card_rtds(card, rtd)  {
> @@ -4435,17 +4435,9 @@ void snd_soc_dapm_connect_dai_link_widgets(struct
> snd_soc_card *card)
>          if (rtd->dai_link->dynamic)
>              continue;
> 
> -        if (rtd->dai_link->num_cpus == 1) {
> -            for_each_rtd_codec_dais(rtd, i, codec_dai)
> -                dapm_connect_dai_pair(card, rtd, codec_dai,
> -                              asoc_rtd_to_cpu(rtd, 0));
> -        } else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
> -            for_each_rtd_codec_dais(rtd, i, codec_dai)
> -                dapm_connect_dai_pair(card, rtd, codec_dai,
> -                              asoc_rtd_to_cpu(rtd, i));
> -        } else {
> -            dev_err(card->dev,
> -                "N cpus to M codecs link is not supported yet\n");
> +        for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +            for_each_rtd_cpu_dais(rtd, j, cpu_dai)
> +                dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
>          }
>      }
>  }
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 7958c9defd49..43b1166eb333 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2747,7 +2747,7 @@ static int soc_get_playback_capture(struct
> snd_soc_pcm_runtime *rtd,
>                      int *playback, int *capture)
>  {
>      struct snd_soc_dai *cpu_dai;
> -    int i;
> +    int i, j;
> 
>      if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
>          dev_err(rtd->dev,
> @@ -2801,22 +2801,14 @@ static int soc_get_playback_capture(struct
> snd_soc_pcm_runtime *rtd,
>              SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
> 
>          for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -            if (rtd->dai_link->num_cpus == 1) {
> -                cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -            } else if (rtd->dai_link->num_cpus ==
> rtd->dai_link->num_codecs) {
> -                cpu_dai = asoc_rtd_to_cpu(rtd, i);
> -            } else {
> -                dev_err(rtd->card->dev,
> -                    "N cpus to M codecs link is not supported yet\n");
> -                return -EINVAL;
> +            for_each_rtd_cpu_dais(rtd, j, cpu_dai) {
> +                if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_PLAYBACK) &&
> +                    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> +                    *playback = 1;
> +                if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_CAPTURE) &&
> +                    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> +                    *capture = 1;
>              }
> -
> -            if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_PLAYBACK) &&
> -                snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -                *playback = 1;
> -            if (snd_soc_dai_stream_valid(codec_dai,
> SNDRV_PCM_STREAM_CAPTURE) &&
> -                snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -                *capture = 1;
>          }
>      }
> 
