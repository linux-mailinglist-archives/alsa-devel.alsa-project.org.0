Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA108241AE2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765311668;
	Tue, 11 Aug 2020 14:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765311668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597148438;
	bh=iAQ/B01bh6p2og0ZULF1NAh+ITlvSZl27tcjQCovLJg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyDC8IMjG8wCoXReA0nCLkjNEx6qUsXii7UFLMS134ldBH16G0VWp5tPM3x+B8kZC
	 IQ7hp1KXEvrwvDf5tlFdRYdYfEmjQiETh+Us03JoIhYGdl2PB9B/wa80v7ZB+IC86y
	 B5oE9QvQTrwxCJXazbp+SsbZOD9VBja3GvJFGB8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 382A1F802DD;
	Tue, 11 Aug 2020 14:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE6DF802DC; Tue, 11 Aug 2020 14:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 416D0F80161
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 416D0F80161
IronPort-SDR: bdnY9HMFmyQ1Fy7BetfglExau4bVXhcNVL7JqE2FRxDh2IjgllMZLiKjOOGdn0C93oiqIY/3Gy
 Kuyx31X4wLFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="151153865"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="151153865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:17:34 -0700
IronPort-SDR: e+w56EaCtkjnuRHj9PSGBwkIvvJc8N5cjp6Vqc0pz/w85vTCEvmuwot+wZcTvChKS9IzqihTEC
 fmo1/ECqT/LQ==
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="495126800"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.154.141])
 ([10.249.154.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:17:30 -0700
Subject: Re: [PATCH v2 06/13] ASoC: Intel: catpt: PCM operations
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-7-cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <e02fc6e7-20aa-4977-d2a3-a78e3e696df2@linux.intel.com>
Date: Tue, 11 Aug 2020 14:17:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811100034.6875-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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



On 8/11/2020 12:00 PM, Cezary Rojewski wrote:
> DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
> i.e. all pipelines are already defined within firmware and host is
> relegated to allocing stream for predefined pins. This is represented by
> 'catpt_topology' member.
> 
> Implementation covers all available pin types:
> - system playback and capture
> - two offload streams
> - loopback (reference)
> - bluetooth playback and capture
> 
> PCM DAI operations differentiate between those pins as some (mainly
> offload) are to be handled differently - DSP expects wp updates on each
> notify_position notification.
> 
> System playback has no volume control capability as it is routed to
> mixer stream directly. Other primary streams - capture and two offloads
> - offer individual volume controls.
> 
> Compared to sound/soc/intel/haswell this configures SSP device format
> automatically on pcm creation.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---

...

> +
> +static int catpt_set_ctlvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol)
> +{
> +	u32 dspvol;
> +	int ret, i;
> +
> +	if (ctlvol[0] == ctlvol[1]) {

This check seems bit suspicious to me, as CATPT_CHANNELS_MAX is 4 and 
you only check 2 of possible values here, while in else part, you loop 
over all possible 4 to set them? So there is chance that ctlvol[0] is 
equal to ctlvol[1], but ctlvol[2] and ctlvol[3] are different, what 
happens then?

> +		dspvol = ctlvol_to_dspvol(ctlvol[0]);
> +
> +		ret = catpt_ipc_set_volume(cdev, stream_id,
> +					   CATPT_ALL_CHANNELS_MASK, dspvol,
> +					   0, CATPT_AUDIO_CURVE_NONE);
> +	} else {
> +		for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
> +			dspvol = ctlvol_to_dspvol(ctlvol[i]);
> +
> +			ret = catpt_ipc_set_volume(cdev, stream_id,
> +						   i, dspvol,
> +						   0, CATPT_AUDIO_CURVE_NONE);
> +			if (ret)
> +				goto exit;
> +		}
> +	}
> +exit:
> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +	return 0;
> +}
> +
> +static int catpt_volume_info(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = CATPT_CHANNELS_MAX;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = ARRAY_SIZE(volume_map) - 1;
> +	return 0;
> +}
> +
> +static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
> +	u32 dspvol;
> +	int i;
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
> +		dspvol = catpt_mixer_volume(cdev, &cdev->mixer, i);
> +		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
> +	}
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	return 0;
> +}
> +
> +static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
> +	int ret;
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret = catpt_set_ctlvol(cdev, cdev->mixer.mixer_hw_id,
> +			       ucontrol->value.integer.value);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	return ret;
> +}
> +
> +static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
> +	struct catpt_stream_runtime *stream;
> +	long *ctlvol = (long *)kcontrol->private_value;
> +	u32 dspvol;
> +	int i;
> +
> +	stream = catpt_stream_find(cdev, kcontrol->id.device);
> +	if (!stream) {
> +		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
> +			ucontrol->value.integer.value[i] = ctlvol[i];
> +		return 0;
> +	}
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
> +		dspvol = catpt_stream_volume(cdev, stream, i);
> +		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
> +	}
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	return 0;
> +}
> +
> +static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
> +	struct catpt_stream_runtime *stream;
> +	long *ctlvol = (long *)kcontrol->private_value;
> +	int ret, i;
> +
> +	stream = catpt_stream_find(cdev, kcontrol->id.device);
> +	if (!stream) {
> +		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
> +			ctlvol[i] = ucontrol->value.integer.value[i];
> +		return 0;
> +	}
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret = catpt_set_ctlvol(cdev, stream->info.stream_hw_id,
> +			       ucontrol->value.integer.value);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < CATPT_CHANNELS_MAX; i++)
> +		ctlvol[i] = ucontrol->value.integer.value[i];
> +	return 0;
> +}
> +
> +static int catpt_loopback_switch_get(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	ucontrol->value.integer.value[0] = *(bool *)kcontrol->private_value;
> +	return 0;
> +}
> +
> +static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
> +	struct catpt_stream_runtime *stream;
> +	bool mute;
> +	int ret;
> +
> +	mute = (bool)ucontrol->value.integer.value[0];
> +
> +	stream = catpt_stream_find(cdev, kcontrol->id.device);
> +	if (!stream) {
> +		*(bool *)kcontrol->private_value = mute;
> +		return 0;
> +	}
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +
> +	*(bool *)kcontrol->private_value = mute;
> +	return 0;
> +}
> +
> +static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
> +
> +static int catpt_component_probe(struct snd_soc_component *component)
> +{
> +	struct snd_kcontrol_new templates[5];
> +	struct snd_kcontrol_new volctl = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |
> +			  SNDRV_CTL_ELEM_ACCESS_READWRITE,
> +		.info = catpt_volume_info,
> +		.tlv.p = catpt_volume_tlv,
> +	};
> +	void *p;
> +	int i;
> +
> +	/* master volume (mixer stream) */
> +	templates[0] = volctl;
> +	templates[0].name = "Master Playback Volume";
> +	templates[0].get = catpt_mixer_volume_get;
> +	templates[0].put = catpt_mixer_volume_put;
> +
> +	/* individual volume controls for offload and capture */
> +	for (i = 1; i < 4; i++) {
> +		/* volume storage for each of CATPT_CHANNELS_MAX */
> +		p = devm_kcalloc(component->dev, CATPT_CHANNELS_MAX,
> +				 sizeof(long), GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +		templates[i] = volctl;
> +		templates[i].get = catpt_stream_volume_get;
> +		templates[i].put = catpt_stream_volume_put;
> +		templates[i].private_value = (unsigned long)p;
> +	}
> +
> +	templates[1].name = "Media0 Playback Volume";
> +	templates[1].device = CATPT_PIN_ID_OFFLOAD1;
> +	templates[2].name = "Media1 Playback Volume";
> +	templates[2].device = CATPT_PIN_ID_OFFLOAD2;
> +	templates[3].name = "Mic Capture Volume";
> +	templates[3].device = CATPT_PIN_ID_CAPTURE1;
> +
> +	/* reference stream mute */
> +	p = devm_kzalloc(component->dev, sizeof(bool), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +	templates[4] = (struct snd_kcontrol_new)
> +		SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)p,
> +				    catpt_loopback_switch_get,
> +				    catpt_loopback_switch_put);
> +	templates[4].device = CATPT_PIN_ID_REFERENCE;
> +
> +	return snd_soc_add_component_controls(component, templates,
> +					      ARRAY_SIZE(templates));
> +}
> +
> +static int catpt_waves_switch_get(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	return 0;
> +}
> +
> +static int catpt_waves_switch_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	return 0;
> +}
> +
> +static int catpt_waves_param_get(struct snd_kcontrol *kcontrol,
> +				 unsigned int __user *bytes,
> +				 unsigned int size)
> +{
> +	return 0;
> +}
> +
> +static int catpt_waves_param_put(struct snd_kcontrol *kcontrol,
> +				 const unsigned int __user *bytes,
> +				 unsigned int size)
> +{
> +	return 0;
> +}
> +
> +static const struct snd_kcontrol_new component_kcontrols[] = {
> +/* Enable or disable WAVES module */
> +SOC_SINGLE_BOOL_EXT("Waves Switch", 0,
> +		    catpt_waves_switch_get, catpt_waves_switch_put),
> +/* WAVES module parameter control */
> +SND_SOC_BYTES_TLV("Waves Set Param", 128,
> +		  catpt_waves_param_get, catpt_waves_param_put),
> +};
> +
> +static const struct snd_soc_dapm_widget component_widgets[] = {
> +	SND_SOC_DAPM_AIF_IN("SSP0 CODEC IN", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("SSP0 CODEC OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("SSP1 BT IN", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("SSP1 BT OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
> +
> +	SND_SOC_DAPM_MIXER("Playback VMixer", SND_SOC_NOPM, 0, 0, NULL, 0),
> +};
> +
> +static const struct snd_soc_dapm_route component_routes[] = {
> +	{"Playback VMixer", NULL, "System Playback"},
> +	{"Playback VMixer", NULL, "Offload0 Playback"},
> +	{"Playback VMixer", NULL, "Offload1 Playback"},
> +
> +	{"SSP0 CODEC OUT", NULL, "Playback VMixer"},
> +
> +	{"Analog Capture", NULL, "SSP0 CODEC IN"},
> +	{"Loopback Capture", NULL, "SSP0 CODEC IN"},
> +
> +	{"SSP1 BT OUT", NULL, "Bluetooth Playback"},
> +	{"Bluetooth Capture", NULL, "SSP1 BT IN"},
> +};
> +
> +static const struct snd_soc_component_driver catpt_comp_driver = {
> +	.name = "catpt-platform",
> +
> +	.probe = catpt_component_probe,
> +	.pcm_construct = catpt_component_pcm_construct,
> +	.open = catpt_component_open,
> +	.pointer = catpt_component_pointer,
> +
> +	.controls = component_kcontrols,
> +	.num_controls = ARRAY_SIZE(component_kcontrols),
> +	.dapm_widgets = component_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(component_widgets),
> +	.dapm_routes = component_routes,
> +	.num_dapm_routes = ARRAY_SIZE(component_routes),
> +};
> +
> +int catpt_arm_stream_templates(struct catpt_dev *cdev)
> +{
> +	struct resource *res;
> +	u32 scratch_size = 0;
> +	int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(catpt_topology); i++) {
> +		struct catpt_stream_template *template;
> +		struct catpt_module_entry *entry;
> +		struct catpt_module_type *type;
> +
> +		template = catpt_topology[i];
> +		template->persistent_size = 0;
> +
> +		for (j = 0; j < template->num_entries; j++) {
> +			entry = &template->entries[j];
> +			type = &cdev->modules[entry->module_id];
> +
> +			if (!type->loaded)
> +				return -ENOENT;
> +
> +			entry->entry_point = type->entry_point;
> +			template->persistent_size += type->persistent_size;
> +			if (type->scratch_size > scratch_size)
> +				scratch_size = type->scratch_size;
> +		}
> +	}
> +
> +	if (scratch_size) {
> +		/* allocate single scratch area for all modules */
> +		res = catpt_request_region(&cdev->dram, scratch_size);
> +		if (!res)
> +			return -EBUSY;
> +		cdev->scratch = res;
> +	}
> +
> +	return 0;
> +}
> +
> +int catpt_register_plat_component(struct catpt_dev *cdev)
> +{
> +	struct snd_soc_component *component;
> +	int ret;
> +
> +	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
> +	if (!component)
> +		return -ENOMEM;
> +
> +	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
> +					   cdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	component->name = catpt_comp_driver.name;
> +	return snd_soc_add_component(component, dai_drivers,
> +				     ARRAY_SIZE(dai_drivers));
> +}
> 
