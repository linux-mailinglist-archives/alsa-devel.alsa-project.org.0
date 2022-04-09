Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCF4FAAD8
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 22:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE821735;
	Sat,  9 Apr 2022 22:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE821735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649537068;
	bh=mo/lNzfOFDyADuSnF1IU16TbGay61XrDW7QsrkXdmOI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmmY2yHt2GXgtdqSlM19YHjRBbpS1A0PBQn3OXM94G93jJhmBgarcczFk1+7upQYp
	 0MrgcLOJnwoRoR5aDe2vqgXZA1hSLU4czt7ISwdUO7pctL1ZkRSG/4z19RjRjZC6hw
	 IU0eiH2kxWwhO7jhwTgCmS3Xp0lwgr+XQX2hxrec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EB2F80054;
	Sat,  9 Apr 2022 22:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A6ACF80253; Sat,  9 Apr 2022 22:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A38F80054
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 22:43:17 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9594EA003F;
 Sat,  9 Apr 2022 22:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9594EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1649536996; bh=aAaHr0zd3Hyd3xRGhjU3KBPhjAEQM3giFs4GG2wGqJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a7mMC3+8eMDDVut4eBjKua1yfyZWZ6KrOmRX1BwCER740YujKV7pBmrZQxhzm0gjo
 tsXw1DkVLgvr5HSLxjiLLU1Ef0UezUfVtNIAup3vr2H751RHxQ2TNwp+4QnNDvuuk9
 FNhYFaXmLdtrmyKvjJRiVvIRF3CXD5N41hC3ELbc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat,  9 Apr 2022 22:43:13 +0200 (CEST)
Message-ID: <dee9ff0a-4d99-1ae3-4f37-15107ab40637@perex.cz>
Date: Sat, 9 Apr 2022 22:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: usb-audio: Increase max buffer size
Content-Language: en-US
To: Geraldo Nascimento <geraldogabriel@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <20220407212740.17920-1-tiwai@suse.de> <YlHuQWqGM+3T3HUP@geday>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YlHuQWqGM+3T3HUP@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 09. 04. 22 22:36, Geraldo Nascimento wrote:
> On Thu, Apr 07, 2022 at 11:27:40PM +0200, Takashi Iwai wrote:
>> The current limit of max buffer size 1MB seems too small for modern
>> devices with lots of channels and high sample rates.
>> Let's make bigger, 4MB.
> 
> Hi Takashi,
> 
> I did some math and 4MB is still too little for some extreme hardware
> like the Behringer Wing, which is USB 2.0 by the way. According to my
> calculations, at 192 KHz and 48 channels, even with this 4MB patch, we
> would still have only 151.7 ms of buffer for the Wing.
> 
> Therefore my suggestion is to expose the MAX_BUFFER_BYTES as Kconf.
> 
> Do you think this is plausible?

I think that much better behaviour may be to calculate and limit the max 
buffer size at runtime depending on the max channels / rate / sample bits 
obtained from the USB descriptors by default. For standard hardware, those big 
buffers do not make much sense and there's usually a mix of the USB sound 
hardware in the system.

					Jaroslav

> 
> Thanks,
> Geraldo Nascimento
> 
>>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>   sound/usb/pcm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>> index 6a460225f2e3..37ee6df8b15a 100644
>> --- a/sound/usb/pcm.c
>> +++ b/sound/usb/pcm.c
>> @@ -659,7 +659,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
>>   #define hwc_debug(fmt, args...) do { } while(0)
>>   #endif
>>   
>> -#define MAX_BUFFER_BYTES	(1024 * 1024)
>> +#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
>>   #define MAX_PERIOD_BYTES	(512 * 1024)
>>   
>>   static const struct snd_pcm_hardware snd_usb_hardware =
>> -- 
>> 2.31.1
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
