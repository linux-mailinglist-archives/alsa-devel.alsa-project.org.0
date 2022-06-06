Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD753F1A6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3B561B5C;
	Mon,  6 Jun 2022 23:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3B561B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654550613;
	bh=fZWy41IS0oX4SxFeiVDkn3d5ODJpu5kkeb11YjqwGkc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BakBzsqtn1K4qD85akSJUpp/1COwMDA8MOojCzVeas6oXeOe6O1N5CTw+uZaV8cUn
	 /kYEwdtBkWaz4JJogtR3hqlZJ6R1UI+SHyEn1OsPzCg4LyPVkJfjjzNj6MilX/E/D5
	 hn/jfX6dLHsU0Gwt/O7/j1LWi8jQ6jmH/AkDNVG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B92F80089;
	Mon,  6 Jun 2022 23:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D40A2F8012A; Mon,  6 Jun 2022 23:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4136AF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4136AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j/caJlO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654550546; x=1686086546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fZWy41IS0oX4SxFeiVDkn3d5ODJpu5kkeb11YjqwGkc=;
 b=j/caJlO6RhM8Zn73mHMEzj8/MiMMRMi3FvyUCt4Zvwg1Pqm0ovuGrlPq
 409nxdHmKR/Vv45zFYttdwywp2wKjf/A3C4ujhpkO1u+G35YgK2KLYhvK
 z9upo/rXevIlsphWFd1o/SiliSTVlg4XUW+PlQx2asgT8Ufa1W7Hn+9xX
 ekumx600mqI/1iYHhhWCDexgBvxdAT4p70rZ2Dpe8/HxdDkOTHrFdrn9i
 XSWk9c6PbrCBVXKd+qVWdTsHpP+VDGJilJOaTwIwGz4qSlfFqwkf24p1c
 hF7HNhzCjKqRo7ZqNyVaw6snf9vVS/qUJ/sdr5a2mLv39WiK/j+FXnBYy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="257136816"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="257136816"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:22:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="583883549"
Received: from yantem-mobl9.amr.corp.intel.com (HELO [10.212.24.154])
 ([10.212.24.154])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:22:21 -0700
Message-ID: <15fd77de-9c6e-2e48-be4e-bae4abd7bb96@linux.intel.com>
Date: Mon, 6 Jun 2022 16:22:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <8e1641d0-b081-6301-db94-2c026166079a@linux.intel.com>
 <ED93F42F-5406-4D4F-B996-86F683EC09ED@cutebit.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ED93F42F-5406-4D4F-B996-86F683EC09ED@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Hector Martin <marcan@marcan.st>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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



On 6/6/22 15:46, Martin Povišer wrote:
> (I am having trouble delivering mail to linux.intel.com, so I reply to the list
> and CC at least...)
> 
>> On 6. 6. 2022, at 22:02, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>> + * Virtual FE/BE Playback Topology
>>> + * -------------------------------
>>> + *
>>> + * The platform driver has independent frontend and backend DAIs with the
>>> + * option of routing backends to any of the frontends. The platform
>>> + * driver configures the routing based on DPCM couplings in ASoC runtime
>>> + * structures, which in turn is determined from DAPM paths by ASoC. But the
>>> + * platform driver doesn't supply relevant DAPM paths and leaves that up for
>>> + * the machine driver to fill in. The filled-in virtual topology can be
>>> + * anything as long as a particular backend isn't connected to more than one
>>> + * frontend at any given time. (The limitation is due to the unsupported case
>>> + * of reparenting of live BEs.)
>>> + *
>>> + * The DAPM routing that this machine-level driver makes up has two use-cases
>>> + * in mind:
>>> + *
>>> + * - Using a single PCM for playback such that it conditionally sinks to either
>>> + *   speakers or headphones based on the plug-in state of the headphones jack.
>>> + *   All the while making the switch transparent to userspace. This has the
>>> + *   drawback of requiring a sample stream suited for both speakers and
>>> + *   headphones, which is hard to come by on machines where tailored DSP for
>>> + *   speakers in userspace is desirable or required.
>>> + *
>>> + * - Driving the headphones and speakers from distinct PCMs, having userspace
>>> + *   bridge the difference and apply different signal processing to the two.
>>> + *
>>> + * In the end the topology supplied by this driver looks like this:
>>> + *
>>> + *  PCMs (frontends)                   I2S Port Groups (backends)
>>> + *  ────────────────                   ──────────────────────────
>>> + *
>>> + *  ┌──────────┐       ┌───────────────► ┌─────┐     ┌──────────┐
>>> + *  │ Primary  ├───────┤                 │ Mux │ ──► │ Speakers │
>>> + *  └──────────┘       │    ┌──────────► └─────┘     └──────────┘
>>> + *                ┌─── │ ───┘             ▲
>>> + *  ┌──────────┐  │    │                  │
>>> + *  │Secondary ├──┘    │     ┌────────────┴┐
>>> + *  └──────────┘       ├────►│Plug-in Demux│
>>> + *                     │     └────────────┬┘
>>> + *                     │                  │
>>> + *                     │                  ▼
>>> + *                     │                 ┌─────┐     ┌──────────┐
>>> + *                     └───────────────► │ Mux │ ──► │Headphones│
>>> + *                                       └─────┘     └──────────┘
>>> + */
>>
>> In Patch2, the 'clusters' are described as front-ends, with I2S as
>> back-ends. Here the PCMs are described as front-ends, but there's no
>> mention of clusters. Either one of the two descriptions is outdated, or
>> there's something missing to help reconcile the two pieces of information?
> 
> Both descriptions should be in sync. Maybe I don’t know the proper
> terminology. In both cases the frontend is meant to be the actual I2S
> transceiver unit, and backend the I2S port on the SoC’s periphery,
> which can be routed to any of transceiver units. (Multiple ports can
> be routed to the same unit, which means the ports will have the same
> clocks and data line -- that's a configuration we need to support to
> drive some of the speaker arrays, hence the backend/frontend
> distinction).
> 
> Maybe I am using 'PCM' in a confusing way here? What I meant is a
> subdevice that’s visible from userspace, because I have seen it used
> that way in ALSA codebase.

