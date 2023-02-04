Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1068AAFA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 16:41:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1FC86E;
	Sat,  4 Feb 2023 16:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1FC86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675525285;
	bh=zUe9EUoBkZnWEMwmozKSTC0t0RJZMAIrMZAKuX1uZFk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bf6K+Q/pE0l40d8hRUTgBfhAUPaN0dbx9xwQN78bKNFd62q/U328Rsqrv5TSjuUXM
	 eU43Xlojkaqt5NKnxk97s3on6+0RwnIFvM3Wf4inytg7QXxWbK+dAvCP/PPh33B9/E
	 dJvOP7vrCM9S6i68R29B6TZagZiRZ1xAcf54I4jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A191EF8001D;
	Sat,  4 Feb 2023 16:40:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4186DF804C2; Sat,  4 Feb 2023 16:40:23 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 44C23F8001D
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 16:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C23F8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=Fq0pueX6
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D25C811C2;
 Sat,  4 Feb 2023 16:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D25C811C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675525212; bh=l3xSRTFA3MNvz4W6xyvZEiyOGmWcQP8c5+ia1o9PufM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fq0pueX66F1Pp8oFBO/R1Fv8aW/RTSvGEnZMb13RhNbqeEytw4+ThxUtnEjkfo3pO
 qGkLD+0lRfz5CyLDbKPFneBFF8dk+X/phF6vKnaocMxQRT45WHyymx8udFCcwKbPZ2
 mID94DRZ7EY42BGbwAdl/m2DkKYNIMYhKDcR4GM0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat,  4 Feb 2023 16:40:08 +0100 (CET)
Message-ID: <fa44f39c-4dea-5433-fd89-1286ed6a94da@perex.cz>
Date: Sat, 4 Feb 2023 16:40:08 +0100
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
 <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
 <e2ab7f52-4fc9-bcff-5051-5590ca4f8496@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <e2ab7f52-4fc9-bcff-5051-5590ca4f8496@gmail.com>
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

On 04. 02. 23 10:11, Alan Young wrote:
> 
> On 03/02/2023 18:02, Jaroslav Kysela wrote:
>> Thank you for your suggestion, but I think that the *whole* code for 
>> !get_time_info in update_audio_tstamp() should be recoded. The calling of 
>> ns_to_timespec64() is not enough to handle the boundary wraps in a decent 
>> range (tenths years for 24x7 operation) 
> 
> Yes, indeed. My ambition was unnecessarily short.
> 
> 
>> and the bellow code is dangerous for 32-bit apps / system:
>>
>>      if (crossed_boundary) {
>>                 snd_BUG_ON(crossed_boundary != 1);
>>                 runtime->hw_ptr_wrap += runtime->boundary;
>>      }
>>
> I don't understand why?
 >
>> I would probably propose to have just hw_ptr_wrap +1 counter (we can 
>> reconstruct the frame position back by multiplication and do range check 
>> later), 
> 
> Would that really help that much? It would extend the total possible duration 
> but perhaps ~1523287 years(below) is sufficient.
> 
>> remove snd_BUG_ON
> 
> Again, why?

For 32-bit apps the boundary is near to UINT32_MAX (see recalculate_boundary() 
function). So only one crossing point is not enough to cover a decent time range.

There should be a better check, if the add operation crosses the U64 range for 
snd_BUG_ON. In my eyes, it looks safer to use counter here and do the checks
in the function which uses this value.

>> and improve the timespec64 calculation.
>>
>> The calculation should be split to two parts (tv_sec / tv_nsec):
>>
>> 1) calculate seconds: (frames / rate)
>> 2) calculate the remainder (ns): ((frames % rate) * NSEC_PER_SEC) / rate
>>
>> With 64-bit integer range, we should go up to (for 384000Hz rate):
>>
>> 2**64 / 384000 / 3600 / 24 / 365 = ~1523287 years
> 
> 
> Yes indeed. How about this?
> 
> static inline void snd_pcm_lib_frames_to_timespec64(u64 frames, unsigned int rate, struct timespec64 *audio_tstamp)
> {
> 	u32 remainder;
> 	audio_tstamp->tv_sec = div_u64_rem(frames, rate, &remainder);
> 	audio_tstamp->tv_nsec = div_u64(mul_u32_u32(remainder, NSEC_PER_SEC), rate);

Yes, this looks fine.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

