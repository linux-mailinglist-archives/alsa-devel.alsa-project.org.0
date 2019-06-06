Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCE137CFD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 21:10:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C59950;
	Thu,  6 Jun 2019 21:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C59950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559848245;
	bh=QiLKQ5FJthwNNsmdkuuAWIVlsmdh9rzugPaCaFZiTwQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pq1V1M6sucNLjS0nsEDcJV2Qdgf97p9dVmfo2O4YoVB/TDY4QuJbKu+1p0YBzM7Ag
	 GTt79s7MuVxR47RrYvue+iN5XP/EML4tQ91upjHMTVSviTyU8e8ZSf8kyo/JyY/9Iy
	 /PaYFx3itKd10Ur74zYOPNImhRaY2henCzsmKaGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD8EF896EF;
	Thu,  6 Jun 2019 21:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62AD8F896F7; Thu,  6 Jun 2019 21:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11074F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 21:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11074F8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 12:08:51 -0700
X-ExtLoop1: 1
Received: from spkavuly-mobl.amr.corp.intel.com (HELO [10.252.139.223])
 ([10.252.139.223])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2019 12:08:51 -0700
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87lfyfe4r3.wl-kuninori.morimoto.gx@renesas.com>
 <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900FE91@IRSMSX104.ger.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c0d5fa8a-ae0d-6d3c-b4a5-7010640683b8@linux.intel.com>
Date: Thu, 6 Jun 2019 14:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900FE91@IRSMSX104.ger.corp.intel.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 146/146] ASoC: soc-core: remove legacy
 style dai_link
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

Please don't top-post.

On 6/6/19 1:25 PM, Rojewski, Cezary wrote:
> Hmm, guess reviewing 001 proved redundant after all. Unless I got it wrong, you are removing code implemented in that very patch (the 001).

Not quite. There was already code to convert codecs and platforms to the 
new representation but the cpu part was missing. The first patch only 
deals with cpu dais. The last patch removes all the conversions for 
codec/platform/cpu and uses the new representation across the board, so 
there's more code removed in the last patch than added in the first.

> Any chance for eliminating ping-pong effect and doing the "right" changes from the get-go? Especially the renames are confusing here (s/cleanup_platform/cleanup_legacy/) if you intend to remove them soon after.

Using a ping-pong analogy for a 146-patch series is pushing it. It's 
first make then break to avoid bisect issues. And the names match what 
is used in the existing code. maybe the naming isn't to your liking but 
it's what has been used for a while.

Note that the last patch is going to break all the non-upstream machine 
drivers so you will have quite a bit of work to do on your own when you 
rebase.

