Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F817A724
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCAB2166D;
	Thu,  5 Mar 2020 15:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCAB2166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583417301;
	bh=b7peT79+U3YlaE/wt4V+ePa1VSOAbHYD+LaCp1psQJE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHGnxCZFgAsdO22la08VidzVvUvxn0WwCKE5F7S3WNJ+wVcDdR4c6S/VILNZPZrVU
	 nkuxGBwrflGXEfYG8K7nJLaKY0nYqGZ4jD0Kzx6GFzlU/yo65nB7Kr2ByrQvT+KDr1
	 IrtA2/48katlaBw0IZJ9UCMWmB17WHMgioiMx2NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4EF4F80245;
	Thu,  5 Mar 2020 15:06:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599D0F8025F; Thu,  5 Mar 2020 15:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA818F80126
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA818F80126
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 06:06:22 -0800
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="229698294"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.153.175])
 ([10.249.153.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 05 Mar 2020 06:06:20 -0800
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <9e9c3c17-2bf4-ce02-fbe1-0631b20b13b3@linux.intel.com>
Date: Thu, 5 Mar 2020 15:06:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 3/5/2020 2:47 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/5/20 7:36 AM, Mark Brown wrote:
>> On Thu, Mar 05, 2020 at 07:06:15AM -0600, Pierre-Louis Bossart wrote:
>>> The use of devm_gpiod_get() in a dailink .init() callback generates 
>>> issues
>>> when unloading modules. The dependencies between modules are not well
>>> handled and the snd_soc_rt5677 module cannot be removed:
>>
>> In what way are the dependencies not well managed and why aren't we
>> requesting the GPIO on device model probe anyway?
> 
> there are a couple of machine drivers where the gpios are requested from 
> the machine driver. I have no idea what it is done this way, maybe the 
> codec exposes a gpiochip that's used later? I was hoping that Andy can 
> help, I don't fully get the acpi mapping and all.
> 
> see the code here for reference:
> 
> https://elixir.bootlin.com/linux/v5.6-rc4/source/sound/soc/intel/boards/bdw-rt5677.c#L250 
> 
> 
> The issue happens when running our test scripts, which do a set a rmmod 
> in a specific order: rmmod of the machine driver, then doing an rmmod of 
> the codec driver. Somehow the second fails with the 'module in use error'.
> 
> It's probably because the devm_ release does not happen when the card is 
> unregistered and the machine driver resources released since we use the 
> component device. There might very well be a bug somewhere in the devm_ 
> handling, I just don't have a clue how to debug this - and the .exit() 
> makes sense regardless in other cases unrelated to GPIOs.
> 

This sounds related to issue I've seen related to fact that there is 
devm_snd_soc_register_component and devm_snd_soc_register_card and when 
cleanup happens, one of them seems to release memory before other one 
runs it cleanup functions. And then cleanup functions try to operate on 
already released memory.

I haven't debugged this in depth, and just made simple patch to replace 
problematic devm_kzalloc with kzalloc and kfree, but there seems 
something weird happening related to how dynamic memory management works 
in ASOC.
