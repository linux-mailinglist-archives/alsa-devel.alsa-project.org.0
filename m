Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D53C220EE9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5951612;
	Wed, 15 Jul 2020 16:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5951612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594822398;
	bh=Q/uSGKL1NOTk++AMDQzXWr4RKXuTXjGndrq+XVImRDs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDs5SAQha8YibQlcmoxy1O6vNO/QlowT1U1WyO2Qi/qSIYk73xt9uUpL+gEFxjwR1
	 eqyUwFafUBB3WzmimGDMTkejC5Q4sRD8nyEnjf69DTTRXqIESmjixRktiI//5nyHFM
	 zEgWvSZPoOFVUF08Kk/IWwBU8w8SJeJTW4juUz0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C199AF80227;
	Wed, 15 Jul 2020 16:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60D00F8021D; Wed, 15 Jul 2020 16:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E835F8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E835F8014E
IronPort-SDR: FliIxPUeii5fqzq5AAiFgHFRw093z+e9fs+tV9hjyiLrQJiwJ3bDA64ATRM7yJassc05O0pAcO
 Q+x2dHPRwgZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="128713568"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="128713568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:11:27 -0700
IronPort-SDR: kvtOHsuz0HAGIGpENCKWVi39h2mstL8kjyl/VBqzWlnCbkBoMBVqQzs1sxSGPKKxzjQbxzvryP
 A3Lv7snNvHyw==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460103339"
Received: from sjeong-mobl.amr.corp.intel.com (HELO [10.255.231.101])
 ([10.255.231.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:11:26 -0700
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
To: Vinod Koul <vkoul@kernel.org>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
 <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
 <20200701054224.GV2599@vkoul-mobl>
 <MN2PR11MB4080CF23D00A3AF817AC1E7CFF6D0@MN2PR11MB4080.namprd11.prod.outlook.com>
 <077d4430-bb76-df2c-2c39-8077998e6fdc@linux.intel.com>
 <20200715045449.GP34333@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b9538103-4c72-722d-0abd-015f9432f17f@linux.intel.com>
Date: Wed, 15 Jul 2020 09:11:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715045449.GP34333@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Blauciak,
 Slawomir" <slawomir.blauciak@intel.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>, "Liao,
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



On 7/14/20 11:54 PM, Vinod Koul wrote:
> On 02-07-20, 10:01, Pierre-Louis Bossart wrote:
>   
>>>> Sounds good. Now that you are already in irq thread, does it make sense
>>>> to spawn a worker thread for this and handle it there? Why not do in the
>>>> irq thread itself. Using a thread kind of defeats the whole point behind
>>>> concept of irq threads
>>>
>>> Not sure If you are talking about cdns_update_slave_status_work().
>>> The reason we need to spawn a worker thread in sdw_cdns_irq() is
>>> that we will do sdw transfer which will generate an interrupt when
>>> a slave interrupt is triggered. And the handler will not be invoked if the
>>> previous handler is not return yet.
>>> Please see the scenario below for better explanation.
>>> 1. Slave interrupt arrives
>>> 	2.1 Try to read Slave register and waiting for the transfer response
>>> 	2.2 Get the transfer response interrupt and finish the sdw transfer.
>>> 3. Finish the Slave interrupt handling.
>>>
>>> Interrupts are triggered in step 1 and 2.2, but step 2.2's handler will not be
>>> invoked if step 1's handler is not return yet.
>>> What we do is to spawn a worker thread to do step 2 and return from step 1.
>>> So the handler can be invoked when the transfer response interrupt arrives.
>>
>> To build on Bard's correct answer, the irq thread only takes care of
>> 'immediate' actions, such as command completion, parity or bus clash errors.
>> The rest of the work can be split in
>> a) changes to device state, usually for attachment and enumeration. This is
>> rather slow and will entail regmap syncs.
>> b) device interrupts - typically only for jack detection which is also
>> rather slow.
>>
>> Since this irq thread function is actually part of the entire HDaudio
>> controller interrupt handling, we have to defer the work for cases a) and b)
>> and re-enable the HDaudio interrupts at the end of the irq thread function -
>> see the code I shared earlier.
>>
>> In addition, both a) and b) will result  in transactions over the bus, which
>> will trigger interrupts to signal the command completions. In other words,
>> because of the asynchronous nature of the transactions, we need a two-level
>> implementation. If you look at the previous solution it was the same, the
>> commands were issued in the irq thread and the command completion was
>> handled in the handler, since we had to make the handler minimal with a
>> global GIE interrupt disable we kept the same hierarchy to deal with
>> commands but move it up one level.
>>
>> You could argue that maybe a worker thread is not optimal and could be
>> replaced by something better/faster. Since the jack detection is typically
>> handled with a worker thread in all ASoC codec drivers, we didn't feel the
>> need to optimize further. We did not see any performance impact with this
>> change.
>>
>> Does this answer to your concern?
> 
> The point is that we are already in irq_thread which is designed to
> handle any bottom half processing and can be given priority, spawning of
> worker threads for another bottom half seems unnecessary to me and would
> increase the latency for you.
> 
> I would have handled everything in irq_thread and returned, after all we
> are in bottom half :)
> 
> Is there a reason for worker thread here, if so it is not clear to me
> atm.

I think we explained it at length: the irq thread deals with command 
completion so the command initiation required for enumeration and 
imp-def interrupt needs to be issued in *another* thread.

You cannot have in the same thread a wait_for_completion() and 
complete(), it'd be a by-design deadlock.

Maybe a comparison would help.

previous design for N masters
N+2 Handlers + threads (one IPC, one stream, N SoundWire)
each SoundWire handler takes care of command completion and wakes a 
thread for enumeration and imp-def interrupt.

New design
Single handler for ALL interrupt sources
The handler masks the global interrupt and wakes a thread that deals 
with all interrupt sources, one after the other. The SoundWire thread 
function for each Master will take case of command completion and 
schedules a workqueue for enumeration and imp-def interrupt. The irq 
thread then unmask the global interrupt and returns IRQ_HANDLED.
