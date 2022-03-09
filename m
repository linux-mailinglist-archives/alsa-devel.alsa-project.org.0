Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7A4D319A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 16:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7005F1685;
	Wed,  9 Mar 2022 16:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7005F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646839018;
	bh=MxZDzUlCIaHYoZJmhfTEyLOV6jdwo3rvEMya55hMUPU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPXg8k7+pMMPINlSJxjwe4URw0tyHbR8vCZSAyHBbVvxKg8LPUv70P6tr2/yzW653
	 JQ61XmMKHvmw7B6305mgmY7xn1Pj3k7RDUce2FySoNmXgJGYCK83nZAkfycf+W5m2Q
	 PdFX5ZIuTTK5TmmBtBSYLEzqAy14JSLP4GBFdbXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E15F80236;
	Wed,  9 Mar 2022 16:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F6FF80236; Wed,  9 Mar 2022 16:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18269F80158
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 16:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18269F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ipHKEYjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646838941; x=1678374941;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MxZDzUlCIaHYoZJmhfTEyLOV6jdwo3rvEMya55hMUPU=;
 b=ipHKEYjSpmNfN5wTmj+TsMF2hFJJCU8gABf5p6UD2T+dTQXKvOFQEkn4
 VJOoYAfCxsCMiVeuCm4zMj+Y/CYlXvp+DY5awMegSVjnW5XjFhNtqB+qG
 1xRlMJZChzS9ld/3sCxjq2DjFNhG6qxvOpUUjU9UvTrrWyQvM5j9PRIgg
 5rtS6uVNs9ngMx0B0yjOiE6neXs2jgIqBNdPxXsiMinWN876Fbw+9GqXy
 6Fe2NXH2XvZ+zcHIv3dxePxp+GhX/RejQuY1SXbcctVTAz2XCH8AA34FW
 yH9EbdEks7zVD8zvhZidOLUyzH+LfsDee6FuuAp3hxCF0k6/w0DKxxNH9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242438814"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="242438814"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:15:33 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="632633186"
Received: from byoshina-mobl.amr.corp.intel.com (HELO [10.212.156.250])
 ([10.212.156.250])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 07:15:32 -0800
Message-ID: <2e6b7905-4b9f-8615-a7f2-6b3d66e6386e@linux.intel.com>
Date: Wed, 9 Mar 2022 09:15:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH V0 1/1] ASoC: msm: fix integer overflow for long duration
 offload playback
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Raghu Bankapur <quic_rbankapu@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <cover.1646835508.git.quic_rbankapu@quicinc.com>
 <b906dbaf772d0152a3af52d639b090d15fe8c362.1646835508.git.quic_rbankapu@quicinc.com>
 <37933410-1bc7-3e27-50e8-3da03e8b5603@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <37933410-1bc7-3e27-50e8-3da03e8b5603@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quiinc.com>
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



On 3/9/22 08:51, Amadeusz Sławiński wrote:
> On 3/9/2022 3:22 PM, Raghu Bankapur wrote:
>> From: Raghu Bankapur <quic_rbankapu@quiinc.com>
>>
>> 32 bit variable is used for storing number of bytes copied to DSP,
>> which can overflow when playback duration goes beyond 24 hours.
>> Change data type for this variable to uint64_t to prevent overflow
>> and related playback anomaly.
>>
>> Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
>> ---
>>   include/uapi/sound/compress_offload.h | 2 +-
>>   sound/core/compress_offload.c         | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/sound/compress_offload.h 
>> b/include/uapi/sound/compress_offload.h
>> index 9555f31c8425..57d24d89b2f4 100644
>> --- a/include/uapi/sound/compress_offload.h
>> +++ b/include/uapi/sound/compress_offload.h
>> @@ -67,7 +67,7 @@ struct snd_compr_params {
>>    */
>>   struct snd_compr_tstamp {
>>       __u32 byte_offset;
>> -    __u32 copied_total;
>> +    __u64 copied_total;
>>       __u32 pcm_frames;
>>       __u32 pcm_io_frames;
>>       __u32 sampling_rate;
> 
> I don't think this patch should be merged as is. It changes UAPI header, 
> most likely breaking existing user space tools. Can't overflow be 
> handled somehow instead?
> 
> Although having looked around, it makes a bit of sense, as 
> snd_compr_update_tstamp() copies tstamp->copied_total to 64 bit 
> variables...
> 
> Perhaps raise protocol version? ( 
> https://elixir.bootlin.com/linux/latest/source/include/uapi/sound/compress_offload.h#L34 
> )

This change sounded familiar, and sure enough we've already discussed 
this in 2019. I thought we did change things but unfortunately no, the 
problem is still there.

https://lore.kernel.org/alsa-devel/1560843846-4631-1-git-send-email-bgoswami@codeaurora.org/

we really want to change all the copied_total, pcm_frames and 
pcm_io_frames to u64 and add a new IOCTL.

