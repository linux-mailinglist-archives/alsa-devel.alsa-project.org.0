Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDECF5028
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 16:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 429D8166E;
	Fri,  8 Nov 2019 16:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 429D8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573228191;
	bh=Fr5VFhs0IXGHvnGDh1QXE68h/gTJndlKQgAb0zVVUsw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/CrLmBHQArEe9GuJywbJuyy+tU4vyQp+5dPRIgidOwkxvgjwyhAyXzNwoWsO//Sz
	 sd0z9MoV3nLm/k+0V/CQdvSf6vkiNZAjetrcjq0Wdu1t7bfG2exNGPW+l0GL6v9U/V
	 ZVIVWg+Wa69XM1oo5Onx+YITikfNzf7dEaOu9ygg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F0B1F803D0;
	Fri,  8 Nov 2019 16:48:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA6EF800D3; Fri,  8 Nov 2019 16:48:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7845EF800D3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 16:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7845EF800D3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 07:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; d="scan'208";a="377794945"
Received: from nupoorko-mobl1.amr.corp.intel.com (HELO [10.251.157.201])
 ([10.251.157.201])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2019 07:47:44 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-8-pierre-louis.bossart@linux.intel.com>
 <20191103063051.GJ2695@vkoul-mobl.Dlink>
 <9a8fb9ec-1ccb-4931-1ec6-bfae043e8c88@linux.intel.com>
 <20191108040427.GT952516@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d20c13c2-ffed-1147-769f-a483d4d9847b@linux.intel.com>
Date: Fri, 8 Nov 2019 08:41:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191108040427.GT952516@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 07/14] soundwire: add initial definitions
 for sdw_master_device
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



On 11/7/19 10:04 PM, Vinod Koul wrote:
> On 04-11-19, 08:42, Pierre-Louis Bossart wrote:
>>
>>
>> On 11/3/19 1:30 AM, Vinod Koul wrote:
>>> On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
>>>> Since we want an explicit support for the SoundWire Master device, add
>>>> the definitions, following the Grey Bus example.
>>>>
>>>> Open: do we need to set a variable when dealing with the master uevent?
>>>
>>> I dont think we want that or we need that!
>>
>> In GreyBus there are events and variables set, not sure what they were used
>> for. The code works without setting an event, but we'd need to make a
>> conscious design decision, and I am not too sure what usersace would use the
>> informatio for.
>>
>>>
>>> And to prevent that rather than adding a variable, can you please
>>> modify the device_type and use separate ones for master_device and
>>> slave_device
>>
>> sorry, I don't get the comment. There is only already a different device
>> type
>>
>>
>> struct bus_type sdw_bus_type = {
>> 	.name = "soundwire",
>> 	.match = sdw_bus_match,
>> 	.uevent = sdw_uevent,
> 
> We can remove this
> 
>> };
>>
>> struct device_type sdw_slave_type = {
>> 	.name =		"sdw_slave",
>> 	.release =	sdw_slave_release,
> 
> Add here:
> 
>          uevent = sdw_uevent,
> 
>> };
>>
>> struct device_type sdw_md_type = {
>> 	.name =		"soundwire_master",
>> 	.release =	sdw_md_release,
>> };
> 
> And not have here!
> 
> Problem solved!

I will give it a try but I don't know what the 'problem' was.
The code works as is, and btw you are commenting on the wrong version of 
the series, v2 was sent yesterday.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
