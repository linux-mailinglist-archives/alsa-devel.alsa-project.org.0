Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0E1CFA2C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D4B16C3;
	Tue, 12 May 2020 18:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D4B16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589299832;
	bh=ePySVT/q9cN3vcu4Ky3uJUmeJgi4el32RPNW8j7eXI4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/Db9zfgVarDJR0jvdQB8GZMoStZQkq/CxHDd+dkSjfKpl9f0isQJgCSUyaGgdPo/
	 D4Oj+auuC5riFXYWGYMxcg1zUP+7l6QoNtUededtaJyXHRbsXWrQs/U+R6jRmsScyN
	 smziHo5dZkTnNJyKOEIM7fAp8wFvckFxNQTL9X3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F1DF8014C;
	Tue, 12 May 2020 18:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA46F8014C; Tue, 12 May 2020 18:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB2AF800B7
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 18:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB2AF800B7
IronPort-SDR: 8oXXYNgtn0ekdlnUdpvwgWzUIe/FLRGWYkIQ/gLR+oXwZNdWEYGJaauzmQff+o6eAXSefGLPlf
 mK4kdV+yAvNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 09:08:39 -0700
IronPort-SDR: nbIPwbVM1FtOkmdF1YvWu67mvfPrzxseWx7VxXKXCiGVUa0QnxqzBkn/Wf3aF1q6kFrtsGuiva
 AjQFJRAdYRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="409352761"
Received: from bmtannen-mobl.amr.corp.intel.com (HELO [10.255.228.231])
 ([10.255.228.231])
 by orsmga004.jf.intel.com with ESMTP; 12 May 2020 09:08:37 -0700
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
To: Vinod Koul <vkoul@kernel.org>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
 <20200512033035.GV1375924@vkoul-mobl>
 <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
 <20200512155927.GA4297@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <79ee2b4a-c2e3-aba7-8b67-b1a01922d089@linux.intel.com>
Date: Tue, 12 May 2020 11:08:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512155927.GA4297@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 5/12/20 10:59 AM, Vinod Koul wrote:
> On 12-05-20, 09:36, Pierre-Louis Bossart wrote:
>> On 5/11/20 10:30 PM, Vinod Koul wrote:
>>> On 11-05-20, 14:00, Pierre-Louis Bossart wrote:
>>>>>> +	md = &bus->md;
>>>>>> +	md->dev.bus = &sdw_bus_type;
>>>>>> +	md->dev.type = &sdw_master_type;
>>>>>> +	md->dev.parent = parent;
>>>>>> +	md->dev.of_node = parent->of_node;
>>>>>> +	md->dev.fwnode = fwnode;
>>>>>> +	md->dev.dma_mask = parent->dma_mask;
>>>>>> +
>>>>>> +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
>>>>>
>>>>> This give nice sdw-master-0. In DT this comes from reg property. I dont
>>>>> seem to recall if the ACPI/Disco spec treats link_id as unique across
>>>>> the system, can you check that please, if not we would need to update
>>>>> this.
>>>> Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are relative
>>>> to the immediate parent Device."
>>>>
>>>> There isn't any known implementation with more than one controller.
>>>
>>> But then it can come in "future" right. So lets try to make it future
>>> proof by not using the link_id (we can expose that as a sysfs if people
>>> want to know). So a global unique id needs to allocated (hint: idr or
>>> equivalent) and used as master_id
>>
>> Can you clarify if you are asking for a global ID for Intel/ACPI platforms,
>> or for DT as well? I can't figure out from the soundwire-controller.yaml
>> definitions if there is already a notion of unique ID.
> 
> If ACPI was unique, then I was planning to update the definition below
> to include that. Given that it is not the case, let's make it agnostic to
> underlying firmware.

I am not sure I understand how this would be done.

The call sequence is

sdw_bus_master_add(bus)
     sdw_master_device_add(bus, parent, fw_node)

At the bus level, we don't have any information on which controller the 
bus is related to.

We'd need to add an argument to sdw_bus_master_add() and have the 
controller unique ID be allocated outside of the SoundWire core, hence 
my question on whether the DT definition should not be extended.

> 
>>
>> properties:
>>    $nodename:
>>      pattern: "^soundwire(@.*)?$"
>>
>>     soundwire@c2d0000 {
>>          #address-cells = <2>;
>>          #size-cells = <0>;
>>          reg = <0x0c2d0000 0x2000>;
> 
