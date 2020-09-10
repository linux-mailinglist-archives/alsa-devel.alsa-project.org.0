Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFEA264786
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 15:55:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F91716C2;
	Thu, 10 Sep 2020 15:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F91716C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746136;
	bh=U3dP73ZrRTLAA3aHtn8CT7j24GBotFBj9Vi2WVMhyQ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbW0HxBzaO6fqz5sR8KZ4tx7uJMdOgGgxkCLu3001bAhwpTCR8sz5uaHzKxXIMeY1
	 Yw9p1oupqjdcQCr+OJTnPc7UmsBvjIDf2f9ioSyT40X+Tm1txjzXUIsTBSnKdSQDiF
	 mXxwoGvCPFSBpcHdH7iF+EDGNdqNz8BW+S2ZGuZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F8AF80272;
	Thu, 10 Sep 2020 15:53:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D2BF80264; Thu, 10 Sep 2020 15:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0608CF800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 15:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0608CF800E9
IronPort-SDR: QaPC+DAXbbY94Vke+67ZmVMtHEsgHKxynmWs0sPn/Hwx9206j1Wk/DksVWwkjlkSVJpLKiZ5uZ
 5j7E0ikJaaeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="220091445"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="220091445"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:53:35 -0700
IronPort-SDR: dg1NVBFH/bnZiCmRBDFTZ4YN/pF+PnxBn7sJccFIrQZAWnXZThjwac3qzRUsXv3UsZT2h4MuIG
 +48EPESRjeCQ==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="480897360"
Received: from minfanti-mobl.amr.corp.intel.com (HELO [10.254.126.4])
 ([10.254.126.4])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:53:34 -0700
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
To: Vinod Koul <vkoul@kernel.org>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
 <20200904050244.GT2639@vkoul-mobl>
 <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
 <20200909075555.GK77521@vkoul-mobl>
 <184867c2-9f0c-bffe-2eb7-e9c5735614b0@linux.intel.com>
 <20200910062223.GQ77521@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <adf51127-2813-cdf0-e5a6-f5ec3b0d33fa@linux.intel.com>
Date: Thu, 10 Sep 2020 08:53:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910062223.GQ77521@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 9/10/20 1:22 AM, Vinod Koul wrote:
> On 09-09-20, 08:48, Pierre-Louis Bossart wrote:
>>
>>>>>> + *	25		0 (Reserved)
>>>>>> + *	24:22		Function Number [2:0]
>>>>>> + *	21		Entity[6]
>>>>>> + *	20:19		Control Selector[5:4]
>>>>>> + *	18		0 (Reserved)
>>>>>> + *	17:15		Control Number[5:3]
>>>>>> + *	14		Next
>>>>>> + *	13		MBQ
>>>>>> + *	12:7		Entity[5:0]
>>>>>> + *	6:3		Control Selector[3:0]
>>>>>> + *	2:0		Control Number[2:0]
>>>>>> + */
>>>>>> +
>>>>>> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)						\
>>>>>> +	(BIT(30)							|	\
>>>>>
>>>>> Programmatically this is fine, but then since we are defining for the
>>>>> description above, IMO it would actually make sense for this to be defined
>>>>> as FIELD_PREP:
>>>>>
>>>>>            FIELD_PREP(GENMASK(30, 26), 1)
>>>>>
>>>>> or better
>>>>>
>>>>>            u32_encode_bits(GENMASK(30, 26), 1)
>>>>>
>>>>>> +	FIELD_PREP(GENMASK(24, 22), FIELD_GET(GENMASK(2, 0), (fun)))	|	\
>>>>>
>>>>> Why not use u32_encode_bits(GENMASK(24, 22), (fun)) instead for this and
>>>>> below?
>>>>
>>>> Because your comment for the v1 review was to use FIELD_PREP/FIELD_GET, and
>>>> your other patches for bitfield access only use FIELD_PREP/FIELD_GET.
>>>
>>> yes and looking at this, I feel u32_encode_bits(GENMASK(24, 22), (fun))
>>> would look better than FIELD_PREP(GENMASK(24, 22), FIELD_GET(GENMASK(2, 0), (fun)))
>>>
>>> Do you agree?
>>
>> The Function (fun) case is the easy one: the value is not split in two.
>>
>> But look at the entity case, it's split in two:
>>
>> FIELD_PREP(BIT(21), FIELD_GET(BIT(6), (ent)))			FIELD_PREP(GENMASK(12, 7),
>> FIELD_GET(GENMASK(5, 0), (ent)))
>>
>> same for control
>>
>> FIELD_PREP(GENMASK(20, 19), FIELD_GET(GENMASK(5, 4), (ctl)))	|	
>> FIELD_PREP(GENMASK(6, 3), FIELD_GET(GENMASK(3, 0), (ctl)))	|	
>>
>> and same for channel number
>>
>> FIELD_PREP(GENMASK(17, 15), FIELD_GET(GENMASK(5, 3), (ch)))	|	
>> FIELD_PREP(GENMASK(2, 0), FIELD_GET(GENMASK(2, 0), (ch))))
>>
>> I don't see how we can avoid using the FIELD_GET to extract the relevant
>> bits from entity, control, channel number values.
> 
> No, you dont need FIELD_GET, that would be pointless for this helper if
> that was the case

