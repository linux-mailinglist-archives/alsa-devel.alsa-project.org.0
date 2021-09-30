Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBD41DEAE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 18:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC0316A2;
	Thu, 30 Sep 2021 18:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC0316A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633018654;
	bh=AuIn8GYX2DEVrs/XZh36vZiLilBXOgvWfizZClgoNr4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KaCBKHP1BDb9EuRwL+xrqqdiVUF2t5+7aTYbdoZOq9pDgwAPMkTPk+V5CAF5LkXjK
	 uRU66bh5lrrviCLP5c67i0KNKo+m1+X4avZxWV+au77IWwo5eHn1mUz//ZAIskJAN+
	 qloVPCif8CqanNRl7G9SxgVNk5+PUSuoWXklOfo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE29F804BC;
	Thu, 30 Sep 2021 18:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EC84F804AD; Thu, 30 Sep 2021 18:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38532F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 18:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38532F80218
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="223335791"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="223335791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 09:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="521260621"
Received: from lcalx-mobl1.amr.corp.intel.com (HELO [10.212.88.180])
 ([10.212.88.180])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 09:13:48 -0700
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
 <b68d3c04-07b5-966c-5cd3-8cc715cc470e@linux.intel.com>
 <78e175f3-29cb-f059-427f-51210278c42a@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <09bbf14a-a5a0-23c6-d557-66a3af1ac227@linux.intel.com>
Date: Thu, 30 Sep 2021 11:13:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <78e175f3-29cb-f059-427f-51210278c42a@nvidia.com>
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


>>>> Can you describe the sequence that you used to start them? That may be
>>>> useful to understand the criteria you used?
>>> I have something like this:
>>>
>>> FE1  --> Crossbar -> Mixer Input1    |
>>> FE2  --> Crossbar -> Mixer Input2    |
>>> ...                                  | --> Mixer Output -->
>>> ... |
>>> FE10 --> Crossbar -> Mixer Input10   |
>>>
>>> All these FEs are started one after the other. This is an example of
>>> 10x1. Similarly we can have 2x1, 3x1 etc.,
>>> In our system, the crossbar [0] and mixer [1] are separate ASoC
>>> components. Basically audio paths consist of a group of ASoC components
>>> which are connected back to back.
>> Not following. Can you explain how starting FE1 does not change the
>> state of the mixer output then?
>>
>> Or is each 'Crossbar' instance a full-blown BE? In that case you have a
>> 1:1 mapping between FE and BE, a *really* simple topology...
> 
> Yes 'Crossbar' exposes multiple ports and it is 1:1 mapping with FE.
> Starting FE1 does configure mixer output.

Ah ok, now I get the difference with the N:1 topology we used.
Thanks for explaining this.

>>> In the interim, may be we can have following patch to keep both systems
>>> working and keep the discussion going to address the oustanding
>>> requirements/issues?
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index ab25f99..0fbab50 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct
>>> snd_soc_pcm_runtime *fe, int stream,
>>>                  if (!fe->dpcm[stream].runtime && !fe->fe_compr)
>>>                          continue;
>>>
>>> -               if ((be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_NEW) &&
>>> +               /*
>>> +                * Filter for systems with 'component_chaining' enabled.
>>> +                * This helps to avoid unnecessary re-configuration
>>> of an
>>> +                * already active BE on such systems.
>>> +                */
>>> +               if (fe->card->component_chaining &&
>>> +                   (be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_NEW) &&
>>>                      (be->dpcm[stream].state !=
>>> SND_SOC_DPCM_STATE_CLOSE))
>>>                          continue;
>> that wouldn't work. We need to support the STOP and START cases as well.
>>
> 
> I meant with flag 'fe->card->component_chaining', which is currently
> used by Tegra audio only.

Ah yes, this may be a temporary solution that gets us both back to a
'working solution'. Let me give it a try.
Good discussion, thanks!
-Pierre
