Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B81CF937
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 17:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A337016B0;
	Tue, 12 May 2020 17:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A337016B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589297570;
	bh=/Q2luAGTv6BcwfYkzG8VzCwMkCsPmwLxqeF0mq2Aolk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAesAIi8D+XgBpRZI2BZccDi36hnkCvaayUQn5tf6x7uxVwXD8isAOV/AKouPrh64
	 XoIB7AR+jp5PAVOkSh0nn5GqMqcobyf8/joCJvJTAmEZaNOjy4inGDz9F1Lq9SaUrG
	 8/URbFeMO8Vfj21vFoldDeecfUHbvOyzQUypeaJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 267ADF800B7;
	Tue, 12 May 2020 17:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F91F800B7; Tue, 12 May 2020 17:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A0AF800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 17:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A0AF800E3
IronPort-SDR: iuvKTBZqD0xVK6ijZaHUB+qfpLmeUrMWLzqdnpQaGmqVVL0/IbHQQqg8sMA5xGFZD9YuWziOZo
 UDgSIzFbelyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 08:30:23 -0700
IronPort-SDR: ZK3Se/fAkNFyJF7QxFxocRhwMaC21XL7PjjHBRWOuKhXYlwUSsgU9zriRl+JD5WOMbFHC3V6Jr
 FnvElm6Y+HgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="409336630"
Received: from bmtannen-mobl.amr.corp.intel.com (HELO [10.255.228.231])
 ([10.255.228.231])
 by orsmga004.jf.intel.com with ESMTP; 12 May 2020 08:30:21 -0700
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
To: Vinod Koul <vkoul@kernel.org>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
 <20200512033035.GV1375924@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
Date: Tue, 12 May 2020 09:36:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512033035.GV1375924@vkoul-mobl>
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



On 5/11/20 10:30 PM, Vinod Koul wrote:
> On 11-05-20, 14:00, Pierre-Louis Bossart wrote:
>>>> +	md = &bus->md;
>>>> +	md->dev.bus = &sdw_bus_type;
>>>> +	md->dev.type = &sdw_master_type;
>>>> +	md->dev.parent = parent;
>>>> +	md->dev.of_node = parent->of_node;
>>>> +	md->dev.fwnode = fwnode;
>>>> +	md->dev.dma_mask = parent->dma_mask;
>>>> +
>>>> +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
>>>
>>> This give nice sdw-master-0. In DT this comes from reg property. I dont
>>> seem to recall if the ACPI/Disco spec treats link_id as unique across
>>> the system, can you check that please, if not we would need to update
>>> this.
>> Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are relative
>> to the immediate parent Device."
>>
>> There isn't any known implementation with more than one controller.
> 
> But then it can come in "future" right. So lets try to make it future
> proof by not using the link_id (we can expose that as a sysfs if people
> want to know). So a global unique id needs to allocated (hint: idr or
> equivalent) and used as master_id

Can you clarify if you are asking for a global ID for Intel/ACPI 
platforms, or for DT as well? I can't figure out from the 
soundwire-controller.yaml definitions if there is already a notion of 
unique ID.

properties:
   $nodename:
     pattern: "^soundwire(@.*)?$"

    soundwire@c2d0000 {
         #address-cells = <2>;
         #size-cells = <0>;
         reg = <0x0c2d0000 0x2000>;
