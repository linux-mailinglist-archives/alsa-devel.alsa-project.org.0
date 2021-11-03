Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A752443CD0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 06:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFBAB166B;
	Wed,  3 Nov 2021 06:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFBAB166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635918202;
	bh=AhXW4Z1PXLRqSLQp3/yZHri6odPR6FIbihGOuMw753Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nnsb/UGPJOUnFcQbPZNRgW0Dv3SV9MuOMXWPZyP530PhSiiwzi680HOc3n+IxCFb0
	 xMcjRb4J7Ez7h/+q9hhNzAuKmVlG0ItaWe8oHycqyAyGVTQFKwWOmfkMz+EwsOJRYD
	 TDORnfWyydNiIj+VQO5R9ttmV3Rm9VeEHRz4UEh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52432F80279;
	Wed,  3 Nov 2021 06:42:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 960A1F8026A; Wed,  3 Nov 2021 06:42:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1889F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 06:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1889F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p7XJQa6i"
Received: by mail-pf1-x42f.google.com with SMTP id o14so1220408pfu.10
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 22:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IkLavH6bHRnjOCk9c0dRR1U3BfPY7tUVIXIB9PCYDy4=;
 b=p7XJQa6iK9SZ4fS3lGJdyVWApi0iUXUu9J0u6wGITQg53ccsLx1caSLsV71kf05ZeR
 +DkJTQ09jhsM04iJGsFd0A64iUw6JkDCrUYLSri304jwqYQL2PGiXJZ6KBGumREOyDbm
 n8r+lt9wf4y4xA5Gq29knnjrLcDfWUFBjiptVowoqsPkUABoQv4gbLw02Vx4g8kJk4R4
 HAa03JuZrWETFcJvH/e0YpEfNuzkdJ3pVjbfPZfkmXTo1WbCtQ/s4ikcm2jwOCn2+Sv9
 7cpGE1nVY3N6tZd0CIvrlRCxE24s1hYIrAyqrv2H/WJrvcL9hgY1dfPUzdmUWnkjz5r3
 vMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IkLavH6bHRnjOCk9c0dRR1U3BfPY7tUVIXIB9PCYDy4=;
 b=VJmh3WIN9iG5Y+8j3udxQ1JFwjphHFR5RPpB3P9yS0UZwg94FBzRsZC8a3dMJcTF+P
 i3XhYFkKMIlUoOhTtjojpxbvgkNdaQwbinU7+3ELBHv+B19OQ5gdYksYqzfAsOCCvzWj
 zopehQ+2s6z7XeNLWj6R1wGoViezLQU3pnGCDnds6OMCIsGRi8+Cvd9trcRWEBMkS88i
 K0u8xe0pdvBxqsPJQ/GdGCZH2RUImEViW1OQk7EwL6dgS/GNAoxFrv1QIZyF5xEdN64l
 5NVfgev9NIZN7Xm82hpL9FPz8l8A3x9+JMFWxmsLWpSw1oeIeP1qhE+TBadCw83VdhHb
 UlyA==
X-Gm-Message-State: AOAM531Ak9hLdgPaAN3FPDW1g3xx0QT1CPMHQU3KqQDetd2z6F5N1kay
 uDk2sfyVgIGgf7dgS2RUskg=
X-Google-Smtp-Source: ABdhPJzaMyoDL/8+G0gZPvsMRnec4wTj5cy+ssft5uVKalYqvH2f3ubIwgNTV/uHFT2pihC77gXf/Q==
X-Received: by 2002:a63:1e51:: with SMTP id p17mr2684150pgm.195.1635918110370; 
 Tue, 02 Nov 2021 22:41:50 -0700 (PDT)
Received: from [172.18.2.138] ([137.59.101.13])
 by smtp.gmail.com with ESMTPSA id h24sm927683pfn.180.2021.11.02.22.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 22:41:49 -0700 (PDT)
Subject: Re: [PATCH] ALSA: seq: Fix RCU stall in snd_seq_write()
To: Takashi Iwai <tiwai@suse.de>
References: <20211102033222.3849-1-qiang.zhang1211@gmail.com>
 <s5hy267ot27.wl-tiwai@suse.de>
 <2d05ceab-b8b7-0c7b-f847-69950c6db14e@gmail.com>
 <s5ho872q25p.wl-tiwai@suse.de>
 <47f05b3a-811b-e64c-0366-3aebaece6c8e@gmail.com>
 <s5hcznipwsm.wl-tiwai@suse.de>
From: Zqiang <qiang.zhang1211@gmail.com>
Message-ID: <b8e27c66-2fe3-aae0-a19c-e87a3e56625e@gmail.com>
Date: Wed, 3 Nov 2021 13:41:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hcznipwsm.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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


