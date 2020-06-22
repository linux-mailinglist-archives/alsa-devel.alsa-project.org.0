Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC63203F20
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 20:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4834171A;
	Mon, 22 Jun 2020 20:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4834171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592850486;
	bh=Ffol+jJZa+wQ+HKGWkZwcypNJY2t6LGy9epltl+WcVE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqtT1Lw7ZxkVnp07R1EDvONQr/EdMjnLNx6KkbKBfNRwHk84b47Fi+Y5AZMu27/la
	 MBlizCxHZ6FSWHGKk9BPZ/czNW2Lq3+pJ9fZxx8f1jXkBsbW0P7pl0TAJi29iKbpUi
	 Hj4P9KRUvyOFOyfXqKs+k2M1asIIquzHuYdLyaWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1865DF80162;
	Mon, 22 Jun 2020 20:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46357F8015B; Mon, 22 Jun 2020 20:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365C9F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 20:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365C9F8010E
IronPort-SDR: fFJGjXtvBsC1xOhfNF+dspPNrabbedKmOeg5T76RDH/T2xSFb7jMtmpsgoL7j4kzvIOTzcs/Kf
 2hvTim0aXAng==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142092296"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="142092296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:26:17 -0700
IronPort-SDR: GIquSpQm2VE+618UMgcQNJ0Or/anQHOqb8C9PzF2ZoXCa3xrs4GaLTOxdZ3BuSS+NDqbGMZy1K
 wrcGpu2P3lFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="278848371"
Received: from mdbricke-mobl1.amr.corp.intel.com (HELO [10.254.75.75])
 ([10.254.75.75])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2020 11:26:16 -0700
Subject: Re: [PATCH 3/5] ASoC: Intel: kbl-rt5660: use .exit() dailink callback
 to release gpiod
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-4-pierre-louis.bossart@linux.intel.com>
 <20200622182009.GH2428291@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b9452bbd-d8ee-5697-12fe-52644eae9bb4@linux.intel.com>
Date: Mon, 22 Jun 2020 13:26:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622182009.GH2428291@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org
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



On 6/22/20 1:20 PM, Andy Shevchenko wrote:
> On Mon, Jun 22, 2020 at 10:42:39AM -0500, Pierre-Louis Bossart wrote:
>> The gpiod handling is inspired from the bdw-rt5677 code. Apply same
>> fix to avoid reference count issue while removing modules for
>> consistency.
> 
> ...
> 
>> -	ctx->gpio_lo_mute = devm_gpiod_get(component->dev, "lineout-mute",
>> -					   GPIOD_OUT_HIGH);
>> +	ctx->gpio_lo_mute = gpiod_get(component->dev, "lineout-mute",
>> +				      GPIOD_OUT_HIGH);
>>   	if (IS_ERR(ctx->gpio_lo_mute)) {
>>   		dev_err(component->dev, "Can't find GPIO_MUTE# gpio\n");
>>   		return PTR_ERR(ctx->gpio_lo_mute);
> 
> Is it fatal? Then IS_ERR() is not needed below. For NULL I already told.

this patch only fixes a deadlock, whether or not this is fatal or not is 
a different question. I would assert if if you can't mute your audio is 
broken.

>> +	/*
>> +	 * The .exit() can be reached without going through the .init()
>> +	 * so explicitly test if the gpiod is valid
>> +	 */
> 
> This comment should be amended after fixing the code.
> 
>> +	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
>> +		gpiod_put(ctx->gpio_lo_mute);
>> +}
> 
