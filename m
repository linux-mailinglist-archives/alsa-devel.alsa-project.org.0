Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F575867C6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 12:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A7E868;
	Mon,  1 Aug 2022 12:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A7E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659350686;
	bh=hzwjk2ZBZy87lyQ0byKZLVz4Vtk+0ryc6E7+KgCcZ5s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiDudnm19Sp5uTq30zioLVjfxN+sEgiC2l6FaPMoSYnE3AYlKnEaAQiVXBIxKcAAj
	 dr0JiGzXBrKI/UQFSkZ622W1szXgi1gFYBv4dZ25ws69NhhEWavBfHcL0mz5d98pEt
	 lbMo5+CagFdsV+GFW3LuMiogYQEgo2KveRz8es0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C08F8013D;
	Mon,  1 Aug 2022 12:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70782F8013D; Mon,  1 Aug 2022 12:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84592F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 12:43:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 84198A003F;
 Mon,  1 Aug 2022 12:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 84198A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1659350618; bh=ErbutU/TAgJYOhWZm18pY0pkF5w96wSH5uWqJfaIF1g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b5qZ9hkOWO50hA7kpGn2emillaGwzJABxFz1uh2pG8T1n6dJ9L5knFy7xvcPWVfNV
 jkYu6yAjcZjftc3zlTgCoEEhOS+3r5TiKZW6uEtUKLwjWtNmoFpDJKidLrVuvHTrtp
 HDRA5cYo21Hn2wTOapPZZG95JiEeN4oH9zoNzJA0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  1 Aug 2022 12:43:36 +0200 (CEST)
Message-ID: <408af362-0839-e4f0-8dea-15103b269836@perex.cz>
Date: Mon, 1 Aug 2022 12:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] ALSA: core: Add async signal helpers
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220728125945.29533-1-tiwai@suse.de>
 <20220728125945.29533-2-tiwai@suse.de>
 <e903d8ac-7575-77f6-2d6b-a787ea3ec0bb@perex.cz> <871qu0nuei.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <871qu0nuei.wl-tiwai@suse.de>
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

On 01. 08. 22 12:13, Takashi Iwai wrote:
> On Mon, 01 Aug 2022 10:05:59 +0200,
> Jaroslav Kysela wrote:
>>
>> On 28. 07. 22 14:59, Takashi Iwai wrote:
>>> Currently the call of kill_fasync() from an interrupt handler might
>>> lead to potential spin deadlocks, as spotted by syzkaller.
>>> Unfortunately, it's not so trivial to fix this lock chain as it's
>>> involved with the tasklist_lock that is touched in allover places.
>>>
>>> As a temporary workaround, this patch provides the way to defer the
>>> async signal notification in a work.  The new helper functions,
>>> snd_fasync_helper() and snd_kill_faync() are replacements for
>>> fasync_helper() and kill_fasync(), respectively.  In addition,
>>> snd_fasync_free() needs to be called at the destructor of the relevant
>>> file object.
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>
>> ...
>>
>>> +void snd_kill_fasync(struct snd_fasync *fasync, int signal, int poll)
>>> +{
>>> +	unsigned long flags;
>>> +
>>> +	if (!fasync || !fasync->on)
>>> +		return;
>>> +	spin_lock_irqsave(&snd_fasync_lock, flags);
>>> +	fasync->signal = signal;
>>> +	fasync->poll = poll;
>>> +	list_move(&fasync->list, &snd_fasync_list);
>>> +	schedule_work(&snd_fasync_work);
>>> +	spin_unlock_irqrestore(&snd_fasync_lock, flags);
>>> +}
>>
>> The schedule_work() may be called outside the spinlock - it calls
>> queue_work_on() / __queue_work() which has already own protection for
>> the concurrent execution.
> 
> It can be outside, too, but scheduling earlier reduces the possible
> unnecessary scheduling.  Suppose that a list is added while the work
> is already running in another CPU.  If we call schedule_work() outside
> this lock, it might be already the time after the work has processed
> the queued item, and hence it can be a superfluous scheduling call.

It's really a negligible optimization. It would be better to not block other 
CPUs here to allow insertion of the new event. Also the __queue_work() is a 
bit complex code, so the call outside the spin lock may be better.

But either code is acceptable for me.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
