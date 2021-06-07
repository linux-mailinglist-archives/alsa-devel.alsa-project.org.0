Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39739E6B8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 20:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50AF8167D;
	Mon,  7 Jun 2021 20:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50AF8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623090868;
	bh=3axUphQzW1BbpGyLNTN/dqKwfgXC2Tu3avdx3vGqxiU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuymyisAZ5XbC0Ko15667BdjUhQ7pr6Bzt8bbtkPgRcZHMoNXXsco3D0fT2b7whd+
	 EeP7MfLCaa3VXdFpg4f/pFS/NON4/HxSXVn7q1KkUcnBVIEnI1ABqGRorBvuh7/xA8
	 EPaL4Y7GS6+2vjnp/3TCtTP2QrkehsVBkj/eGBIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF553F800DF;
	Mon,  7 Jun 2021 20:32:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8674CF80212; Mon,  7 Jun 2021 20:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60176F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 20:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60176F800DF
IronPort-SDR: tmpqjHQrWwYDogEcpq57XnfQ0JaeeRvu4EWD2SBwuL17EJ39cYbqjfnGVvLZSXMCFmXGPSFux5
 UYt9L2vI2KRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192009337"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="192009337"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:32:48 -0700
IronPort-SDR: hEZZQyqiJNNcgEl8G32to+qOaYgO6xuSYnKHeqp+pMk/0Q4uq1MkZuWkewh+e6OKbXz4HSPqu8
 i9roS/djGXHg==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="447585633"
Received: from dsanc15x-mobl3.amr.corp.intel.com (HELO [10.251.138.253])
 ([10.251.138.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 11:32:46 -0700
Subject: Re: [PATCH 3/4] ASoC: intel: sof_cs42l42: add support for
 jsl_cs4242_mx98360a
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-4-brent.lu@intel.com>
 <505c7e46-316c-9fa1-feaa-115f4561ed19@linux.intel.com>
 <DM6PR11MB36421AD935E4A2B8EBD0FE6197389@DM6PR11MB3642.namprd11.prod.outlook.com>
 <cb76f83c-e9d1-9726-ff8d-8d48a4de8e26@linux.intel.com>
 <DM6PR11MB364231AEC2208EAF5F898B7A97389@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f8fa92bf-29eb-5ea4-55cc-4bb99db3b0d7@linux.intel.com>
Date: Mon, 7 Jun 2021 13:32:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB364231AEC2208EAF5F898B7A97389@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "M,
 Naveen" <naveen.m@intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
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



On 6/7/21 11:28 AM, Lu, Brent wrote:
>>>>
>>>> This also looks like we have two topologies configuring the same DAIs
>>>> differently on different platforms.
>>>>
>>>> Why can't we pick one configuration that would work in all cases?
>>>>
>>>
>>> The comment just say we are reusing rt5685's sof-jsl-rt5682-mx98360a.tplg.
>>> This patch does not care about the dai sequence. Maybe I should reword
>>> the commit log.
>>
>> I was referring to the bclk frequency, one case uses 2.4 and the other
>> 3.072MHz.
> 
> The 2.4MHz setting isn't ready when we enabled this codec so we selected
> 3.072MHz. Since we are updating topology for PLL issue soon, we can change
> bclk frequency to 2.4MHz as well. How do you think?

The 3.072MHz clock will require the 24.576MHz PLL to be on on the 
SOC/PCH. If you can use 2.4 MHz without any loss of quality and the 
codec can deal with 25 bit slots with 24-bit data it's better power-wise.

We try to use 64.fs only when it's absolutely mandatory, e.g. if the 
codec or amplifier doesn't support the 25/24 configuration. IIRC this 
was the case with TI PCM512x and Maxim amps.

We've also used the 3.072 MHz bit clock when there are constraints on 
the clock sources and selectors. This isn't the case on GLK but the SOF 
commit 0a97c1a92f2d93bd4d45bc99d61e362cd214748c clarified the clock 
selection for newer platforms, including JSL. In the end we may be 
forced to use the 3.072 MHz PLL, you'd need to look at the various 
topologies used with this machine driver.

