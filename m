Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B05B1B20
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 13:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50AE51697;
	Thu,  8 Sep 2022 13:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50AE51697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662635808;
	bh=UkPoV7ZiE3j0S2V5FOLkQyaGBXCFB++Mh2L+BvRKOdE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdbVMRb+QqwE6LCjeezd8+Fdm7z9OAImlJ1cT5dYzSJDXQzujjMHxU1Kt8kgV8yMT
	 fIhR+4QOwCnSVzO6vPx9xSqacXEoLQCNGPwPWT8rwlqrKJmMRzLdhTYqwxBr5BJigl
	 u6ee8v/MbtzpxNbXHQDtq/Q5Mtu10ExdhtzkjKkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE155F8023B;
	Thu,  8 Sep 2022 13:15:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FC7F80217; Thu,  8 Sep 2022 13:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E10BBF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 13:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E10BBF800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662635743234118938-webhooks-bot@alsa-project.org>
References: <1662635743234118938-webhooks-bot@alsa-project.org>
Subject: Alsaloop long-running session leads to CPU spikes and stalls
Message-Id: <20220908111546.81FC7F80217@alsa1.perex.cz>
Date: Thu,  8 Sep 2022 13:15:46 +0200 (CEST)
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

alsa-project/alsa-utils issue #168 was opened from ebrodlic:

We have a recurring issue on an embedded system where we use alsaloop to continually forward audio between:
EC25E modem -> system speaker (output)
system microphone (input) -> EC25E modem

The two alsaloop processes run constantly in the background, and are in charge of enabling the GSM call audio functionality on our devices.

What ends up happening is:
- System boots up and starts the 2 processes
- System usage is normal levels for 2-3 hours (very low CPU utilization)
- After cca 3 hours of runtime, one alsaloop process will spike a single core of the CPU up to 100% continually
- After a seemingly random amount of time of the single CPU core being fully utilized, the system may show reduced responsiveness, eventually showing recurring kernel warnings regarding CPU stalls

```
[Tue Aug 30 16:50:42 2022] rcu: INFO: rcu_preempt self-detected stall on CPU
[Tue Aug 30 16:50:42 2022] rcu:         3-....: (5048 ticks this GP) idle=752/1/0x4000000000000002 softirq=1819133/1819133 fqs=2493
[Tue Aug 30 16:50:42 2022]      (t=5250 jiffies g=3235733 q=26917)
[Tue Aug 30 16:50:42 2022] Task dump for CPU 3:
[Tue Aug 30 16:50:42 2022] alsaloop        R  running task        0   761      1 0x00000202
[Tue Aug 30 16:50:42 2022] Call trace:
[Tue Aug 30 16:50:42 2022]  dump_backtrace+0x0/0x140
[Tue Aug 30 16:50:42 2022]  show_stack+0x14/0x20
[Tue Aug 30 16:50:42 2022]  sched_show_task+0x110/0x138
[Tue Aug 30 16:50:42 2022]  dump_cpu_task+0x40/0x4c
[Tue Aug 30 16:50:42 2022]  rcu_dump_cpu_stacks+0x94/0xd0
[Tue Aug 30 16:50:42 2022]  rcu_sched_clock_irq+0x75c/0x9c8
[Tue Aug 30 16:50:42 2022]  update_process_times+0x2c/0x68
[Tue Aug 30 16:50:42 2022]  tick_sched_handle.isra.0+0x30/0x50
[Tue Aug 30 16:50:42 2022]  tick_sched_timer+0x48/0x98
[Tue Aug 30 16:50:42 2022]  __hrtimer_run_queues+0x110/0x1b0
[Tue Aug 30 16:50:42 2022]  hrtimer_interrupt+0xe4/0x240
[Tue Aug 30 16:50:42 2022]  arch_timer_handler_phys+0x30/0x40
[Tue Aug 30 16:50:42 2022]  handle_percpu_devid_irq+0x80/0x140
[Tue Aug 30 16:50:42 2022]  generic_handle_irq+0x24/0x38
[Tue Aug 30 16:50:42 2022]  __handle_domain_irq+0x60/0xb8
[Tue Aug 30 16:50:42 2022]  gic_handle_irq+0x5c/0x148
[Tue Aug 30 16:50:42 2022]  el1_irq+0xb8/0x180
[Tue Aug 30 16:50:42 2022]  snd_power_wait+0x0/0xe8
[Tue Aug 30 16:50:42 2022]  snd_pcm_ioctl+0x2c/0x40
[Tue Aug 30 16:50:42 2022]  do_vfs_ioctl+0x964/0xb48
[Tue Aug 30 16:50:42 2022]  ksys_ioctl+0x78/0xa8
[Tue Aug 30 16:50:42 2022]  __arm64_sys_ioctl+0x1c/0xb8
[Tue Aug 30 16:50:42 2022]  el0_svc_common.constprop.0+0x68/0x160
[Tue Aug 30 16:50:42 2022]  el0_svc_handler+0x20/0x80
[Tue Aug 30 16:50:42 2022]  el0_svc+0x8/0x208
[Tue Aug 30 16:50:42 2022] retire_capture_urb: 307 callbacks suppressed
```

Commands used to start the two processes:
`/usr/bin/alsaloop -P ec25 -C default -t 500000 -n -r 8000 -f S16_LE -c 1`
`/usr/bin/alsaloop -C ec25 -P default -t 500000 -n -r 8000 -f S16_LE -c 1`

Our current alsa .asoundrc conf file:
```
pcm.dmixer {
    type dmix
    ipc_key 1024
    ipc_key_add_uid false   # let multiple users share
    ipc_perm 0666           # IPC permissions for multi-user sharing (octal, default 0600)
    slave {
        pcm "hw:tas5722,0"
    }
    bindings {
        0 0
        1 1
    }
}

pcm.dsnooped {
    type dsnoop
    ipc_key 1027
    ipc_key_add_uid false   # let multiple users share
    ipc_perm 0666           # IPC permissions for multi-user sharing (octal, default 0600)
    slave {
        pcm "hw:ics43432,0"
        channels 1
        format S32_LE
    }
}

pcm.asymed {
    type asym
    playback.pcm "dmixer"
    capture.pcm "softvol"
}

pcm.!default {
    type plug
    slave.pcm "asymed"
}

pcm_slave.ec25 {
    pcm "hw:EC25E,0"
    format S16_LE
    channels 1
    rate 8000
}

pcm.ec25 {
    type plug
    slave ec25
}

pcm.softvol {
    type softvol
    slave.pcm dsnooped
    control {
        name "Boost Capture Volume"
        card ics43432
    }
    min_dB -3.0
    max_dB 50.0
}
```

This one is not very easy to debug so it would be great if I could get some pointers in are we dealing with:
- potential bugs
- alsaloop misuse in approach
- problems in existing configuration

Any info would be appreciated!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/168
Repository URL: https://github.com/alsa-project/alsa-utils
