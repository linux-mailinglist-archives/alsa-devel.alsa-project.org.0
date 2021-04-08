Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 128333587F2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 17:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903DC166F;
	Thu,  8 Apr 2021 17:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903DC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617894806;
	bh=WPfZwbAIW+gejIiacxEDP1w8a+zBJ2IHbLjJtdLyuM0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YzLpeuMin848dz0NvX/O0b/8tG5Ejl9jDgeoOG7qgv045ZSEmTzvFY2Hyjhsh8wM+
	 DbNEuuUvsKtIIxJ0ng6GHxMpx3S/rqgGjlZSkgil81YiBPqvSOsGaLmH4GdVMVPA/6
	 u/gAel8/+5n9+17MEJT2zpBO/ChuZPR/KfslxRJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9CEF80169;
	Thu,  8 Apr 2021 17:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13D8CF8020B; Thu,  8 Apr 2021 17:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F82F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 17:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F82F80162
IronPort-SDR: u7RtdXWknufT5bulbSMfKiLY/cIN7d95nzWqFM0oSOsneAjqv7nlmBAl9/7zEzaAu6s/XMtWYc
 NdkwhvDNhRoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193602448"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="193602448"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:11:50 -0700
IronPort-SDR: EHJmmFj/myV72YBzic+jZzhq5DH1OLoYVGflYNyUJmAbCjIwg6SFO70gThWK0hnrscUztyG3NI
 8vuqdJiQ0QdQ==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="458861480"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.105])
 ([10.237.12.105])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:11:47 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <a15ad17a-e86d-50b3-64e2-9c9dd019ff2e@linux.intel.com>
 <20210408144706.GK4516@sirena.org.uk>
 <9c758fde-cad7-8c9f-ac9d-61357ce2581e@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <ca51c97c-047e-bfe4-198d-caf218dc90c5@linux.intel.com>
Date: Thu, 8 Apr 2021 17:11:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9c758fde-cad7-8c9f-ac9d-61357ce2581e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 4/8/2021 5:04 PM, Jaroslav Kysela wrote:
> Dne 08. 04. 21 v 16:47 Mark Brown napsal(a):
>> On Thu, Apr 08, 2021 at 09:12:57AM -0500, Pierre-Louis Bossart wrote:
>>> On 4/8/21 8:18 AM, Takashi Iwai wrote:
>>
>>>> I guess the question here is how to identify the proper profile for a
>>>> certain platform and how to get it passed over the whole system.
>>>> Theoretically, the rename of the card name or mixer name strings could
>>>> be done in user-space side, too (e.g. mapping in alsa-lib or
>>>> whatever), so I don't think it mandatory to make them variable via
>>>> sysfs, if it's meant only for the consistency reason.
>>
>>>> Didn't we discuss in the past about the possibility to store the
>>>> profile name in the card component string?
>>
>>> Because of OEM or user customization, we will have multiple versions of
>>> firmware and topology that will have to be enabled in specific setting. The
>>> last thing we want is hard-coded rules in the kernel on which firmware
>>> customization to use for which platform.
>>
>> ...
>>
>>> If the users wipes the OEM image and installs a standard distribution on the
>>> same device, they would by default use the firmware generated from the SOF
>>> main branch, without any differentiation and 3rd party IP.
>>
>>> So the point is: how do we expose this information to UCM? In the machine
>>> driver where the card is created? There is zero information on what the
>>> firmware/topology does. The information can only be extracted when the
>>> topology is loaded when probing the SOF component driver.
>>
>> So what we're looking for here is a mechanism to tell userspace what
>> firmware has been loaded?
> 
> It's just a part of the issue with the proper runtime sound card
> identification. But yes, the firmware can really change the created sound card
> (controls, PCM devices, paramters for those devices). In this case, UCM should
> pick another configuration.
> 
> I'm looking for a straight solution here.
> 
> 					Jaroslav
> 

Wouldn't dsp_status from snd_hwdep already work here?
The only thing which would need to be done is to connect it to ASoC card?

And in userspace ask using hwdep interface for what is the loaded FW?

Amadeusz
