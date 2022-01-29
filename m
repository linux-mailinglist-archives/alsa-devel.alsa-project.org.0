Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1E4A2D17
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 09:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37226175C;
	Sat, 29 Jan 2022 09:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37226175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643444967;
	bh=QKWZCfeNvKBwXB6w3TMUpNPo6Uc8Q3GVkelIWtQEMaU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfyN7gu5TTcYWTxxK8JN6UnTx6QMcnYXrOQolggSLXleIwctNSxoLbgvUdtHc9rpZ
	 taYyKrEDHq9/CA6oxy/Vw6Ogii7Xqk9njbfGsFFaJ80wTFzDyg4BIzlL4IueE8tIpU
	 JfGSogNSJDw2lx0EKY/Yl8TpIavI7zVSaKnLJo4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BAFF80162;
	Sat, 29 Jan 2022 09:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00CFF801F7; Sat, 29 Jan 2022 09:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 262D3F8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 09:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262D3F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M3PSr+bo"
Received: by mail-wr1-x436.google.com with SMTP id a13so15266954wrh.9
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GA0NOfpEqe3qWBXSOvv5bXzkV1hAhaFI4xVLJT/VjQw=;
 b=M3PSr+boKzzuhkE347kbKzzUFNBNo9+qgDNw90wyTDUZ5sVblW8s44uCWmPZUuG7nN
 d5le4A+fJS/h+kQKw/3/veAb1RVmnz2jsP7otGQVxUWWHfVjxRDRMAWbEKIfzdID0EMq
 UgLT6gBvdyuUhOVlxqfR0ayL2s26j4DUugWIEnYvS7prow0eN4iNF7bn0ewd5kXRDQ3L
 1Go8EKKeoZ25pTc+gSnnKN0o6U4fmwlJPLgYIfqI0flt+otUMM+GEdXVMG1sBhYGbcVe
 TbpHI81nc5CTKixazjclRNis5FZoQqDWQLlaBK3qWvGexAx+vzZWVpoI2vlSXGG1YPXH
 ciEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GA0NOfpEqe3qWBXSOvv5bXzkV1hAhaFI4xVLJT/VjQw=;
 b=4COQfZ7yoR2Ua2rx8SPhmMLA9GK0pV1pAmF1yS8bQLK4dLY0OXenrx0GJ2rs3qDdnr
 3fg2PM+sQkvLx+gr3Z7XyDD3hp28DYPUHtG5ARjNEzOHD1s43rxsJ6u296C8hKxWmQeP
 rhRebcGAKPFX1sE3nrKNQG9SL3AtCdYJ2J1LIJVNuNCtXB3OjDua8KnFKyWosNeb8xxr
 bfog+cXSuqiWzSQm8Xu1M05mhuSf8rsG3EKwik5NezN6S6uYkte+HzSaNV66wnt5i4hR
 UJnd8k4b67zbO/CXWVWk4JwTEPCs6Rur8u3KU49g/EyToqvJmc6XpGIH/zVgndOHGpOh
 FFPQ==
X-Gm-Message-State: AOAM530A1uMj0SVF93JmHtVL4yULANNKpI2oCH92oFU1jgJ3op6VZAPk
 sDuvTfzdEPPgww66HRc8e70=
X-Google-Smtp-Source: ABdhPJyf80oiedkVRZRUYWxy3k4AL+v7nCEOVzF8s88hXoQ3GK+EczTGvPZGVx37GtNwGWC7rufaig==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr9712824wri.29.1643444888987; 
 Sat, 29 Jan 2022 00:28:08 -0800 (PST)
Received: from [10.68.0.6] ([64.64.123.28])
 by smtp.gmail.com with ESMTPSA id 6sm7874795wry.69.2022.01.29.00.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:28:08 -0800 (PST)
Subject: Re: [BUG] ALSA: core: possible deadlock involving waiting and locking
 operations
To: Takashi Iwai <tiwai@suse.de>
References: <56766037-972e-9e5b-74c1-88633a72a77f@gmail.com>
 <YfTCKrjpaeKWFglO@workstation>
 <37c84cd1-80c6-cbcf-6673-d90d99501d4f@gmail.com>
 <s5hilu3eywp.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <5e068664-9c9e-271a-08a0-ea107554b1a5@gmail.com>
Date: Sat, 29 Jan 2022 16:28:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hilu3eywp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel <linux-kernel@vger.kernel.org>, broonie@kernel.org
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



