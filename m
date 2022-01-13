Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFB48D90E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 14:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237BE1F5B;
	Thu, 13 Jan 2022 14:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237BE1F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642080820;
	bh=g5wY99T4KfkzljRwUqFOYdlhFEBd4CPuM5/BzYEO4Bo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MermsVhO67/Hq+eNVBUIu6BVFXywpl9h833qapT5GSVSSr37gcvV47URWBCS3zfez
	 BNXCbSojl9fQO33tS1sc5pRfyTMUdkwJ+mM0Y+NSuXz+oZ5Bk/RSdaIkAhAbdbXI4+
	 h46gyoCChQ5td42BbgkN1MptBmYVFPaVfqdAuyzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDECF80141;
	Thu, 13 Jan 2022 14:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A63F8013F; Thu, 13 Jan 2022 14:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51BA1F800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:32:25 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9C36AA0047;
 Thu, 13 Jan 2022 14:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9C36AA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1642080744; bh=EP9L7qMdhh8Wu5bJ8Lvwpb50iWBvWlC/gxIJDaoqDlU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u4jgkH9FO4pNyDYeLu2BKOfsvgTbC7KoCy1GZWXfGlYATM6+XR6M3LZaKA2zW/LmV
 KbmZG6Jxt1jaOSWmpES4FjNQlzg8SFOxQEytN2ljNfhQf8XdwSIiGZgtc/NOW6gYcA
 EcuLQnjgPoDQsOMAQY+2AOyn1tdf2kTLhsknvYk0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 Jan 2022 14:32:21 +0100 (CET)
Message-ID: <40388d17-0c5e-5d10-2f8a-ba75e2b7b9c7@perex.cz>
Date: Thu, 13 Jan 2022 14:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ALSA: pcm: accept the OPEN state for snd_pcm_stop()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220113113130.1961332-1-perex@perex.cz>
 <s5hmtjz7q16.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5hmtjz7q16.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 13. 01. 22 13:56, Takashi Iwai wrote:
> On Thu, 13 Jan 2022 12:31:30 +0100,
> Jaroslav Kysela wrote:
>>
>> It may be useful to completely invalidate streaming under some
>> circumstances like the USB gadget detach. This case is a bit different
>> than the complete disconnection. The applications should be notified
>> that the PCM streaming is no longer available, but the recovery may be
>> expected.
>>
>> This patch adds support for SNDRV_PCM_STATE_OPEN passed
>> to snd_pcm_stop() function. Only the hw_free ioctl is allowed to free
>> the buffers in this state for a full recovery operation or the PCM file
>> handle must be closed.
>>
>> In the OPEN state, ioctls return EBADFD error (with the added hw_free
>> exception above). The applications which are not aware about this new
>> state transition (and recovery) will fail with an error. This operation
>> is expected.
>>
>> Link: https://lore.kernel.org/alsa-devel/4e17c99b-1d8a-8ebe-972c-9b1299952ff8@ivitera.com/
>> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> I find the idea neat, but I'm afraid that it's a bit confusing from
> the user POV as is.  Namely, the state is in OPEN, but you'd have to
> perform hw_free manually at first for moving forward; how can user
> know it?

Thanks for the feedback.

The state ioctls are also not blocked, so the PCM state can be checked when 
EBADFD is returned for the updated applications. But as noted in the comment, 
it's expected that current applications will fail (like for the disconnect).

The OPEN state can be set only when hw_params fails in the current code. So 
the applications can distinguish the hw_params error / invalidate stream 
cases. We may also add this info (flag) to the PCM status structure.

This extension can be also implemented using a new PCM state, but in the 
regard of our discussion a few months ago, it's probably not a way.

> Maybe PCM core should do hw_free by itself when hw_params is
> called with hw_free_queued.

Yes, it's a possible optimization, too. I had same idea when I post the patch. 
But the mmap is an issue here - applications must do unmap before hw_params, 
so I'm not convinced to add this auto-free to hw_params, because hw_free has 
the straight semantics (munmap before). It would be probably clever to keep 
those steps separated.

Also ideally, there may be a check in hw_params, if parameters (buffers) are 
changed, but the implementation is not so easy. Maybe we can allow OPEN -> 
PREPARE transition for this case, so the applications may just restart the 
streaming in the most light way.

This extension can be also implemented using a new PCM state, but in the 
regard of our discussion a few months ago, it's probably not a way.

> Also, do_hw_free() will skip the actual free because it's in OPEN
> state, no?

Yes, I forgot to add it. I'll sent v2 when we settle those little details.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
