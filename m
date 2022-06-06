Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FE53EF21
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BBA01B44;
	Mon,  6 Jun 2022 22:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BBA01B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654545814;
	bh=ht8ltP8Lh72mkZ64JEGJTFrPQhemNpUKLl3RPA6Okhs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ArZwIS1wyOlJURkexuNqucjKdupK6dQxrnDxCTOH5Mi57SSrbWM0taPyh7fGrjNYv
	 UpM6DhCSVAulAkTJfRwOM05cIA770M3jFifFtqT+BTCLCnQVFzLVd7SgyjNpTt5YZS
	 ZaGICBeAq6BVw5kfQL8vDa9kFscV7GnCj14+M+gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA16EF80310;
	Mon,  6 Jun 2022 22:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24070F8012A; Mon,  6 Jun 2022 22:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 907D0F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907D0F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SSEfx4qp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654545750; x=1686081750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ht8ltP8Lh72mkZ64JEGJTFrPQhemNpUKLl3RPA6Okhs=;
 b=SSEfx4qpVbxVKe0ow8c2My4SSGGVwEfpq2PEXsew26c4mS8OA/XaCv8e
 h+9szisKMvwF/Slhbks8BunBKVpSUXXeQKD4TGZ287tWDB3lNXVqy6BeD
 6hiW6MkiuA5Qimw7OWKBRi4buG+x5ck3ZD6jE2KYG8lSW9m/3OAfWU7RZ
 BOkaj3F/pCi72bRtJtK5aK0Br6cewJoVdCgJAZ3JmxGU7mf4a027k6tbd
 0UAvetX4s6CHObdS8vImpGCckv2qYn1yiOvzPryZhugBAqFQi4fKPoKdS
 0qxKhSrUwX6ct7ZOTfjlzQBmbAAQ5BrTjtSX4Sy87aXNsELwnzUwZ6jA+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="257131655"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="257131655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:02:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="532311999"
