Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6E424A22F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 16:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BF221865;
	Wed, 19 Aug 2020 16:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BF221865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597849018;
	bh=PVHIJ57r0k1cmSrtJySw+ZIp4mQTlSi5s5Y7TIoNy50=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cvj783zaOV1KR4JrK1YTZXt3F/R+la093IPtlOmdw9ezDulbrDiuelGPMoUmOwwuc
	 EJunPpt6gAA1KnqPVIKRcJQeJmjx8Z5BUHhrxC8YRnNPrtTgWzR+yEYanImJo7eddA
	 0y0H4PRVOTVfT8+AgyeFoMfHHHg6A+4yuHL2CONA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C648F80255;
	Wed, 19 Aug 2020 16:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F9D0F80218; Wed, 19 Aug 2020 16:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C60C4F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 16:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C60C4F800D3
IronPort-SDR: +whbxsUKhPJIdQh+G34/SgvMxjCHcm/0my989oHqxkY13eG497KpX5pmOkBRSOlyOhqC6PZWYD
 Ut+GeQ/9NSng==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="142751303"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="142751303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 07:55:05 -0700
IronPort-SDR: ubcHSx/w71sne8XWitt+NlgnJuEdtWJWrQMR8MArDGQobesdny9iKkvD3xgNd3fIQLhfbeTCKI
 6g83GJPJNcNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="278345884"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.18.70])
 ([10.213.18.70])
 by fmsmga007.fm.intel.com with ESMTP; 19 Aug 2020 07:54:59 -0700
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <20200818115050.GI1891694@smile.fi.intel.com>
 <9a733e30-8d44-edf7-1bae-5b6f935628d2@intel.com>
 <20200819142128.GP1891694@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3ce135e9-c466-b6c7-9d7f-88c4fe6aab14@intel.com>
Date: Wed, 19 Aug 2020 16:54:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819142128.GP1891694@smile.fi.intel.com>
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

On 2020-08-19 4:21 PM, Andy Shevchenko wrote:
> On Wed, Aug 19, 2020 at 03:46:30PM +0200, Cezary Rojewski wrote:
>> On 2020-08-18 1:50 PM, Andy Shevchenko wrote:
>>> On Mon, Aug 17, 2020 at 01:12:01PM +0200, Cezary Rojewski wrote:
>>>> On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
>>>>> On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:

>>>>>> +	bool lp;
>>>>>> +
>>>>>> +	if (list_empty(&cdev->stream_list))
>>>>>> +		return catpt_dsp_select_lpclock(cdev, true, true);
>>>>>> +
>>>>>> +	lp = true;
>>>>>> +	list_for_each_entry(stream, &cdev->stream_list, node) {
>>>>>> +		if (stream->prepared) {
>>>>>> +			lp = false;
>>>>>> +			break;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	return catpt_dsp_select_lpclock(cdev, lp, true);
>>>>>
>>>>> Seems too much duplication.
>>>>>
>>>>> 	struct catpt_stream_runtime *stream;
>>>>>
>>>>> 	list_for_each_entry(stream, &cdev->stream_list, node) {
>>>>> 		if (stream->prepared)
>>>>> 			return catpt_dsp_select_lpclock(cdev, false, true);
>>>>> 	}
>>>>>
>>>>> 	return catpt_dsp_select_lpclock(cdev, true, true);
>>>>>
>>>>>
>>>>> Better?
>>>>
>>>> list_first_entry (part of list_for_each_entry) expects list to be non-empty.
>>>> ->streal_list may be empty when invoking catpt_dsp_update_lpclock().
>>>
>>> I didn't get this. Can you point out where is exactly problematic place?
>>>
>>
>> list_for_each_entry makes use of list_first_entry when initializing 'pos'
>> index variable.
> 
> Correct.
> 
>> Documentation for list_first_entry reads: "Note, that list
>> is expected to be not empty"
> 
> Correct.
> 
>> so I'm validating list's status before moving
>> on to the loop as stream_list may be empty when catpt_dsp_update_lpclock()
>> gets called.
> 
> But here you missed the second part of the for-loop, i.e. exit conditional.
> 
> If your assumption (that list_for_each_*() is not empty-safe) is correct,
> it would be disaster in global kernel source level.
> 

We want no disasters here : )
safety-out. Ack.
