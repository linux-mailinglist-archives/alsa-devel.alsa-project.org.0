Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871F1AAAFE
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E7A1657;
	Wed, 15 Apr 2020 17:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E7A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962855;
	bh=UNeOg1LyQd7NKBwirtIIHyTmFUUK8A/gVMX4+5lH+/0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sMaSCLeeyTJgGWIZLD2tRI4rpy83z4fld7WFkPsB+I+CJoTf/xax92NcZjJEra5OY
	 sP297po5kvrCPezL3ZpAxnhnWRwVFPrN+9t0kX6eML5+/c/ds4CQDS8koAudaTC3nY
	 Q1V20hFu//+8QR1jbaHJ/QtdJ9abxZeHBLI01EEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5793F802BD;
	Wed, 15 Apr 2020 16:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66118F802BE; Wed, 15 Apr 2020 16:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49993F80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49993F80229
IronPort-SDR: 0QI2/DxAD+L4Xw8Pie/m4dloQUFQuuw3DeNho1jTlJSwELe8lCqYo0OBhSSaeIUqKoswGLmDCi
 pvhMcGVDx9nQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:57:11 -0700
IronPort-SDR: ZTf1Ulx5V/dhCiNQBZoSQhguP/8CLmmD+MQuGpC5BeFcndgopAga0aVvAua6NqY9WuQhzAV9rM
 KkVVM19xpvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="400337204"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121])
 ([10.209.36.121])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 07:57:10 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414171125.GB34613@smile.fi.intel.com>
 <7c0e7f81-cb1c-9c59-4421-baf41b8d015b@linux.intel.com>
 <20200415095228.GO34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
Date: Wed, 15 Apr 2020 09:19:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095228.GO34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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



On 4/15/20 4:52 AM, Andy Shevchenko wrote:
> On Tue, Apr 14, 2020 at 12:54:25PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:11 PM, Andy Shevchenko wrote:
>>> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
>>>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>>>> the "sclk" string as a fallback.
>>>
>>> This is fishy a bit.
>>
>> I didn't find a single example where we use a NULL string in ACPI cases?
> 
> ...
> 
>>> If no, why not simple switch to devm_clk_get_optional()?
>>
>> Not sure what that would change?
> 
> Hmm... Who is the provider of this clock?

Well, at the hardware level, the clock is provided by two local 
oscillators controlled by the codec GPIOs. So you could consider that 
the codec is both the provider and consumer of the clock.

In the Linux world, the PCM512x codec driver creates a gpiochip. And the 
clk driver uses the gpios to expose a clk used by the PCM512x codec driver.

I am not fully happy with this design because it creates a double 
dependency which makes it impossible to remove modules. But I don't know 
how to model it otherwise.

But to go back to your question, the two parts are really joined at the 
hip since the same gpios exposed by one is used by the other.

