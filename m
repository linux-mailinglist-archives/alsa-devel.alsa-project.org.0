Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BA26C32B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 15:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7EB316AF;
	Wed, 16 Sep 2020 15:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7EB316AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600262047;
	bh=pB5SBQDgGhv4Y3C60n++erIF3u0a62gG38AqoxUyhm0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgaMNp/169Sn0MbJxqFmDZDHpts0Hoqep9DgVjD/e5vA2+VVPHdyoau8U8Yq8ToSC
	 as8PJpJCYp7/llpB3GD3wou5VB+ApZ4k/beSVmlzsyaeXEF0kwU4qN6Tginv3BT+8W
	 vAj0hWNVvmbDEPyPdh2km9HzvUqlZ8UyoaIK7qsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C88E6F800BB;
	Wed, 16 Sep 2020 15:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22B5F8015A; Wed, 16 Sep 2020 15:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=NICE_REPLY_A,PRX_BODY_21,
 PRX_BODY_72,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D1D0F800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 15:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1D0F800BB
IronPort-SDR: e1Iy5BhPVuZj2xXTZ9sGFNmn+5z3EfgI2/bdfqsoF0Fs8wmmAL25+CTq7iBpL6UvUiZ4QFmpS9
 lod0ceHhGbiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="139466140"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="139466140"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 06:12:17 -0700
IronPort-SDR: MVS8Hy5teS3hg1wO0idxtJ8DVPmkc0coiYjpFJO/ilmoKoFGp0/oIZtyk58SFaqekoLTdCuIH5
 y30DXIdCUMWg==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="507163140"
Received: from gopikapa-mobl.amr.corp.intel.com (HELO [10.209.66.210])
 ([10.209.66.210])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 06:12:16 -0700
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
To: Vinod Koul <vkoul@kernel.org>
References: <20200904050244.GT2639@vkoul-mobl>
 <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
 <20200909075555.GK77521@vkoul-mobl>
 <184867c2-9f0c-bffe-2eb7-e9c5735614b0@linux.intel.com>
 <20200910062223.GQ77521@vkoul-mobl>
 <adf51127-2813-cdf0-e5a6-f5ec3b0d33fa@linux.intel.com>
 <20200911070649.GU77521@vkoul-mobl>
 <21606609-8aaf-c7b2-ffaf-c7d37de1fa3f@linux.intel.com>
 <20200914050825.GA2968@vkoul-mobl>
 <11feabb2-dc8b-7acc-6e4d-0903fc435b00@linux.intel.com>
 <20200916123545.GK2968@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d717f109-7ffd-11cb-f44d-f6c0b48d4985@linux.intel.com>
Date: Wed, 16 Sep 2020 08:11:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916123545.GK2968@vkoul-mobl>
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



On 9/16/20 7:35 AM, Vinod Koul wrote:
> On 14-09-20, 09:44, Pierre-Louis Bossart wrote:
>>> For LSB bits, I dont think this is an issue. I expect it to work, for example:
>>> #define CONTROL_LSB_MASK  GENMASK(2, 0)
>>>           foo |= u32_encode_bits(control, CONTROL_LSB_MASK);
>>>
>>> would mask the control value and program that in specific bitfeild.
>>>
>>> But for MSB bits, I am not sure above will work so, you may need to extract
>>> the bits and then use, for example:
>>> #define CONTROL_MSB_BITS        GENMASK(5, 3)
>>> #define CONTROL_MSB_MASK        GENMASK(17, 15)
>>>
>>>           control = FIELD_GET(CONTROL_MSB_BITS, control);
>>>           foo |= u32_encode_bits(control, CONTROL_MSB_MASK);
>>>
>>>> If you have a better suggestion that the FIELD_PREP/FIELD_GET use, I am all
>>>> ears. At the end of the day, the mapping is pre-defined and we don't have
>>>> any degree of freedom. What I do want is that this macro/inline function is
>>>> shared by all codec drivers so that we don't have different interpretations
>>>> of how the address is constructed.
>>>
>>> Absolutely, this need to be defined here and used by everyone else.
>>
>> Compare:
>>
>> #define SDCA_CONTROL_MSB_BITS        GENMASK(5, 3)
>> #define SDCA_CONTROL_MSB_MASK        GENMASK(17, 15)
>> #define SDCA_CONTROL_LSB_MASK        GENMASK(2, 0)
>>
>> foo |= u32_encode_bits(control, SDCA_CONTROL_LSB_MASK);
>> control = FIELD_GET(SDCA_CONTROL_MSB_BITS, control);
>> foo |= u32_encode_bits(control, SDCA_CONTROL_MSB_MASK);
>>
>> with the original proposal:
>>
>> foo |= FIELD_GET(GENMASK(2, 0), control))	
>> foo |= FIELD_PREP(GENMASK(17, 15), FIELD_GET(GENMASK(5, 3), control))	
>>
>> it gets worse when the LSB positions don't match, you need another variable
>> and an additional mask.
>>
>> I don't see how this improves readability? I get that hard-coding magic
>> numbers is a bad thing in general, but in this case there are limited
>> benefits to the use of additional defines.
> 
> I think it would be prudent to define the masks and use them rather than
> magic values. Also it makes it future proof

I don't see your point at all. The values cannot be modified, a 
different macro would be needed for a standard change.

Anyways, I am not going to argue further, I'll use your code example as 
is and move on.