I don't get how one would specify which parts of the original value are 
extracted?

> 
>>
>> Or I am missing your point completely.
> 
> Correct
> 
> It should be:
> 
>          foo |= u32_encode_bits(val, FOO_MASK_A);
> 
> which would write val into bits represented by FOO_MASK_A by
> appropriately shifting val and masking it with FOO_MASK_A
> 
> So net result is bits in FOO_MASK_A are modified with val, rest of the
> bits are not touched

Vinod, please see the explanation below [1], we need to split the 
original value in two and insert the bits in two separate locations.

You only considered the simple case for the functions, your proposal 
will not work for entities, controls and channel numbers.

>>
>>
>>>>> And while at it, consider defining masks for various fields rather than
>>>>> using numbers in GENMASK() above, that would look better, be more
>>>>> readable and people can reuse it.
>>>>
>>>> Actually on this one I disagree. These fields are not intended to be used by
>>>> anyone, the goal is precisely to hide them behind regmap, and the use of raw
>>>> numbers makes it easier to cross-check the documentation and the code.
>>>> Adding a separate set of definitions would not increase readability.
>>>
>>> Which one would you prefer:
>>>
>>>           #define SDCA_FUN_MASK           GENMASK(24, 22)
>>>
>>>           foo |= u32_encode_bits(SDCA_FUN_MASK, fun)
>>>
>>> Or the one proposed...?
>>
>> Same as above, let's see what this does with the control case where we'd
>> need to have four definitions:

[1]

>>
>> #define SDCA_CONTROL_DEST_MASK1 GENMASK(20, 19)
>> #define SDCA_CONTROL_ORIG_MASK1 GENMASK(5, 4)
>> #define SDCA_CONTROL_DEST_MASK2 GENMASK(6, 3)
>> #define SDCA_CONTROL_ORIG_MASK2 GENMASK(3, 0)
>>
>> And the code would look like
>>
>> foo |= u32_encode_bits(SDCA_CONTROL_DEST_MASK1,
>> FIELD_GET(SDCA_CONTROL_ORIG_MASK1, fun));
>> foo |= u32_encode_bits(SDCA_CONTROL_DEST_MASK2,
>> FIELD_GET(SDCA_CONTROL_ORIG_MASK2, fun));
>>
>> The original suggestion was:
>>
>> FIELD_PREP(GENMASK(20, 19), FIELD_GET(GENMASK(5, 4), (ctl)))	|	
>> FIELD_PREP(GENMASK(6, 3), FIELD_GET(GENMASK(3, 0), (ctl)))	|	
>>
>> I prefer the original... Adding these defines doesn't really add value
>> because
>> a) the values will not be reused anywhere else.
>> b) we need 12 of those defines
>> b) we need a prefix for those defines which makes the code heavier
> 
