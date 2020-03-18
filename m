Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA9189A35
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 12:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3F4175A;
	Wed, 18 Mar 2020 12:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3F4175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584529554;
	bh=JFG5I35+p0OeklfkUP5wJKaIu3ju5s+mvEETRDmmLg8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0+JG8Ul8BYnAzUJn/l0qfwzwrU4uesrxEKHvK5MgBS/5Ot/fUv1VlUezoVnvc68u
	 YhPsQkhtomonEaN63nVoRkXFb6F8VDfKE+XqF4ibp/2dk8H7GARFahXnR2C1MkRWEz
	 3srfyxhAMu3lrRMAHSyJ/7lm2UfAZouFwoUkWtWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30304F80139;
	Wed, 18 Mar 2020 12:04:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D313F80132; Wed, 18 Mar 2020 12:04:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F124F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 12:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F124F80058
IronPort-SDR: IXSx0+wc9EaW1xm1RAs9iwlECXOS2Vi6begipuQNg/5+pCuSOohxWppu69vGdLymI2IMK7HKcS
 FQSRVh2LtEKg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 03:25:35 -0700
IronPort-SDR: v/NexHIGH0+qXYVecN4ika98njN29uwBFD9uTSYs3gaXSyi/xNqbL6+4kFv+2GraSxtSLSP238
 OxFm9jIl5HQA==
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="417897905"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.252.40.246])
 ([10.252.40.246])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 03:25:33 -0700
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
 <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
 <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
 <9adc9d91-4227-9558-067f-40a9aa3fb561@perex.cz>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <fc031fee-4f5d-18bb-b411-2d97f57a0c95@linux.intel.com>
Date: Wed, 18 Mar 2020 11:25:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9adc9d91-4227-9558-067f-40a9aa3fb561@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>>>>>> Basic UCM configuration for HDA DSP generic enabling codec playback
>>>>>> and
>>>>>> capture on both HDA codec and DMIC ports.
>>>>>
>>>>> Could you describe for what Linux driver (source code) is this
>>>>> configuration?
>>>>
>>>>
>>>> This file is for Intel Skylake SST driver. Information added in v2.
>>>
>>> Ok, do we have this code in the vanilla linux kernel? Which .c file?
>>> The driver name 'hdadsp' looks suspicious. We usually have a delimiter
>>> in the driver name (like sof-hda-dsp).
>>
>>
>> Yes, it is a part of Skylake driver, "hdadsp" is the name of sound card
>> created on machine when using HDA generic machine driver. This machine
>> driver is made of 2 .c files:
>>
>>       - skl_hda_dsp_common.c
>>       - skl_hda_dsp_generic.c
>>
>> both are located in: sound/soc/intel/boards/
>>
>> Example on production laptop:
>>
>> test@test-Swift-SF515-51T:/proc/asound$ cat cards
>>    0 [hdadsp         ]: hda-dsp - hda-dsp
>>                         WL-SwiftSF515_51T-V1.02-Guinness_WL
>
> Ok, I see now. The 'hdadsp' is the user configurable card 
> identification (alias to the card number) not the driver name. The UCM 
> should be in 'hda-dsp' directory. If the UCM validator works for you, 
> it should be corrected.
>
> Could you point me to the alsa-info.sh output for this hardware?
>

Thank you for the explanation, adjustments are coming in v4. Still, I 
was able to test ucm's on DUT using "alsaucm -c hdadsp" command and it 
worked..

I had some problems uploading the output automatically, so done it 
manually, here's the link:

http://www.alsa-project.org/db/?f=986bf4515b2af1de75d42f2df2f812664fb7ec6e


I also sent a patch adding output to configs subtree in alsa-tests repo.

V4 was tested with ucm-validator, no errors.


> Thank you,
>                 Jaroslav
>

Thanks,
Mateusz