Received: from yantem-mobl9.amr.corp.intel.com (HELO [10.212.24.154])
 ([10.212.24.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:02:20 -0700
Message-ID: <8e1641d0-b081-6301-db94-2c026166079a@linux.intel.com>
Date: Mon, 6 Jun 2022 15:02:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220606191910.16580-6-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>
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


> + * Virtual FE/BE Playback Topology
> + * -------------------------------
> + *
> + * The platform driver has independent frontend and backend DAIs with the
> + * option of routing backends to any of the frontends. The platform
> + * driver configures the routing based on DPCM couplings in ASoC runtime
> + * structures, which in turn is determined from DAPM paths by ASoC. But the
> + * platform driver doesn't supply relevant DAPM paths and leaves that up for
> + * the machine driver to fill in. The filled-in virtual topology can be
> + * anything as long as a particular backend isn't connected to more than one
> + * frontend at any given time. (The limitation is due to the unsupported case
> + * of reparenting of live BEs.)
> + *
> + * The DAPM routing that this machine-level driver makes up has two use-cases
> + * in mind:
> + *
> + * - Using a single PCM for playback such that it conditionally sinks to either
> + *   speakers or headphones based on the plug-in state of the headphones jack.
> + *   All the while making the switch transparent to userspace. This has the
> + *   drawback of requiring a sample stream suited for both speakers and
> + *   headphones, which is hard to come by on machines where tailored DSP for
> + *   speakers in userspace is desirable or required.
> + *
> + * - Driving the headphones and speakers from distinct PCMs, having userspace
> + *   bridge the difference and apply different signal processing to the two.
> + *
> + * In the end the topology supplied by this driver looks like this:
> + *
> + *  PCMs (frontends)                   I2S Port Groups (backends)
> + *  ────────────────                   ──────────────────────────
> + *
> + *  ┌──────────┐       ┌───────────────► ┌─────┐     ┌──────────┐
> + *  │ Primary  ├───────┤                 │ Mux │ ──► │ Speakers │
> + *  └──────────┘       │    ┌──────────► └─────┘     └──────────┘
> + *                ┌─── │ ───┘             ▲
> + *  ┌──────────┐  │    │                  │
> + *  │Secondary ├──┘    │     ┌────────────┴┐
> + *  └──────────┘       ├────►│Plug-in Demux│
> + *                     │     └────────────┬┘
> + *                     │                  │
> + *                     │                  ▼
> + *                     │                 ┌─────┐     ┌──────────┐
> + *                     └───────────────► │ Mux │ ──► │Headphones│
> + *                                       └─────┘     └──────────┘
> + */

In Patch2, the 'clusters' are described as front-ends, with I2S as
back-ends. Here the PCMs are described as front-ends, but there's no
mention of clusters. Either one of the two descriptions is outdated, or
there's something missing to help reconcile the two pieces of information?


> +static int macaudio_copy_link(struct device *dev, struct snd_soc_dai_link *target,
> +			       struct snd_soc_dai_link *source)
> +{
> +	memcpy(target, source, sizeof(struct snd_soc_dai_link));
> +
> +	target->cpus = devm_kcalloc(dev, target->num_cpus,
> +				sizeof(*target->cpus), GFP_KERNEL);
> +	target->codecs = devm_kcalloc(dev, target->num_codecs,
> +				sizeof(*target->codecs), GFP_KERNEL);
> +	target->platforms = devm_kcalloc(dev, target->num_platforms,
> +				sizeof(*target->platforms), GFP_KERNEL);
> +
> +	if (!target->cpus || !target->codecs || !target->platforms)
> +		return -ENOMEM;
> +
> +	memcpy(target->cpus, source->cpus, sizeof(*target->cpus) * target->num_cpus);
> +	memcpy(target->codecs, source->codecs, sizeof(*target->codecs) * target->num_codecs);
> +	memcpy(target->platforms, source->platforms, sizeof(*target->platforms) * target->num_platforms);


use devm_kmemdup?

> +
> +	return 0;
> +}

> +static int macaudio_get_runtime_mclk_fs(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dpcm *dpcm;
> +
> +	/*
> +	 * If this is a FE, look it up in link_props directly.
> +	 * If this is a BE, look it up in the respective FE.
> +	 */
> +	if (!rtd->dai_link->no_pcm)
> +		return ma->link_props[rtd->dai_link->id].mclk_fs;
> +
> +	for_each_dpcm_fe(rtd, substream->stream, dpcm) {
> +		int fe_id = dpcm->fe->dai_link->id;
> +
> +		return ma->link_props[fe_id].mclk_fs;
> +	}

I am not sure what the concept of mclk would mean for a front-end? This
is typically very I2S-specific, i.e. a back-end property, no?

> +
> +	return 0;
> +}
> +
> +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int mclk_fs = macaudio_get_runtime_mclk_fs(substream);
> +	int i;
> +
> +	if (mclk_fs) {
> +		struct snd_soc_dai *dai;
> +		int mclk = params_rate(params) * mclk_fs;
> +
> +		for_each_rtd_codec_dais(rtd, i, dai)
> +			snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);
> +
> +		snd_soc_dai_set_sysclk(cpu_dai, 0, mclk, SND_SOC_CLOCK_OUT);
> +	}
> +
> +	return 0;
> +}
> +
> +static void macaudio_dpcm_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *dai;
> +	int mclk_fs = macaudio_get_runtime_mclk_fs(substream);
> +	int i;
> +
> +	if (mclk_fs) {
> +		for_each_rtd_codec_dais(rtd, i, dai)
> +			snd_soc_dai_set_sysclk(dai, 0, 0, SND_SOC_CLOCK_IN);
> +
> +		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
> +	}
> +}
> +
> +static const struct snd_soc_ops macaudio_fe_ops = {
> +	.shutdown	= macaudio_dpcm_shutdown,
> +	.hw_params	= macaudio_dpcm_hw_params,
> +};
> +
> +static const struct snd_soc_ops macaudio_be_ops = {
> +	.shutdown	= macaudio_dpcm_shutdown,
> +	.hw_params	= macaudio_dpcm_hw_params,
> +};
> +
> +static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +	struct snd_soc_dai *dai;
> +	unsigned int mask;
> +	int nslots, ret, i;
> +
> +	if (!props->tdm_mask)
> +		return 0;
> +
> +	mask = props->tdm_mask;
> +	nslots = __fls(mask) + 1;
> +
> +	if (rtd->num_codecs == 1) {
> +		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), mask,
> +					       0, nslots, MACAUDIO_SLOTWIDTH);
> +
> +		/*
> +		 * Headphones get a pass on -EOPNOTSUPP (see the comment
> +		 * around mclk_fs value for primary FE).
> +		 */
> +		if (ret == -EOPNOTSUPP && props->is_headphones)
> +			return 0;
> +
> +		return ret;
> +	}
> +
> +	for_each_rtd_codec_dais(rtd, i, dai) {
> +		int slot = __ffs(mask);
> +
> +		mask &= ~(1 << slot);
> +		ret = snd_soc_dai_set_tdm_slot(dai, 1 << slot, 0, nslots,
> +					       MACAUDIO_SLOTWIDTH);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int macaudio_be_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +	struct snd_soc_dai *dai;
> +	int i, ret;
> +
> +	ret = macaudio_be_assign_tdm(rtd);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (props->is_headphones) {
> +		for_each_rtd_codec_dais(rtd, i, dai)
> +			snd_soc_component_set_jack(dai->component, &ma->jack, NULL);
> +	}

this is weird, set_jack() is invoked by the ASoC core. You shouldn't
need to do this?

> +
> +	return 0;
> +}
> +
> +static void macaudio_be_exit(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +	struct snd_soc_dai *dai;
> +	int i;
> +
> +	if (props->is_headphones) {
> +		for_each_rtd_codec_dais(rtd, i, dai)
> +			snd_soc_component_set_jack(dai->component, NULL, NULL);
> +	}

same, why is this needed?

> +}
> +
> +static int macaudio_fe_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +	int nslots = props->mclk_fs / MACAUDIO_SLOTWIDTH;
> +
> +	return snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), (1 << nslots) - 1,
> +					(1 << nslots) - 1, nslots, MACAUDIO_SLOTWIDTH);
> +}
> +
> +
> +static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
> +				void *data);
> +
> +static struct notifier_block macaudio_jack_nb = {
> +	.notifier_call = macaudio_jack_event,
> +};

