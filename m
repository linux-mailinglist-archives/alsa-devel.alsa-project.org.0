Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A93249FD7
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 15:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE0A184E;
	Wed, 19 Aug 2020 15:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE0A184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597843688;
	bh=/dqK1jItTGmTMZRZeQ6DqUAa4WzqQDiC+zXRlW5abX4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZGb2nrVJKjKQbzOOX8A4mDO/XMWmo8252iPnbOfIdm/r+/8wRA2tKNrNUQjMoOpW
	 iaR6STDa+GCSLeV/dZjoB8fjyhGTvpSSfYwzDKpNxuG8Na3JATJZd5uptO4HSoOiTg
	 o6iNZPuuaFtw9Ri5fQbF/9IgPcBXsC9kaq/NgEE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F6CF80255;
	Wed, 19 Aug 2020 15:26:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4967CF80218; Wed, 19 Aug 2020 15:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A3A0F8011C
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 15:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A3A0F8011C
IronPort-SDR: DoiqjeCH2Em/27QNMhBWAd+v+BbJ/8Si9mWrADFomEIbOFZGnDtuF280z3I88EdNQYHQK3qMUC
 QfBp6a4Vxfrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152518811"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="152518811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 06:26:12 -0700
IronPort-SDR: uxOoKx7C3SRrI17Dk1AlEJQQvRPaHInh7AmTskmHWtbv7C9rxUWyED2BHZPSQqwOPielmE1Hsu
 KYq8ddSe4qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="441600074"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.18.70])
 ([10.213.18.70])
 by orsmga004.jf.intel.com with ESMTP; 19 Aug 2020 06:26:05 -0700
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
 <20200818100743.GH1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7cd5fa73-797e-17c3-4b7c-7635a18c59af@intel.com>
Date: Wed, 19 Aug 2020 15:26:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818100743.GH1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2020-08-18 12:07 PM, Andy Shevchenko wrote:
> On Mon, Aug 17, 2020 at 12:02:39PM +0200, Cezary Rojewski wrote:
>> On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
>>> On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:
>>
>> Thanks for good review Andy!
> 
> You're welcome!
> 

>>>> +struct catpt_dev {
>>>> +	struct device *dev;
>>>
>>>> +	struct dw_dma_chip *dmac;
>>>
>>> Is it possible to use opaque pointer here? It will be better if in the future
>>> (I think unlikely, but still) somebody decides to use this with another DMA
>>> engine.
>>
>> Any opaque structure comes at a cost -> requires higher level of
>> understanding from developers maintaining given piece of code (that includes
>> architecture knowledge too, to get a grasp of why such decision was even
>> made) == higher maintaince cost.
>>
>> One could device ADSP architectures into:
>> 1) LPT/WPT
>> 2) BYT/CHT/BDW
>> 3) cAVS (SKL+)
>> 4) new (which I won't be elaborating here for obvious reasons)
>>
>> To my knowledge, except for 1), none of them makes use of dmaengine.h when
>> loading FW or doing any other action for that matter. As such, I don't see
>> any reason to convert something explicit into something implicit. Don't
>> believe either of options would be reusing struct catpt_dev too. In general,
>> to make that happen you'd have to start with conversion of existing HDAudio
>> transport (cAVS+) into dmaengine model and then do the same with SoundWire
>> (cAVS+) - haven't seen sdw code in a while but still pretty sure it's not
>> dmaengine-friendly.
> 
> 
> Some documentation says that Audio is using iDMA 32-bit in (some?) BSW/CHT,
> some documentation says otherwise (Synopsys DesignWare). Can you somewhere
> clarify what the actual state of affairs? I remember even some (android?) ASoC
> code used to have different type of DMA engines because of that.

Well, we are supporting Android for HDA-based platforms only. At least 
that's true for Androids my team is covering. LPT/WPT and BYT/CHT/BSW 
architectures are not part of that coverage (and I'm not aware of any 
support for these on Android, probably some hard-maintainance with no 
possibility of changes). As HDA DMAs are made use of during image 
loading in cAVS+, there is no need for enlisting DW DMAC.

