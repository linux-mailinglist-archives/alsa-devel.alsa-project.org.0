Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21878643D05
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 07:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F651729;
	Tue,  6 Dec 2022 07:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F651729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670307078;
	bh=nAU2cVGo0cMwQxA17GlUKs04Np5diHMGJCRzwBQaLsg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tIkBnH9ktNcUoIv8WgcJMIZWIM7rCSbzQTO/GRwmsDxwdvQBo4Hb/TxlIyp7Brfpg
	 k+ok+swV1rAYXMRpoRqx/FBIMKSSVDcPghQGpqmthDv/C8nr7EWkaqVesav26gMcee
	 /pX18oFKM6x8TI6X1DQHSAvQ7/jZ5CfsobQ7qTOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B7DF80290;
	Tue,  6 Dec 2022 07:10:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C95F80155; Tue,  6 Dec 2022 07:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7ADF80155
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 07:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7ADF80155
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NR93d62fDz15N5D;
 Tue,  6 Dec 2022 14:09:17 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 14:10:05 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <cuigaosheng1@huawei.com>,
 <mk@phasorlab.de>
Subject: [PATCH] ALSA: mts64: fix possible null-ptr-defer in
 snd_mts64_interrupt
Date: Tue, 6 Dec 2022 14:10:04 +0800
Message-ID: <20221206061004.1222966-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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

I got a null-ptr-defer error report when I do the following tests
on the qemu platform:

make defconfig and CONFIG_PARPORT=m, CONFIG_PARPORT_PC=m,
CONFIG_SND_MTS64=m

Then making test scripts:
cat>test_mod1.sh<<EOF
modprobe snd-mts64
modprobe snd-mts64
EOF

Executing the script, perhaps several times, we will get a null-ptr-defer
report, as follow:

syzkaller:~# ./test_mod.sh
snd_mts64: probe of snd_mts64.0 failed with error -5
modprobe: ERROR: could not insert 'snd_mts64': No such device
 BUG: kernel NULL pointer dereference, address: 0000000000000000
 #PF: supervisor write access in kernel mode
 #PF: error_code(0x0002) - not-present page
 PGD 0 P4D 0
 Oops: 0002 [#1] PREEMPT SMP PTI
 CPU: 0 PID: 205 Comm: modprobe Not tainted 6.1.0-rc8-00588-g76dcd734eca2 #6
 Call Trace:
  <IRQ>
  snd_mts64_interrupt+0x24/0xa0 [snd_mts64]
  parport_irq_handler+0x37/0x50 [parport]
  __handle_irq_event_percpu+0x39/0x190
  handle_irq_event_percpu+0xa/0x30
  handle_irq_event+0x2f/0x50
  handle_edge_irq+0x99/0x1b0
  __common_interrupt+0x5d/0x100
  common_interrupt+0xa0/0xc0
  </IRQ>
  <TASK>
  asm_common_interrupt+0x22/0x40
 RIP: 0010:_raw_write_unlock_irqrestore+0x11/0x30
  parport_claim+0xbd/0x230 [parport]
  snd_mts64_probe+0x14a/0x465 [snd_mts64]
  platform_probe+0x3f/0xa0
  really_probe+0x129/0x2c0
  __driver_probe_device+0x6d/0xc0
  driver_probe_device+0x1a/0xa0
  __device_attach_driver+0x7a/0xb0
  bus_for_each_drv+0x62/0xb0
  __device_attach+0xe4/0x180
  bus_probe_device+0x82/0xa0
  device_add+0x550/0x920
  platform_device_add+0x106/0x220
  snd_mts64_attach+0x2e/0x80 [snd_mts64]
  port_check+0x14/0x20 [parport]
  bus_for_each_dev+0x6e/0xc0
  __parport_register_driver+0x7c/0xb0 [parport]
  snd_mts64_module_init+0x31/0x1000 [snd_mts64]
  do_one_initcall+0x3c/0x1f0
  do_init_module+0x46/0x1c6
  load_module+0x1d8d/0x1e10
  __do_sys_finit_module+0xa2/0xf0
  do_syscall_64+0x37/0x90
  entry_SYSCALL_64_after_hwframe+0x63/0xcd
  </TASK>
 Kernel panic - not syncing: Fatal exception in interrupt
 Rebooting in 1 seconds..

The mts wa not initialized during interrupt,  we add check for
mts to fix this bug.

Fixes: 68ab801e32bb ("[ALSA] Add snd-mts64 driver for ESI Miditerminal 4140")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/drivers/mts64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index d3bc9e8c407d..f0d34cf70c3e 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -815,6 +815,9 @@ static void snd_mts64_interrupt(void *private)
 	u8 status, data;
 	struct snd_rawmidi_substream *substream;
 
+	if (!mts)
+		return;
+
 	spin_lock(&mts->lock);
 	ret = mts64_read(mts->pardev->port);
 	data = ret & 0x00ff;
-- 
2.25.1

