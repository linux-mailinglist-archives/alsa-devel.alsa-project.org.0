Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB8B1C7BCF
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 23:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2250417CF;
	Wed,  6 May 2020 23:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2250417CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588798890;
	bh=tZMYf6PiW8AUEsBwpdaqCHHUWTYmWGh8CnI+jMnUGOo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMIDdLjG0gXXJCIaG7jgsQ+MGt1bgc1PKwSIykEnqLdwiCpizwExHkja26BvJog3c
	 osf5ZLJzHOpXC+lVnXJwklRgm7eCU6LcLWvq8Ul7HM52YayGbO7cqBw55RJ/lHUxW9
	 1iD6Dlfj+5s8GLUw/PWPeT4G6zZCifpPTxFgnKZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F4CFF800DF;
	Wed,  6 May 2020 23:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E29F80258; Wed,  6 May 2020 23:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07B0FF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 23:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B0FF800DF
IronPort-SDR: 6b7fDOjPu1SJTV+kdzBhFKwuj5WZIilGagZjLkhvGDuqhlbQYHpOdi5bpWVlr8ylTIA0LT43st
 JHJGDmLDUYYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 14:00:14 -0700
IronPort-SDR: 5CrN33BFtHT+EEHCn3rkKeqHy4mgOV9Qb3YinSKm3loj6AGp831xS22hwFv+X+xnclINEYdB26
 Lf0J0ALQS95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249880156"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.134.203])
 ([10.249.134.203])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 14:00:12 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Update description for HDaudio
 kconfig
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200506205224.7577-1-cezary.rojewski@intel.com>
 <41c6fa62-d489-32ba-5575-6fc4548ebf18@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7f1c7582-9c47-06dc-2f7e-b5d7cbd42557@intel.com>
Date: Wed, 6 May 2020 23:00:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <41c6fa62-d489-32ba-5575-6fc4548ebf18@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 2020-05-06 22:57, Pierre-Louis Bossart wrote:
> 
> 
> On 5/6/20 3:52 PM, Cezary Rojewski wrote:
>> With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
>> warning is no longer true. Remove it and update the description.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/Kconfig | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
>> index c8de0bb5bed9..4d11f4f3f7e2 100644
>> --- a/sound/soc/intel/Kconfig
>> +++ b/sound/soc/intel/Kconfig
>> @@ -209,12 +209,8 @@ config SND_SOC_INTEL_SKYLAKE_SSP_CLK
>>   config SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
>>       bool "HDAudio codec support"
>>       help
>> -      This option broke audio on Linus' Skylake laptop in December 2018
>> -      and the race conditions during the probe were not fixed since.
>> -      This option is DEPRECATED, all HDaudio codec support needs
>> -      to be handled by the SOF driver.
>> -      Distributions should not enable this option and there are no known
>> -      users of this capability.
>> +      If you have Intel Skylake or Kabylake with HDaudio codec
> 
> I would have added HDaudio codec + dmic but that's good enough, the 
> selection based on DMIC presence will be done by your other patch so
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Thanks Cezary.
> 
> 
>> +      then enable this option by saying Y or m.
>>   config SND_SOC_INTEL_SKYLAKE_COMMON
>>       tristate
>>

Do you want me to spin v3? While copying desc from other kconfgs, I 
added 'or m' by mistake. Don't mind to update once more if you want me to.

Czarek
