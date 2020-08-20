Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9ED24B02F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 09:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197371682;
	Thu, 20 Aug 2020 09:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197371682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597908736;
	bh=PaqqI5w3MH6hFUexfU83GDHMhqNXUs8Qx1PDyZlxFQg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDzIWBeoOhi4pPXilLf5KDceiPbCKBEBIr0ahyeTRXyCXabb/KeB/8fBozn7dfx6/
	 rSdoR+1MQDUEjC5qYfYMVNi0NXjxbvcsBvcWu7EueYHReYYVWhu6voLH/AS6otC8Jh
	 mK2jttLGHkRAfp4aonbGXNeAqpHpKrEEvt5qZCcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A9EF8023F;
	Thu, 20 Aug 2020 09:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72112F80228; Thu, 20 Aug 2020 09:30:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11162F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 09:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11162F80114
IronPort-SDR: pIr833avm7tuyYx0zeOmCkJf6cN7Gd6GJpJq+cZpfnIgqRpHo3qIkcGeKN4CduxON4OR08e+pk
 F9GNOIR8ej/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="219559617"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="219559617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 00:30:19 -0700
IronPort-SDR: jvfhywWI2t51R4muhG1P3ITdUYjAtvZY9a+xeBrWnCZvr9az9tAERb3GdBv3YkRcd8Aj8Blc+S
 Nm9HQyEI5M5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="279905277"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.157.204])
 ([10.249.157.204])
 by fmsmga008.fm.intel.com with ESMTP; 20 Aug 2020 00:30:14 -0700
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
Message-ID: <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
Date: Thu, 20 Aug 2020 09:30:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On 2020-08-17 1:12 PM, Cezary Rojewski wrote:
> On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
>> On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:

>>
>>> +#define CATPT_DMA_MAXBURST    0x3
>>
>> We have DMA engine definitions for that, please avoid magic numbers.
>>
> 
> As with most of the dma stuff, based on existing:
> /sound/soc/intel/common/sst-firmware.c SST_DSP_DMA_MAX_BURST
> 
> Ack.
> 

Actually, wasn't able to find anything _MAXBURST related in dmaengine.h. 
_BUSWIDTH_ have their constants defined there, true, but I'm already 
making use of these and this is dst/src_maxburst we're talking about. 
 From what I've seen in kernel sources, most usages are direct 
assignments: xxx_maxburst = Y;

>>> +    /* set D3 */
>>> +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
>>> +    udelay(50);
>>
>> Don't we have PCI core function for this?
>>
>> ...
>>
>>> +    /* set D0 */
>>> +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
>>> +    udelay(100);
>>
>> Ditto.
>>
>> ...
>>
>>> +    /* set D3 */
>>> +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
>>> +    udelay(50);
>>
>> Ditto.
>>
>> ...
>>
>>> +    /* set D0 */
>>> +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
>>
>> Ditto.
>>
> 
> Thanks to you now I know the correct answer: yes.
> Ack for all of these. Good advice Andy, again!

Similar situation occurred here. What we're dealing with is: instance of 
'struct platform_device' type, found on bus: acpi with PCI set as a 
parent device.

Scope found in DSDT:
	\_SB_.PCI0.ADSP
sysfs device path:
	/sys/devices/pci0000:00/INT3438:00
Within the latter _no_ standard utility files will be available e.g.: 
ability to dump PCI config space, bars and such.

I haven't found any functionality to extract "pci_companion" from a 
platform_device. What can be made use of is: PCI_D3hot and PCI_D0 enum 
constants, as pci_set_power_state() does not apply - expects struct 
pci_dev *.

Perhaps got misled by the function naming? catpt_updatel_xxx helpers: 
_xxx denotes specific ADSP device's mmio space. Almost all cases are 
covered by _pci and _shim.
