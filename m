Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750CA708B6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 20:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6741847;
	Mon, 22 Jul 2019 20:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6741847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563820477;
	bh=Wb8Xb66DlgnwrrwNELzmli92SoI2Mk5RxuV1HU7KpBk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ra9MnbuCRkUP2G2oYSVicc80Rj0o4OwhFa7vd9wKwr33Wg809s8hzu1zbogIKRYoK
	 izrjKYx3OpU9/qlEhvpthoboESv0CYkdFwFtlW8/SVK3MEwGpEYZA8WojRsstuAwNA
	 UfwcKsKx4TXq2KVc+0UdAAOkDQOdoK+cZ7h+AcRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF41F803D1;
	Mon, 22 Jul 2019 20:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A81F803D6; Mon, 22 Jul 2019 20:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODYSUB_16, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEFCF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 20:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEFCF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 11:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="177061683"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2019 11:32:39 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
 <58061248-786f-37f6-fc9f-cf18db242a75@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <adf2fdc1-5155-062a-3ad2-c0acd7812707@intel.com>
Date: Mon, 22 Jul 2019 20:32:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <58061248-786f-37f6-fc9f-cf18db242a75@linux.intel.com>
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

On 2019-07-22 18:02, Pierre-Louis Bossart wrote:
> 
> 
> On 7/20/19 2:45 PM, Cezary Rojewski wrote:
>> Existing IPC framework omits crucial part of the entire communication:
>> reply header. Some IPCs cannot function at all without the access to
>> said header. Update the sst-ipc with new sst_ipc_message structure to
>> represent both request and reply allowing reply-processing handlers to
>> save received responses.
> 
> I don't get the idea at all.

It's not "an idea", this is cAVS design. GET_PIPELINE_STATE, 
LARGE_CONFIG_GET and such define portion of their essential _payload_ 
within header instead of actual SRAM window. Some of these contain 
entire _payload_ within header instead - as already stated.

> the DSP provides rx_data and a size. If there is a header at the start 
> of the IPC data in some cases, why can't you cast and extract the header 
> when it's needed for your SKL usages? Why does adding a header make the 
> IPC work better?

This is cAVS solution we speak of, not an aDSP one. Not all IPCs have 
constant size defined here.
Moreover, define "size" - from architectural point of view this is 
*only* size an application is prepared to handle, it's usually 
overestimated. The actual size of _get_ is known only after reply is 
received. If it exceeds frame's window, then it gets more complicated..

"If there is a header at the start of the IPC data in some cases, why 
can't you cast and extract the header (...)"
??
An IPC Header - primary and extension - is found within Host HW 
registers e.g.: HICPI & HIPCIE what differs from data - payload - which 
is located in SRAM windows: downlink and uplink - depending on the 
direction. Saving header does not "make the IPC work better" - it allows 
them to function in the first place. Again, this is not the case for all 
IPCs.

Publishing such IPCs (e.g.: _get_large_config found in skl-sst-ipc.c) 
makes no sense if you do not process them correctly. I know not why 
dysfunctional code has been upstreamed or why does it not follow cAVS 
design pattern. All the series being posted currently aim to correct the 
very fundations of Skylake which are/ were broken, clearly.

> 
> I have the feeling this is blurring layers between receiving data and 
> processing it in platform-specific ways, and I am nervous about touching 
> Baytrail and Broadwell legacy, which are way past maintenance mode and 
> should be deprecated really.

I'm not nervous at all. Baytrail IPC is deprecated in favor of /atom/sst 
- God knows why yet another _common_ folder has been created there..
Haswell with DSP does not really exist.
Broadwell is the only one left and my changes only _update_ the 
framework - these do not change its behavior.

Truth be told, it did not age well at all. 99% of Skylake+ IPC 
communication is done in synchronized fashion yet during initialization 
there are always 8 messages allocated (times two: tx & rx). In total we 
are allocating 8 x 2 x PAGE_SIZE memory. These days memory might not be 
a problem, though does not change the fact it could have been done 
better. Lot of wasted memory..
There's certainly more to do, that's the message.

> 
> And last this patchset does not apply on top of Mark's tree?

I can recheck this, been a week since I did a snapshot of 5.3. Thanks 
for heads up.

> 
>>
>> Despite the range of changes required for model to be updated, no
>> functional changes are made for core hanswell, baytrail and skylake
>> message handlers. Reply-processing handlers now save received response
>> header yet no usage is added by default.
>>
>> To allow for future changes, righful kings of IPC kingdom need to be put
>> back on the throne. This update addresses one of them: LARGE_CONFIG_GET.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
