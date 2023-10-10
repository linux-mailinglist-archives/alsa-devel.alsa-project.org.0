Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA57BFE4B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE612151B;
	Tue, 10 Oct 2023 15:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE612151B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696945564;
	bh=9xPTWQGHuk7lel1oBbaTYPF5EiHw4wGQOqibEisQBec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HyVCk3TNQyXHK+i8hpxE1CAOSEtzxRQQ0/QBfmXlOryD3H1CmAWlYOWDd3aGn41vM
	 49EXudIyQ7S31gRc6F1wpiH7p/F3Nhz3iQHWBKpRMnBIQQJcpSLVSj55Ymx5Nj4qFo
	 bOT6JWKkTS07lY3yfA6LJzpzi4OLt3SCHggYNhPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6551F80552; Tue, 10 Oct 2023 15:44:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41631F80166;
	Tue, 10 Oct 2023 15:44:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC06F80310; Tue, 10 Oct 2023 15:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA2BF8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 15:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA2BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S9cE0MAM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696945483; x=1728481483;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9xPTWQGHuk7lel1oBbaTYPF5EiHw4wGQOqibEisQBec=;
  b=S9cE0MAMERON/RgOtOHvmrfPck3cVVoRPVqUNfLYCsnJLt2Ci1T3+7xF
   ftnKGJQmQExBDEIldXxxe/Rd7rC3eqtPZWhgWi5z90nAqp6A4Z4KBapnh
   ZL88ZXSlBAmGTCRoufiOv1Z32WY2ghIP2xmxZEZ4gLYbOBfq4MMt5EdWW
   jp7ocJyuzoc3LtP9eDQq/3tWMBrGfrW45sjoY7js9CmSYjmgx+J2Vr8f5
   moou3NZgNxcZbp2YEUTBQ1fkyCKR2rbPirfFGqTrxMPn8LKlO/s/SoiHb
   vuVdHguaf3C9VC+yH6nLUmK3n4lL5fcX1SlviyC3MOpv1Fei/O/30rGVb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369460345"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="369460345"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753412647"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="753412647"
Received: from sssodhi-mobl.amr.corp.intel.com (HELO [10.212.38.18])
 ([10.212.38.18])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:44:34 -0700
Message-ID: <9482b3be-7ef9-4eee-8cc0-bd677aa807b3@linux.intel.com>
Date: Tue, 10 Oct 2023 09:40:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
 <87a5sr8e7n.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87a5sr8e7n.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IUCZQAYQQT3IG4RY5IBPOKMRTQJHW2QE
