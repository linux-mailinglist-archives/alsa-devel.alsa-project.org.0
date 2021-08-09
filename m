Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB23E4784
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 16:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49348167C;
	Mon,  9 Aug 2021 16:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49348167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628519317;
	bh=VWbPXyxew8lKjCJUIxpLqmg8372v9N0pIBV6/Dzo83c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWhU9TUtDqC6S2d06qCFq9VtdRiKa+DgoXxlhd7HrfmqG9Q8maBZgmi5SA96d7kad
	 wQNx2mCo2AET1TTN5gtBQ/1EG/weSM1ciIBpcsWKwY46rn28zmbPaXngHQ1p6FTL00
	 WsjTvuWNa2rntmvLHc08ZiOt3LgaXXGsKrjWAnW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D22F800CB;
	Mon,  9 Aug 2021 16:27:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A85AF802D2; Mon,  9 Aug 2021 16:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B81F800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 16:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B81F800C8
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278452603"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="278452603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 07:26:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="525272453"
Received: from jsmalone-mobl1.amr.corp.intel.com (HELO [10.212.48.42])
 ([10.212.48.42])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 07:26:54 -0700
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
To: Takashi Iwai <tiwai@suse.de>, Vinod Koul <vkoul@kernel.org>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
 <YQ07BVDyPD1Vb4R8@matsya>
 <a40644ba-bee7-0fc2-93e5-b1746ecda938@linux.intel.com>
 <YRCozWNtypjnTp0b@matsya> <s5hy29bnkqh.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <acef4e19-dd85-a079-341b-4b26b45c8efb@linux.intel.com>
Date: Mon, 9 Aug 2021 09:26:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hy29bnkqh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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



>>> For Intel machine drivers, all BE dailinks use
>>> .no_pcm = 1 (explicit setting)
>>> .nonatomic = 0 (implicit).
>>
>> that was my question, how is it implicit?
>> Should be explicitly set, right?

implicit behavior with C, if you don't set a field its value is zero...

>>> All FE dailinks use
>>> .no_pcm = 0 (implicit)
>>> .nonatomic = 1 (explicit setting)
>>>
>>>>> So the question is: is there any issue with sending an IPC in a DAI
>>>>> trigger callback?
>>>>
>>>> Sorry looks like we diverged, orignal question was can we do heavy tasks
>>>> in trigger, the answer is no, unless one uses nonatomic flag which was
>>>> added so that people can do that work with DSPs like sending IPCs..
>>>> Maybe we should add heavy slimbus/soundwire handling to it too...?
>>>
>>> I don't think the answer is as clear as you describe it Vinod.
>>>
>>> The .nonatomic field is at the BE dailink level.
>>>
>>> Unless I am missing something, I don't see anything that lets me set a
>>> .nonatomic property at the *DAI* level.
>>
>> I would say that was a miss in original design, it should have been set
>> at dai level or at least allowed to propagate from dai level setting.
>>
>> Now we are allowed to set it at dai_link but it is governed by dai
>> behaviour (DSP based DAI etc...)
> 
> Actually, there was one big piece I overlooked.  The whole DPCM BE
> operation is *always* tied with FE's.  That is, the nonatomic flag is
> completely ignored for BE, but just follows what FE sets up.
> 
> And that's the very confusing point when reviewing the code.  You
> cannot know whether it's written for non-atomic context or not.  This
> means that it's also error-prone; the code that assumes the operation
> in a certain mode might mismatch with the bound FE.
> 
> So, ideally, both FE and BE should set the proper nonatomic flags, and
> have a consistency check with WARN_ON() at the run time.

Sorry Takashi, I am not following. Are you asking me to add a .nonatomic
flag in all the exiting BEs along with a WARN_ON?

I can do this, but that's a sure way to trigger massive amounts of
user-reported "regression in kernel 5.1x". Is this really what you want?

Also I don't understand how this would help with the specific problem
raised in this patch: can we yes/no do something 'heavy' in a *DAI*
callback? What is the definition of 'heavy'?

And last, I am not sure it's always the case that a BE follows the FE
configuration. We've had cases of BE->BE loopbacks where the host
doesn't see or configured the data.