BYT/CHT/BSW support moved to /sound/soc/intel/atom (away from 
/sound/soc/intel/baytrail in case of BYT) mostly with support available 
in SOF too. Support for that architecture in either of the solutions is 
not within my area of expertise but I don't believe any DMAC is enlisted 
there either.

>>>> +	if (ret < 0)
>>>
>>> I'm wondering if all these ' < 0' all over the code make sense? What do you
>>> expect out of positive returned values if any?
>>>
>>
>> Isn't this more of a preference? Please note I'm basing many of my decisions
>> on code that's around me - /sound/core/ and sound/soc/ *.c.
>>
>> Except for IPCs, basically all catpt rets retrieved from functions called
>> will be returning either 0 (success) or <0 (error). No objections, but I
>> don't see much difference either.
> 
> In case some will return positive code you may hide the (potential) issue.
> I prefer be explicit over implicit, means use ' < 0' only where it makes sense.
> 

Ack.

>>>> +	ret = devm_add_action(cdev->dev, board_pdev_unregister, board);
>>>> +	if (ret < 0) {
>>>> +		platform_device_unregister(board);
>>>
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>
>>> return ret;
>>>
>>
>> Similarly, to comment~2 regarding preferences, don't mind the change (in
>> fact, I'm a fan) but in the past got messaged to leave things explicit -
>> leave last 'if' with return ret, while return 0 marking success outside.
> 
> Actually you may simplify by calling devm_add_action_or_reset() instead.
> 

Indeed, that simplifies things. Ack.

>>>> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
>>>> +	if (!cdev)
>>>> +		return -ENOMEM;
>>>
>>>
>>>> +	cdev->spec = device_get_match_data(dev);
>>>> +	if (!cdev->spec)
>>>> +		return -ENODEV;
>>>
>>> You may save some cycles if you do this before memory allocations.
>>>
>>
>> i.e. define a local for spec, assign and begin the init process only once
>> it's found? Isn't that a loss in most cases? Comes down to:
>>
>> 	declare local + later cdev->spec = spec assignment
>> 	vs
>> 	unlikely -ENODEV with memory being unnecessarily allocated
>>
>> Perhaps I'm unaware of what's going on with device_get_match_data, but I
>> believe .probe() won't get called until one of .acpi_match_table ids matches
>> device available on the bus. Existing list of ids won't ever get changed as
>> there are only two platforms available for 2011-2013 ADSP architecture.
> 
> Up to you but I consider cleaner code if we don't do heavier operation ahead
> when lighter ones can fail.
> 

And this is a very good approach. Thought device_get_match_data is 
'heavier' than the devm_kzalloc.

>>>> +	/* map DSP bar address */
>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +	if (!res)
>>>> +		return -ENODEV;
>>>> +	cdev->lpe_ba = devm_ioremap(dev, res->start, resource_size(res));
>>>> +	if (!cdev->lpe_ba)
>>>> +		return -EIO;
>>>> +	cdev->lpe_base = res->start;
>>>
>>> Why the region is not get requested?
>>>
>>>> +	/* map PCI bar address */
>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>>> +	if (!res)
>>>> +		return -ENODEV;
>>>> +	cdev->pci_ba = devm_ioremap(dev, res->start, resource_size(res));
>>>> +	if (!cdev->pci_ba)
>>>> +		return -EIO;
>>>
>>> Ditto.
>>>
>>
>> Comes from catpt_dmac_probe() (dsp.c) making use of devm_ioremap_resource().
>> If you _get_ requested resource there, the function called in
>> catpt_dmac_probe() will yielrd -EBUSY.
>>
>> This is based on existing code:
>> /sound/soc/intel/common/sst-acpi.c ::sst_acpi_probe() see mmio assignments.
>> /sound/soc/intel/common/sst-firmate.ce ::dw_probe() see chip->regs
>> assignment.
>>
>> Perhaps you've found even more problems in existing code than I did..
> 
> Hmm... But isn't catpt_dmac_probe(), actually what is in the DMA engine driver
> beneath, should take care of the requesting *and* remapping resource?
> 
> ...
> 

One could say ADSP subsystem in LPT/WPT is made of following modules:
- dsp (shim) space
- 2x dma (engine 0 & 1)
- 2x ssp (with 1 tasked with BT-paths and 0 for non-BT-paths)

Recommended sequences in dsp.c (_power_up/ _power_down) will be 
operating only on SHIM and SSP spaces. DMA space is actually only 
accessed when dumping memory during device coredump. Because of that 
though, I cannot say "adsp will never access DMA space".

-

I did some testing today and indeed very simple approach suffices:
- devm_platform_get_and_ioremap_resource for DSP bar
- devm_platform_ioremap_resource for PCI bar
- instead of doing devm_ioremap_resource() separately for dmac in 
catpt_dmac_probe(), just do:

dmac->regs = cdev->lpe_ba + cdev->spec->host_dma_offset[<engine id>]

>>>> +		.acpi_match_table = ACPI_PTR(catpt_ids),
>>>
>>> ACPI_PTR() either bogus (when you have depends on ACPI) or mistake that brings
>>> you compiler warning (unused variable).
>>>
>>> I highly recommend in new code avoid completely ACPI_PTR() and of_match_ptr()
>>> macros.
>>>
>>
>> That's something new for me. Thanks for a good advice.
> 
> Basically of_match_ptr / ACPI_PTR should go together with ugly ifdeffery,
> otherwise neither of them should be present. If the driver can be compiled but
> won't be functional w/o OF / ACPI dependency, then we do something like
> 
> 	depends on ACPI || COMPILE_TEST
> 
> to give a hint to the user.
> 

Ack(s) all the way.

>>>> +#include <linux/iopoll.h>
>>>
>>> Missed headers:
>>> bits.h (note, the below guarantees to provide this one)
>>> bitops.h
>>> io.h (writel(), readl(), etc)
>>>
>>
>> Removed these as registers.h always gets included with other files which
>> already inhering them via nesting.
>> Will update in v5 as requested.
> 
> The rule of thumb is to include headers which we are direct users of.
> This is listed in Submit Patches Checklist document AFAIR.
> 

Thanks for info! Ack.

>>>> +#define CATPT_SSP_SSC0		0x0
>>>> +#define CATPT_SSP_SSC1		0x4
>>>> +#define CATPT_SSP_SSS		0x8
>>>> +#define CATPT_SSP_SSIT		0xC
>>>> +#define CATPT_SSP_SSD		0x10 and
>>>> +#define CATPT_SSP_SSTO		0x28
>>>> +#define CATPT_SSP_SSPSP		0x2C
>>>> +#define CATPT_SSP_SSTSA		0x30
>>>> +#define CATPT_SSP_SSRSA		0x34
>>>> +#define CATPT_SSP_SSTSS		0x38
>>>> +#define CATPT_SSP_SSC2		0x40
>>>> +#define CATPT_SSP_SSPSP2	0x44
>>>
>>> Isn't it PXA2xx register set? Can you use their definitions?
>>>
>>
>> Could you be more specific? Wasn't able to find anything useful in /include.
> 
> include/linux/pxa2xx_ssp.h
> 

Did some reconnaissance and it while this registers are shared, LPT/WPT 
are equipped with a newer version of said ssp device with some old 
functionalities have been removed too. So the question comes down to: do 
I re-use PXA2XX registers due to historical background (inheritance) 
-or- leave it explicit as is. Honestly, I don't really mind either of 
these. Got surprised by short register names in mentioned header though.

>>> These defaults lack of comments.
>>>
>>
>> Because there aren't any available to choose from. While these are part of
>> "recommended sequence", the only comment attached is:
>>      bring hw to their defaults as hw won't reset itself
>>
>> catpt is an effort of sw and fw guys, no hw input is included as I've found
>> only one guy still @ intel but he is busy with different projects and
>> honestly, even if he would agree, him digging now why was this needed might
>> take weeks. That's 2011 ADSP architecture, not some cutting-edge stuff.
> 
> I understand, but try your best to leave at least a little trail of these...
> Sometimes, btw, so called Production Kernel repository (patches there) may give
> a hint. Lately, during AtomISP v2 resurrection, it appears that Intel Aero
> platform has support there and a lot of quirks available somewhere.
> 

I'll see what I can do.
