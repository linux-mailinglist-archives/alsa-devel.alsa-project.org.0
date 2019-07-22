Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29B70A94
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 22:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA3C1833;
	Mon, 22 Jul 2019 22:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA3C1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563827020;
	bh=WitMwxHM+aVdw1gns7y8BibGncAwcSetji4P0KunamI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nW69986iw34HjKj36r2MJ5yEjN6wd3z1PkpQumcfeptTWkYyoyun/FhlshcfY/8nw
	 aRwB7EAwZSg1KUhleXWKXUzjIzEXR2OjesXJOrqPWTI2IwG/JiDEPXn+fzfl3SNxFl
	 7sDhk0UKrVHpPbfyxsx9D/OcorjCt6bdBpdZ8hGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE70F803D1;
	Mon, 22 Jul 2019 22:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12807F803D5; Mon, 22 Jul 2019 22:21:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_16,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C01F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 22:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C01F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 13:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="320791769"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga004.jf.intel.com with ESMTP; 22 Jul 2019 13:21:37 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
 <58061248-786f-37f6-fc9f-cf18db242a75@linux.intel.com>
 <adf2fdc1-5155-062a-3ad2-c0acd7812707@intel.com>
 <26d588a8-510d-b818-54f1-865c3ab69fe5@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <660350e5-86df-674e-d307-dd1e2bc0ee42@intel.com>
Date: Mon, 22 Jul 2019 22:21:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <26d588a8-510d-b818-54f1-865c3ab69fe5@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: Intel: IPC framework updates
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

On 2019-07-22 21:05, Pierre-Louis Bossart wrote:
> 
> 
> On 7/22/19 1:32 PM, Cezary Rojewski wrote:
>> On 2019-07-22 18:02, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 7/20/19 2:45 PM, Cezary Rojewski wrote:
>>>> Existing IPC framework omits crucial part of the entire communication:
>>>> reply header. Some IPCs cannot function at all without the access to
>>>> said header. Update the sst-ipc with new sst_ipc_message structure to
>>>> represent both request and reply allowing reply-processing handlers to
>>>> save received responses.
>>>
>>> I don't get the idea at all.
>>
>> It's not "an idea", this is cAVS design. GET_PIPELINE_STATE, 
>> LARGE_CONFIG_GET and such define portion of their essential _payload_ 
>> within header instead of actual SRAM window. Some of these contain 
>> entire _payload_ within header instead - as already stated.
> 
> No one outside of your team has a clue what cAVS design means, so we'll 
> have to agree on what this really means, see below. seems to me like 
> 'header' refers to a hardware capability, not the data format.
> 
>>
>>> the DSP provides rx_data and a size. If there is a header at the 
>>> start of the IPC data in some cases, why can't you cast and extract 
>>> the header when it's needed for your SKL usages? Why does adding a 
>>> header make the IPC work better?
>>
>> This is cAVS solution we speak of, not an aDSP one. Not all IPCs have 
>> constant size defined here.
>> Moreover, define "size" - from architectural point of view this is 
>> *only* size an application is prepared to handle, it's usually 
>> overestimated. The actual size of _get_ is known only after reply is 
>> received. If it exceeds frame's window, then it gets more complicated..
>>
>> "If there is a header at the start of the IPC data in some cases, why 
>> can't you cast and extract the header (...)"
>> ??
>> An IPC Header - primary and extension - is found within Host HW 
>> registers e.g.: HICPI & HIPCIE what differs from data - payload - 
>> which is located in SRAM windows: downlink and uplink - depending on 
>> the direction. Saving header does not "make the IPC work better" - it 
>> allows them to function in the first place. Again, this is not the 
>> case for all IPCs.
> 
> The limited understanding I have of the architecture is that the IPC can 
> be done either by transmitting compressed information in an IPC 
> register, using up to 60 bits of information, or a full-blown version in 
> SRAM windows - with the caveat that the SRAM windows may not be 
> available in all power states. All four combinations between TX and RX 
> are possible, e.g. you can transmit a command over the IPC register and 
> get a reply in the SRAM window.
> I am not aware of a case where the IPC register and SRAM window contain 
> unrelated information, it's either self-contained in the IPC register or 
> the IPC register has a qualifier to help interpret the SRAM window 
> contents. Please correct me here if these explanations are incorrect.
> 
> This solution works for SKL+ only, so I am really wondering why you'd 
> want to align legacy platforms with newer stuff. Not to mention that 
> there are two versions of the IPC registers for cAVS.

