Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C34251574
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 11:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2166F1675;
	Tue, 25 Aug 2020 11:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2166F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598348102;
	bh=W4ITxqAOA9Hpazq00Tei74DyFu9h6S2UXHUYJtUJJu0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ek3HWC1WXAanMfHo79NPsDBSv4DYw6CMFp+w/fvEY4CC14CJHyKqDUMIWXNxa9En0
	 1dIeBfGDcC4t7fyfiN3MU71o8JqDgXtBglIeJBMW0VgK6a91Zqi95tj4quU5Dnyvsd
	 5TsbzITbM2BdSZl97Dd3TiflKXMdiiVFKBpDXfFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49825F800EB;
	Tue, 25 Aug 2020 11:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0DF0F8025A; Tue, 25 Aug 2020 11:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D585F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 11:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D585F80143
IronPort-SDR: M+Qks1S76prDLNSm2GCP0DIoc/RSUDqzUM2hlrVKCRcO3RUetyGkGw7Ar59m/DyqDmB+Qz/vpQ
 OeVRXRguh0hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="143851225"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="143851225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 02:33:04 -0700
IronPort-SDR: eKvLWIrVWbHkiKZRU+B72cd9hBLOh++oyFrH+emPxOgry3FHnMBf3cLxZ4oOd2z1Rl/ctEf1vj
 3C8AWGSK50Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="336445713"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.19.243])
 ([10.213.19.243])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2020 02:32:58 -0700
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
 <20200818100743.GH1891694@smile.fi.intel.com>
 <7cd5fa73-797e-17c3-4b7c-7635a18c59af@intel.com>
 <20200819134323.GM1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <13a443ad-f667-c7f0-a25d-35baf94be23e@intel.com>
Date: Tue, 25 Aug 2020 11:32:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819134323.GM1891694@smile.fi.intel.com>
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

On 2020-08-19 3:43 PM, Andy Shevchenko wrote:
> On Wed, Aug 19, 2020 at 03:26:04PM +0200, Cezary Rojewski wrote:
>> On 2020-08-18 12:07 PM, Andy Shevchenko wrote:
>>> On Mon, Aug 17, 2020 at 12:02:39PM +0200, Cezary Rojewski wrote:
>>>> On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
>>>>> On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:

>>>>>> +#define CATPT_SSP_SSC0		0x0
>>>>>> +#define CATPT_SSP_SSC1		0x4
>>>>>> +#define CATPT_SSP_SSS		0x8
>>>>>> +#define CATPT_SSP_SSIT		0xC
>>>>>> +#define CATPT_SSP_SSD		0x10 and
>>>>>> +#define CATPT_SSP_SSTO		0x28
>>>>>> +#define CATPT_SSP_SSPSP		0x2C
>>>>>> +#define CATPT_SSP_SSTSA		0x30
>>>>>> +#define CATPT_SSP_SSRSA		0x34
>>>>>> +#define CATPT_SSP_SSTSS		0x38
>>>>>> +#define CATPT_SSP_SSC2		0x40
>>>>>> +#define CATPT_SSP_SSPSP2	0x44
>>>>>
>>>>> Isn't it PXA2xx register set? Can you use their definitions?
>>>>
>>>> Could you be more specific? Wasn't able to find anything useful in /include.
>>>
>>> include/linux/pxa2xx_ssp.h
>>
>> Did some reconnaissance and it while this registers are shared, LPT/WPT are
>> equipped with a newer version of said ssp device with some old
>> functionalities have been removed too. So the question comes down to: do I
>> re-use PXA2XX registers due to historical background (inheritance) -or-
>> leave it explicit as is. Honestly, I don't really mind either of these. Got
>> surprised by short register names in mentioned header though.
> 
> Short names are for historical reasons, but you may change them over the
> kernel, if you wish (I think you won't spend time on this).
> 
> My vision is to extend that header to cover changes and use it in your code.
> It might, though, require some cleanups to be done against pxa2xx_ssp.h.
> 

Conclusion from checking pxa2_ssp.h registers:

- SSPSP2 is missing (0x44)
- SSC2 vs SSACDD (0x40) both same offset but different purpose so 
probably new define would have to be added

As situation is similar to the resource-API case below are the options:
a) ship catpt with existing ssp reg set, update pxa2_ssp.h in following 
series and then re-use them for catpt
b) update pxa2_ssp.h first, await merge, ship catpt only afterward

I vote for option a) given the maturity driver is reaching plus I'd 
rather be done with sound/soc/intel/ sanitization sooner than later.

Czarek
