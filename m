Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F625170F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 13:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 152661694;
	Tue, 25 Aug 2020 13:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 152661694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598353636;
	bh=LG+Js2OjQ7autWLRgbDX52cmssVSJDSrEytn9k7rNeI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s/n8lM0dIQ1CuOHxoRYdFdwp5rxRHfh9HjiC5VXGPgcYPp7YDgXADAqstDcPKGklY
	 L2X8aO2Zu6IjCaanRrrVI/FZxE+T5lVGG1pmqDp4b0WE1qQX7/5AyBGK4tiSW6Ehgu
	 IhoW9QHOgZsznZtV8tHet+mjKzN2SvOPwG7XJ0JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C4F3F802F9;
	Tue, 25 Aug 2020 13:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAF7F80143; Tue, 25 Aug 2020 11:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 500F0F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 11:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500F0F80143
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxCMZo3ERfncENAA--.2579S2;
 Tue, 25 Aug 2020 17:39:53 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Takashi Iwai <tiwai@suse.com>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2] Revert "ALSA: hda: Add support for Loongson 7A1000
 controller"
Date: Tue, 25 Aug 2020 17:39:48 +0800
Message-Id: <1598348388-2518-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxCMZo3ERfncENAA--.2579S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW3Gr43KFW5XFyrAw4DXFb_yoW5Jw1fpw
 15Zr12yr4kKr4qqa15ta4Yvry8twnrAasrGrWxJw17ZFnrur18JryxZF4SkFs8urWrJFy7
 J34DtwsrWayDGw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUq38nUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Mailman-Approved-At: Tue, 25 Aug 2020 13:01:32 +0200
Cc: alsa-devel@alsa-project.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

This reverts commit 61eee4a7fc40 ("ALSA: hda: Add support for Loongson
7A1000 controller") to fix the following error on the Loongson LS7A
platform:

rcu: INFO: rcu_preempt self-detected stall on CPU
<SNIP>
NMI backtrace for cpu 0
CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted 5.8.0+ #3
Hardware name:  , BIOS
Workqueue: events azx_probe_work [snd_hda_intel]
<SNIP>
Call Trace:
[<ffffffff80211a64>] show_stack+0x9c/0x130
[<ffffffff8065a740>] dump_stack+0xb0/0xf0
[<ffffffff80665774>] nmi_cpu_backtrace+0x134/0x140
[<ffffffff80665910>] nmi_trigger_cpumask_backtrace+0x190/0x200
[<ffffffff802b1abc>] rcu_dump_cpu_stacks+0x12c/0x190
[<ffffffff802b08cc>] rcu_sched_clock_irq+0xa2c/0xfc8
[<ffffffff802b91d4>] update_process_times+0x2c/0xb8
[<ffffffff802cad80>] tick_sched_timer+0x40/0xb8
[<ffffffff802ba5f0>] __hrtimer_run_queues+0x118/0x1d0
[<ffffffff802bab74>] hrtimer_interrupt+0x12c/0x2d8
[<ffffffff8021547c>] c0_compare_interrupt+0x74/0xa0
[<ffffffff80296bd0>] __handle_irq_event_percpu+0xa8/0x198
[<ffffffff80296cf0>] handle_irq_event_percpu+0x30/0x90
[<ffffffff8029d958>] handle_percpu_irq+0x88/0xb8
[<ffffffff80296124>] generic_handle_irq+0x44/0x60
[<ffffffff80b3cfd0>] do_IRQ+0x18/0x28
[<ffffffff8067ace4>] plat_irq_dispatch+0x64/0x100
[<ffffffff80209a20>] handle_int+0x140/0x14c
[<ffffffff802402e8>] irq_exit+0xf8/0x100

Because AZX_DRIVER_GENERIC can not work well for Loongson LS7A HDA
controller, it needs some workarounds which are not merged into the
upstream kernel at this time, so it should revert this patch now.

Fixes: 61eee4a7fc40 ("ALSA: hda: Add support for Loongson 7A1000 controller")
Cc: <stable@vger.kernel.org> # 5.9-rc1+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: update commit message

 sound/pci/hda/hda_intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index e34a4d5..0f86e37 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2745,8 +2745,6 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
 	/* Zhaoxin */
 	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
-	/* Loongson */
-	{ PCI_DEVICE(0x0014, 0x7a07), .driver_data = AZX_DRIVER_GENERIC },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
-- 
2.1.0

