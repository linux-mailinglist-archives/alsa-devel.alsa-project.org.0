Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A484F41C3FA
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 13:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2D116A1;
	Wed, 29 Sep 2021 13:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2D116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632916693;
	bh=FRvG2ftF8rsmCtEwqD9minryJ1CMBouw6+vWnxIyz00=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLpgxi+J/Ncxux+RdBVcu9+POHacILaViWIylAta7I40SZg9OABQ5UevFxUPfmgVI
	 2Ra4ScQ/iY/erepzOOuBwHVgBuZxW38kPQjOQgV9KbURK4JsOFNfd+baf/DFnkgiXW
	 MjlsN2fFRxVTIqmFwztEzr26LDkOLmh+YqZi6jJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AEC7F801F7;
	Wed, 29 Sep 2021 13:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42153F80227; Wed, 29 Sep 2021 13:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=CTE_8BIT_MISMATCH, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9A17F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 13:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A17F80105
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="285937597"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="285937597"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:56:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="476617195"
Received: from heid-mobl.ger.corp.intel.com (HELO [10.249.37.205])
 ([10.249.37.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:56:41 -0700
Message-ID: <2f96f1aa-74f2-8ea8-3f43-e4da97400fde@linux.intel.com>
Date: Wed, 29 Sep 2021 14:56:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, catalin.marinas@arm.com,
 will@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-2-git-send-email-spujar@nvidia.com>
 <be6290d1-0682-3d93-98a6-ad0be3ca42c1@linux.intel.com>
 <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <70422e52-89d2-d926-b3f9-be59780d464e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 29/09/2021 10:43, Sameer Pujar wrote:
> 
> 
> On 9/29/2021 2:55 AM, Pierre-Louis Bossart wrote:
>> On 8/27/21 4:33 AM, Sameer Pujar wrote:
> 
> [...]
> 
>> But in addition we'd need to agree on what an 'active BE' is. Why can't
>> we connect a second stream while the first one is already in HW_PARAMS
>> or PAUSED or STOP? It's perfectly legal in ALSA/ASoC to have multiple
>> HW_PARAMS calls, and when we reach STOP we have to do a prepare again.
>>
>> And more fundamentally, the ability to add a second FE on a 'active' BE
>> in START state is a basic requirement for a mixer, e.g. to play a
>> notification on one FE while listening to music on another. What needs
>> to happen is only to make sure that the FE and BE are compatible in
>> terms of HW_PARAMS and not sending a second TRIGGER_STOP, only checking
>> the BE NEW or CLOSE state is way too restrictive.
> 
> Sorry for the trouble to your system.
> 
> Idea was to avoid reconfiguration of the same BE DAI again, but not to
> stop the provision to add a subsequent FE. In fact I had tested mixing
> of streams coming from 10 different FEs.
> 
> In your case, because of this patch, looks like the subsequent FE is not
> finding a BE DAI since it is already active due to a prior FE. The
> reason it works at my end is because the mixer input and output DAIs are
> separated. Any new FE would just configure the mixer input DAI to which
> it is attached and skip already running/configured output DAI. 

The problem as I see is that with this patch one can not connect a new
FE to a BE which is _not_ in NEW or CLOSE state.

The FE and BE needs to be connected to have DPCM working and this patch
makes the code to skip the dpcm_be_connect().

Consider this simple setup:

FE1 -->|
       | --> BE -->
FE2- ->|

First we start FE1, dpcm_be_connect(FE1, BE, stream) is made.

Later FE2 is started but dpcm_be_connect(FE2, BE, stream) would be not
made because BE is no longer in NEW/CLOSE state.

> I am just
> curious to know, if originally you were reconfiguring the BE DAI again
> with same parameters (for a second FE) or some additional configuration
> is done?
> 
> 
>> I can send a revert with the explanations in the commit message if there
>> is a consensus that this patch needs to be revisited.
> 
> May be this can be revisited since it appears to be a critical problem
> for your system. But I hope this discussion can be alive on following
> points for a better fix.
> 
> 1. The original issue at my end was not just a configuration redundancy.
> I realize now that with more stream addition following error print is seen.
>    "ASoC: too many users playback at open 4"
> 
>    This is because the max DPCM users is capped at 8. Increasing this
> may help (need to see what number is better), but does not address the
> redundancy problem.
> 
> 2. If reconfiguration of the same BE is not necessary for a subsequent
> FE run, shouldn't we avoid the reconfig itself and somehow avoid FE
> failure?

I'm not sure, but it might be possible to just skip the
dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
call at the end of the loop, but the question is under which condition?
Can a BE asked to be reconfigured when STOP/OPEN/HW_PARAMS?

Skipping the connect does not sound right for a new FE-BE connection.

-- 
Péter
