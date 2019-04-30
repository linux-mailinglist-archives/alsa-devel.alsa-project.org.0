Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F90FDF8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 18:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2098F16AA;
	Tue, 30 Apr 2019 18:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2098F16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556641885;
	bh=Y/g+JubRqtrwmN796dQXueBRndURrI/ZH9SWJkG5pmc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mto+e5laVs1ggQXBkb5xO1K3DEJ6lunJtkuUnMwRbrE40AOzbIAtFB4H8GLpOcExi
	 sY4E/ld/9WzG6bvlYRhm0bTSFrYv0oGvARIojN23E8ymN9A/Lv5gTcvrf2KPierNAL
	 HDwxZglpg224Kpuyx3tLloBMf2O7kIVpkYCeSMdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9CBF896AA;
	Tue, 30 Apr 2019 18:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D64F896AA; Tue, 30 Apr 2019 18:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F28D3F8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 18:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28D3F8065C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 09:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="147139281"
Received: from cng16-mobl.amr.corp.intel.com (HELO [10.252.205.95])
 ([10.252.205.95])
 by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2019 09:29:22 -0700
To: =?UTF-8?Q?Vfi=06inod_Koul?= <vkoul@kernel.org>
References: <20190411031701.5926-1-pierre-louis.bossart@linux.intel.com>
 <20190411031701.5926-3-pierre-louis.bossart@linux.intel.com>
 <20190414095839.GG28103@vkoul-mobl>
 <08ea1442-361a-ecfc-ca26-d3bd8a0ec37b@linux.intel.com>
 <20190430085153.GS3845@vkoul-mobl.Dlink>
 <9866ac8c-103d-22cd-a639-a71c39a685c2@linux.intel.com>
 <20190430145444.GU3845@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72ff2d4f-85a7-b117-3d51-229c5f421734@linux.intel.com>
Date: Tue, 30 Apr 2019 11:29:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430145444.GU3845@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/5] soundwire: fix style issues
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



On 4/30/19 9:54 AM, Vfiinod Koul wrote:
> On 30-04-19, 08:38, Pierre-Louis Bossart wrote:
>> On 4/30/19 3:51 AM, Vinod Koul wrote:
>>> On 15-04-19, 08:09, Pierre-Louis Bossart wrote:
>>>>
>>>>>>
>>>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>>>> ---
>>>>>>     drivers/soundwire/Kconfig          |   2 +-
>>>>>>     drivers/soundwire/bus.c            |  87 ++++++++--------
>>>>>>     drivers/soundwire/bus.h            |  16 +--
>>>>>>     drivers/soundwire/bus_type.c       |   4 +-
>>>>>>     drivers/soundwire/cadence_master.c |  87 ++++++++--------
>>>>>>     drivers/soundwire/cadence_master.h |  22 ++--
>>>>>>     drivers/soundwire/intel.c          |  87 ++++++++--------
>>>>>>     drivers/soundwire/intel.h          |   4 +-
>>>>>>     drivers/soundwire/intel_init.c     |  12 +--
>>>>>>     drivers/soundwire/mipi_disco.c     | 116 +++++++++++----------
>>>>>>     drivers/soundwire/slave.c          |  10 +-
>>>>>>     drivers/soundwire/stream.c         | 161 +++++++++++++++--------------
>>>>>
>>>>> I would prefer this to be a patch per module. It doesnt help to have a
>>>>> single patch for all the files!
>>>>>
>>>>> It would be great to have cleanup done per logical group, for example
>>>>> typos in a patch, aligns in another etc...
>>>>
>>>> You've got to be kidding. I've never seen people ask for this sort of
>>>> detail.
>>>
>>> Nope this is the way it should be. A patch is patch and which
>>> should do one thing! Even if it is a cleanup one.
>>>
>>> I dislike a patch which touches everything, core, modules, so please
>>> split up. As a said in review it takes guesswork to find why a change
>>> was done, was it whitespace fix, indentation or not, so please split up
>>> based on type of fixes.
>>
>> With all due respect, you are not helping here but rather slowing things
>> down. I've done dozens of cleanups in the ALSA tree and I didn't go in this
>> sort of details.
> 
> Thats fine, it is upto people, everyone has different views, mine is
> different from Takashi's. We all know for example networking has
> different stable and code style rule. That is how it is and I dont think
> we would have one rule for all kernel.
> 
> All I ask is to be able to review and split up accordingly, I guess that
> is a fair request
> 
>> The fact that the series was tagged as Reviewed by Takashi
>> on April 11 and we are still discussing trivial changes tells me the
>> integration model is broken.
> 
> Is it? you got feedback on 15th (that too after my 2 week conf/vacation
> break) and I got called crazy for that, not helping!!
> 
> 
>> It's not just me the patches related to
>> runtime-pm from your own Linaro colleagues posted on March 28 went nowhere
>> either.
> 
> Does it matter it was a Linaro colleague or not, a patch was posted,
> feedback given (similar to cadence one) we agreed that the fix
> is not correct and so patch was not applied. I don't think Srini cried
> over it!
> 
>> Moving forward, I suggest we merge SoundWire-related patches through the
>> sound tree. There will be dependencies in the coming weeks between SOF and
>> SoundWire and it makes no sense to have separate maintainers and make the
>> life of early adopters more complicated than it needs to be. If we have
>> 3-week delays for trivial stuff, I can't imagine what the pace will be when
>> I publish the next 20-odd patches I am still working on, and the code needed
>> for the SoundWire audio device class being standardized as we speak. Things
>> were fine up to now since no one was actually using the code, we are in a
>> different model now.
> 
> I disagree and wont accept it. I dont think you understand that you are
> not the most important person in the whole world, the 20 patches series
> you are cooking would sure be greatest ever, but that is not the point.
> The kernel has a process, you got a feedback, please fix that and post
> v2 rather than cribbing, complaining and calling crazy. The energy would
> have been better spent on fixing the feedback provided.
> 
> Dependencies are _always_ there in kernel development and we know how to
> deal with it. Am sure Takashi, Mark and me can come to reasonable
> agreement, I wouldn't worry about that!
> 
> What we dont do is create new model for your 20 patches.
> 
> And I guess I dont have anything more to say on this thread, so I wont
> bother replying, please feel free to post v2 and I shall review.

Friends have disagreements. We remain friends and I will provide a v2.

I still believe it makes no sense to split the integration of 
SoundWire-related patches in two different trees. The only rationale for 
it might be that SoundWire is a 'bus' than could be used in other areas. 
Except that for now and the foreseeable future (2022+) it's only for 
audio as a replacement of HDaudio, so the pragmatic way of dealing with 
SoundWire is to merge the code through the audio tree. And given that 
the code is not in a usable state at the moment, dealing with the audio 
tree would not have any negative impact on anyone.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
