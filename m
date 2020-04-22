Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C31B4EDB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 23:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78EE116A9;
	Wed, 22 Apr 2020 23:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78EE116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587589843;
	bh=no3DMx3qXTw9j+8QvCUgB3Fqq4mU42PO4t4LEz4LCis=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WntFQTbHthHaUsYmi1a27U4PPWiGm63Ivksi/BELvd/EY5H5o6R1hd9TqsPEzL2Z+
	 zB6JSEPL7OrtXyeKmBXvImm8HtI2Scia6ECZyTVcRKPN4NNK8yiEtFMqe4olVUn+R8
	 jBcZ8tJYrBThvaby+q2oVZEMTVQ/LFFcrUzYX1EA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46F9F80108;
	Wed, 22 Apr 2020 23:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2532F801D9; Wed, 22 Apr 2020 23:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF4DCF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 23:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF4DCF80108
IronPort-SDR: Y8c8sVH3A5ZxelI2kB7SUJ3mfVj8YyFyg5oY/EPHeSIuHNF3sB+PedYFupZ+BfYM9JUtKoenRB
 UzRJAFp5LV+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:08:48 -0700
IronPort-SDR: OR9zGtfyQpMcV4afdZVH3NnBLr3lk7xcncQE4cUHbgMbM+idqrkVVLGwx7GuDbpx41mMXv0KmV
 j65tepvaTZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="457280305"
Received: from jpilli-mobl.amr.corp.intel.com (HELO [10.254.51.39])
 ([10.254.51.39])
 by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 14:08:45 -0700
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
To: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
 <60402718-f36c-cab3-2766-9ae180dd7504@linux.intel.com>
 <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8054d4a1-8889-5ccf-a685-59fa16502822@linux.intel.com>
Date: Wed, 22 Apr 2020 16:08:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158758876497.163502.13202465070681172627@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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



On 4/22/20 3:52 PM, Stephen Boyd wrote:
> Quoting Pierre-Louis Bossart (2020-04-22 02:54:38)
>>
>>
>> On 4/22/20 4:32 AM, Stephen Boyd wrote:
>>> Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
>>>> On ACPI platforms the of_ functions are irrelevant, conditionally
>>>> compile them out and add devm_clk_hw_register_clkdev() call instead.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>    drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
>>>> index bf0616c959da..d01a90fed51b 100644
>>>> --- a/drivers/clk/clk-hifiberry-dacpro.c
>>>> +++ b/drivers/clk/clk-hifiberry-dacpro.c
>>>> @@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
>>>>                   return ret;
>>>>           }
>>>>    
>>>> +#ifndef CONFIG_ACPI
>>>
>>> Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
>>
>> git grep CONFIG_ACPI shows most of the kernel code uses #if(n)def
>> CONFIG_ACPI. It's equivalent, it's a boolean.
> 
> It's not equivalent. It is a pre-processor directive vs. an if statement
> that evaluates to 0 or 1 and lets the compiler see both sides of the
> code to check types.

Ah, yes I misunderstood your point.
