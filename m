Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453522348AF
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 17:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B81851663;
	Fri, 31 Jul 2020 17:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B81851663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596210562;
	bh=uOs3TAcPgMxp6AKePZId0Wg3RDlLharOdpAAYs5S4ew=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+ijuWMLEuWpGdUg+TqUNm/dUCGoAnqxJZRaN/LPi1y6QwFfB1XTAiH7EXszpgmMU
	 Q4iqWRQuIMk9N1x6CQ3kXwZoUtEWGDxMrSFuV+oztxTrDQlZ6emlp0ecauttW2Yu4R
	 /DFY88asFpmyFrkAH6rgSrHI4GO18rOlgTi6RE6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA24AF801A3;
	Fri, 31 Jul 2020 17:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 905C5F80171; Fri, 31 Jul 2020 17:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 592FFF80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 17:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592FFF80111
IronPort-SDR: BFbZkBIoUcGnNlIe34/JiUCszjj9jM0B/xLVGHRGpkdDB3xaxW7WY4PLAmKP7FpmfBIOpQg/4A
 oJQVYCitKyuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="216252970"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="216252970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 08:47:29 -0700
IronPort-SDR: c7DhzOwfTf2zcd2f9QTBrBP0/HmYCrcRmRExmd1hAFjxIFbw1/5C0Tk0lKX+7eF7E9VUS7085z
 tQ+O4YeYKoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="491521008"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.27.145])
 ([10.213.27.145])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 08:47:25 -0700
Subject: Re: [PATCH 0/3] ASoC: core: Two step component registration
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
 <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <61faef6e-70e9-5574-5f3a-e333d0a71617@intel.com>
Date: Fri, 31 Jul 2020 17:47:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, olivier.moysan@st.com,
 alexandre.torgue@st.com, lgirdwood@gmail.com, arnaud.pouliquen@st.com,
 tiwai@suse.com, broonie@kernel.org, mcoquelin.stm32@gmail.com
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

On 2020-07-31 5:07 PM, Pierre-Louis Bossart wrote:
> On 7/31/20 9:41 AM, Cezary Rojewski wrote:
>> Provide a mechanism for true two-step component registration. This
>> mimics device registration flow where initialization is the first step
>> while addition goes as second in line. Drivers may choose to modify
>> component's fields before registering component to ASoC subsystem via
>> snd_soc_add_component.
> 
> I must admit I don't see where this might be used for Intel platforms, 
> we've been happily using snd_soc_register_component() without hitting 
> limitations.

Patchset targets entire ASoC framework, not Intel catalog. As 
_initialize and _add are already in place, having a two-step 
registration is cohesive with other "frameworks" e.g. device one.

New to ASoC? Trying to learn soc-components? Guess what, 
creation/registration procedure is exactly the same as one you're used 
to already!

> Also the only two uses of snd_soc_add_component() seem mainly driven by 
> memory allocation - and avoiding a devm_kzalloc in 
> snd_soc_register_component().

In general, code quality and improvements to its flow should not require 
ton of usages. But hey, you got two already.

> Out of curiosity, can you provide an example where this two-step would 
> be required or beneficial? Thanks!

Overridding component->name which is currently always tied to 
fmt_single_name so you may choose a different name than the ->dev one.
