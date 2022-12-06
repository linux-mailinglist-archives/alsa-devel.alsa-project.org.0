Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE549644819
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 16:35:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607051828;
	Tue,  6 Dec 2022 16:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607051828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670340921;
	bh=QCUoX14tfclkO5GylbtI8GdrNBAy8EpB3v8UADUVB/8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z8QAcebDwzNCj67v/BNFdDmA12dP2OgtkaWPfuBteTbUq19ErcQbJ49PlcxHqKg6v
	 Z63iZJ54T4PcHD+u3CzPd1OQAgC6h7dzSbmQgNeiq/uOS7ELVC6ehu28WOSok2nslH
	 5jzAhbACAtppftMrxziVemuv1AiSdLsY404yYQ9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019A2F80290;
	Tue,  6 Dec 2022 16:34:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F80F80246; Tue,  6 Dec 2022 16:34:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F296F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 16:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F296F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="USqwWPnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670340857; x=1701876857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QCUoX14tfclkO5GylbtI8GdrNBAy8EpB3v8UADUVB/8=;
 b=USqwWPnCN3hCRlJ2cgPdg+Omu9CBC6ujzaLAOn5a8Hakk1AYdEznWOuW
 xOQnrOsswWd01mTumiMi3HslwrGfnb4KaQ2wpjauCOzvWXC4TUMgju96l
 OSyv8tnKMNu3QXM0tt5FPJ9+gRY195weHHXbsRmejQlZb9vnMnZRGgHtO
 1huAfuNfFiCz9hUxoiqHSRqs85vE1d2kWdlZFPYUzyXmneky/+sw3H+zk
 kkNXNa7sXthKdMWVHRlv60tAct6aiEvxe9VwjyxL87RE1FIJGI3LCVkLE
 dWiZ7QoucfbDrqfSs0ly9nervegidLsbBnDOlsfljCxDRLHyJ723DayQG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="315362204"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="315362204"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 07:34:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="770760262"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="770760262"
Received: from cjian12x-mobl.amr.corp.intel.com (HELO [10.212.125.207])
 ([10.212.125.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 07:34:10 -0800
Message-ID: <186a5111-617d-c8f0-ba7e-1f39663c65dd@linux.intel.com>
Date: Tue, 6 Dec 2022 09:34:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ALSA: compress: Add AC3, EAC3, TrueHD, DTS, MPEG-H 3D
 Audio Stream (MHAS)
Content-Language: en-US
To: Carlos Rafael Giani <crg7475@mailbox.org>, Vinod Koul <vkoul@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221206145317.99934-1-crg7475@mailbox.org>
 <d6da4f2f-d6d8-bab6-66f0-a4b2486d1922@linux.intel.com>
 <cdee3f7d-3f98-02dc-9fc6-18ffc489c6f8@mailbox.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cdee3f7d-3f98-02dc-9fc6-18ffc489c6f8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 12/6/22 09:16, Carlos Rafael Giani wrote:
> IEC61937 is quite commonly used, yes. However, I have been working with
> a commercial system that is getting support for these formats
> implemented via compress-offload. Since these formats aren't exactly
> uncommon, I figured that adding these could be useful, especially since
> only the #defines need to be added, nothing else.

please don't top-post on mailing lists.

Nothing else? That sounds to good to be true. Specifically for
spatialization, there's got to be some sort of interface to control
where the objects are located, either in reference to the listener
position or the listening room setup.

The compressed API was developed back in the early 2010s for elementary
streams, it's not been extended since and IMHO it's far too limited to
support Atmos and newer systems optimally.

> On 06.12.22 16:07, Pierre-Louis Bossart wrote:
>>
>> On 12/6/22 08:53, Carlos Rafael Giani wrote:
>>> These audio codecs are used in sound bars and digital TVs, and benefit
>>> from off-loading to a DSP. In particular, Dolby Atmos and MPEG-H 3D
>>> audio
>>> spatialization is done in dedicated DSPs. Thus, adding these codecs  to
>>> the Compress-Offload API makes sense.
>> The question is "how is the stream transported". In most implementations
>> for these formats, the DSP is on the receiver side and the transport
>> happens with an IEC61937 format - which does not require the use of the
>> compressed API.
>>
>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>> ---
>>>   include/uapi/sound/compress_params.h | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/sound/compress_params.h
>>> b/include/uapi/sound/compress_params.h
>>> index ddc77322d571..7a58e2026be3 100644
>>> --- a/include/uapi/sound/compress_params.h
>>> +++ b/include/uapi/sound/compress_params.h
>>> @@ -43,7 +43,13 @@
>>>   #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>>>   #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>>>   #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
>>> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
>>> +#define SND_AUDIOCODEC_AC3                   ((__u32) 0x00000011)
>>> +#define SND_AUDIOCODEC_EAC3                  ((__u32) 0x00000012)
>>> +#define SND_AUDIOCODEC_TRUEHD                ((__u32) 0x00000013)
>>> +#define SND_AUDIOCODEC_DTS                   ((__u32) 0x00000014)
>> IIRC there are multiple flavors of DTS, off the top of my head DTS-ES,
>> 96, HD, Master Audio. "DTS" only doesn't even begin to describe the
>> possible variants.

And IIRC2 there is some level of backwards compatibility between
flavors, but the decoder may or may not be able to generate the number
of channels and formats supported in the initial stream. That's a
problem if you need to configure audio codecs or interfaces and the DSP
doesn't tell you what it decoded or upmixed.

>>> +/* MPEG-H 3D Audio Stream (MHAS) as defined in ISO/IEC 23008-3 */
>>> +#define SND_AUDIOCODEC_MHAS                  ((__u32) 0x00000015)
>> Doesn't this need the definition of profiles and various types of
>> formats - classic problem with designed-by-committee MPEG codecs.
>>
>>> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_MHAS
>>
>>>   /*
>>>    * Profile and modes are listed with bit masks. This allows for a
