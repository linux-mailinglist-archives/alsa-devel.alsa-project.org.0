Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1F1B61A6
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 19:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E80B169A;
	Thu, 23 Apr 2020 19:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E80B169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587661957;
	bh=YBEMUyu52qr+mfM9FKzM5Vezl2DRWnGKtJd/MMHdylY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4nVl+RdOy7pVdvuFIayT7wyYwRxDIreW+kDoDR3Clq/l6yVVaFImXP6G1VcgLttb
	 1qYz9v/Qk7bm4gL0s2xA9cfoNbfVyOLNz5Rd5bgvzIkNszouxXWs/A3TlmZ69WGO13
	 ESdE1bWsnalf5rCfCmJZYzo0A/24y6OPRqqXSDHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C3B2F80121;
	Thu, 23 Apr 2020 19:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D34F801EC; Thu, 23 Apr 2020 19:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E20F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 19:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E20F80121
IronPort-SDR: x5zoypPlCKiy1IGpNeUtbI0OKJe3Dsd+r45ZwKJ8BycZFTs+cQtLpDp4xTSMNZd1MNVdJf/GJH
 q/85mJjpCbwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 10:10:46 -0700
IronPort-SDR: WcVoZbtQs+HXrpX3W4mhjY1ssIBSU/V6jcaOvWf4UP705aNMbMgNh94JFrdo9My9BIH2pFUgI+
 KzVV45RzelZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="456983609"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.5.100])
 ([10.213.5.100])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 10:10:44 -0700
Subject: Re: [PATCH] ALSA: hda: Refactor Intel NHLT init
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>
References: <20200423112136.25207-1-cezary.rojewski@intel.com>
 <s5hd07ywikl.wl-tiwai@suse.de>
 <b37cb05b-f4c2-e747-c3f0-1582ed3afadd@intel.com>
 <8e3d7780-d776-d964-d8a8-4618b7ae045a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <33288338-edb9-c99f-7837-d8f2e8c8ec09@intel.com>
Date: Thu, 23 Apr 2020 19:10:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8e3d7780-d776-d964-d8a8-4618b7ae045a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com
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

On 2020-04-23 18:29, Pierre-Louis Bossart wrote:
> On 4/23/20 6:40 AM, Cezary Rojewski wrote:
>> On 2020-04-23 13:24, Takashi Iwai wrote:
>>> On Thu, 23 Apr 2020 13:21:36 +0200,
>>> Cezary Rojewski wrote:
>>>>
>>>> NHLT fetch based on _DSM prevents ACPI table override mechanism from
>>>> being utilized. Make use of acpi_get_table to enable it and get rid of
>>>> redundant code.
>>>>
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>
>>> This looks like a nice cleanup and I'll happily apply if anyone can
>>> test with the actual hardware -- currently mine has no DSP, so unable
>>> to check.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>
>> NHLT override method has been added for internal use half a year ago 
>> and is for some time the default method within our CI. This is tested 
>> on a wide spread of hardware, that is any Intel AVS archtecture, 
>> including production laptops.
> 
> We are checking independently with SOF CI [1], the NHLT is used to 
> detect microphone counts so we'll see if there's a regression.
> 
> That said, for my education Cezary an you clarify what you typically 
> override? the settings are usually tied to specific hardware configs.

When speaking of testing purposes, we actually ignore the go-to one/two 
format limit which is often applied on production stuff. E.g.: you may 
proliferate SSP blobs and make use of up to 256 formats (NHLT enforced 
limit IIRC). That goes for SSP loopback testing.
Same applies to DMIC. While hardware tells you 0, 2 or 4 channels, 
nothing prevents you to play with different bit depths/ sampling rate. 
You could even force 2ch on 4ch setups. Clock changes are also part of 
the game.

> Also the NHLT may point to a topology file name but with your recent 
> changes an alternate file can be used, so it's not clear to me how 
> non-Intel folks might use the override and for what?

NHLT-based topology filename is a long standing issue. When you launch 
/skylake on a non-NHLT setup (e.g. Linus laptop) you end up with a 
perfectly white-spaced filename. Does not look very secure to me. It 
also makes it difficult to share topologies with OEMs - in practice 
production stuff is available in dozens of different OEM-id/revision-id 
combinations, and thus topology naming becomes a nightmare.

Let's get this nightmare over with.

In perfect world all users would have received their stuff with correct 
BIOS settings applied. We, humans, did not reach that point yet though. 
It's handy to have a quick workaround for that. While none of NHLT GUI 
tools are upstreamed yet, spec is already there. So, a clever user (or 
one with Intel's help) can dump his existing NHLT table:
	cat /sys/firmware/acpi/tables/NHLT > nhlt.bin

Decompile it -or- play with binary directly to append a missing format.

> 
> While I am at it, we recently had a bug report where a user provided the 
> NHLT, and I had no idea how to go about parsing it to check its 
> contents. Are there any tools to dump the contents in human-readable 
> representation?
> 

To my knowledge there are none available externally. Maybe soon this 
will change. If I managed to push spec upstream, a 'simple tool' 
shouldn't be a problem. But who knows..

Internally? There are few : )

> [1] https://github.com/thesofproject/linux/pull/2046
