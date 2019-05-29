Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A58C32D608
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 09:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCDBF1695;
	Wed, 29 May 2019 09:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCDBF1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559114146;
	bh=L7j1xhUk75MeNrWjRCPfCqj2I9VQocn/MDQiK61JWs8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrJ72E2r5Pc+j6eS9fmlBVS9gTVPjCkkTJUADzc7Xr+oIbRst5hEC6zmL70fjY8+A
	 w8aRiLe3MDKLIozA7R3f3smRf5R5dCfrZHo91Ic7PIKkdVfJltKMSLrZTQA7XDTNw1
	 eBw57JbLOSc+QwfxUbSDiSy4gsg0+wYLG8FqdbmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0209AF8072E;
	Wed, 29 May 2019 09:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA22BF896E4; Wed, 29 May 2019 09:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 321BCF8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 09:13:57 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5CB5CA003F;
 Wed, 29 May 2019 09:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5CB5CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1559114037; bh=i8w/zRxpCTpqX4BDPhGHKKHNaz3IikIsBmgW7qF0Bo8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OgJZ97gWwpcKcV9lB9f1kkFjd7WCmod+PKnWGJgnrzzPoGyMotVGECQAF+DkQUH48
 21ymm+HUkeEFXwCrlr2ttgqZ4aXqB+YWiy5FPfkQ4WB95FbPLitzz/9P+CfuqTsKCN
 YUgI0/wV53OHOME67cGGI+wl3RBYB7Um/iBUwF4U=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 29 May 2019 09:13:52 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190528200206.2793-1-perex@perex.cz>
 <2baa9302-3e1d-6710-ed3e-13122094f8b8@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <286ab50b-b0ac-3e98-b4c6-c0304b7414f7@perex.cz>
Date: Wed, 29 May 2019 09:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2baa9302-3e1d-6710-ed3e-13122094f8b8@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: uapi headers - add missing
 include for stdint.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 28. 05. 19 v 23:45 Pierre-Louis Bossart napsal(a):
> Hi Jaroslav,
> 
> On 5/28/19 3:02 PM, Jaroslav Kysela wrote:
>> The modified header files depend on types defined in <stdint.h>.
> 
> Humm, not an objection but more a question: may I ask in which cases the 
> compilation would fail or what types were problematic? I see stdint.h 
> being used by only 3 files in include/uapi so not sure if we missed 
> something?

We have some automatic tests in our kernel integration, so the uapi headers
should be useable standalone. But looking further to the uapi tree,
uapi/scsi/scsi_bsg_fc.h does not have stdint.h include statement, too. So the
situation is not black and white. I will recommend to add explicit include of
stdint.h to our test. Please, ignore this patch.

					Thanks,
						Jaroslav

> Also we removed some of those files recently since they were not used by 
> the kernel, we only have abi.h, fw.h, header.h and tokens.h in this 
> directory, so that patch would not apply against Mark's tree.
> 
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Takashi Iwai <tiwai@suse.de>
>> Cc: Mark Brown <broonie@kernel.org>
>> ---
>>   include/uapi/sound/sof/eq.h       | 4 ++++
>>   include/uapi/sound/sof/fw.h       | 4 ++++
>>   include/uapi/sound/sof/header.h   | 4 ++++
>>   include/uapi/sound/sof/manifest.h | 4 ++++
>>   include/uapi/sound/sof/trace.h    | 4 ++++
>>   5 files changed, 20 insertions(+)
>>
>> diff --git a/include/uapi/sound/sof/eq.h b/include/uapi/sound/sof/eq.h
>> index 666c2b6a3229..106d56e357e0 100644
>> --- a/include/uapi/sound/sof/eq.h
>> +++ b/include/uapi/sound/sof/eq.h
>> @@ -9,6 +9,10 @@
>>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
>>   #define __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
>>   
>> +#ifndef __KERNEL__
>> +#include <stdint.h>
>> +#endif
>> +
>>   /* FIR EQ type */
>>   
>>   #define SOF_EQ_FIR_IDX_SWITCH	0
>> diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
>> index 1afca973eb09..4f2de19a3b86 100644
>> --- a/include/uapi/sound/sof/fw.h
>> +++ b/include/uapi/sound/sof/fw.h
>> @@ -13,6 +13,10 @@
>>   #ifndef __INCLUDE_UAPI_SOF_FW_H__
>>   #define __INCLUDE_UAPI_SOF_FW_H__
>>   
>> +#ifndef __KERNEL__
>> +#include <stdint.h>
>> +#endif
>> +
>>   #define SND_SOF_FW_SIG_SIZE	4
>>   #define SND_SOF_FW_ABI		1
>>   #define SND_SOF_FW_SIG		"Reef"
>> diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
>> index 7868990b0d6f..6a62ae8f0eb9 100644
>> --- a/include/uapi/sound/sof/header.h
>> +++ b/include/uapi/sound/sof/header.h
>> @@ -9,6 +9,10 @@
>>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
>>   #define __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
>>   
>> +#ifndef __KERNEL__
>> +#include <stdint.h>
>> +#endif
>> +
>>   /*
>>    * Header for all non IPC ABI data.
>>    *
>> diff --git a/include/uapi/sound/sof/manifest.h b/include/uapi/sound/sof/manifest.h
>> index 2009ee30fad0..d57aa2bc4764 100644
>> --- a/include/uapi/sound/sof/manifest.h
>> +++ b/include/uapi/sound/sof/manifest.h
>> @@ -9,6 +9,10 @@
>>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
>>   #define __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
>>   
>> +#ifndef __KERNEL__
>> +#include <stdint.h>
>> +#endif
>> +
>>   /* start offset for base FW module */
>>   #define SOF_MAN_ELF_TEXT_OFFSET		0x2000
>>   
>> diff --git a/include/uapi/sound/sof/trace.h b/include/uapi/sound/sof/trace.h
>> index ffa7288a0f16..1652bc08d576 100644
>> --- a/include/uapi/sound/sof/trace.h
>> +++ b/include/uapi/sound/sof/trace.h
>> @@ -9,6 +9,10 @@
>>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
>>   #define __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
>>   
>> +#ifndef __KERNEL__
>> +#include <stdint.h>
>> +#endif
>> +
>>   /*
>>    * Host system time.
>>    *
>>
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
