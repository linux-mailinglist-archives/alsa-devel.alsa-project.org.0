Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CC4A2CBA
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 09:08:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7782F174E;
	Sat, 29 Jan 2022 09:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7782F174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643443704;
	bh=OMEsQ1VPDqoDOIwHwB6XSd/wWusEaETXTUoOVJmsS8w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJCmCCX/OqAwykM7KPhB+KXlccc9+GXIsNYEG7Z1HspRPVD3RnEWZBzlUl1t63TDf
	 1tj0qeRwfcIj6rH5/t8OA8ikThlDLZoJ8sw4x77UbmiINDFrAQZKAsHyje/q8RB9n6
	 qUKs/gb8zoKl9uHfR5xyL0NWXf/LZUJH7ZUl7ai0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE430F80212;
	Sat, 29 Jan 2022 09:07:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8617DF801F7; Sat, 29 Jan 2022 09:07:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7920AF8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 09:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7920AF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XXhQLm4X"
Received: by mail-wr1-x431.google.com with SMTP id v13so15182484wrv.10
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QGqCLwrYCOsLTLWxlsYjHAKL7s07BhHpkbZ0BHayhEY=;
 b=XXhQLm4XFpK3TEqUu6oVnTKrNXWyDVZ19MGKTRDv/YMl8p4WAUmNbBD1IxTMPQi1/Q
 7zUeRdI3tGgsJvTeMZTZgK3ls+Cghokr/ZIIrWGfC321V/NgNm7HqcsQHjr5hCrozLiE
 ctasMt1p8lnwt5z5QNqSV1xcpS2lLImSqvwtK5aJIOe7f4rAMQabXTKJ9E5R71Sqe4Zy
 NKeZQYipRj6+BRrOEOeGZvgM7+JdFVlBZvfTd+kUaOu8HZsBAD6scwriB720tyhv2D0k
 f3PdjRp+ZU3hnh23J5SYKhKZryk5+HD5tsR30y6YhHA05y/y+kJR424vaM27JljQskZg
 4L5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QGqCLwrYCOsLTLWxlsYjHAKL7s07BhHpkbZ0BHayhEY=;
 b=H1M9LhqORw8ggm57gURCtJDJXjpr5bzP2M+kjzHr4CUfr3AYP1yYwHaiNzUq/R8jxH
 9fBloqSFDCxtI+IGONKUnM6o63plT8NPGRpbzWOcLDFrLUIZsaq0t5Wh7p/ymg4l85Ym
 01SLQoC5dEu0ZpmQkN/mpdPyr04sEpKkGyh1xdxmiqKZHOEs68cI7CpZLcMEFRsBY1r/
 o42iflY/FGKQzNTOKO0P9ad2mBSkWdxaTOUTYdnvwEw0iHtguzx87IAzJjTV/vdhxvAh
 tHpqOpu58eZyQ9KSjm/X6Apv3WPHy8/uj8+4DuixtmYl3m0u3pNJWiIk6Z6jTqbi5dNX
 7aiA==
X-Gm-Message-State: AOAM533DcWGQt48coSrqv7LE1SJquEuTRdWTTtJOxmE242RnrL0Woi4n
 3yX45CKEQQSfvRuTX91Eo6A=
X-Google-Smtp-Source: ABdhPJy2Kz0Ejxy8IE6Nkx/AeK5mYYZno6b45FJq7Ugm4sukeGrRfzbYnJWcFIqqwqkjXvXPhGh2bA==
X-Received: by 2002:adf:de83:: with SMTP id w3mr9591722wrl.181.1643443630198; 
 Sat, 29 Jan 2022 00:07:10 -0800 (PST)
Received: from [10.68.0.6] ([64.64.123.28])
 by smtp.gmail.com with ESMTPSA id n2sm7460545wrw.63.2022.01.29.00.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:07:09 -0800 (PST)
Subject: Re: [BUG] ALSA: core: possible deadlock involving waiting and locking
 operations
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, o-takashi@sakamocchi.jp
References: <56766037-972e-9e5b-74c1-88633a72a77f@gmail.com>
 <YfTCKrjpaeKWFglO@workstation>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <37c84cd1-80c6-cbcf-6673-d90d99501d4f@gmail.com>
