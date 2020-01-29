Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBD14CFA8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF54E167F;
	Wed, 29 Jan 2020 18:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF54E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580318908;
	bh=KUG7zeR4PfixaB6hq//ZykQ+OSJHK+us5Vshvw9fVpc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FElxmmDiGHmt+J/2RaN5Uha4aR7rFiUsyINF8qvxGTc9KdpfcSEjj2cOfshki82QD
	 DF8Q2Q4UsA8KI7YnIjTkkcX2PWfIn9sFYauze5jT9xrD3GPCD+HxBkJX5MMUHBl74I
	 P/LhOAL3kVxPGhQ8snb/W6JHjBDcQKzkLsIrv4Cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48376F80229;
	Wed, 29 Jan 2020 18:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBD1F8021E; Wed, 29 Jan 2020 18:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F73CF80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F73CF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 09:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,378,1574150400"; d="scan'208";a="222515543"
Received: from rnoffsin-mobl.amr.corp.intel.com (HELO [10.252.139.181])
 ([10.252.139.181])
 by orsmga008.jf.intel.com with ESMTP; 29 Jan 2020 09:26:37 -0800
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 Takashi Iwai <tiwai@suse.de>
References: <CAFQqKeW5b5BEU1cXRzxqmmSNCQ8Qnifn3mivx4yVnrtk7Ho0Tg@mail.gmail.com>
 <s5hsgjyn1ci.wl-tiwai@suse.de>
 <aff5f7fd-13d2-b523-b3c6-a4529c4cf26e@linux.intel.com>
 <s5htv4edxf5.wl-tiwai@suse.de>
 <d143aa71-92c7-5ba7-4866-68eef82b99b0@linux.intel.com>
 <s5ho8umdwdz.wl-tiwai@suse.de> <s5hlfpqdw25.wl-tiwai@suse.de>
 <CAFQqKeVCKp1cSL+j_uf-dbG8y1BYCTzHdrJFQ7Vo4VAsA8dYzQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0cbc4d4a-c529-6b65-84bf-41df31009a64@linux.intel.com>
Date: Wed, 29 Jan 2020 11:26:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeVCKp1cSL+j_uf-dbG8y1BYCTzHdrJFQ7Vo4VAsA8dYzQ@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about the right fix for a sparse warning
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/29/20 11:16 AM, Sridharan, Ranjani wrote:
>>
>>> Sorry, my bad, it seems that my sparse program was too old.  After
>>> upgrading to the latest version, I could see the warning, too.
>>
>> ... and the cause was what I suspected: it's a 64bit compat type that
>> defines the fields explicitly with __s32.  I overlooked that it's
>> always used for __KERNEL__.  The tentative fix is below.

Nice, thanks Takashi, Ranjani and I were lost on this one.

>>
>>
>> thanks,
>>
>> Takashi
>>
>>
>> --- a/include/uapi/sound/asound.h
>> +++ b/include/uapi/sound/asound.h
>> @@ -564,13 +564,13 @@ typedef char __pad_after_uframe[sizeof(__u64) -
>> sizeof(snd_pcm_uframes_t)];
>>   #endif
>>
>>   struct __snd_pcm_mmap_status64 {
>> -       __s32 state;                    /* RO: state -
>> SNDRV_PCM_STATE_XXXX */
>> +       snd_pcm_state_t state;          /* RO: state -
>> SNDRV_PCM_STATE_XXXX */
>>          __u32 pad1;                     /* Needed for 64 bit alignment */
>>          __pad_before_uframe __pad1;
>>          snd_pcm_uframes_t hw_ptr;       /* RO: hw ptr (0...boundary-1) */
>>          __pad_after_uframe __pad2;
>>          struct __snd_timespec64 tstamp; /* Timestamp */
>> -       __s32 suspended_state;          /* RO: suspended stream state */
>> +       snd_pcm_state_t suspended_state;        /* RO: suspended stream
>> state */
>>          __u32 pad3;                     /* Needed for 64 bit alignment */
>>          struct __snd_timespec64 audio_tstamp; /* sample counter or wall
>> clock */
>>   };
>>
> 
> Thanks, Takashi. I will prepare a patch with the fix.
> 
> Thanks,
> Ranjani
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
