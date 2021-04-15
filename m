Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76A361438
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 23:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AC5166E;
	Thu, 15 Apr 2021 23:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AC5166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618522637;
	bh=J6ui1SjeVy54ZYRwAHT1gPHECAR734lbGdGfl8iJjHc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJ6d+2K+frQT1ggZAyNQm71w2CvnXfuVxhmaaRaxsOOkj16kfBY4qJAsda68pchXj
	 oqhvP0Rhg5YCoLKNzNJY7Pk8ARzCFYdUbj+6ETavjJJBs1BHhVD1ksx//NwK25brBC
	 Lgn7LBP823zGg1llmTjGwgw9uS/dSaVE0LV4FcLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E318BF80128;
	Thu, 15 Apr 2021 23:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE58F8022B; Thu, 15 Apr 2021 23:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D576F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 23:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D576F800FF
IronPort-SDR: 3+8JpRXRoJ3dq90p6lM3ZlDwNvlU34Z8w6bFo+kQAYTy1TcJLB5PQNtrOOP2+qAgq4ANn9Lmd4
 8xglyDjm70Gw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194974264"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="194974264"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 14:35:17 -0700
IronPort-SDR: dDauFJgceeoZbAeYPfiEwlpPDweo3v7ZYfgeWqYqsU7qt8hSZ3F4+kGa2lCtkW7/9qlvlMSwAE
 mjZB3EYdCR6g==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382863786"
Received: from krkonda-mobl.amr.corp.intel.com (HELO [10.212.33.22])
 ([10.212.33.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 14:35:16 -0700
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Jack Yu <jack.yu@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
 <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
Date: Thu, 15 Apr 2021 16:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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



On 3/30/21 2:26 PM, Pierre-Louis Bossart wrote:
> 
> 
>>>> Using new kcontrols "Capture Switch" and "Capture Volume" instead,
>>>> remove kcontrols which no longer be used.
>>>
>>> Is this going to disrupt any UCM profiles?
>>
>> Yes (the rt715 prefix is from the SOF driver):
>>
>> # RT715 specific volume control settings
>>
>> BootSequence [
>>     cset "name='rt715 DMIC3 Boost' 2"
>>     cset "name='rt715 DMIC4 Boost' 2"
>>     cset "name='rt715 ADC 24 Mux' 3"
>>     cset "name='rt715 ADC 25 Mux' 4"
>>     cset "name='rt715 ADC 27 Capture Switch' 1"
>>     cset "name='rt715 ADC 07 Capture Switch' 1"
>>     cset "name='rt715 ADC 07 Capture Volume' 58"
>> ]
> 
> To be clearer, we wanted to change the UCM files to only try to 
> configure the 'old' controls when they are present. The 'new' controls 
> are aligned between RT715 and RT715-sdca.
> 
> There will be a minor inconvenience if an existing platform updates the 
> kernel without updating UCM files, but it's the only solution we found 
> in earlier discussions.
> 
> Distributions are typically faster with alsa-ucmconf updates than kernel 
> changes so that inconvenience is likely very limited (we support 4-5 
> Dell CML/TGL platforms w/ SoundWire)

Was there any sustained objection to this change? Mark and Jaroslav?

I would really like to fix the UCM files so that the mute and volume are 
handled at the codec driver level, and not at the SOF level as it's 
currently the case.

The existing solution really makes no sense, it was 'inspired' (in the 
copy-paste sense) by the PCH-DMIC handling for HDaudio platforms. In 
that case, it made sense to use SOF-level mute/volume because such 
controls don't exist in microphones.

With RT715 we need to use the controls in the codec driver, not the 
firmware.
