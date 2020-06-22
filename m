Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB9203F16
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 20:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A80631718;
	Mon, 22 Jun 2020 20:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A80631718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592850294;
	bh=SeBhGEk36Hm4DDHre/4iAbZJdQ6M8XpuorEOW+iOpBo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lX6TOJF77CdC8fvJMbxznenus11RNoamOxsZh6+qCwpL2gAr4xkJZYpS0CGoaQ+ax
	 khOMUdro160t+oC+jFyAKnHxd3axdJ7mvs2E6/kuf4/DxzOC8KCoLzuMnWagdMZbX0
	 VwHUCK6kKFCCq43fmPNwlI8xF2y2VLU0+70KDC6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C884CF8010E;
	Mon, 22 Jun 2020 20:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46209F8015B; Mon, 22 Jun 2020 20:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B81F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 20:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B81F8010E
IronPort-SDR: Q4AQGOywIaX89drUNph2tJ7ycPMv6XJT58be8FXqFF9/D2N3AmdCdMfYNukXVOh2FaFSK6GeiO
 jCHrLolwsZOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="131241183"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="131241183"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:23:05 -0700
IronPort-SDR: 6jXN4aKGcRYvElXY9Bc22n9q7nmHIGHvUxzzQRUJ3AsRB+CkRj8AhfYeI7TObCvoqzenbvMWql
 WSPBFvE2HJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="278847562"
Received: from mdbricke-mobl1.amr.corp.intel.com (HELO [10.254.75.75])
 ([10.254.75.75])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2020 11:23:04 -0700
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <20200622181824.GG2428291@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <04af7e48-e694-7657-5477-81b6e2e8d1c1@linux.intel.com>
Date: Mon, 22 Jun 2020 13:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622181824.GG2428291@smile.fi.intel.com>
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



On 6/22/20 1:18 PM, Andy Shevchenko wrote:
> On Mon, Jun 22, 2020 at 10:42:38AM -0500, Pierre-Louis Bossart wrote:
>> The mainline code currently prevents modules from being removed.
>>
>> The BE dailink .init() function calls devm_gpiod_get() using the codec
>> component device as argument. When the machine driver is removed, the
>> references to the gpiod are not released, and it's not possible to
>> remove the codec driver module - which is the only entity which could
>> free the gpiod.
>>
>> This conceptual deadlock can be avoided by invoking gpiod_get() in the
>> .init() callback, and calling gpiod_put() in the exit() callback.
>>
>> Tested on SAMUS Chromebook with SOF driver.
> 
>> +static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct bdw_rt5677_priv *bdw_rt5677 =
>> +			snd_soc_card_get_drvdata(rtd->card);
>> +
>> +	/*
>> +	 * The .exit() can be reached without going through the .init()
>> +	 * so explicitly test if the gpiod is valid
>> +	 */
> 
>> +	if (!IS_ERR_OR_NULL(bdw_rt5677->gpio_hp_en))
> 
> _OR_NULL is redundant. gpiod_put() is explicitly NULL-aware.
> 
> IS_ERR() I suppose can be avoided by using gpiod_get_optional(), if it suits the case.
> Otherwise it would be questionable why we got error pointer value on ->exit().

As I explained in the cover letter we can reach this function even if 
the init was not called or was not successful. There are tons of cases 
which reach the same probe_end label in the ASoC core.

So I explicitly added a test for all possible cases. I don't mind 
removing the _OR_NULL if indeed it's safe, but showing this redundancy 
also shows an intent to deal with such cases.

> 
>> +		gpiod_put(bdw_rt5677->gpio_hp_en);
>> +}
> 
