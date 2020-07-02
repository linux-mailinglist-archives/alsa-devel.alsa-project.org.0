Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF721274C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987BF16ED;
	Thu,  2 Jul 2020 17:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987BF16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593702378;
	bh=ps8AcEWWoyWUM1bIF9PN5cd37GxKNnu5NnXFhyUsZqM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWItewAbAO0WiXI4UH/H66hAOi7vU9WmV1GDQj5oqF1Mv+66uhAxaV3l9XZ7miFgM
	 7cnbHBFyEARHx0qr6zHSF5YmSfFEqxv4vtXxAEcI4818Lmf9WiZwJKOUNTLyZzXsBS
	 DHOPibhkNEN0OE51U5qUs4C18JQ0vOKtULtT0Zi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E06F802C4;
	Thu,  2 Jul 2020 17:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78EC3F802A9; Thu,  2 Jul 2020 17:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48BD4F8022D
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BD4F8022D
IronPort-SDR: ysAav6OkiPYT57XRwckTiTKdDmFVhqow2tWq7a+Ss7Z097NCGfXU7Oxwyyh/MTS+M3OqVkmU/B
 1XtyeGs9vwGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="145063734"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="145063734"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:48 -0700
IronPort-SDR: 8NAIp4cDCc3muxHVReeY1Ie+1bQ3zuO3HF1mAWNYARkco+6VdXe7su/ieLRgqDvpIPQdPU9dJQ
 VFrMfrZbfvVQ==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="304275519"
Received: from nchava-mobl1.amr.corp.intel.com (HELO [10.252.135.144])
 ([10.252.135.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:47 -0700
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
To: "Liao, Bard" <bard.liao@intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
 <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
 <20200701054224.GV2599@vkoul-mobl>
 <MN2PR11MB4080CF23D00A3AF817AC1E7CFF6D0@MN2PR11MB4080.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <077d4430-bb76-df2c-2c39-8077998e6fdc@linux.intel.com>
Date: Thu, 2 Jul 2020 10:01:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR11MB4080CF23D00A3AF817AC1E7CFF6D0@MN2PR11MB4080.namprd11.prod.outlook.com>
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
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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



On 7/2/20 2:35 AM, Liao, Bard wrote:
>> -----Original Message-----
>> From: Vinod Koul <vkoul@kernel.org>
>> Sent: Wednesday, July 1, 2020 1:42 PM
>> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>; alsa-devel@alsa-project.org;
>> tiwai@suse.de; gregkh@linuxfoundation.org; linux-kernel@vger.kernel.org;
>> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com;
>> broonie@kernel.org; srinivas.kandagatla@linaro.org; jank@cadence.com; Lin,
>> Mengdong <mengdong.lin@intel.com>; Blauciak, Slawomir
>> <slawomir.blauciak@intel.com>; Kale, Sanyog R <sanyog.r.kale@intel.com>;
>> rander.wang@linux.intel.com; Liao, Bard <bard.liao@intel.com>
>> Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
>> handlers/threads
>>
>> On 30-06-20, 11:46, Pierre-Louis Bossart wrote:
>>
>>>> Is this called from irq context or irq thread or something else?
>>>
>>> from IRQ thread, hence the name, see pointers above.
>>>
>>> The key part is that we could only make the hardware work as intended by
>>> using a single thread for all interrupt sources, and that patch is just the
>>> generalization of what was implemented for HDaudio in mid-2019 after
>> months
>>> of lost interrupts and IPC errors. See below the code from
>>> sound/soc/sof/intel/hda.c for interrupt handling.
>>
>> Sounds good. Now that you are already in irq thread, does it make sense
>> to spawn a worker thread for this and handle it there? Why not do in the
>> irq thread itself. Using a thread kind of defeats the whole point behind
>> concept of irq threads
> 
> Not sure If you are talking about cdns_update_slave_status_work().
> The reason we need to spawn a worker thread in sdw_cdns_irq() is
> that we will do sdw transfer which will generate an interrupt when
> a slave interrupt is triggered. And the handler will not be invoked if the
> previous handler is not return yet.
> Please see the scenario below for better explanation.
> 1. Slave interrupt arrives
> 	2.1 Try to read Slave register and waiting for the transfer response
> 	2.2 Get the transfer response interrupt and finish the sdw transfer.
> 3. Finish the Slave interrupt handling.
> 
> Interrupts are triggered in step 1 and 2.2, but step 2.2's handler will not be
> invoked if step 1's handler is not return yet.
> What we do is to spawn a worker thread to do step 2 and return from step 1.
> So the handler can be invoked when the transfer response interrupt arrives.

To build on Bard's correct answer, the irq thread only takes care of 
'immediate' actions, such as command completion, parity or bus clash 
errors. The rest of the work can be split in
a) changes to device state, usually for attachment and enumeration. This 
is rather slow and will entail regmap syncs.
b) device interrupts - typically only for jack detection which is also 
rather slow.

Since this irq thread function is actually part of the entire HDaudio 
controller interrupt handling, we have to defer the work for cases a) 
and b) and re-enable the HDaudio interrupts at the end of the irq thread 
function - see the code I shared earlier.

In addition, both a) and b) will result  in transactions over the bus, 
which will trigger interrupts to signal the command completions. In 
other words, because of the asynchronous nature of the transactions, we 
need a two-level implementation. If you look at the previous solution it 
was the same, the commands were issued in the irq thread and the command 
completion was handled in the handler, since we had to make the handler 
minimal with a global GIE interrupt disable we kept the same hierarchy 
to deal with commands but move it up one level.

You could argue that maybe a worker thread is not optimal and could be 
replaced by something better/faster. Since the jack detection is 
typically handled with a worker thread in all ASoC codec drivers, we 
didn't feel the need to optimize further. We did not see any performance 
impact with this change.

Does this answer to your concern?