On 2021/11/2 下午8:27, Takashi Iwai wrote:
> On Tue, 02 Nov 2021 12:20:32 +0100,
> Zqiang wrote:
>>
>> On 2021/11/2 下午6:31, Takashi Iwai wrote:
>>> On Tue, 02 Nov 2021 10:41:57 +0100,
>>> Zqiang wrote:
>>>> On 2021/11/2 下午4:33, Takashi Iwai wrote:
>>>>> On Tue, 02 Nov 2021 04:32:22 +0100,
>>>>> Zqiang wrote:
>>>>>> If we have a lot of cell object, this cycle may take a long time, and
>>>>>> trigger RCU stall. insert a conditional reschedule point to fix it.
>>>>>>
>>>>>> rcu: INFO: rcu_preempt self-detected stall on CPU
>>>>>> rcu: 	1-....: (1 GPs behind) idle=9f5/1/0x4000000000000000
>>>>>> 	softirq=16474/16475 fqs=4916
>>>>>> 	(t=10500 jiffies g=19249 q=192515)
>>>>>> NMI backtrace for cpu 1
>>>>>> ......
>>>>>> asm_sysvec_apic_timer_interrupt
>>>>>> RIP: 0010:_raw_spin_unlock_irqrestore+0x38/0x70
>>>>>> spin_unlock_irqrestore
>>>>>> snd_seq_prioq_cell_out+0x1dc/0x360
>>>>>> snd_seq_check_queue+0x1a6/0x3f0
>>>>>> snd_seq_enqueue_event+0x1ed/0x3e0
>>>>>> snd_seq_client_enqueue_event.constprop.0+0x19a/0x3c0
>>>>>> snd_seq_write+0x2db/0x510
>>>>>> vfs_write+0x1c4/0x900
>>>>>> ksys_write+0x171/0x1d0
>>>>>> do_syscall_64+0x35/0xb0
>>>>>>
>>>>>> Reported-by: syzbot+bb950e68b400ab4f65f8@syzkaller.appspotmail.com
>>>>>> Signed-off-by: Zqiang <qiang.zhang1211@gmail.com>
>>>>>> ---
>>>>>>     sound/core/seq/seq_queue.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
>>>>>> index d6c02dea976c..f5b1e4562a64 100644
>>>>>> --- a/sound/core/seq/seq_queue.c
>>>>>> +++ b/sound/core/seq/seq_queue.c
>>>>>> @@ -263,6 +263,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
>>>>>>     		if (!cell)
>>>>>>     			break;
>>>>>>     		snd_seq_dispatch_event(cell, atomic, hop);
>>>>>> +		cond_resched();
>>>>>>     	}
>>>>>>       	/* Process time queue... */
>>>>>> @@ -272,6 +273,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
>>>>>>     		if (!cell)
>>>>>>     			break;
>>>>>>     		snd_seq_dispatch_event(cell, atomic, hop);
>>>>>> +		cond_resched();
>>>>> It's good to have cond_resched() in those places but it must be done
>>>>> more carefully, as the code path may be called from the non-atomic
>>>>> context, too.  That is, it must have a check of atomic argument, and
>>>>> cond_resched() is applied only when atomic==false.
>>>>>
>>>>> But I still wonder how this gets a RCU stall out of sudden.  Looking
>>>>> through https://syzkaller.appspot.com/bug?extid=bb950e68b400ab4f65f8
>>>>> it's triggered by many cases since the end of September...
>>>> I did not find useful information from the log,  through calltrace, I
>>>> guess it may be triggered by the long cycle time, which caused the
>>>> static state of the RCU to
>>>>
>>>> not be reported in time.
>>> Yes, I understand that logic.  But I wonder why this gets triggered
>>> *now* out of sudden.  The code has been present over decades, and I
>>> don't think the similar test case must have been performed by fuzzer.
>>>
>>>> I ignore the atomic parameter check,  I will resend v2 .   in
>>>> no-atomic context, we can insert
>>>>
>>>> cond_resched() to avoid this situation, but in atomic context,
>>>>
>>>> the RCU stall maybe still trigger.
>>> Right, so maybe it's better to have an upper limit for the processed
>>> cells, something like below (totally untested).
>>>
>>> Could you reproduce the problem locally?  Otherwise it's all nothing
>>> but a guess...
>> yes, this is just a guess.  I haven't reproduced locally, limiting the
>> number of cycles is a suitable modification,
>>
>> but the  MAX_CELL_PROCESSES_IN_QUEUE is an experience value.
> Yes, that's why we need the reproducer in anyway before moving
> forward.  The problem is that the patch looks as if it were fixing the
> RCU stall, but we haven't verified it at all that it is really the
> cause.  Even we haven't checked whether it's really the too many cells
> queued, or just because the concurrent queuing made the function
> re-running.

Thanks your explanation,  I think we can send your changes out and wait 
for syzbot to test.

thanks

Zqiang

>
> Takashi