X-Message-ID-Hash: IUCZQAYQQT3IG4RY5IBPOKMRTQJHW2QE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUCZQAYQQT3IG4RY5IBPOKMRTQJHW2QE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/9/23 21:21, Kuninori Morimoto wrote:
> Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
> but it is used for CPU < Codec case only. We want to use it for any case.
> 
> By this patch, not only N:M connection, but all existing connection
> (1:1, 1:N, N:N) will use same connection mapping.
> Because it will use default mapping, no conversion patch is needed
> to exising CPU/Codec drivers.
> 
> More over, CPU:Codec = M:N (M > N) also supported in the same time.
> 
> Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h              | 48 ++++++++++++++++--
>  sound/soc/intel/boards/sof_sdw.c | 14 +++---
>  sound/soc/soc-core.c             | 83 ++++++++++++++++++++++++++++++++
>  sound/soc/soc-dapm.c             | 47 +++++++-----------
>  sound/soc/soc-pcm.c              | 73 +++++++++++++++-------------
>  5 files changed, 191 insertions(+), 74 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 63b57f58cc569..13f1158df2b1e 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -655,8 +655,50 @@ struct snd_soc_dai_link_component {
>  	struct of_phandle_args *dai_args;
>  };
>  
> -struct snd_soc_dai_link_codec_ch_map {
> -	unsigned int connected_cpu_id;
> +/*
> + * [dai_link->ch_maps Image sample]
> + *
> + * CPU0 <---> Codec0
> + *
> + *	.ch_maps is from CPU
> + *
> + *	.num_cpus   = 1;
> + *	.num_codecs = 1;
> + *	.connected_node = [0];
> + *
> + * CPU0 <---> Codec_x
> + * CPU1 <---> Codec_y
> + * CPU2 <---> Codec_z
> + *
> + *	.ch_maps is from CPU
> + *
> + *	.num_cpus   = 3;
> + *	.num_codecs = 3;
> + *	.connected_node = [x, y, z];
> + *
> + * CPU0 <---> Codec_x
> + * CPU1 <-+-> Codec_y
> + * CPU2 <-/
> + *
> + *	.ch_maps is from CPU
> + *
> + *	.num_cpus   = 3;
> + *	.num_codecs = 2;
> + *	.connected_node = [x, y, y];
> + *
> + *
> + * CPU_x <---> Codec0
> + * CPU_y <-+-> Codec1
> + *	   \-> Codec2
> + *
> + *	.ch_maps is from Codec

how would we know what the convention is? Is this based on the largest
number of dais, so here num_codecs > num_cpus so we use a codec-centric
convention? That would be worth explaining in clear text

> + *
> + *	.num_cpus   = 2;
> + *	.num_codecs = 3;
> + *	.connected_node = [x, y, y];
> + */
> +struct snd_soc_dai_link_ch_map {
> +	unsigned int connected_node;

connected_node is a scalar here and an array above. maybe split this
patch between a rename and a functionality change?

>  	unsigned int ch_mask;
>  };
>  
> @@ -688,7 +730,7 @@ struct snd_soc_dai_link {
>  	struct snd_soc_dai_link_component *codecs;
>  	unsigned int num_codecs;
>  
> -	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
> +	struct snd_soc_dai_link_ch_map *ch_maps;
>  	/*
>  	 * You MAY specify the link's platform/PCM/DMA driver, either by
>  	 * device name, or by DT/OF node, but not both. Some forms of link
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index 226a74a4c340f..7927b729866d9 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -579,7 +579,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
>  	int i;
>  	int j;
>  
> -	if (!rtd->dai_link->codec_ch_maps)
> +	if (!rtd->dai_link->ch_maps)
>  		return 0;
>  
>  	/* Identical data will be sent to all codecs in playback */
> @@ -607,9 +607,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
>  	 */
>  	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
> -			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
> +			if (rtd->dai_link->ch_maps[j].connected_node != i)


>  				continue;
> -			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
> +			rtd->dai_link->ch_maps[j].ch_mask = ch_mask << (j * step);
>  		}
>  	}
>  	return 0;
> @@ -1350,7 +1350,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
>  	return 0;
>  }
>  
> -static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
> +static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
>  			    int codec_num, int cpu_num)
>  {
>  	int step;
> @@ -1358,7 +1358,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
>  
>  	step = codec_num / cpu_num;
>  	for (i = 0; i < codec_num; i++)
> -		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
> +		sdw_codec_ch_maps[i].connected_node = i / step;
>  }
>  
>  static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
> @@ -1453,7 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
>  		*ignore_pch_dmic = true;
>  
>  	for_each_pcm_streams(stream) {
> -		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
> +		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
>  		char *name, *cpu_name;
>  		int playback, capture;
>  		static const char * const sdw_stream_name[] = {
> @@ -1530,7 +1530,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
>  		dai_links[*link_index].nonatomic = true;
>  
>  		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
> -		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
> +		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
>  		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
>  					  playback, group_id, adr_index, dai_index);
>  		if (ret < 0) {
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index c305e94762c39..a4bb4c29331cf 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1824,6 +1824,84 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>  EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
>  #endif /* CONFIG_DMI */
>  
> +#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7

why 7?

> +static struct snd_soc_dai_link_ch_map default_connction_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {

typo: connection

this is repeated multiple times in comments below

> +	{ .connected_node = 0 },
> +	{ .connected_node = 1 },
> +	{ .connected_node = 2 },
> +	{ .connected_node = 3 },
> +	{ .connected_node = 4 },
> +	{ .connected_node = 5 },
> +	{ .connected_node = 6 },
> +};
> +static struct snd_soc_dai_link_ch_map default_connction_map2[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +	{ .connected_node = 0 },
> +};
> +
> +static int snd_soc_compensate_connection_map(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i, j, n, max;
> +
> +	/*
> +	 * dai_link->ch_maps indicates how CPU/Codec are connected.
> +	 * It will be a map seen from a larger number of DAI.
> +	 * see
> +	 *	soc.h :: [dai_link->ch_maps Image sample]
> +	 */
> +	for_each_card_prelinks(card, i, dai_link) {
> +
> +		/* it should have ch_maps if connection was N:M */
> +		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
> +		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
> +			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
> +				dai_link->name);
> +			return -EINVAL;
> +		}
> +
> +		/* do nothing if it has own maps */
> +		if (dai_link->ch_maps)
> +			goto sanity_check;
> +
> +		/* check default map size */
> +		if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
> +		    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
> +			dev_err(card->dev, "soc-core.c needs update default_connction_maps");
> +			return -EINVAL;
> +		}
> +
> +		/* Compensate missing map for ... */
> +		if (dai_link->num_cpus == dai_link->num_codecs)
> +			dai_link->ch_maps = default_connction_map1; /* for 1:1 or N:N */
> +		else
> +			dai_link->ch_maps = default_connction_map2; /* for 1:N or N:1 */
> +
> +sanity_check:
> +		if (dai_link->num_cpus >= dai_link->num_codecs) {
> +			n   = dai_link->num_cpus;
> +			max = dai_link->num_codecs;
> +		} else {
> +			n   = dai_link->num_codecs;
> +			max = dai_link->num_cpus;
> +		}
> +
> +		for (j = 0; j < n; j++)
> +			if (dai_link->ch_maps[j].connected_node >= max) {
> +				dev_err(card->dev, "strange connected_node (%d) was added to ch_maps",

maybe elaborate on what "strange" might mean so that average users can
figure this out?

> +					dai_link->ch_maps[j].connected_node);
> +				return -EINVAL;
> +			}
> +	}
> +
> +	return 0;
> +}
> +

