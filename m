Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985D130F0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 17:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5AE81821;
	Fri,  3 May 2019 17:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5AE81821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556896239;
	bh=F/xkro6GlzAXT+Ozxho+LGkRpoLfh3ck8nBZKWg+jjI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lf2kZsnF48f/8h0zT9SOZfLMw+GFzz5iDCCXnXQDX6lOAYrrHtNhsN8y3L9K+29r/
	 gZ6l9+b2Cnvm0ALH0ZF1WD5hlLav2yiNCaTTvLrgX2m52WNqW3Q+YursbZqOYqnnoy
	 6xrAWD1T7D8qFAZ7JPLaxztqfy7Tsps06aJkTYyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EAEF896CB;
	Fri,  3 May 2019 17:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43F7FF896CB; Fri,  3 May 2019 17:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 999C7F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 17:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999C7F80720
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 08:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,426,1549958400"; d="scan'208";a="145742423"
Received: from nzussbla-mobl.amr.corp.intel.com (HELO [10.254.111.239])
 ([10.254.111.239])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2019 08:09:29 -0700
To: Guenter Roeck <linux@roeck-us.net>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20180702155954.6722-1-liam.r.girdwood@linux.intel.com>
 <20190503132943.GA14550@roeck-us.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b244d8e8-7d91-868c-16a6-157dd3214316@linux.intel.com>
Date: Fri, 3 May 2019 10:09:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503132943.GA14550@roeck-us.net>
Content-Language: en-US
Cc: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: core: Allow topology to override
 machine driver FE DAI link config.
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



On 5/3/19 8:29 AM, Guenter Roeck wrote:
> On Mon, Jul 02, 2018 at 04:59:54PM +0100, Liam Girdwood wrote:
>> Machine drivers statically define a number of DAI links that currently
>> cannot be changed or removed by topology. This means PCMs and platform
>> components cannot be changed by topology at runtime AND machine drivers
>> are tightly coupled to topology.
>>
>> This patch allows topology to override the machine driver DAI link config
>> in order to reuse machine drivers with different topologies and platform
>> components. The patch supports :-
>>
>> 1) create new FE PCMs with a topology defined PCM ID.
>> 2) destroy existing static FE PCMs
>> 3) change the platform component driver.
>> 4) assign any new HW params fixups.
>> 5) assign a new card name prefix to differentiate this topology to userspace.
>>
>> The patch requires no changes to the machine drivers, but does add some
>> platform component flags that the platform component driver can assign
>> before loading topologies.
>>
> 
> This patch causes most Kabylake systems, specifically those utilizing
> kbl_rt5663_rt5514_max98927.c or kbl_da7219_max98927.c, to crash.

Guenter, can you confirm that Soraka is part of the list affected by 
this issue? It's the only device I have.

We are aware of issues on that platform with upstream code on the ssp 
fixup but were thinking it was topology related, so maybe we have a 
combination of issues... I recall Harsha (CC:ed) and team worked on this 
maybe around mid-November.

That piece of code making use of dpcm internal structures has been 
around since the initial submission in mid 2017, I am not sure what the 
idea was behind all these constraints.

