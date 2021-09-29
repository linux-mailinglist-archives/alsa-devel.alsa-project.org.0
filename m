Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24CF41C877
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 17:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5472916F0;
	Wed, 29 Sep 2021 17:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5472916F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632929496;
	bh=olYYJCTYRHazulX/HjqWqdH1HhxCByVaNF4TlL8BmQQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CX/o42rdSbqxk/J0pu+RZ0sF3xw8lLkugILKUAMJ7r3U9qfqwaTW0v6uUcab8dUtM
	 R0XysjtgXI8zSPDBdLr22WJoCmp/dJyyLiqHoLfCkil8rwTmXGB+YeBnSKmgz4b31t
	 OV47fmuXYRjMn0N0uvPuxbOKOrLRWvc8G6hevx+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB368F80161;
	Wed, 29 Sep 2021 17:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E79F804B0; Wed, 29 Sep 2021 17:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7759F80227
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 17:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7759F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225036995"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225036995"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="588091592"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234])
 ([10.209.150.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:09 -0700
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 catalin.marinas@arm.com, will@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
 <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <647b1d54-dbd7-ce91-291d-d677ce908398@linux.intel.com>
Date: Wed, 29 Sep 2021 09:52:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sharadg@nvidia.com, linux-tegra@vger.kernel.org,
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




>>> But in addition we'd need to agree on what an 'active BE' is. Why can't
>>> we connect a second stream while the first one is already in HW_PARAMS
>>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>>
>>> And more fundamentally, the ability to add a second FE on a 'active' BE
>>> in START state is a basic requirement for a mixer, e.g. to play a
>>> notification on one FE while listening to music on another. What needs
>>> to happen is only to make sure that the FE and BE are compatible in
>>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
>>> the BE NEW or CLOSE state is way too restrictive.
>>
>> Sorry for the trouble to your system.
>>
>> Idea was to avoid reconfiguration of the same BE DAI again, but not to
>> stop the provision to add a subsequent FE. In fact I had tested mixing
>> of streams coming from 10 different FEs.

Can you describe the sequence that you used to start them? That may be
useful to understand the criteria you used?

>> In your case, because of this patch, looks like the subsequent FE is not
>> finding a BE DAI since it is already active due to a prior FE. The
>> reason it works at my end is because the mixer input and output DAIs are
>> separated. Any new FE would just configure the mixer input DAI to which
>> it is attached and skip already running/configured output DAI. 

If you want to visualize the topology we're using in our 'nocodec'
tests, see

https://sof-ci.01.org/linuxpr/PR3177/build6440/devicetest/?model=ADLP_RVP_NOCODEC&testcase=verify-kernel-boot-log

and use the sof-adl-nocodec.

it's a bog-standard topology with processing entities connected by buffers.

I don't fully understand the notion of mixer input DAI, in our case we
have a bunch of PCM devices connected to a mixer. The mixer is not
directly connected to a DAI.

> The problem as I see is that with this patch one can not connect a new
> FE to a BE which is _not_ in NEW or CLOSE state.
> 
> The FE and BE needs to be connected to have DPCM working and this patch
> makes the code to skip the dpcm_be_connect().
> 
> Consider this simple setup:
> 
> FE1 -->|
>        | --> BE -->
> FE2- ->|
> 
> First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.
> 
> Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
> made because BE is no longer in NEW/CLOSE state.

I share Peter's analysis, there cannot be any restrictions on
connections - at any time. A mixer input might become active and be
added to the mix. We might have a temporary lock to delay new
connections but cannot not reject them outright based on BE state.

>> I am just
>> curious to know, if originally you were reconfiguring the BE DAI again
>> with same parameters (for a second FE) or some additional configuration
>> is done?

That's a different question - and a good one.

In the case of a mixer, the propagation of hw_params is a broken
concept. It leads to the first FE configuring the BE to define its
preferred parameters, e.g. S16_LE format. If later on a second FE is
started which could play S24_LE, the mixer and BE are already configured
to a lower resolution. A mixer should really have its own parameters and
be the start of a new 'domain' - as Lars described it several years ago
at the audio miniconference.

For now, the only restriction that we could enforce is that the BE
cannot be reconfigured after the prepare step.

Note that our DAIs tolerate multiple calls to hw_params. If you have a
case where the hw_params allocates resources, maybe you should consider
moving that allocation to the prepare step, or free them if you detect a
reconfiguration. That would be something needed even outside of the DPCM
scope. Similarly you need to support the case where the DAI hw_free is
called without hw_params ever being called, it's a known sequence that
can happen if the FE hw-params fails.

>>> I can send a revert with the explanations in the commit message if there
>>> is a consensus that this patch needs to be revisited.
>>
>> May be this can be revisited since it appears to be a critical problem
>> for your system. But I hope this discussion can be alive on following
>> points for a better fix.
>>
>> 1. The original issue at my end was not just a configuration redundancy.
>> I realize now that with more stream addition following error print is seen.
>>    "ASoC: too many users playback at open 4"
>>
>>    This is because the max DPCM users is capped at 8. Increasing this
>> may help (need to see what number is better), but does not address the
>> redundancy problem.

we haven't used more than 2 users, but it's already broken at 2 with
race conditions left and right. I am really surprised you managed to
have more than 2 without hitting inconsistent states - our automated
play/stop/pause monkey tests reliably break DPCM in less than 20s.

>> 2. If reconfiguration of the same BE is not necessary for a subsequent
>> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
>> failure?
> 
> I'm not sure, but it might be possible to just skip the
> dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
> call at the end of the loop, but the question is under which condition?
> Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?
> 
> Skipping the connect does not sound right for a new FE-BE connection.

The reconfiguration is one problem, but what also happens is that the BE
dailink will see multiple triggers. I've been playing with refcounts to
force consistency and make sure there is only one TRIGGER_START send to
the dailink, and conversely there are cases where the TRIGGER_STOP is
never sent...