Yes, I think most people familiar with DPCM would take the 'PCM
frontend' as some sort of generic DMA transfer from system memory, while
the 'back end' is more the actual serial link. In your case, the
front-end is already very low-level and tied to I2S already. I think
that's fine, it's just that using different terms for 'cluster' and
'PCM' in different patches could lead to confusions.

>>> +static int macaudio_get_runtime_mclk_fs(struct snd_pcm_substream *substream)
>>> +{
>>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>>> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
>>> +	struct snd_soc_dpcm *dpcm;
>>> +
>>> +	/*
>>> +	 * If this is a FE, look it up in link_props directly.
>>> +	 * If this is a BE, look it up in the respective FE.
>>> +	 */
>>> +	if (!rtd->dai_link->no_pcm)
>>> +		return ma->link_props[rtd->dai_link->id].mclk_fs;
>>> +
>>> +	for_each_dpcm_fe(rtd, substream->stream, dpcm) {
>>> +		int fe_id = dpcm->fe->dai_link->id;
>>> +
>>> +		return ma->link_props[fe_id].mclk_fs;
>>> +	}
>>
>> I am not sure what the concept of mclk would mean for a front-end? This
>> is typically very I2S-specific, i.e. a back-end property, no?
> 
> Right, that’s a result of the confusion from above. Hope I cleared it up
> somehow. The frontend already decides the clocks and data serialization,
> hence mclk/fs is a frontend-prop here.

What confuses me in this code is that it looks possible that the front-
and back-end could have different mclk values? I think a comment is
missing that the values are identical, it's just that there's a
different way to access it depending on the link type?


>>> +static int macaudio_be_init(struct snd_soc_pcm_runtime *rtd)
>>> +{
>>> +	struct snd_soc_card *card = rtd->card;
>>> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
>>> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
>>> +	struct snd_soc_dai *dai;
>>> +	int i, ret;
>>> +
>>> +	ret = macaudio_be_assign_tdm(rtd);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	if (props->is_headphones) {
>>> +		for_each_rtd_codec_dais(rtd, i, dai)
>>> +			snd_soc_component_set_jack(dai->component, &ma->jack, NULL);
>>> +	}
>>
>> this is weird, set_jack() is invoked by the ASoC core. You shouldn't
>> need to do this?
> 
> That’s interesting. Where would it be invoked? How does ASoC know which codec
> it attaches to?

sorry, my comment was partly invalid.

set_jack() is invoked in the machine driver indeed, what I found strange
is that you may have different codecs handling the jack? What is the
purpose of that loop?


>>> +static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
>>> +				void *data);
>>> +
>>> +static struct notifier_block macaudio_jack_nb = {
>>> +	.notifier_call = macaudio_jack_event,
>>> +};
>>
>> why is this needed? we have already many ways of dealing with the jack
>> events (dare I say too many ways?).
> 
> Because I want to update the DAPM paths based on the jack status,
> specifically I want to set macaudio_plugin_demux. I don’t know how
> else it could be done.

I don't know either but I have never seen notifier blocks being used. I
would think there are already ways to do this with DAPM events.


>>> +static int macaudio_jack_event(struct notifier_block *nb, unsigned long event,
>>> +				void *data)
>>> +{
>>> +	struct snd_soc_jack *jack = data;
>>> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(jack->card);
>>> +
>>> +	ma->jack_plugin_state = !!event;
>>> +
>>> +	if (!ma->plugin_demux_kcontrol)
>>> +		return 0;
>>> +
>>> +	snd_soc_dapm_mux_update_power(&ma->card.dapm, ma->plugin_demux_kcontrol,
>>> +				      ma->jack_plugin_state,
>>> +				      (struct soc_enum *) &macaudio_plugin_demux_enum, NULL);
>>
>> the term 'plugin' can be understood in many ways by different audio
>> folks. 'plugin' is usually the term used for processing libraries (VST,
>> LADSPA, etc). I think here you meant 'jack control'?
> 
> So ‘jack control’ would be understood as the jack plugged/unplugged status?

The 'Headphone Jack' or 'Headset Mic Jack' kcontrols typically track the
status. Other terms are 'jack detection'. "plugin" is not a very common
term here.