> 
> Reason is that the fixup functions in those drivers expect params to be
> part of struct snd_soc_dpcm:
> 
> static int kabylake_ssp_fixup(..)
> {
> 	...
> 	struct snd_soc_dpcm *dpcm = container_of(
> 			params, struct snd_soc_dpcm, hw_params);
> 
> That is, however, not always the case with the new call path.
> 
> int soc_dai_hw_params(struct snd_pcm_substream *substream,
> ...
> 	/* perform any topology hw_params fixups before DAI  */
> 	if (rtd->dai_link->be_hw_params_fixup) {
> 		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
> 
> called from:
> 
> static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
> ...
> 	ret = soc_dai_hw_params(substream, &codec_params, codec_dai);
> 
> codec_params is a local variable, and container_of() on it points to some
> random location on the stack. Result is odd and random crashes in
> kabylake_ssp_fixup(), nad even if it doesn't crash the fixup doesn't work.
> 
> I have no idea how to fix the problem, unfortunately.
> 
> Guenter
> 
>> Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
>> ---
>>
>> Changes since V1.
>>    o Now iterate over component_list to fix crash with DT enumerated cards.
>>    o Make sure name prefix is only added once with deferred probiing.
>>
>>   include/sound/soc.h  |  13 ++++++
>>   sound/soc/soc-core.c | 101 +++++++++++++++++++++++++++++++++++++++++--
>>   sound/soc/soc-pcm.c  |  12 +++++
>>   3 files changed, 123 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/sound/soc.h b/include/sound/soc.h
>> index f7579f82cc00..b1d65fcb8756 100644
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -806,6 +806,14 @@ struct snd_soc_component_driver {
>>   	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
>>   	unsigned int endianness:1;
>>   	unsigned int non_legacy_dai_naming:1;
>> +
>> +	/* this component uses topology and ignore machine driver FEs */
>> +	const char *ignore_machine;
>> +	const char *topology_name_prefix;
>> +	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
>> +				  struct snd_pcm_hw_params *params);
>> +	bool use_dai_pcm_id;	/* use the DAI link PCM ID as PCM device number */
>> +	int be_pcm_base;	/* base device ID for all BE PCMs */
>>   };
>>   
>>   struct snd_soc_component {
>> @@ -963,6 +971,9 @@ struct snd_soc_dai_link {
>>   	/* pmdown_time is ignored at stop */
>>   	unsigned int ignore_pmdown_time:1;
>>   
>> +	/* Do not create a PCM for this DAI link (Backend link) */
>> +	unsigned int ignore:1;
>> +
>>   	struct list_head list; /* DAI link list of the soc card */
>>   	struct snd_soc_dobj dobj; /* For topology */
>>   };
>> @@ -1002,6 +1013,7 @@ struct snd_soc_card {
>>   	const char *long_name;
>>   	const char *driver_name;
>>   	char dmi_longname[80];
>> +	char topology_shortname[32];
>>   
>>   	struct device *dev;
>>   	struct snd_card *snd_card;
>> @@ -1011,6 +1023,7 @@ struct snd_soc_card {
>>   	struct mutex dapm_mutex;
>>   
>>   	bool instantiated;
>> +	bool topology_shortname_created;
>>   
>>   	int (*probe)(struct snd_soc_card *card);
>>   	int (*late_probe)(struct snd_soc_card *card);
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 4663de3cf495..38bf7d01894b 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -852,6 +852,9 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
>>   	const char *platform_name;
>>   	int i;
>>   
>> +	if (dai_link->ignore)
>> +		return 0;
>> +
>>   	dev_dbg(card->dev, "ASoC: binding %s\n", dai_link->name);
>>   
>>   	if (soc_is_dai_link_bound(card, dai_link)) {
>> @@ -1461,7 +1464,9 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
>>   {
>>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>>   	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>> -	int i, ret;
>> +	struct snd_soc_rtdcom_list *rtdcom;
>> +	struct snd_soc_component *component;
>> +	int i, ret, num;
>>   
>>   	dev_dbg(card->dev, "ASoC: probe %s dai link %d late %d\n",
>>   			card->name, rtd->num, order);
>> @@ -1507,9 +1512,28 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
>>   		soc_dpcm_debugfs_add(rtd);
>>   #endif
>>   
>> +	num = rtd->num;
>> +
>> +	/*
>> +	 * most drivers will register their PCMs using DAI link ordering but
>> +	 * topology based drivers can use the DAI link id field to set PCM
>> +	 * device number and then use rtd + a base offset of the BEs.
>> +	 */
>> +	for_each_rtdcom(rtd, rtdcom) {
>> +		component = rtdcom->component;
>> +
>> +		if (!component->driver->use_dai_pcm_id)
>> +			continue;
>> +
>> +		if (rtd->dai_link->no_pcm)
>> +			num += component->driver->be_pcm_base;
>> +		else
>> +			num = rtd->dai_link->id;
>> +	}
>> +
>>   	if (cpu_dai->driver->compress_new) {
>>   		/*create compress_device"*/
>> -		ret = cpu_dai->driver->compress_new(rtd, rtd->num);
>> +		ret = cpu_dai->driver->compress_new(rtd, num);
>>   		if (ret < 0) {
>>   			dev_err(card->dev, "ASoC: can't create compress %s\n",
>>   					 dai_link->stream_name);
>> @@ -1519,7 +1543,7 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
>>   
>>   		if (!dai_link->params) {
>>   			/* create the pcm */
>> -			ret = soc_new_pcm(rtd, rtd->num);
>> +			ret = soc_new_pcm(rtd, num);
>>   			if (ret < 0) {
>>   				dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
>>   				       dai_link->stream_name, ret);
>> @@ -1846,6 +1870,74 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>>   EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
>>   #endif /* CONFIG_DMI */
>>   
>> +static void soc_check_tplg_fes(struct snd_soc_card *card)
>> +{
>> +	struct snd_soc_component *component;
>> +	const struct snd_soc_component_driver *comp_drv;
>> +	struct snd_soc_dai_link *dai_link;
>> +	int i;
>> +
>> +	list_for_each_entry(component, &component_list, list) {
>> +
>> +		/* does this component override FEs ? */
>> +		if (!component->driver->ignore_machine)
>> +			continue;
>> +
>> +		/* for this machine ? */
>> +		if (strcmp(component->driver->ignore_machine,
>> +			   card->dev->driver->name))
>> +			continue;
>> +
>> +		/* machine matches, so override the rtd data */
>> +		for (i = 0; i < card->num_links; i++) {
>> +
>> +			dai_link = &card->dai_link[i];
>> +
>> +			/* ignore this FE */
>> +			if (dai_link->dynamic) {
>> +				dai_link->ignore = true;
>> +				continue;
>> +			}
>> +
>> +			dev_info(card->dev, "info: override FE DAI link %s\n",
>> +				 card->dai_link[i].name);
>> +
>> +			/* override platform component */
>> +			dai_link->platform_name = component->name;
>> +
>> +			/* convert non BE into BE */
>> +			dai_link->no_pcm = 1;
>> +
>> +			/* override any BE fixups */
>> +			dai_link->be_hw_params_fixup =
>> +				component->driver->be_hw_params_fixup;
>> +
>> +			/* most BE links don't set stream name, so set it to
>> +			 * dai link name if it's NULL to help bind widgets.
>> +			 */
>> +			if (!dai_link->stream_name)
>> +				dai_link->stream_name = dai_link->name;
>> +		}
>> +
>> +		/* Inform userspace we are using alternate topology */
>> +		if (component->driver->topology_name_prefix) {
>> +
>> +			/* topology shortname created ? */
>> +			if (!card->topology_shortname_created) {
>> +				comp_drv = component->driver;
>> +
>> +				snprintf(card->topology_shortname, 32, "%s-%s",
>> +					 comp_drv->topology_name_prefix,
>> +					 card->name);
>> +				card->topology_shortname_created = true;
>> +			}
>> +
>> +			/* use topology shortname */
>> +			card->name = card->topology_shortname;
>> +		}
>> +	}
>> +}
>> +
>>   static int snd_soc_instantiate_card(struct snd_soc_card *card)
>>   {
>>   	struct snd_soc_pcm_runtime *rtd;
>> @@ -1855,6 +1947,9 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>>   	mutex_lock(&client_mutex);
>>   	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
>>   
>> +	/* check whether any platform is ignore machine FE and using topology */
>> +	soc_check_tplg_fes(card);
>> +
>>   	/* bind DAIs */
>>   	for (i = 0; i < card->num_links; i++) {
>>   		ret = soc_bind_dai_link(card, &card->dai_link[i]);
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 153218aa4909..db51849ae9bd 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -865,8 +865,20 @@ int soc_dai_hw_params(struct snd_pcm_substream *substream,
>>   		      struct snd_pcm_hw_params *params,
>>   		      struct snd_soc_dai *dai)
>>   {
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>   	int ret;
>>   
>> +	/* perform any topology hw_params fixups before DAI  */
>> +	if (rtd->dai_link->be_hw_params_fixup) {
>> +		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev,
>> +				"ASoC: hw_params topology fixup failed %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	if (dai->driver->ops->hw_params) {
>>   		ret = dai->driver->ops->hw_params(substream, params, dai);
>>   		if (ret < 0) {
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
