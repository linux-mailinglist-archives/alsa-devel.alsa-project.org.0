Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF912608ED
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 05:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83EAD177C;
	Tue,  8 Sep 2020 05:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83EAD177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599534694;
	bh=6NlH9irnoRPgx7TGfqvmnjr8LQqCP1rwy0xZMlAJBMY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UK0FvqlAWTZQDOdKwAP8660XjYWiGXsLrEx1dmLYoDmQ/IsJlEJ4DerNGXNHq1LYb
	 xdEEQv4YWP5q0u+EXEGvO3vcpn6sVqjYjrkrqG+30Za1cBr8sEF4UBCaAmfApMWiLk
	 PF8bdyTCWZOHnHu2Ce8YWy+KcSuG2RRNSAzwC9Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B32D7F801F2;
	Tue,  8 Sep 2020 05:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F513F8015F; Tue,  8 Sep 2020 05:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 4CF2BF8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 05:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF2BF8015F
Received: from [10.130.0.80] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx+MXr9VZf2fcSAA--.2842S3;
 Tue, 08 Sep 2020 11:09:31 +0800 (CST)
Subject: Re: [PATCH v2] Revert "ALSA: hda: Add support for Loongson 7A1000
 controller"
To: Huacai Chen <chenhuacai@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <1598348388-2518-1-git-send-email-yangtiezhu@loongson.cn>
 <s5hsgcb59gw.wl-tiwai@suse.de>
 <CAAhV-H5V5adhY2OjJLxW7x3zDaHGgBxxy45hjf22+qMSEBQuww@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bf50515b-a018-a66d-188a-4901428e66a6@loongson.cn>
Date: Tue, 8 Sep 2020 11:09:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5V5adhY2OjJLxW7x3zDaHGgBxxy45hjf22+qMSEBQuww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx+MXr9VZf2fcSAA--.2842S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1rAw1DZryfuF4xJF1DKFg_yoW5GF4kpw
 1FyF4avr4Dtr4UJa1qvr909r18tw45AasrX3s7Jr1jvF12gr1kJryxJF4SgFs8Gry5ZFW7
 t398twsrWFyDG37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUn2-eDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Cc: alsa-devel@alsa-project.org, Xuefeng Li <lixuefeng@loongson.cn>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

On 09/08/2020 08:37 AM, Huacai Chen wrote:
> Hi, all
>
> This patch should be backported to 5.4.

Hi,

Commit 61eee4a7fc40 ("ALSA: hda: Add support for Loongson
7A1000 controller") has been not yet merged into 5.4, so no
need to backport.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_intel.c?h=v5.4

Thanks,
Tiezhu

>
> Huacai
>
> On Tue, Aug 25, 2020 at 6:03 PM Takashi Iwai <tiwai@suse.de> wrote:
>> On Tue, 25 Aug 2020 11:39:48 +0200,
>> Tiezhu Yang wrote:
>>> This reverts commit 61eee4a7fc40 ("ALSA: hda: Add support for Loongson
>>> 7A1000 controller") to fix the following error on the Loongson LS7A
>>> platform:
>>>
>>> rcu: INFO: rcu_preempt self-detected stall on CPU
>>> <SNIP>
>>> NMI backtrace for cpu 0
>>> CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted 5.8.0+ #3
>>> Hardware name:  , BIOS
>>> Workqueue: events azx_probe_work [snd_hda_intel]
>>> <SNIP>
>>> Call Trace:
>>> [<ffffffff80211a64>] show_stack+0x9c/0x130
>>> [<ffffffff8065a740>] dump_stack+0xb0/0xf0
>>> [<ffffffff80665774>] nmi_cpu_backtrace+0x134/0x140
>>> [<ffffffff80665910>] nmi_trigger_cpumask_backtrace+0x190/0x200
>>> [<ffffffff802b1abc>] rcu_dump_cpu_stacks+0x12c/0x190
>>> [<ffffffff802b08cc>] rcu_sched_clock_irq+0xa2c/0xfc8
>>> [<ffffffff802b91d4>] update_process_times+0x2c/0xb8
>>> [<ffffffff802cad80>] tick_sched_timer+0x40/0xb8
>>> [<ffffffff802ba5f0>] __hrtimer_run_queues+0x118/0x1d0
>>> [<ffffffff802bab74>] hrtimer_interrupt+0x12c/0x2d8
>>> [<ffffffff8021547c>] c0_compare_interrupt+0x74/0xa0
>>> [<ffffffff80296bd0>] __handle_irq_event_percpu+0xa8/0x198
>>> [<ffffffff80296cf0>] handle_irq_event_percpu+0x30/0x90
>>> [<ffffffff8029d958>] handle_percpu_irq+0x88/0xb8
>>> [<ffffffff80296124>] generic_handle_irq+0x44/0x60
>>> [<ffffffff80b3cfd0>] do_IRQ+0x18/0x28
>>> [<ffffffff8067ace4>] plat_irq_dispatch+0x64/0x100
>>> [<ffffffff80209a20>] handle_int+0x140/0x14c
>>> [<ffffffff802402e8>] irq_exit+0xf8/0x100
>>>
>>> Because AZX_DRIVER_GENERIC can not work well for Loongson LS7A HDA
>>> controller, it needs some workarounds which are not merged into the
>>> upstream kernel at this time, so it should revert this patch now.
>>>
>>> Fixes: 61eee4a7fc40 ("ALSA: hda: Add support for Loongson 7A1000 controller")
>>> Cc: <stable@vger.kernel.org> # 5.9-rc1+
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>
>>> v2: update commit message
>> Applied now.  Thanks.
>>
>>
>> Takashi

