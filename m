Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B289741DC67
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 16:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5300C16AF;
	Thu, 30 Sep 2021 16:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5300C16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633012588;
	bh=Na53UXDR9CPZ79NObbdj1RGgKhz+P3IA91jC3dfNMqA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvTsbW6IeO4E3JmfV7A7ku5DFmeN9xYNJqrIkqAcPBUT49n+NcifrZvIddHHgg14e
	 rlJlSY86OwFT4l2IIcSsL3r7P/P+LM/fnWjjj0MYqZVEL2uG5xIWiOHAYQTaj83qjg
	 Xe3QguhiugDXx8jq0SN3XUYrlN0wS610a9yUEZas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC687F800F3;
	Thu, 30 Sep 2021 16:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A0C7F804AD; Thu, 30 Sep 2021 16:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F34BF80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 16:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F34BF80113
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="247740205"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="247740205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 07:34:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="521230778"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180])
 ([10.212.88.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 07:34:48 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: Sameer Pujar <spujar@nvidia.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, catalin.marinas@arm.com,
 will@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
 <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
 <94861852-29ba-be9e-8c63-a70a01550b3a@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b68d3c04-07b5-966c-5cd3-8cc715cc470e@linux.intel.com>
Date: Thu, 30 Sep 2021 09:34:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <94861852-29ba-be9e-8c63-a70a01550b3a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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


>>>>> But in addition we'd need to agree on what an 'active BE' is. Why
>>>>> can't
>>>>> we connect a second stream while the first one is already in HW_PARAMS
>>>>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>>>>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>>>>
>>>>> And more fundamentally, the ability to add a second FE on a
>>>>> 'active' BE
>>>>> in START state is a basic requirement for a mixer, e.g. to play a
>>>>> notification on one FE while listening to music on another. What needs
>>>>> to happen is only to make sure that the FE and BE are compatible in
>>>>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only
>>>>> checking
>>>>> the BE NEW or CLOSE state is way too restrictive.
>>>> Sorry for the trouble to your system.
>>>>
>>>> Idea was to avoid reconfiguration of the same BE DAI again, but not to
>>>> stop the provision to add a subsequent FE. In fact I had tested mixing
>>>> of streams coming from 10 different FEs.
>> Can you describe the sequence that you used to start them? That may be
>> useful to understand the criteria you used?
> 
> I have something like this:
> 
> FE1  --> Crossbar -> Mixer Input1    |
> FE2  --> Crossbar -> Mixer Input2    |
> ...                                  | --> Mixer Output -->
> ... |
> FE10 --> Crossbar -> Mixer Input10   |
> 
> All these FEs are started one after the other. This is an example of
> 10x1. Similarly we can have 2x1, 3x1 etc.,
> In our system, the crossbar [0] and mixer [1] are separate ASoC
> components. Basically audio paths consist of a group of ASoC components
> which are connected back to back.

Not following. Can you explain how starting FE1 does not change the
state of the mixer output then?

Or is each 'Crossbar' instance a full-blown BE? In that case you have a
1:1 mapping between FE and BE, a *really* simple topology...

>> I don't fully understand the notion of mixer input DAI, in our case we
>> have a bunch of PCM devices connected to a mixer. The mixer is not
>> directly connected to a DAI.
> 
> Please see above mixer example. Since mixer is a separate ASoC
> component, it exposes 10 inputs (or DAIs) and outputs. Originally what I
> wanted to do was, for subsequent FE runs (FE2, FE3 ...) mixer output
> need not be configured again and again.
> 
>>> The problem as I see is that with this patch one can not connect a new
>>> FE to a BE which is _not_ in NEW or CLOSE state.
>>>
>>> The FE and BE needs to be connected to have DPCM working and this patch
>>> makes the code to skip the dpcm_be_connect().
>>>
>>> Consider this simple setup:
>>>
>>> FE1 -->|
>>>         | --> BE -->
>>> FE2- ->|
>>>
>>> First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.
>>>
>>> Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
>>> made because BE is no longer in NEW/CLOSE state.
>> I share Peter's analysis, there cannot be any restrictions on
>> connections - at any time. A mixer input might become active and be
>> added to the mix. We might have a temporary lock to delay new
>> connections but cannot not reject them outright based on BE state.
> 
> Yes, I understand how this affects a system like yours. As per mixer
> example above, in our case subsequent FEs always find BE from Crossbar.
> That is why I don't see similar error.

Not following either.

>>>> I am just
>>>> curious to know, if originally you were reconfiguring the BE DAI again
>>>> with same parameters (for a second FE) or some additional configuration
>>>> is done?
>> That's a different question - and a good one.
>>
>> In the case of a mixer, the propagation of hw_params is a broken
>> concept. It leads to the first FE configuring the BE to define its
>> preferred parameters, e.g. S16_LE format. If later on a second FE is
>> started which could play S24_LE, the mixer and BE are already configured
>> to a lower resolution. A mixer should really have its own parameters and
>> be the start of a new 'domain' - as Lars described it several years ago
>> at the audio miniconference.
> 
> Propagation is one of the problems we want to address and require help
> from DPCM experts. But the scenario you mentioned is a special case
> which need not be supported, because mixer can operate in one
> configuration at a given time and subsequent FEs should agree to the
> already running configuration. However mixer should support both S16_LE
> and S24_LE (whenever possible), but not simultaneously. At least this is
> the expecation from our systems. Yes mixer may require fixup of a
> specific config (we earlier had proposed mixer controls to configure
> mixer parameters, but the idea was disliked), but propagation may help
> avoid fixing up everywhere in the audio path where it is not really
> required. But I don't know how this can be done at the moment.

What I am saying is that the mixer should be pre-configured with the
desired resolution/sample rate, and some adaptation needs to happen if
the FE provides data in a different format.

This is similar to what sound servers typically do on their sinks, they
define ONE configuration. Dynamic changes are annoying and result in
corner cases where the quality can vary depending on which FE is started
first.

>>>> For now, the only restriction that we could enforce is that the BE
>> cannot be reconfigured after the prepare step.
>>
>> Note that our DAIs tolerate multiple calls to hw_params. If you have a
>> case where the hw_params allocates resources, maybe you should consider
>> moving that allocation to the prepare step, or free them if you detect a
>> reconfiguration. That would be something needed even outside of the DPCM
>> scope. Similarly you need to support the case where the DAI hw_free is
>> called without hw_params ever being called, it's a known sequence that
>> can happen if the FE hw-params fails.
> 
> Currently this does not seem to be a problem for us. Patch was to avoid
> reconfiguration which was felt to be redundant for our system.
> 
>>>>> I can send a revert with the explanations in the commit message if
>>>>> there
>>>>> is a consensus that this patch needs to be revisited.
>>>> May be this can be revisited since it appears to be a critical problem
>>>> for your system. But I hope this discussion can be alive on following
>>>> points for a better fix.
>>>>
>>>> 1. The original issue at my end was not just a configuration
>>>> redundancy.
>>>> I realize now that with more stream addition following error print
>>>> is seen.
>>>>     "ASoC: too many users playback at open 4"
>>>>
>>>>     This is because the max DPCM users is capped at 8. Increasing this
>>>> may help (need to see what number is better), but does not address the
>>>> redundancy problem.
>> we haven't used more than 2 users, but it's already broken at 2 with
>> race conditions left and right. I am really surprised you managed to
>> have more than 2 without hitting inconsistent states - our automated
>> play/stop/pause monkey tests reliably break DPCM in less than 20s.
> 
> I am not sure what is the exact difference, may be DPCM usage in our
> case is different from what you have. I have mixer tests for different
> combinations (2x1, 3x1 ...), which seem to pass. In general, we want to
> have path like this.
> 
> FE -> BE1 -> BE2 -> ... -> BEx
> 
> Each BEx could be a mixer, resampler etc., Currently DPCM core sees this
> as multiple BEs for a given FE and that is why multiple "users" are
> reported.

This sort of flow vastly exceeds the capabilities of DPCM, which is
already badly broken with one BE and 2 FEs... I think what you want is
what Lars described at the audio miniconf with 'domains'.

> In the interim, may be we can have following patch to keep both systems
> working and keep the discussion going to address the oustanding
> requirements/issues?
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ab25f99..0fbab50 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct
> snd_soc_pcm_runtime *fe, int stream,
>                 if (!fe->dpcm[stream].runtime && !fe->fe_compr)
>                         continue;
> 
> -               if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
> +               /*
> +                * Filter for systems with 'component_chaining' enabled.
> +                * This helps to avoid unnecessary re-configuration of an
> +                * already active BE on such systems.
> +                */
> +               if (fe->card->component_chaining &&
> +                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
>                     (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
>                         continue;

that wouldn't work. We need to support the STOP and START cases as well.


>>>> 2. If reconfiguration of the same BE is not necessary for a subsequent
>>>> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
>>>> failure?
>>> I'm not sure, but it might be possible to just skip the
>>> dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
>>> call at the end of the loop, but the question is under which condition?
>>> Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?
>>>
>>> Skipping the connect does not sound right for a new FE-BE connection.
>> The reconfiguration is one problem, but what also happens is that the BE
>> dailink will see multiple triggers. I've been playing with refcounts to
>> force consistency and make sure there is only one TRIGGER_START send to
>> the dailink, and conversely there are cases where the TRIGGER_STOP is
>> never sent...
> Just a thought. FE links have dummy codec DAI and core wants to find a
> real BE when FE is started. May be don't fail a FE when no back end DAI
> is found (and/or find if the same BE is already connected to some FE)
> and the above problem becomes simpler?

That would be just moving the problem. In our case we would be silently
playing on a dummy output just because the correct output was not found
due to state handling issues.
