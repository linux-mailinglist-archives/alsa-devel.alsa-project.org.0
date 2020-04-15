Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC81AAAF9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064561612;
	Wed, 15 Apr 2020 16:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064561612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962779;
	bh=fPIjh/S+wnnHjQtoUmOuMrDRrCKv+RQs+5PDZ83/ZYE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmHbHKSwSkkkoYeoNPob7DQ/eoCt9b95RhWYzaD9zPAQFbXfFz9nwLG5KkJXINSe6
	 I60Fj6u4/ZE2Fa9/NRuYQu/BGDFXW8IVmI4YaEiCQowkg9q3b5gDG2QBJXc6DW/whK
	 B3EiUo/tWTRfQJrZyKYrW5Lf0VQ943UCTCWLKRgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC11F80115;
	Wed, 15 Apr 2020 16:57:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 463F8F80115; Wed, 15 Apr 2020 16:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F44F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F44F80115
IronPort-SDR: nsYVq48mgFPtOWI5rEB0Jm5jOuEnuryueaIT5/z39JclFKwB/AmBq9YtL62F2blZeCvAX19t9C
 kWKTdGcHzlvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:57:09 -0700
IronPort-SDR: vTZGDdDuMV+ybxPP4XZua6xk6dUN/yHLuEGjn3AQCYHjh1uACWaSCt7N6rt09jcVkdqBHiXq2/
 UTKYIoOEExpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="400337197"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121])
 ([10.209.36.121])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 07:57:07 -0700
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+
 PRO
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
 <20200415095526.GP34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
Date: Wed, 15 Apr 2020 09:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095526.GP34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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



On 4/15/20 4:55 AM, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:20 PM, Andy Shevchenko wrote:
>>> On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:
> 
> ...
> 
>>>> +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
>>>
>>> Is this in the bindings?
>>
>> Not for now. the 'sclk' part is only used by me myself and I in an ACPI
>> context. I can add this description if desired.
> 
> Unfortunately you need to add this to the bindings, because it's a part of it
> and somebody may use it outside of your scope.

ok


>>>> +	if (IS_ERR(ctx->sclk)) {
>>>
>>>> +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
>>>
>>> Sounds like devm_clk_get_optional().
>>
>> I am not sure about the semantic here. This driver selects the one which
>> implements this clock, so if we get a -ENOENT return it's a very bad sign.
>> Not sure what suppressing the error and converting to NULL would do?
> 
> Same as per GPIO.
> Can it work without this clock? How did it work before your change?
> 
> When you add any hard dependency always ask yourself above questions.

The clock is not required in codec slave mode, it's provided by the SOC.

The clock is required when the codec is configured as master. Without 
these GPIO selection there will be no audio. So yes we could move this 
to devm_clk_get_optional() and change the test to IS_ERR_OR_NULL.



>>>> +		goto skip_dacpro;
>>>> +	}
> 