On 2022/1/29 16:20, Takashi Iwai wrote:
> On Sat, 29 Jan 2022 09:07:05 +0100,
> Jia-Ju Bai wrote:
>>
>>
>> On 2022/1/29 12:27, Takashi Sakamoto wrote:
>>> Hi,
>>>
>>> On Sat, Jan 29, 2022 at 11:33:26AM +0800, Jia-Ju Bai wrote:
>>>> Hello,
>>>>
>>>> My static analysis tool reports a possible deadlock in the sound driver
>>>> in Linux 5.10:
>>>>
>>>> snd_card_disconnect_sync()
>>>>     spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
>>>>     wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
>>>>     spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)
>>>>
>>>> snd_hwdep_release()
>>>>     mutex_lock(&hw->open_mutex); --> Line 152 (Lock B)
>>>>     mutex_unlock(&hw->open_mutex); --> Line 157 (Unlock B)
>>>>     snd_card_file_remove()
>>>>       wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)
>>>>
>>>> snd_hwdep_open()
>>>>     mutex_lock(&hw->open_mutex); --> Line 95 (Lock B)
>>>>     snd_card_file_add()
>>>>       spin_lock(&card->files_lock); --> Line 932 (Lock A)
>>>>       spin_unlock(&card->files_lock); --> Line 940 (Unlock A)
>>>>     mutex_unlock(&hw->open_mutex); --> Line 139 (Unlock B)
>>>>
>>>> When snd_card_disconnect_sync() is executed, "Wait X" is performed by
>>>> holding "Lock A". If snd_hwdep_open() is executed at this time, it holds
>>>> "Lock B" and then waits for acquiring "Lock A". If snd_hwdep_release()
>>>> is executed at this time, it waits for acquiring "Lock B", and thus
>>>> "Wake X" cannot be performed to wake up "Wait X" in
>>>> snd_card_disconnect_sync(), causing a possible deadlock.
>>>>
>>>> I am not quite sure whether this possible problem is real and how to fix
>>>> it if it is real.
>>>> Any feedback would be appreciated, thanks :)
>>> I'm interested in your report about the deadlock, and seek the cause
>>> of issue. Then I realized that we should take care of the replacement of
>>> file_operation before acquiring spinlock in snd_card_disconnect_sync().
>>>
>>> ```
>>> snd_card_disconnect_sync()
>>> ->snd_card_disconnect()
>>>     ->spin_lock()
>>>     ->list_for_each_entry()
>>>       mfile->file->f_op = snd_shutdown_f_ops
>>>     ->spin_unlock()
>>> ->spin_lock_irq()
>>> ->wait_event_lock_irq()
>>> ->spin_unlock_irq()
>>> ```
>>>
>>> The implementation of snd_shutdown_f_ops has no value for .open, therefore
>>> snd_hwdep_open() is not called anymore when waiting the event. The mutex
>>> (Lock B) is not acquired in process context of ALSA hwdep application.
>>>
>>> The original .release function can be called by snd_disconnect_release()
>>> via replaced snd_shutdown_f_ops. In the case, as you can see, the spinlock
>>> (Lock A) is not acquired.
>>>
>>> I think there are no race conditions against Lock A and B in process
>>> context of ALSA hwdep application after card disconnection. But it would
>>> be probable to overlook the other case. I would be glad to receive your
>>> check for the above procedure.
>> Thanks a lot for the quick reply :)
>> Your explanation is reasonable, because snd_shutdown_f_ops indeed has
>> no value for .open.
>>
>> However, my static analysis tool finds another possible deadlock in
>> the mentioned code:
>>
>> snd_card_disconnect_sync()
>>    spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
>>    wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
>>    spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)
>>
>> snd_hwdep_release()
>>    snd_card_file_remove()
>>      spin_lock(&card->files_lock); --> Line 962 (Lock A)
>>      wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)
>>      spin_unlock(&card->files_lock); --> Line 977 (Unlock A)
>>
>> When snd_card_disconnect_sync() is executed, "Wait X" is performed by
>> holding "Lock A".
> No, it's wait_event_lock_irq(), and this helper unlocks the given lock
> during waiting and re-locks it after schedule().  See the macro
> expansion in include/linux/wait.h.

Oh, yes, you are right.
Sorry for this false positive...
I will improve my tool, thanks.


Best wishes,
Jia-Ju Bai
