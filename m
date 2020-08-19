Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49824A072
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 15:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916B2179E;
	Wed, 19 Aug 2020 15:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916B2179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597844912;
	bh=uoH63gJ/ElQ+mUgSLiwscbDo55y6iLkWZ8pbQIgaD20=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K96NTVv5Tj+zz7Yzc6BZvkLDDzFNd20kEUgQh/j0sdq9/xQzbj39LNjBWts2bZlGy
	 pwLULYXSTrD3H7WymrzgcN9CQkzoD5icDuz1G48DyDvYsCPcdGBPdKzS4+wTbiWJ7m
	 SAgYmWSe1EfIMzPU/KEqK/nTpgVOOGhXn6zXCeOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26B4F80114;
	Wed, 19 Aug 2020 15:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 178C8F80218; Wed, 19 Aug 2020 15:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C69C6F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 15:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C69C6F80114
IronPort-SDR: 1dGPkmQygbZy8+YXMqq+EmhwDK8HsI9MMeTrT2KLXNlG7hBSVLDdJ2h7j+j9iAHeDuKE1en4Gg
 royhrvzjXrZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239936830"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="239936830"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 06:46:39 -0700
IronPort-SDR: WqW3ihR21tlVEA5CDVaysfUIUtnMY0RK12WMnblEp8tGPUx18vjbUXcuY3KhLUFmT54N6Fn5Bp
 QhjlyC8ejbWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="441605322"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.18.70])
 ([10.213.18.70])
 by orsmga004.jf.intel.com with ESMTP; 19 Aug 2020 06:46:31 -0700
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <20200818115050.GI1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9a733e30-8d44-edf7-1bae-5b6f935628d2@intel.com>
Date: Wed, 19 Aug 2020 15:46:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818115050.GI1891694@smile.fi.intel.com>
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

On 2020-08-18 1:50 PM, Andy Shevchenko wrote:
> On Mon, Aug 17, 2020 at 01:12:01PM +0200, Cezary Rojewski wrote:
>> On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
>>> On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
>>>> Implement dsp lifecycle functions such as core RESET and STALL,
>>>> SRAM power control and LP clock selection. This also adds functions for
>>>> handling transport over DW DMA controller.
>>
>> Thanks for your input Andy!
> 
> You're welcome!
> 

>>>> +#define CATPT_DMA_DEVID		1 /* dma engine used */
>>>
>>> Not sure I understand what exactly this means.
>>>
>>
>> Well, you may choose either engine 0 or 1 for loading images. Reference
>> solution which I'm basing catpt on - Windows driver equivalent - makes use
>> of engine 1. Goal of this implementation is to align closely to stable
>> Windows solution wherever possible to reduce maintainance cost.
> 
> Please, give extended comment here.
> 

Sure, ack.

>>>> +	status = dma_wait_for_async_tx(desc);
>>>
>>>> +	catpt_updatel_shim(cdev, HMDC,
>>>> +			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
>>>
>>> Update even in erroneous case?
>>>
>>
>> Yes. This is based on stable Windows solution equivalent and get's updated
>> even in failure case to disable access to HOST memory in demand more.
> 
> I guess this deserves a comment.
> 

Ditto.

>>>> +	return (status == DMA_COMPLETE) ? 0 : -EPROTO;
> 
> ...
> 
>>>> +	new <<= __ffs(mask);
>>>> +	new = ~(new) & mask;
>>>
>>> Unneeded parentheses.
>>> And perhaps in one line it will be better to understand:
>>>
>>> 	new = ~(new << __ffs(mask)) & mask;
>>>
>>
>> Was called out in the past not to combine everything in one-line like if I'm
>> to hide something from reviewer.
>>
>> No problem with combining these together in v5.
> 
> you also may consider to use u32_replace_bits() or so.
> 

I'll check bitfields.h too, sure.

>>>> +	bool lp;
>>>> +
>>>> +	if (list_empty(&cdev->stream_list))
>>>> +		return catpt_dsp_select_lpclock(cdev, true, true);
>>>> +
>>>> +	lp = true;
>>>> +	list_for_each_entry(stream, &cdev->stream_list, node) {
>>>> +		if (stream->prepared) {
>>>> +			lp = false;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return catpt_dsp_select_lpclock(cdev, lp, true);
>>>
>>> Seems too much duplication.
>>>
>>> 	struct catpt_stream_runtime *stream;
>>>
>>> 	list_for_each_entry(stream, &cdev->stream_list, node) {
>>> 		if (stream->prepared)
>>> 			return catpt_dsp_select_lpclock(cdev, false, true);
>>> 	}
>>>
>>> 	return catpt_dsp_select_lpclock(cdev, true, true);
>>>
>>>
>>> Better?
>>
>> list_first_entry (part of list_for_each_entry) expects list to be non-empty.
>> ->streal_list may be empty when invoking catpt_dsp_update_lpclock().
> 
> I didn't get this. Can you point out where is exactly problematic place?
> 

list_for_each_entry makes use of list_first_entry when initializing 
'pos' index variable. Documentation for list_first_entry reads: "Note, 
that list is expected to be not empty" so I'm validating list's status 
before moving on to the loop as stream_list may be empty when 
catpt_dsp_update_lpclock() gets called.
