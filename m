Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A991CFB85
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 19:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3743116D3;
	Tue, 12 May 2020 19:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3743116D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589302995;
	bh=+FgrVYwsFl7EL1gSkB/aeZnEL+nuiARcPD/rSP79HN0=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jt+P35brE6OC0TMNlgmXAA92aMKCysR1Axk6TDUeof4x2veWt+LwRaBYN/6ogRGeJ
	 ZGk470ftOKwwMoSS6UAp3WKegisfS3+1HTPyWCNAdU/jKGySRhJYCKCLqB2EX1CbsT
	 whRujCWSvz5FAKvokfeCAnzmvxCts4Kc4V4nRqYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A749F800AA;
	Tue, 12 May 2020 19:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9338F8014C; Tue, 12 May 2020 19:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30232F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 19:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30232F800AA
IronPort-SDR: XeUTXGaJgL07V9SpQX6LFxF1a3bHY1xMGtesr/ieZKMEQud8Ig9UVU/57/dFlk63C+ss4QIagv
 yDYM5l9axJTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 10:01:07 -0700
IronPort-SDR: Db+r0AcSc4+ThFSgLvogNxTh85ziDyrWydS9TnmqFaUWvjWYYVYlI8AICp5miq0ISGU+OqX1/u
 /dUoFeYTtoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="297371105"
Received: from bbian-mobl3.amr.corp.intel.com (HELO [10.254.96.32])
 ([10.254.96.32])
 by fmsmga002.fm.intel.com with ESMTP; 12 May 2020 10:01:05 -0700
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
 <20200512033035.GV1375924@vkoul-mobl>
 <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
 <20200512155927.GA4297@vkoul-mobl>
 <79ee2b4a-c2e3-aba7-8b67-b1a01922d089@linux.intel.com>
Message-ID: <86d45af8-93db-d284-64d4-efa22ccc0908@linux.intel.com>
Date: Tue, 12 May 2020 12:01:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79ee2b4a-c2e3-aba7-8b67-b1a01922d089@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 5/12/20 11:08 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/12/20 10:59 AM, Vinod Koul wrote:
>> On 12-05-20, 09:36, Pierre-Louis Bossart wrote:
>>> On 5/11/20 10:30 PM, Vinod Koul wrote:
>>>> On 11-05-20, 14:00, Pierre-Louis Bossart wrote:
>>>>>>> +    md = &bus->md;
>>>>>>> +    md->dev.bus = &sdw_bus_type;
>>>>>>> +    md->dev.type = &sdw_master_type;
>>>>>>> +    md->dev.parent = parent;
>>>>>>> +    md->dev.of_node = parent->of_node;
>>>>>>> +    md->dev.fwnode = fwnode;
>>>>>>> +    md->dev.dma_mask = parent->dma_mask;
>>>>>>> +
>>>>>>> +    dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
>>>>>>
>>>>>> This give nice sdw-master-0. In DT this comes from reg property. I 
>>>>>> dont
>>>>>> seem to recall if the ACPI/Disco spec treats link_id as unique across
>>>>>> the system, can you check that please, if not we would need to update
>>>>>> this.
>>>>> Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are 
>>>>> relative
>>>>> to the immediate parent Device."
>>>>>
>>>>> There isn't any known implementation with more than one controller.
>>>>
>>>> But then it can come in "future" right. So lets try to make it future
>>>> proof by not using the link_id (we can expose that as a sysfs if people
>>>> want to know). So a global unique id needs to allocated (hint: idr or
>>>> equivalent) and used as master_id
>>>
>>> Can you clarify if you are asking for a global ID for Intel/ACPI 
>>> platforms,
>>> or for DT as well? I can't figure out from the soundwire-controller.yaml
>>> definitions if there is already a notion of unique ID.
>>
>> If ACPI was unique, then I was planning to update the definition below
>> to include that. Given that it is not the case, let's make it agnostic to
>> underlying firmware.
> 
> I am not sure I understand how this would be done.
> 
> The call sequence is
> 
> sdw_bus_master_add(bus)
>      sdw_master_device_add(bus, parent, fw_node)
> 
> At the bus level, we don't have any information on which controller the 
> bus is related to.
> 
> We'd need to add an argument to sdw_bus_master_add() and have the 
> controller unique ID be allocated outside of the SoundWire core, hence 
> my question on whether the DT definition should not be extended.

And btw I don't think it makes sense to add a new definition for Intel. 
We already have a notion of HDaudio bus->idx that's set to zero since we 
don't have a case for multiple HDaudio controllers.

if we ever do have more than once controller, then we should rely on 
HDaudio bus->idx as the identifier and not create one specifically for 
SoundWire - which means as I mentioned above passing an argument and not 
defining a controller ID in the SoundWire core.
