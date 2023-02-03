Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DA68A11D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 19:03:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D8982E;
	Fri,  3 Feb 2023 19:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D8982E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675447410;
	bh=sQb0GgmuPk/w0KwhkbnpYfxa//MqyJrzNDEQLsCm8+s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JIXfwPGWztCS2ukclUQGIOivU5BUdg7xQjxLb/CJ4RA4dYYYTbZLIxnVNRNXvnTJc
	 6qBpg2Bxswx2j/coZdi3oal92xJ29/zeyX5nGGfIBUMeS13dp583wvJGyVD5QjsFH/
	 A20GCN5IaLYbPFYMqA50UgZHfVVGh2QAxNvVOgkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33127F800E3;
	Fri,  3 Feb 2023 19:02:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 582BCF80254; Fri,  3 Feb 2023 19:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4EFAF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 19:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EFAF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=V8ALx5mM
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 073E211C2;
 Fri,  3 Feb 2023 19:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 073E211C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675447333; bh=njGj/3RyhwetM4ZyrXkA91f7Rr8egjSHMWgICgHmVAw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V8ALx5mM3twEANe4cBHxbReyLHzrmSPimf+bgHo/yk59HSMb1u719fKUs/IjWGhnh
 YWerY/RvIiHe6X9NBs2NTy8igsp3Vxf7wlP6UNuBa960jNus8A0qfy6YiS249zqd6M
 ZoNlDDpHmMu5vGC6iU1WZvYSEOQDTZDaj2T/NUPw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  3 Feb 2023 19:02:08 +0100 (CET)
Message-ID: <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
Date: Fri, 3 Feb 2023 19:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, o-takashi@sakamocchi.jp,
 pierre-louis.bossart@linux.intel.com
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
 <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03. 02. 23 17:11, Alan Young wrote:
> 
> On 03/02/2023 00:34, Takashi Sakamoto wrote:
>> Hi,
>>
>> Thank you for the report.
>>
>> On Thu, Feb 02, 2023 at 01:55:24PM +0000, Alan Young wrote:
>>> sound/core/pcm_lib.c:update_audio_tstamp() contains the following
>>> calculation:
>>>
>>>           audio_nsecs = div_u64(audio_frames * 1000000000LL,
>>>                   runtime->rate);
>>>
>>> This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or 1.1
>>> days at 192000.
>>>
>>> Are you interested in a patch to improve this?
>>>
>>> The same calculation occurs in a couple of other places.
>> I'm interested in your patch. Would you please post it C.C.ed to the
>> list and me?  As you noted, we can see the issue in ALSA PCM core and
>> Intel HDA stuffs at least.
>>
>>    * sound/core/pcm_lib.c
>>    * sound/pci/hda/hda_controller.c
>>    * sound/soc/intel/skylake/skl-pcm.c
>>
>> I note that 'NSEC_PER_SEC' macro is available once including
>> 'linux/time.h'. It is better to use instead of the literal.
>> The macro is defined in 'include/vdso/time64.h'.
>>
>>
>> As another issue, the value of 'audio_frames' comes from the value of
>> 'struct snd_pcm_runtime.hw_ptr_wrap'. In ALSA PCM core, the value is
>> increased by the size of PCM buffer every time hw_ptr cross the boundary
>> of PCM buffer, thus multiples of the size is expected. Nevertheless,
>> there is no check for overflow within 64 bit storage. In my opinion, the
>> committer had less care of it since user does not practically playback or
>> capture PCM substream so long. But the additional check is preferable as
>> long as it does not break the fallback implementation of audio time stamp.
> 
> 
> I have not yet finished testing various alternatives. I want to extend
> the overflow by "enough" and also am conscious of the need to keep the
> overhead down.
> 
> I actually think, on reflection, that the only case that matters is the
> call from update_audio_tstamp(). The others only deal with codec delays
> which will be small (unless I misunderstand those drivers).
> 
> This is what I have so far but I'll submit a proper patch when I have it
> refined.
> 
> static u64 snd_pcm_lib_frames_to_nsecs(u64 frames, unsigned int rate)
> {
>       /*
>        *  Avoid 64-bit calculation overflow after:
>        *  - 4.8 days @ 44100
>        *  - 0.56 days @ 384000
>        *  extending these intervals by a factor of 100.
>        */
>       if (frames < 0xffffffffffffffffLLU / NSEC_PER_SEC)
>           return div_u64(frames * NSEC_PER_SEC, rate);
> 
>       if (rate % 100 == 0)
>           return div_u64(frames * (NSEC_PER_SEC/100), (rate/100));
> 
>       /* Fallback: reduce precision to approximately deci-micro-seconds: 1.28e-7 */
>       return div_u64(frames * (NSEC_PER_SEC >> 7), rate) << 7;
> }

Thank you for your suggestion, but I think that the *whole* code for 
!get_time_info in update_audio_tstamp() should be recoded. The calling of 
ns_to_timespec64() is not enough to handle the boundary wraps in a decent 
range (tenths years for 24x7 operation) and the bellow code is dangerous for 
32-bit apps / system:

      if (crossed_boundary) {
                 snd_BUG_ON(crossed_boundary != 1);
                 runtime->hw_ptr_wrap += runtime->boundary;
      }

I would probably propose to have just hw_ptr_wrap +1 counter (we can 
reconstruct the frame position back by multiplication and do range check 
later), remove snd_BUG_ON and improve the timespec64 calculation.

The calculation should be split to two parts (tv_sec / tv_nsec):

1) calculate seconds: (frames / rate)
2) calculate the remainder (ns): ((frames % rate) * NSEC_PER_SEC) / rate

With 64-bit integer range, we should go up to (for 384000Hz rate):

2**64 / 384000 / 3600 / 24 / 365 = ~1523287 years

Maybe I did a mistake somewhere. I'm open for comments.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

