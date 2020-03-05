Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF817A68C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635071661;
	Thu,  5 Mar 2020 14:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635071661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583415552;
	bh=+E17eXP1c2DMcbXvhLulVWHFuaZIUbQ3kV9nIGVNpc8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzguRXq8ZB/wgpUdJ9BsIwFrNGNT50nXZ9KV85eWP3RtUi4b5FB8WHPrE2zOKpnGL
	 lggVa9y3Ee3e6jvipYPGvXS0cYAWllwuBavOWTyNZl3radQSENSUO3/rLD7wS8wQk6
	 OOttaO2eCcrgIazHcNv7TwD2dOAnnNeFUGEsfRQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CCAF800D8;
	Thu,  5 Mar 2020 14:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C431FF8026A; Thu,  5 Mar 2020 14:37:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B8D9F80245
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8D9F80245
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="229690843"
Received: from virbhadx-mobl1.amr.corp.intel.com (HELO [10.254.184.168])
 ([10.254.184.168])
 by orsmga007.jf.intel.com with ESMTP; 05 Mar 2020 05:37:36 -0800
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305132558.GJ1224808@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <269870e7-02d5-22a5-df0b-d36845db6104@linux.intel.com>
Date: Thu, 5 Mar 2020 07:37:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305132558.GJ1224808@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
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



On 3/5/20 7:25 AM, Andy Shevchenko wrote:
> On Thu, Mar 05, 2020 at 07:06:15AM -0600, Pierre-Louis Bossart wrote:
>> The use of devm_gpiod_get() in a dailink .init() callback generates issues
>> when unloading modules. The dependencies between modules are not well
>> handled and the snd_soc_rt5677 module cannot be removed:
>>
>> rmmod: ERROR: Module snd_soc_rt5677 is in use
>>
>> Removing the use of devm_ and manually releasing the gpio descriptor
> 
> gpio -> GPIO

yep


>> +static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct bdw_rt5677_priv *bdw_rt5677 =
>> +			snd_soc_card_get_drvdata(rtd->card);
>> +
> 
>> +	if (!IS_ERR(bdw_rt5677->gpio_hp_en))
> 
> I'm wondering if you need this check at all? In the above (I left for context)
> the GPIO is considered mandatory, does the core handles errors from ->init()
> correctly?

I just rechecked, the error flow is

dailink.init()
soc_init_pcm_runtime
snd_soc_bind_card probe_end:
soc_cleanup_card_resources(card, card_probed);
snd_soc_remove_pcm_runtime(card, rtd);
dai_link->exit(rtd);

so we do need to recheck if the resources allocated in init() are valid.

I also think the IS_ERR() is correct by looking at the code in 
gpiod_get_index() but the comments are rather confusing to me:

  * Return a valid GPIO descriptor, -ENOENT if no GPIO has been assigned 
to the
  * requested function and/or index, or another IS_ERR() code if an error
  * occurred while trying to acquire the GPIO.


> 
>> +		gpiod_put(bdw_rt5677->gpio_hp_en);
>> +}
>> +

