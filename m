Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8372C8280
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 11:47:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440E21745;
	Mon, 30 Nov 2020 11:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440E21745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606733233;
	bh=ECDQtY0ilHpVTrO0YqXdCNoCs+g6ouPdcFPYGJ4wtr0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RT2gzDSp7iA+5C7JphaCYkJd0fQnjzCv0VJbYXFjLu0cNjO47WOmarh8NeTj10bUz
	 Mg3DP1o0RH5mPsz67t7qSjb09TcgroqGIKzjqghVIBjO8W029B9/XNu2898GbV6PGg
	 QwbfWPekw8kBsGY7mohet8wUHZpTaVxHwArVtoPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A56E2F800D0;
	Mon, 30 Nov 2020 11:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4122CF8025F; Mon, 30 Nov 2020 11:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0735F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 11:45:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0735F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="NLI/PQJc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=0zBGlB/pBzsuLOe3mNaPynjhR0Iuh6ooJgwl9QgQmVE=; b=NLI/PQJcSoMYGJWVOo+a/YtCw8
 V4zSrL0sYNgTB3DIjwIvoVeiMwWydNflSeQ+NKhwSZPWNo7yGGoHmYt2IoDUuwljzV5z/95V/xN3C
 LfBU1WC7Qx7vmgd+b7qz2kt5iKotHu8PcNpWxObNxDpdT404H4AZ/eTqCvCYMA0YFF/hQdhaQ9lAr
 hShAIsVSmr+wNJ2pfzUezgkPeDQHH+xSWiHNwb8zkA3sLRphRnmZlbDuris2sp7PJNsUmE2EkgsqH
 w88+y9HiNG04beZ71LS91Oie/oWfYZwFd0U2IjJfPFYng09iOQGVI8yZExJXaA/xEzgtpoCfcZPQF
 2KKEsTrQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kjggI-0003wX-E7; Mon, 30 Nov 2020 11:45:18 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kjggI-000N6P-7p; Mon, 30 Nov 2020 11:45:18 +0100
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <e9bae9eb-6b8b-5a8c-eba0-d7f5da955987@metafoo.de>
Date: Mon, 30 Nov 2020 11:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26003/Sun Nov 29 15:08:06 2020)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 11/30/20 10:57 AM, Sit, Michael Wei Hong wrote:
>
>> -----Original Message-----
>> From: Sia, Jee Heng <jee.heng.sia@intel.com>
>> Sent: Tuesday, 24 November, 2020 11:51 AM
>> To: Shevchenko, Andriy <andriy.shevchenko@intel.com>
>> Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
>> alsa-devel@alsa-project.org; tiwai@suse.com;
>> broonie@kernel.org; pierre-louis.bossart@linux.intel.com;
>> Rojewski, Cezary <cezary.rojewski@intel.com>;
>> liam.r.girdwood@linux.intel.com; vkoul@kernel.org;
>> lars@metafoo.de
>> Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm:
>> Add custom prepare and submit function
>>
>>
>>
>>> -----Original Message-----
>>> From: Shevchenko, Andriy <andriy.shevchenko@intel.com>
>>> Sent: 18 November 2020 10:51 PM
>>> To: Sia, Jee Heng <jee.heng.sia@intel.com>
>>> Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
>>> alsa-devel@alsa- project.org; tiwai@suse.com;
>> broonie@kernel.org;
>>> pierre- louis.bossart@linux.intel.com; Rojewski, Cezary
>>> <cezary.rojewski@intel.com>; liam.r.girdwood@linux.intel.com;
>>> vkoul@kernel.org; lars@metafoo.de
>>> Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-
>> pcm: Add
>>> custom prepare and submit function
>>>
>>> On Wed, Nov 18, 2020 at 02:34:22AM +0200, Sia, Jee Heng
>> wrote:
>>>>> From: Andy Shevchenko <andriy.shevchenko@intel.com>
>>>>> Sent: 17 November 2020 11:51 PM
>>>>> On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei
>> Hong wrote:
>>>>>> Enabling custom prepare and submit function to
>> overcome DMA limitation.
>>>>>> In the Intel KeemBay solution, the DW AXI-based DMA
>> has a
>>>>>> limitation on the number of DMA blocks per transfer. In
>> the case
>>>>>> of 16 bit audio ASoC would allocate blocks exceeding the
>> DMA block limitation.
>>>>> I'm still not sure the hardware has such a limitation.
>>>>>
>>>>> The Synopsys IP supports linked list (LLI) transfers and I
>> hardly
>>>>> can imagine the list has any limitation. Even though, one can
>>>>> always emulate LLI in software how it's done in the
>> DesignWare AHB DMA driver.
>>>>> I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM
>> and
>>>>> didn't find any errata or limits like this.
>>>> [>>] Intel KeemBay datasheet can be found at below link:
>>>>
>> https://www.intel.com/content/www/us/en/secure/design/con
>> fidential/p
>>>> ro
>>>> ducts-and-solutions/processors-and-chipsets/keem-
>> bay/technical-libra
>>>> ry .html?grouping=EMT_Content%20Type&sort=title:asc
>>>> Pg783, "Programmable transfer length (block length), max
>> 1024".
>>>> Sub-list can't
>>> exceed 1024 blocks.
>>>> BTW, I think the 16bits audio could be a confusion because it is
>> not
>>>> about the
>>> number of bits, but rather the constraint of the block length.
>> Base on
>>> my understanding, Audio needs a period larger than 10ms,
>> regardless of the bit depth.
>>>> The questions here are:
>>>> 1. Should DMAEngine expose a new API to constraint the
>> block_length
>>>> (instead of
>>> size in bytes)?
>>>> 2. Should DMA client re-split the linked-list before passing the
>>>> linked-list to
>>> DMAEngine.
>>>> 3. Should DMA controller driver re-split the linked-list before
>> execution.
>>> Since we have DMA slave capabilities, the consumer may ask
>> for them
>>> and prepare the SG list accordingly.
>>>
>>> Above limitation is a block size (value of 1023 is a maximum,
>> meaning
>>> 1024 maximum items in the block of given transfer width). So,
>> like
>>> DesignWare DMA
>>> (AHB) has up to 4095 (but I saw hardware with 2047) or iDMA
>> 32- and
>>> 64-bit have 131071. There is no limitation for amount of blocks
>> of
>>> given maximum length in the LLI!
>>>
>>> No hacks are needed, really.
>> [>>] Hi All, can we have the agreement that DMA clients should
>> optimize the linked-list [>>] by retrieve the DMA capabilities from
>> the DMA controller?
>> [>>] I noticed that Vinod voted #3 but Andy voted #2.
>> [>>] We need your decision to move on.
>>> --
>>> With Best Regards,
>>> Andy Shevchenko
>>>
> Hi everyone,
>
> Is there anymore comment on this RFC?
> We will be using the ASoC framework to split the linked-list, since resplitting the linked-list in DMA is a no go.
> If there isn't any more comments, we will push these patches for review and merging.

Hi,

Why is splitting the list in the DMAengine framework a no go?

The whole idea of the DMAengine framework is to hide hardware specifics. 
It offers an API with certain semantics and it is up to the driver to 
provide an implementation that implements these semantics. There does 
not necessarily have to be a 1-to-1 mapping to hardware primitives in 
such an implementation.

- Lars