Date: Sat, 29 Jan 2022 16:07:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <YfTCKrjpaeKWFglO@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>
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



On 2022/1/29 12:27, Takashi Sakamoto wrote:
> Hi,
>
> On Sat, Jan 29, 2022 at 11:33:26AM +0800, Jia-Ju Bai wrote:
>> Hello,
>>
>> My static analysis tool reports a possible deadlock in the sound driver
>> in Linux 5.10:
>>
>> snd_card_disconnect_sync()
>>    spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
>>    wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
>>    spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)
>>
>> snd_hwdep_release()
>>    mutex_lock(&hw->open_mutex); --> Line 152 (Lock B)
>>    mutex_unlock(&hw->open_mutex); --> Line 157 (Unlock B)
>>    snd_card_file_remove()
>>      wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)
>>
>> snd_hwdep_open()
>>    mutex_lock(&hw->open_mutex); --> Line 95 (Lock B)
>>    snd_card_file_add()
>>      spin_lock(&card->files_lock); --> Line 932 (Lock A)
>>      spin_unlock(&card->files_lock); --> Line 940 (Unlock A)
>>    mutex_unlock(&hw->open_mutex); --> Line 139 (Unlock B)
>>
>> When snd_card_disconnect_sync() is executed, "Wait X" is performed by
>> holding "Lock A". If snd_hwdep_open() is executed at this time, it holds
>> "Lock B" and then waits for acquiring "Lock A". If snd_hwdep_release()
>> is executed at this time, it waits for acquiring "Lock B", and thus
>> "Wake X" cannot be performed to wake up "Wait X" in
>> snd_card_disconnect_sync(), causing a possible deadlock.
>>
>> I am not quite sure whether this possible problem is real and how to fix
>> it if it is real.
>> Any feedback would be appreciated, thanks :)
> I'm interested in your report about the deadlock, and seek the cause
> of issue. Then I realized that we should take care of the replacement of
> file_operation before acquiring spinlock in snd_card_disconnect_sync().
>
> ```
> snd_card_disconnect_sync()
> ->snd_card_disconnect()
>    ->spin_lock()
>    ->list_for_each_entry()
>      mfile->file->f_op = snd_shutdown_f_ops
>    ->spin_unlock()
> ->spin_lock_irq()
> ->wait_event_lock_irq()
> ->spin_unlock_irq()
> ```
>
> The implementation of snd_shutdown_f_ops has no value for .open, therefore
> snd_hwdep_open() is not called anymore when waiting the event. The mutex
> (Lock B) is not acquired in process context of ALSA hwdep application.
>
> The original .release function can be called by snd_disconnect_release()
> via replaced snd_shutdown_f_ops. In the case, as you can see, the spinlock
> (Lock A) is not acquired.
>
> I think there are no race conditions against Lock A and B in process
> context of ALSA hwdep application after card disconnection. But it would
> be probable to overlook the other case. I would be glad to receive your
> check for the above procedure.

Thanks a lot for the quick reply :)
Your explanation is reasonable, because snd_shutdown_f_ops indeed has no 
value for .open.

However, my static analysis tool finds another possible deadlock in the 
mentioned code:

snd_card_disconnect_sync()
   spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
   wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
   spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)

snd_hwdep_release()
   snd_card_file_remove()
     spin_lock(&card->files_lock); --> Line 962 (Lock A)
     wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)
     spin_unlock(&card->files_lock); --> Line 977 (Unlock A)

When snd_card_disconnect_sync() is executed, "Wait X" is performed by 
holding "Lock A". If snd_hwdep_release() is executed at this time, "Wake 
X" cannot be performed to wake up "Wait X", because "Lock A" has been 
already hold by snd_card_disconnect_sync().

I am not quite sure whether this possible problem is real.
Any feedback would be appreciated, thanks :)


Best wishes,
Jia-Ju Bai
