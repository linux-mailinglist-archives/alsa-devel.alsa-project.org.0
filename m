Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8D25170B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 13:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E061673;
	Tue, 25 Aug 2020 13:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E061673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598353595;
	bh=MzUIJHInGzdiUAzqQmo/E1tEA/zj6pOX3OwP3wY0IiA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boNw9l/iy8Xet9/0G9H6ZqouQJ/75rylRwgLpDOG/ZZA3VbTdozND+qJqcg+t13Jh
	 IyfZj6OmfmldhEQ1x9cZsC6oYz8BqyprRBJVg1lY380CCBimWEMzrfVA1m/m6LsVtl
	 LPqkvotyWDRUrDTb4eKGIlWJU3UjiGxW5T7bLTdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93658F802E8;
	Tue, 25 Aug 2020 13:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9111FF8025A; Tue, 25 Aug 2020 11:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id C8DDBF80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 11:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8DDBF80143
Received: from localhost.localdomain (unknown [10.20.41.73])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf8cs10RfZ78NAA--.460S3;
 Tue, 25 Aug 2020 17:17:33 +0800 (CST)
Subject: Re: [PATCH] Revert "ALSA: hda: Add support for Loongson 7A1000
 controller"
To: Takashi Iwai <tiwai@suse.de>
References: <1598343903-2372-1-git-send-email-yangtiezhu@loongson.cn>
 <s5h4kor6sb4.wl-tiwai@suse.de>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <35883e9a-9d2a-624a-66c8-cace17ae6673@loongson.cn>
Date: Tue, 25 Aug 2020 17:17:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <s5h4kor6sb4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxf8cs10RfZ78NAA--.460S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy3GFyrGry3Jryftw1DZFb_yoW5uw4Dpr
 y8Jr4UCw40qr17Gr1Yyrs8Jr97Kr4UA3WUJ348trn8ZF1UWr17Jw1UtFWUKr1DJr15try7
 J39rAF4rKryUG3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUbKsjUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Mailman-Approved-At: Tue, 25 Aug 2020 13:01:32 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
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

On 08/25/2020 04:30 PM, Takashi Iwai wrote:
> On Tue, 25 Aug 2020 10:25:03 +0200,
> Tiezhu Yang wrote:
>> This reverts commit 61eee4a7fc40 ("ALSA: hda: Add support for Loongson
>> 7A1000 controller").
>>
>> With this patch, there exists the following error on the Loongson LS7A
>> platform:
>>
>> [  216.639938] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  216.645685] rcu:     0-....: (1 GPs behind) idle=d5a/1/0x4000000000000004 softirq=562/563 fqs=16476
>> [  216.654565]  (t=53772 jiffies g=-463 q=11976)
>> [  216.658923] NMI backtrace for cpu 0
>> [  216.662417] CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted 5.8.0+ #3
>> [  216.668587] Hardware name:  , BIOS
>> [  216.672174] Workqueue: events azx_probe_work [snd_hda_intel]
>> [  216.677829] Stack : 0000000000000000 0000000000000000 ffffffff95004ce0 d786f9efa2288403
>> [  216.685848]         d786f9efa2288403 0000000000000000 98000001102638c8 ffffffff80cee270
>> [  216.693866]         0000000000000000 0000000000000000 0000000000000000 00000000000002b4
>> [  216.701883]         206b726f775f6562 0000000000000001 0000000000000000 ffffffff80f30000
>> [  216.709902]         ffffffff80f30000 ffffffff80d90000 0000000000000000 0000000000000000
>> [  216.717919]         0000000000000000 0000000000000000 0000000000000000 ffffffff80d90000
>> [  216.725937]         ffffffff80d90000 0000000000000007 ffffffff806aff18 0000000000000000
>> [  216.733955]         ffffffff80f00000 9800000110cc4000 98000001102638c0 ffffffff80d9db80
>> [  216.741974]         ffffffff8065a740 0000000000000000 0000000000000000 0000000000000000
>> [  216.749991]         000073746e657665 0000000000000000 ffffffff80211a64 d786f9efa2288403
>> [  216.758009]         ...
>> [  216.760464] Call Trace:
>> [  216.762920] [<ffffffff80211a64>] show_stack+0x9c/0x130
>> [  216.768058] [<ffffffff8065a740>] dump_stack+0xb0/0xf0
>> [  216.773110] [<ffffffff80665774>] nmi_cpu_backtrace+0x134/0x140
>> [  216.778939] [<ffffffff80665910>] nmi_trigger_cpumask_backtrace+0x190/0x200
>> [  216.785805] [<ffffffff802b1abc>] rcu_dump_cpu_stacks+0x12c/0x190
>> [  216.791806] [<ffffffff802b08cc>] rcu_sched_clock_irq+0xa2c/0xfc8
>> [  216.797808] [<ffffffff802b91d4>] update_process_times+0x2c/0xb8
>> [  216.803724] [<ffffffff802cad80>] tick_sched_timer+0x40/0xb8
>> [  216.809293] [<ffffffff802ba5f0>] __hrtimer_run_queues+0x118/0x1d0
>> [  216.815380] [<ffffffff802bab74>] hrtimer_interrupt+0x12c/0x2d8
>> [  216.821208] [<ffffffff8021547c>] c0_compare_interrupt+0x74/0xa0
>> [  216.827124] [<ffffffff80296bd0>] __handle_irq_event_percpu+0xa8/0x198
>> [  216.833558] [<ffffffff80296cf0>] handle_irq_event_percpu+0x30/0x90
>> [  216.839732] [<ffffffff8029d958>] handle_percpu_irq+0x88/0xb8
>> [  216.845388] [<ffffffff80296124>] generic_handle_irq+0x44/0x60
>> [  216.851131] [<ffffffff80b3cfd0>] do_IRQ+0x18/0x28
>> [  216.855838] [<ffffffff8067ace4>] plat_irq_dispatch+0x64/0x100
>> [  216.861579] [<ffffffff80209a20>] handle_int+0x140/0x14c
>> [  216.866802] [<ffffffff802402e8>] irq_exit+0xf8/0x100
> Could you edit the Oops message to drop unnecessary hex numbers,
> timestamps, and whatever redundant for readers?

OK, thanks for your reply.
I will do it and then send v2 soon.

Thanks,
Tiezhu

>
>
> thanks,
>
> Takashi