> 
> If there is no other way around it and solution is accepted, a note, perhaps in 001 would be helpful for future readers.
> 
> Czarek
> 
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> All drivers switched to modern style dai_link
>> (= struct snd_soc_dai_link_component).
>> Let's remove legacy style dai_link.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>> include/sound/soc.h  |  65 ++------------------
>> sound/soc/soc-core.c | 165 +++------------------------------------------------
>> 2 files changed, 12 insertions(+), 218 deletions(-)
>>
>> diff --git a/include/sound/soc.h b/include/sound/soc.h
>> index 0fa79b8..055e6d0 100644
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -901,77 +901,33 @@ struct snd_soc_dai_link {
>> 	const char *stream_name;		/* Stream name */
>>
>> 	/*
>> -	 *	cpu_name
>> -	 *	cpu_of_node
>> -	 *	cpu_dai_name
>> -	 *
>> -	 * These are legacy style, and will be replaced to
>> -	 * modern style (= snd_soc_dai_link_component) in the future,
>> -	 * but, not yet supported so far.
>> -	 * If modern style was supported for CPU, all driver will switch
>> -	 * to use it, and, legacy style code will be removed from ALSA SoC.
>> -	 */
>> -	/*
>> 	 * You MAY specify the link's CPU-side device, either by device name,
>> 	 * or by DT/OF node, but not both. If this information is omitted,
>> 	 * the CPU-side DAI is matched using .cpu_dai_name only, which
>> hence
>> 	 * must be globally unique. These fields are currently typically used
>> 	 * only for codec to codec links, or systems using device tree.
>> 	 */
>> -	const char *cpu_name;
>> -	struct device_node *cpu_of_node;
>> 	/*
>> 	 * You MAY specify the DAI name of the CPU DAI. If this information is
>> 	 * omitted, the CPU-side DAI is matched using
>> .cpu_name/.cpu_of_node
>> 	 * only, which only works well when that device exposes a single DAI.
>> 	 */
>> -	const char *cpu_dai_name;
>> -
>> 	struct snd_soc_dai_link_component *cpus;
>> 	unsigned int num_cpus;
>>
>> 	/*
>> -	 *	codec_name
>> -	 *	codec_of_node
>> -	 *	codec_dai_name
>> -	 *
>> -	 * These are legacy style, it will be converted to modern style
>> -	 * (= snd_soc_dai_link_component) automatically in soc-core
>> -	 * if driver is using legacy style.
>> -	 * Driver shouldn't use both legacy and modern style in the same time.
>> -	 * If modern style was supported for CPU, all driver will switch
>> -	 * to use it, and, legacy style code will be removed from ALSA SoC.
>> -	 */
>> -	/*
>> 	 * You MUST specify the link's codec, either by device name, or by
>> 	 * DT/OF node, but not both.
>> 	 */
>> -	const char *codec_name;
>> -	struct device_node *codec_of_node;
>> 	/* You MUST specify the DAI name within the codec */
>> -	const char *codec_dai_name;
>> -
>> 	struct snd_soc_dai_link_component *codecs;
>> 	unsigned int num_codecs;
>>
>> 	/*
>> -	 *	platform_name
>> -	 *	platform_of_node
>> -	 *
>> -	 * These are legacy style, it will be converted to modern style
>> -	 * (= snd_soc_dai_link_component) automatically in soc-core
>> -	 * if driver is using legacy style.
>> -	 * Driver shouldn't use both legacy and modern style in the same time.
>> -	 * If modern style was supported for CPU, all driver will switch
>> -	 * to use it, and, legacy style code will be removed from ALSA SoC.
>> -	 */
>> -	/*
>> 	 * You MAY specify the link's platform/PCM/DMA driver, either by
>> 	 * device name, or by DT/OF node, but not both. Some forms of link
>> 	 * do not need a platform.
>> 	 */
>> -	const char *platform_name;
>> -	struct device_node *platform_of_node;
>> 	struct snd_soc_dai_link_component *platforms;
>> 	unsigned int num_platforms;
>>
>> @@ -1033,13 +989,6 @@ struct snd_soc_dai_link {
>> 	/* Do not create a PCM for this DAI link (Backend link) */
>> 	unsigned int ignore:1;
>>
>> -	/*
>> -	 * This driver uses legacy platform naming. Set by the core, machine
>> -	 * drivers should not modify this value.
>> -	 */
>> -	unsigned int legacy_platform:1;
>> -	unsigned int legacy_cpu:1;
>> -
>> 	struct list_head list; /* DAI link list of the soc card */
>> 	struct snd_soc_dobj dobj; /* For topology */
>> };
>> @@ -1699,15 +1648,11 @@ int
>> snd_soc_fixup_dai_links_platform_name(struct snd_soc_card *card,
>> 		if (!name)
>> 			return -ENOMEM;
>>
>> -		if (dai_link->platforms)
>> -			/* only single platform is supported for now */
>> -			dai_link->platforms->name = name;
>> -		else
>> -			/*
>> -			 * legacy mode, this case will be removed when all
>> -			 * derivers are switched to modern style dai_link.
>> -			 */
>> -			dai_link->platform_name = name;
>> +		if (!dai_link->platforms)
>> +			return -EINVAL;
>> +
>> +		/* only single platform is supported for now */
>> +		dai_link->platforms->name = name;
>> 	}
>>
>> 	return 0;
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index e069dfb..b28dda9 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -1052,167 +1052,18 @@ static void soc_remove_dai_links(struct
>> snd_soc_card *card)
>> 	}
>> }
>>
>> -static int snd_soc_init_cpu(struct snd_soc_card *card,
>> -			    struct snd_soc_dai_link *dai_link)
>> -{
>> -	struct snd_soc_dai_link_component *cpu = dai_link->cpus;
>> -
>> -	/*
>> -	 * REMOVE ME
>> -	 *
>> -	 * This is glue code for Legacy vs Modern dai_link.
>> -	 * This function will be removed if all derivers are switched to
>> -	 * modern style dai_link.
>> -	 * Driver shouldn't use both legacy and modern style in the same time.
>> -	 * see
>> -	 *	soc.h :: struct snd_soc_dai_link
>> -	 */
>> -	/* convert Legacy platform link */
>> -	if (!cpu) {
>> -		cpu = devm_kzalloc(card->dev,
>> -				   sizeof(struct snd_soc_dai_link_component),
>> -				   GFP_KERNEL);
>> -		if (!cpu)
>> -			return -ENOMEM;
>> -
>> -		dai_link->cpus		= cpu;
>> -		dai_link->num_cpus	= 1;
>> -		dai_link->legacy_cpu	= 1;
>> -
>> -		cpu->name	= dai_link->cpu_name;
>> -		cpu->of_node	= dai_link->cpu_of_node;
>> -		cpu->dai_name	= dai_link->cpu_dai_name;
>> -	}
>> -
>> -	if (!dai_link->cpus) {
>> -		dev_err(card->dev, "ASoC: DAI link has no CPUs\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int snd_soc_init_platform(struct snd_soc_card *card,
>> -				 struct snd_soc_dai_link *dai_link)
>> -{
>> -	struct snd_soc_dai_link_component *platform = dai_link->platforms;
>> -
>> -	/*
>> -	 * REMOVE ME
>> -	 *
>> -	 * This is glue code for Legacy vs Modern dai_link.
>> -	 * This function will be removed if all derivers are switched to
>> -	 * modern style dai_link.
>> -	 * Driver shouldn't use both legacy and modern style in the same time.
>> -	 * see
>> -	 *	soc.h :: struct snd_soc_dai_link
>> -	 */
>> -	/* convert Legacy platform link */
>> -	if (!platform) {
>> -		platform = devm_kzalloc(card->dev,
>> -				sizeof(struct snd_soc_dai_link_component),
>> -				GFP_KERNEL);
>> -		if (!platform)
>> -			return -ENOMEM;
>> -
>> -		dai_link->platforms	  = platform;
>> -		dai_link->num_platforms	  = 1;
>> -		dai_link->legacy_platform = 1;
>> -		platform->name		  = dai_link->platform_name;
>> -		platform->of_node	  = dai_link->platform_of_node;
>> -		platform->dai_name	  = NULL;
>> -	}
>> -
>> -	/* if there's no platform we match on the empty platform */
>> -	if (!platform->name &&
>> -	    !platform->of_node)
>> -		platform->name = "snd-soc-dummy";
>> -
>> -	return 0;
>> -}
>> -
>> -static void soc_cleanup_legacy(struct snd_soc_card *card)
>> -{
>> -	struct snd_soc_dai_link *link;
>> -	int i;
>> -	/*
>> -	 * FIXME
>> -	 *
>> -	 * this function should be removed with snd_soc_init_platform
>> -	 */
>> -
>> -	for_each_card_prelinks(card, i, link) {
>> -		if (link->legacy_platform) {
>> -			link->legacy_platform = 0;
>> -			link->platforms       = NULL;
>> -		}
>> -		if (link->legacy_cpu) {
>> -			link->legacy_cpu = 0;
>> -			link->cpus = NULL;
>> -		}
>> -	}
>> -}
>> -
>> -static int snd_soc_init_multicodec(struct snd_soc_card *card,
>> -				   struct snd_soc_dai_link *dai_link)
>> -{
>> -	/*
>> -	 * REMOVE ME
>> -	 *
>> -	 * This is glue code for Legacy vs Modern dai_link.
>> -	 * This function will be removed if all derivers are switched to
>> -	 * modern style dai_link.
>> -	 * Driver shouldn't use both legacy and modern style in the same time.
>> -	 * see
>> -	 *	soc.h :: struct snd_soc_dai_link
>> -	 */
>> -
>> -	/* Legacy codec/codec_dai link is a single entry in multicodec */
>> -	if (dai_link->codec_name || dai_link->codec_of_node ||
>> -	    dai_link->codec_dai_name) {
>> -		dai_link->num_codecs = 1;
>> -
>> -		dai_link->codecs = devm_kzalloc(card->dev,
>> -				sizeof(struct snd_soc_dai_link_component),
>> -				GFP_KERNEL);
>> -		if (!dai_link->codecs)
>> -			return -ENOMEM;
>> -
>> -		dai_link->codecs[0].name = dai_link->codec_name;
>> -		dai_link->codecs[0].of_node = dai_link->codec_of_node;
>> -		dai_link->codecs[0].dai_name = dai_link->codec_dai_name;
>> -	}
>> -
>> -	if (!dai_link->codecs) {
>> -		dev_err(card->dev, "ASoC: DAI link has no CODECs\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> +static struct snd_soc_dai_link_component dummy_link = COMP_DUMMY();
>>
>> static int soc_init_dai_link(struct snd_soc_card *card,
>> 			     struct snd_soc_dai_link *link)
>> {
>> -	int i, ret;
>> +	int i;
>> 	struct snd_soc_dai_link_component *codec;
>>
>> -	ret = snd_soc_init_cpu(card, link);
>> -	if (ret) {
>> -		dev_err(card->dev, "ASoC: failed to init cpu\n");
>> -		return ret;
>> -	}
>> -
>> -	ret = snd_soc_init_platform(card, link);
>> -	if (ret) {
>> -		dev_err(card->dev, "ASoC: failed to init multiplatform\n");
>> -		return ret;
>> -	}
>> -
>> -	ret = snd_soc_init_multicodec(card, link);
>> -	if (ret) {
>> -		dev_err(card->dev, "ASoC: failed to init multicodec\n");
>> -		return ret;
>> +	/* default Platform */
>> +	if (!link->platforms || !link->num_platforms) {
>> +		link->platforms = &dummy_link;
>> +		link->num_platforms = 1;
>> 	}
>>
>> 	for_each_link_codecs(link, i, codec) {
>> @@ -2059,7 +1910,7 @@ static void soc_check_tplg_fes(struct snd_soc_card
>> *card)
>> 				 card->dai_link[i].name);
>>
>> 			/* override platform component */
>> -			if (snd_soc_init_platform(card, dai_link) < 0) {
>> +			if (!dai_link->platforms) {
>> 				dev_err(card->dev, "init platform error");
>> 				continue;
>> 			}
>> @@ -2110,7 +1961,6 @@ static int soc_cleanup_card_resources(struct
>> snd_soc_card *card)
>> 	/* remove and free each DAI */
>> 	soc_remove_dai_links(card);
>> 	soc_remove_pcm_runtimes(card);
>> -	soc_cleanup_legacy(card);
>>
>> 	/* remove auxiliary devices */
>> 	soc_remove_aux_devices(card);
>> @@ -2867,7 +2717,6 @@ int snd_soc_register_card(struct snd_soc_card
>> *card)
>>
>> 		ret = soc_init_dai_link(card, link);
>> 		if (ret) {
>> -			soc_cleanup_legacy(card);
>> 			dev_err(card->dev, "ASoC: failed to init link %s\n",
>> 				link->name);
>> 			mutex_unlock(&client_mutex);
>> --
>> 2.7.4
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
