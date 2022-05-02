Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6651723D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 17:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E94868;
	Mon,  2 May 2022 17:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E94868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651504047;
	bh=QUwfBZzLRLec6b7T5ukZsN+GD3t/gplmzAyWpyaOv8g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MO0XlFqvUzeiAsQbr99JOBmC4AoCc2t7dEzvtzeljsHhnpQ6yBIBH1WpQ2+INfY69
	 EW0VYGJNCUCsTCEUsdAMriAwQlSHMw+rb8clfvW0wYvhf16ynvbN1coPI3ig7AlWqp
	 2m1fw+iOV9n+9MMgitfq52YL/LdiednTMQkYbxOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B6FF80249;
	Mon,  2 May 2022 17:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F350F800E9; Mon,  2 May 2022 17:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53DD3F800E9
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 17:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53DD3F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GqReqdeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651503982; x=1683039982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QUwfBZzLRLec6b7T5ukZsN+GD3t/gplmzAyWpyaOv8g=;
 b=GqReqdeM8Q/UfHdgm8u1jwHOtqySXvE73kgR9ktwpADRG5N1w/v5lSpW
 4JIf7DsLrYPQ01yXRL5NnpJcn4YPYba1Zq5wVSE+2y8YyGqSLOq68fBhA
 Acy/nPMNWE2+jzNIleoV7Au/1meIQlyBaz2Z+F4SkA6ib+dEdErCU9V+W
 O8+SYHnAwZwrzBvYEA/P38W0i6IiT4AyghldTULjPZFubA2AeJq8SVYKr
 rhvzBDlF4WuD/GclT8viPD2uUKVN1DNW7dY4jMQ/oOjLPMRJ6RBH6ARjx
 hXPEbsjjlPf068F1EUjHnpRyDD1tLthm2LNAxz+Hxz+xM3yygJWBloDLy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247142472"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="247142472"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 08:06:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="561769688"
Received: from sushilsu-mobl1.amr.corp.intel.com (HELO [10.251.9.25])
 ([10.251.9.25])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 08:06:16 -0700
Message-ID: <29c1bfee-2f0f-e211-1ce7-ac377be03e11@linux.intel.com>
Date: Mon, 2 May 2022 10:06:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Curtis Malainey <cujomalainey@google.com>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <CAOReqxg9Y0_S5jqati4O+GT0C_yR7agBZYK79O996MQAk3HmDQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAOReqxg9Y0_S5jqati4O+GT0C_yR7agBZYK79O996MQAk3HmDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 4/29/22 17:32, Curtis Malainey wrote:
> On Fri, Apr 29, 2022 at 2:55 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> Hi,
>> In the existing ASoC code, there is a fixed mapping between ASoC card and component. A component relies on a ->card pointer that is set during the probe. A component cannot be used by or "bound to" more than one card [1]
>>
>> This has interesting impacts on how a codec or DSP driver need to be implemented.
>>
>> In the AVS series posted this week, multiple components are registered by the DSP driver, following an interface-based split. There's in addition a second-level split, where the logic is pushed further: the DSP driver partitions the SSP DAIs in different set of 'dai_driver's used by different components, which are in turn used by different cards. What is done in these patches is not wrong, and is probably the only solution to support a real-world platform with the existing ASoC code, but are the framework assumptions correct? In this example, the board-level information on which interface is used for what functionality trickles down to the lowest level of the DSP driver implementation.
>>
>> I believe this breaks to some extent the 'clean' split between platform and machine driver(s), and it's not quite aligned with the usual notion of register/probe used across frameworks, be it for drivers/clocks/you name it.
>>
>> A similar case could happen in a codec driver, if independent functionality such as headset and amplifier support was exposed by separate cards, that would in turn mandate that the codec driver exposed N components, each handling different functionality but the same type of DAI.
>>
>> An alternative approach would be that the DSP driver exposes all the possible DAIs that can be used, and the binding is refined to allow for more flexibility. I think it's really the individual DAI that cannot be used by more than one card.
> 
> Would it also be logical to expose the DAIs on the codecs
> independently or should this be validated on a case by case basis?

Not following the question, sorry.
 
>> I figured I would ask on this mailing list if
>>
>> a) I am not mistaken on the component/card relationship and
>>
> 
> Just trying to think of a reason why this would not be true. Are we
> aware of platforms that have configuration relationships across DAIs?
> E.g. they use a single clock and must be configured together, so
> splitting them might cause them to be in sync? Otherwise I agree, if
> DAIs can be handled independently then I don't see why we should tie
> them together.

There are restrictions on most platforms, but those restrictions should be expressed with modeling of clocks and serialization when accessing registers if required. Splitting the DAIs in different components to expose different cards to userspace without modeling such dependencies is a sure fail indeed. It's also an assured fail even if the DAIs are exposed in a single component and used in a single card. One example would be our very own Intel SSP, if you try to configure a shared MCLK with different settings that will quickly go South.

> 
> Curtis
> 
>> b) if this is by design, or if we want to clarify what a component is and what its restrictions might be.
>>
>> Thanks for your feedback/comments
>> -Pierre
>>
>> [1] https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1364
