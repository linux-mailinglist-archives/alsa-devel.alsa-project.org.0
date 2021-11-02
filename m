Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3A442A98
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 10:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CBE16BE;
	Tue,  2 Nov 2021 10:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CBE16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635846216;
	bh=GYyH4187WFttCGpo40AQ4zshqnvXOHto7HILxjAK4go=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4GlyJX8YN189Tsk8Wrg0E/UuOQ8XOyIFiXTzajDRChWFMhACYh1c4BEIQg847/xW
	 Q7tWptg3nGTAhprZA9U+VqgQUjotXPgLO6bcWZMEnOxyyk3nOk629gOZqCd5Xi+9JM
	 P29t2DMpWoj9VzK6Jf5Ntpy6+WQVG29oJfVpMQPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 711B5F8025F;
	Tue,  2 Nov 2021 10:42:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C968BF8025D; Tue,  2 Nov 2021 10:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84627F8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 10:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84627F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N3sCvzxn"
Received: by mail-pl1-x62c.google.com with SMTP id y1so15151271plk.10
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZW+8O4s0rJ1wYpYQ/yCPUQIYSI2PgmRKLIuSTxGkos4=;
 b=N3sCvzxnUT9zaeiJElQoQrxkV2YKMetiR5J3Ix3oFsFtSTdlRi4sy5Bdj+huJwEWIJ
 TdKK6YyM4lWcmvbAvWA0AA6GfoLPO7YJ4Xk7FvAAE3lmmGj4uZtazBOf32DaP7fSouYh
 bPkB7AzIlU0OUNHBJUphmDSkatjarUgKyBRefa6yzXemWCQEhLw2NFdG5XkOcSEyE7tZ
 rYhPWFEFv77kHDyrbROdI3KJCEq+T8L5sljgE2ChcmoAtNDdQioxbRZ1FaCPjprHBOdv
 dxYbm1FKxpSTNj661BzXgT5L/uoVFWtW/1wtPcD1F268njQwo1FRMlK8ngggHa8DlFYC
 TP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZW+8O4s0rJ1wYpYQ/yCPUQIYSI2PgmRKLIuSTxGkos4=;
 b=7fEJxMaQzqe4ACr1TvK40rIptJUDMh0geyESc7CBhxoYsrVKEeWQJDv0rgJnSaNe85
 j3o7C0KCd1JDZd5QVoAVz63GXdJlVrD2MdZh9FPQBCkVYwHMi4eZe1WCHuOfHTFoh6cF
 TXAE50UnzY93SvBoGvLRLFkH3d2c8MCCDSK+61IpqRXxOzBj7PqwVJs3ZqRSSyw7Ydu9
 /mB+MLp3o+kiowY0BPl/fQSZnGTDzY9HBZshl0DqNZ6J3fhMeDEOkQyALw2iXNn3RFsW
 kX8rkc67oHM7+4tE2rFhufxojI7UpbbqDId1VE+JjvH99QTOpaCax0qvuDEZSTteDnnU
 By2g==
X-Gm-Message-State: AOAM532H53a2WKYP15mqdrCa2czAcbtfKCUz6+yGSNtkk7ujCcbQGJX3
 kwc91jrqk/ikrLnxs9/JL3I=
X-Google-Smtp-Source: ABdhPJzIt3kOFjeG48wBYaH6SfFwd2fYnyeO4PwiyCsMqk4A0BeWy/3837ahX2HwxZk+h1W4ZHOHWA==
X-Received: by 2002:a17:90a:6e41:: with SMTP id
 s1mr3838341pjm.166.1635846120628; 
 Tue, 02 Nov 2021 02:42:00 -0700 (PDT)
Received: from [172.18.2.138] ([137.59.101.13])
 by smtp.gmail.com with ESMTPSA id m22sm17957193pfo.71.2021.11.02.02.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 02:42:00 -0700 (PDT)
Subject: Re: [PATCH] ALSA: seq: Fix RCU stall in snd_seq_write()
To: Takashi Iwai <tiwai@suse.de>
References: <20211102033222.3849-1-qiang.zhang1211@gmail.com>
 <s5hy267ot27.wl-tiwai@suse.de>
From: Zqiang <qiang.zhang1211@gmail.com>
Message-ID: <2d05ceab-b8b7-0c7b-f847-69950c6db14e@gmail.com>
Date: Tue, 2 Nov 2021 17:41:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hy267ot27.wl-tiwai@suse.de>
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


On 2021/11/2 下午4:33, Takashi Iwai wrote:
> On Tue, 02 Nov 2021 04:32:22 +0100,
> Zqiang wrote:
>> If we have a lot of cell object, this cycle may take a long time, and
>> trigger RCU stall. insert a conditional reschedule point to fix it.
>>
>> rcu: INFO: rcu_preempt self-detected stall on CPU
>> rcu: 	1-....: (1 GPs behind) idle=9f5/1/0x4000000000000000
>> 	softirq=16474/16475 fqs=4916
>> 	(t=10500 jiffies g=19249 q=192515)
>> NMI backtrace for cpu 1
>> ......
>> asm_sysvec_apic_timer_interrupt
>> RIP: 0010:_raw_spin_unlock_irqrestore+0x38/0x70
>> spin_unlock_irqrestore
>> snd_seq_prioq_cell_out+0x1dc/0x360
>> snd_seq_check_queue+0x1a6/0x3f0
>> snd_seq_enqueue_event+0x1ed/0x3e0
>> snd_seq_client_enqueue_event.constprop.0+0x19a/0x3c0
>> snd_seq_write+0x2db/0x510
>> vfs_write+0x1c4/0x900
>> ksys_write+0x171/0x1d0
>> do_syscall_64+0x35/0xb0
>>
>> Reported-by: syzbot+bb950e68b400ab4f65f8@syzkaller.appspotmail.com
>> Signed-off-by: Zqiang <qiang.zhang1211@gmail.com>
>> ---
>>   sound/core/seq/seq_queue.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
>> index d6c02dea976c..f5b1e4562a64 100644
>> --- a/sound/core/seq/seq_queue.c
>> +++ b/sound/core/seq/seq_queue.c
>> @@ -263,6 +263,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
>>   		if (!cell)
>>   			break;
>>   		snd_seq_dispatch_event(cell, atomic, hop);
>> +		cond_resched();
>>   	}
>>   
>>   	/* Process time queue... */
>> @@ -272,6 +273,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
>>   		if (!cell)
>>   			break;
>>   		snd_seq_dispatch_event(cell, atomic, hop);
>> +		cond_resched();
>
> It's good to have cond_resched() in those places but it must be done
> more carefully, as the code path may be called from the non-atomic
> context, too.  That is, it must have a check of atomic argument, and
> cond_resched() is applied only when atomic==false.
>
> But I still wonder how this gets a RCU stall out of sudden.  Looking
> through https://syzkaller.appspot.com/bug?extid=bb950e68b400ab4f65f8
> it's triggered by many cases since the end of September...

I did not find useful information from the log,  through calltrace, I 
guess it may be triggered by the long cycle time, which caused the 
static state of the RCU to

not be reported in time.

I ignore the atomic parameter check,  I will resend v2 .   in no-atomic 
context, we can insert

cond_resched() to avoid this situation, but in atomic context,

the RCU stall maybe still trigger.

thanks
Zqiang

>
>
> thanks,
>
> Takashi




