Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67000120A05
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 16:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F0D1669;
	Mon, 16 Dec 2019 16:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F0D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576511222;
	bh=EXnJyrZXla9Se5fn9qnnl+RHO2uvsCLQmkfcXsEuaVw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqNiM9b7ajs+R5gbCptPn2ootCreLgAefv6E6j27mveaBOayhDel6A1n1XyUExvUH
	 6ecCX1KwghjRKYtaC2Z8TIGHjurRfnichhHD3j+VYFLpIR89mqmdfcBu1vUedl7cVc
	 arb9xuKVicopgoaVYIgRtJNm+x2xXncf6Av+XprI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D81CEF8022C;
	Mon, 16 Dec 2019 16:45:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA6EF80255; Mon, 16 Dec 2019 16:45:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 991A0F8014F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 16:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991A0F8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 07:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="247075032"
Received: from andresma-mobl.amr.corp.intel.com (HELO [10.252.132.232])
 ([10.252.132.232])
 by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2019 07:45:06 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
 <20191213072844.GF1750354@kroah.com>
 <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
 <20191213161046.GA2653074@kroah.com>
 <20728848-e0ae-01f6-1c45-c8eef6a6a1f4@linux.intel.com>
 <20191214082742.GA3318534@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e9d77c58-e0bd-010c-bbc8-b54c82f065fd@linux.intel.com>
Date: Mon, 16 Dec 2019 09:02:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191214082742.GA3318534@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
 definitions for sdw_master_device
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



On 12/14/19 2:27 AM, Greg KH wrote:
> On Fri, Dec 13, 2019 at 05:25:23PM -0600, Pierre-Louis Bossart wrote:
>>
>>> No, I mean the new MODULE_NAMESPACE() support that is in the kernel.
>>> I'll move the greybus code to use it too, but when you are adding new
>>> apis, it just makes sense to use it then as well.
>>
>> Greg, would the patch below be what you had in mind?
>> Thanks
>> -Pierre
>>
>>
>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>> index 76a5c52b12b4..5bad8422887e 100644
>> --- a/drivers/soundwire/Makefile
>> +++ b/drivers/soundwire/Makefile
>> @@ -7,9 +7,11 @@ ccflags-y += -DDEBUG
>>   #Bus Objs
>>   soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o
>> stream.o
>>   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>> +ccflags-$(CONFIG_SOUNDWIRE) += -DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE
>>
>>   soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
>>   obj-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) +=
>> soundwire-generic-allocation.o
>> +ccflags-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) +=
>> -DDEFAULT_SYMBOL_NAMESPACE=SDW_CORE
> 
> Don't use ccflags, just use the correct MODULE_EXPORT_NS() tag instead.

The documentation [1] states

"
Defining namespaces for all symbols of a subsystem can be very verbose 
and may become hard to maintain. Therefore a default define 
(DEFAULT_SYMBOL_NAMESPACE) is been provided, that, if set, will become 
the default for all EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() macro 
expansions that do not specify a namespace.
"

If the ccflags option is not supported or no longer desired, it'd be 
worth updating the documentation for dummies like me. I took the wording 
as a hint to avoid using MODULE_EXPORT_NS.

> And "SDW_CORE" is odd, "SOUNDWIRE" instead?

'sdw' is the prefix used everywhere for SoundWire symbols.

[1] https://www.kernel.org/doc/html/latest/core-api/symbol-namespaces.html
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