why is this needed? we have already many ways of dealing with the jack
events (dare I say too many ways?).
> +
> +static int macaudio_probe(struct snd_soc_card *card)
> +{
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	ma->pin.pin = "Headphones";
> +	ma->pin.mask = SND_JACK_HEADSET | SND_JACK_HEADPHONE;
> +	ret = snd_soc_card_jack_new(card, ma->pin.pin,
> +			SND_JACK_HEADSET |
> +			SND_JACK_HEADPHONE |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +			&ma->jack, &ma->pin, 1);
> +
> +	if (ret < 0) {
> +		dev_err(card->dev, "jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	snd_soc_jack_notifier_register(&ma->jack, &macaudio_jack_nb);
> +
> +	return ret;
> +}
> +
> +static int macaudio_add_backend_dai_route(struct snd_soc_card *card, struct snd_soc_dai *dai,
> +					  bool is_speakers)
> +{
> +	struct snd_soc_dapm_route routes[2];
> +	int nroutes;
> +	int ret;

newline?

> +	memset(routes, 0, sizeof(routes));
> +
> +	dev_dbg(card->dev, "adding routes for '%s'\n", dai->name);
> +
> +	if (is_speakers)
> +		routes[0].source = "Speakers Playback";
> +	else
> +		routes[0].source = "Headphones Playback";
> +	routes[0].sink = dai->playback_widget->name;
> +	nroutes = 1;
> +
> +	if (!is_speakers) {
> +		routes[1].source = dai->capture_widget->name;
> +		routes[1].sink = "Headphones Capture";
> +		nroutes = 2;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, routes, nroutes);
> +	if (ret)
> +		dev_err(card->dev, "failed adding dynamic DAPM routes for %s\n",
> +			dai->name);
> +	return ret;
> +}
> +
> +static bool macaudio_match_kctl_name(const char *pattern, const char *name)
> +{
> +	if (pattern[0] == '*') {
> +		int namelen, patternlen;
> +
> +		pattern++;
> +		if (pattern[0] == ' ')
> +			pattern++;
> +
> +		namelen = strlen(name);
> +		patternlen = strlen(pattern);
> +
> +		if (namelen > patternlen)
> +			name += (namelen - patternlen);
> +	}
> +
> +	return !strcmp(name, pattern);
> +}
> +
> +static int macaudio_limit_volume(struct snd_soc_card *card,
> +				 const char *pattern, int max)
> +{
> +	struct snd_kcontrol *kctl;
> +	struct soc_mixer_control *mc;
> +	int found = 0;
> +
> +	list_for_each_entry(kctl, &card->snd_card->controls, list) {
> +		if (!macaudio_match_kctl_name(pattern, kctl->id.name))
> +			continue;
> +
> +		found++;
> +		dev_dbg(card->dev, "limiting volume on '%s'\n", kctl->id.name);
> +
> +		/*
> +		 * TODO: This doesn't decrease the volume if it's already
> +		 * above the limit!
> +		 */
> +		mc = (struct soc_mixer_control *)kctl->private_value;
> +		if (max <= mc->max)
> +			mc->platform_max = max;
> +
> +	}
> +
> +	return found;
> +}
> +
> +static int macaudio_late_probe(struct snd_soc_card *card)
> +{
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_pcm_runtime *rtd;
> +	struct snd_soc_dai *dai;
> +	int ret, i;
> +
> +	/* Add the dynamic DAPM routes */
> +	for_each_card_rtds(card, rtd) {
> +		struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +
> +		if (!rtd->dai_link->no_pcm)
> +			continue;
> +
> +		for_each_rtd_cpu_dais(rtd, i, dai) {
> +			ret = macaudio_add_backend_dai_route(card, dai, props->is_speakers);
> +
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	if (!ma->mdata) {
> +		dev_err(card->dev, "driver doesn't know speaker limits for this model\n");
> +		return void_warranty ? 0 : -EINVAL;
> +	}
> +
> +	macaudio_limit_volume(card, "* Amp Gain", ma->mdata->spk_amp_gain_max);
> +	return 0;
> +}
> +
> +static const char * const macaudio_plugin_demux_texts[] = {
> +	"Speakers",
> +	"Headphones"
> +};
> +
> +SOC_ENUM_SINGLE_VIRT_DECL(macaudio_plugin_demux_enum, macaudio_plugin_demux_texts);
> +
> +static int macaudio_plugin_demux_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(dapm->card);
> +
> +	/*
> +	 * TODO: Determine what locking is in order here...
> +	 */
> +	ucontrol->value.enumerated.item[0] = ma->jack_plugin_state;
> +
> +	return 0;
> +}
> +
> +static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
> +				void *data)
> +{
> +	struct snd_soc_jack *jack = data;
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(jack->card);
> +
> +	ma->jack_plugin_state = !!event;
> +
> +	if (!ma->plugin_demux_kcontrol)
> +		return 0;
> +
> +	snd_soc_dapm_mux_update_power(&ma->card.dapm, ma->plugin_demux_kcontrol,
> +				      ma->jack_plugin_state,
> +				      (struct soc_enum *) &macaudio_plugin_demux_enum, NULL);

the term 'plugin' can be understood in many ways by different audio
folks. 'plugin' is usually the term used for processing libraries (VST,
LADSPA, etc). I think here you meant 'jack control'?

> +
> +	return 0;
> +}
> +