Two versions of IPC registers is just a mapping thingy, IPC framework 
does not care about that, leaves that to the caller.
Legacy platforms won't notice the difference at all. Status quo is achieved.

If current _get_large_config is not enough for you, see 
GET_PIPELINE_STATE - first 5 bits of reply.header.extension contain 
actual data. Now, how do I get that info using current framework 
capabilities?

About the architecture. SOF's design is different, cAVS (/skylake) 
always makes use of host registers (IPC header is ALWAYS found there and 
is never located within SRAM window) with SRAM being optional and 
context dependent - data that cannot be contained with the very 60 
available bits is found there.

>>
>> Publishing such IPCs (e.g.: _get_large_config found in skl-sst-ipc.c) 
>> makes no sense if you do not process them correctly. I know not why 
>> dysfunctional code has been upstreamed or why does it not follow cAVS 
>> design pattern. All the series being posted currently aim to correct 
>> the very fundations of Skylake which are/ were broken, clearly.
> 
> Since Skylake+ has a fundamentally different way of doing things, and 
> likely more changes required down the road, why not create your own IPC 
> layer when you can knock yourself out, rather than changing stuff that 
> doesn't need any of this?

Does it really differ that much when it comes to handling IPCs?
Me re-implementing - or let's call it what it would really be: copying - 
IPC framework into /skylake is a lazy option. I prefer doing _simple_ 
changes to an existing /common stuff and thus reducing burden of 
maintenance in months to come.

There are fields and methods /skylake does not require too and yet these 
are there only for the sake of legacy platforms. Long time ago someone 
decided to make them all share one framework. Do you think splitting 
these now is a good idea?

>>>
>>> I have the feeling this is blurring layers between receiving data and 
>>> processing it in platform-specific ways, and I am nervous about 
>>> touching Baytrail and Broadwell legacy, which are way past 
>>> maintenance mode and should be deprecated really.
>>
>> I'm not nervous at all. Baytrail IPC is deprecated in favor of 
>> /atom/sst - God knows why yet another _common_ folder has been created 
>> there..
> 
> deprecated doesn't mean removed, there are still users and we don't 
> break their solution.

Sure thing, wasn't my intention - that's why changes maintain status quo.

>> Haswell with DSP does not really exist.
>> Broadwell is the only one left and my changes only _update_ the 
>> framework - these do not change its behavior.
> 
> When you change something that impacts multiple platforms, the 
> expectation is that it's been tested on other platforms. Precisely when 
> something is deprecated you either don't touch it or make sure the code 
> changes are tested. And with the difficulty getting access to platforms 
> - we have exactly two Broadwell devices with I2S - I am inclined to 
> avoid any changes.

Gathered some legacy platforms, but yeah I was not fortunate yet to test 
these out. Validating on several different platforms starting from SKL 
instead.

Here to makes things right, hope we all are. Skylake+ has been 
dysfunctional for long enough. I'd understand the concern if these were 
functional changes to legacy platforms. They aren't really. Would like 
not to delay the resurrection process any longer.

>> Truth be told, it did not age well at all. 99% of Skylake+ IPC 
>> communication is done in synchronized fashion yet during 
>> initialization there are always 8 messages allocated (times two: tx & 
>> rx). In total we are allocating 8 x 2 x PAGE_SIZE memory. These days 
>> memory might not be a problem, though does not change the fact it 
>> could have been done better. Lot of wasted memory..
> 
> I don't know what this has to do with this patchset, but it's pretty 
> common to allocate multiple messages to queue them up?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
