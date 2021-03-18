Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59074340922
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 16:46:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC5F1699;
	Thu, 18 Mar 2021 16:45:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC5F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616082379;
	bh=H78Oi/ME5U8JNikwOq6/5Bq4PBoCE8DdLPBBKKYmlBk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dfqzYP4xBMtyekyicYTT3pJMVvBjKBzyQBRVr0LLynsUWOtRyxSezWR9Lo8tTq4Xl
	 lKRURYufqoxAbcH37qSPcThugZJpFhSVAcIN4GQXnvgKc2rrEMXJ4J5cOUHZsZEG6A
	 3RGM5X+PhQEp0t7Wu5mW0y1meKNMBwquby/21Uzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F6A4F80171;
	Thu, 18 Mar 2021 16:44:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF0CF80165; Thu, 18 Mar 2021 16:44:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C52D8F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 16:44:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C52D8F800E0
IronPort-SDR: 2HKrJBASaF5VpKpk9HRMjrlZ8k77kHHLEDz7A5vz+9fVzX3tMDKlcPMiiM5INtMB9Dt5za4KAm
 hPRfDJBYnCyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="168999219"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="168999219"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:44:37 -0700
IronPort-SDR: z1nGGynXx86uEza18COfqujEAgE5vGMWAKGh+v5C41pTkg7l/q+D0roS9ESSMRleioXosjvqhg
 eyDU4DEl71dQ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="450522611"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.77])
 ([10.237.12.77])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:44:35 -0700
Subject: Re: [PATCH 3/3] ALSA: hda: Revert "ALSA: hda: Allow setting
 preallocation again for x86"
To: Takashi Iwai <tiwai@suse.de>
References: <20210318151122.2493096-1-amadeuszx.slawinski@linux.intel.com>
 <20210318151122.2493096-4-amadeuszx.slawinski@linux.intel.com>
 <s5hk0q4h3yz.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <c70b8f56-c6c3-cde1-40bf-f04765da56d7@linux.intel.com>
Date: Thu, 18 Mar 2021 16:44:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <s5hk0q4h3yz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
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

On 3/18/2021 4:32 PM, Takashi Iwai wrote:
> On Thu, 18 Mar 2021 16:11:22 +0100,
> Amadeusz Sławiński wrote:
>>
>> This reverts commit f8e4ae10de43fbb7ce85f79e04eca2988b6b2c40.
> 
> It should be a format of commit ("description ...") as checkpatch.pl
> would complain.  The commit f8e4ae10de43 itself is a revert of commit
> c31427d0d21e, and you need to give an explanation why the
> revert-of-a-revert can work better at this time.
> 

I don't mind improving it, however it seems like there is exception done 
in checkpatch for "This reverts commit", so there is no warning on this 
line.

Will add explanation.

> 
> thanks,
> 
> Takashi
> 
>> On systems where there is a lot of FrontEnds, when
>> CONFIG_SND_HDA_PREALLOC_SIZE != 0  ALSA core allocates memory for each
>> FE, which may cause out of memory problems due to per card limit. Force
>> config to 0 on X86, so memory will be allocated on as needed basis.
>>
>> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=201251#c322
>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/hda/Kconfig | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
>> index 57595f1552c9..741179ccbd4e 100644
>> --- a/sound/hda/Kconfig
>> +++ b/sound/hda/Kconfig
>> @@ -21,17 +21,16 @@ config SND_HDA_EXT_CORE
>>          select SND_HDA_CORE
>>   
>>   config SND_HDA_PREALLOC_SIZE
>> -	int "Pre-allocated buffer size for HD-audio driver"
>> +	int "Pre-allocated buffer size for HD-audio driver" if !SND_DMA_SGBUF
>>   	range 0 32768
>> -	default 2048 if SND_DMA_SGBUF
>> +	default 0 if SND_DMA_SGBUF
>>   	default 64 if !SND_DMA_SGBUF
>>   	help
>>   	  Specifies the default pre-allocated buffer-size in kB for the
>>   	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
>>   	  for systems using PulseAudio.  The default 64 is chosen just
>>   	  for compatibility reasons.
>> -	  On x86 systems, the default is 2048 as a reasonable value for
>> -	  most of modern systems.
>> +	  On x86 systems, the default is zero as we need no preallocation.
>>   
>>   	  Note that the pre-allocation size can be changed dynamically
>>   	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
>> -- 
>> 2.25.1
>>

