Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F81C7B9A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:57:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0604817C3;
	Wed,  6 May 2020 22:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0604817C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588798661;
	bh=iF+BFndPcM5uCAmJUcs3hXkvnaFBjJybr/jHQS4w5Z4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/oh25vnql2EVslgmHcR2vBCiXt9ObWcTITs3PKN6C866t546qPNi3SzI2ccESSS6
	 LGgyQJqWvCfm8SsQa96kSfUewFV4cQR2UUV8ZywOjmjA3DE1jaVm8UnwjhohawSDSW
	 zeUMV7GwRbk71YUnyaSGmzjbReqRzXTzCqi15CxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2E7F800DF;
	Wed,  6 May 2020 22:56:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BF7F80253; Wed,  6 May 2020 22:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 217F1F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217F1F800AD
IronPort-SDR: q3CswKj+Jgxp01RyUdIiy3PR01Qg4poAb7am5R3aaBdBnacUF8lbkWY9rjhet6Dza2IcgvZIR3
 vk2ZE3aDd6gw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:55:01 -0700
IronPort-SDR: qq/3wNI+CmvbsNUWq3v5Jrjo6Yskr9ihmQoobvRMPeXGsvr1XE5oSE42PkIAK0yhv+Zc2uzRWe
 Y80P8WlmnPKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249876774"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.134.203])
 ([10.249.134.203])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:55:00 -0700
Subject: Re: [PATCH] Revert "ASoC: Intel: Skylake: mark HDAudio codec support
 as deprecated."
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200506195509.22307-1-cezary.rojewski@intel.com>
 <3fe9ac1d-177c-8b99-a44a-1b6ccb1e2325@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <45c5e539-f7a5-37db-c7c9-97900d2f93b0@intel.com>
Date: Wed, 6 May 2020 22:54:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3fe9ac1d-177c-8b99-a44a-1b6ccb1e2325@linux.intel.com>
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

On 2020-05-06 22:30, Pierre-Louis Bossart wrote:
> On 5/6/20 2:55 PM, Cezary Rojewski wrote:
>> This reverts commit 02701b909c2fab4b49f9c9545ab921c9b2c7a768.
>>
>> With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
>> warning is no longer true. Remove it.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/Kconfig | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
>> index c8de0bb5bed9..d6c5c68b7499 100644
>> --- a/sound/soc/intel/Kconfig
>> +++ b/sound/soc/intel/Kconfig
>> @@ -209,12 +209,9 @@ config SND_SOC_INTEL_SKYLAKE_SSP_CLK
>>   config SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
>>       bool "HDAudio codec support"
>>       help
>> -      This option broke audio on Linus' Skylake laptop in December 2018
>> -      and the race conditions during the probe were not fixed since.
>> -      This option is DEPRECATED, all HDaudio codec support needs
>> -      to be handled by the SOF driver.
>> -      Distributions should not enable this option and there are no known
>> -      users of this capability.
>> +      If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
>> +      GeminiLake or CannonLake platform with an HDaudio codec
>> +      then enable this option by saying Y
> 
> Yes we need to change the help text now that the issues were fixed and 
> UCM/topology are available, but I would be more comfortable if the text 
> was aligned with your patch "[PATCH] ALSA: hda: Allow SST driver on SKL 
> and KBL platforms with DMIC"
> 
> e.g. If you have a Intel Skylake or KabyLake plaforms with an HDaudio 
> codec+DMIC configuration then enable this option by saying Y

Agreed. That makes patch a revert no longer, though. Re-sent as:
	ASoC: Intel: Skylake: Update description for HDaudio kconfig

Thanks, Czarek
