Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739E3A0CE
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CEE216A5;
	Sat,  8 Jun 2019 18:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CEE216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012923;
	bh=gk5Y0ndL8YuxdbvhtF7QhtZxqAmS19w8K+9GYl7MQ2o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hwg8YHt6Ci/nCPNDBtHPyA7IjtpVZxWWgFCnESb+ZU+aBQkWAPKm/PXv+2Zcu1Iys
	 K5TYu7HkHP1r9tObqmW+JuxaBb5tXHy6fhm9mxXQVL2hjNF5n7bLnOgwqzqdNVFC2b
	 5aJwfRQfocV7m5AOfRLgmvAtBQtdFr9JD0XePCSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93625F89797;
	Sat,  8 Jun 2019 18:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BD9AF896DD; Sat,  8 Jun 2019 00:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D774F80709
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 00:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D774F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nfa4aa26"
Received: by mail-pg1-x542.google.com with SMTP id d30so1843184pgm.7
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5DghZ8PPTikiU9X/j+4tCPHJAWwROuGMzt1uGNfZxg=;
 b=nfa4aa26dP+W2SLl0AGTju8iFHimCwmA22RUcaVoSUtkRbCjSuFsIStiXwSI3+mgxd
 04TRxqG9n7UVWtsKdsn+xVIbNNL8P2QGe5fvxcctipFUs56vZ49Oc72VXPEO3FGXls8/
 nIj2/NJ0Gxy8o5NLusKojvxEixTDC2W9CQuag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5DghZ8PPTikiU9X/j+4tCPHJAWwROuGMzt1uGNfZxg=;
 b=YyY1K0UOc7LWugGPb0MOyKtGWLKDPuiRHUlQbsS1RVaN4O6onEgx7iwN7xAyG8/YSN
 jRmbEOy2LwJR9ZtlkvNWMDUI8bkuPsBWVJqQWVFWtD3GQrRAQEMsWuV5L7XYaC1XcG3O
 CsX2ExyfAXI5QwpmofjVO2jrPAHshC/UVBjGatyY4izPhE91NzgYVNyT7Um4IBd84iVH
 N4kMKQYF+Ep0l2iqehmJ61VJRdqP4PdOO5rEv9VpbKdJaoHBTBdxZkjf0XD1zqS3oYua
 UXCmz4P4xdyk04Yu1z+bQzrpNPIHtkwetiRmh1ti3PtpIrdOHx0AqAEtVOao6SEq8Ti3
 g8rg==
X-Gm-Message-State: APjAAAWhdTZnyXNx+lNuTVXNvzVZ1/XxkhZaF3X9wLGnQj46zHW+p9Kr
 oSzYG+2hMEmq4O4LU9J6cqhC/wUMvcZkSA==
X-Google-Smtp-Source: APXvYqzMhd/uupPOTxDJkDmURMyXVUhnZKymqId/tK/dqDZ5RWQedokZNvY86vrjWt7WoP/VMZ4Mtw==
X-Received: by 2002:a62:83cb:: with SMTP id
 h194mr25838451pfe.201.1559945955449; 
 Fri, 07 Jun 2019 15:19:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82b8:d8c4:6cb6:57f5])
 by smtp.gmail.com with ESMTPSA id n13sm3201633pff.59.2019.06.07.15.19.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 15:19:15 -0700 (PDT)
From: Alex Levin <levinale@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  7 Jun 2019 15:19:11 -0700
Message-Id: <20190607221911.118136-1-levinale@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, benzh@chromium.org,
 Mark Brown <broonie@kernel.org>, cujomalainey@chromium.org,
 Alex Levin <levinale@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: Intel: sst: fix kmalloc call with wrong
	flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When calling kmalloc with GFP_KERNEL in case CONFIG_SLOB is unset,
kmem_cache_alloc_trace is called.

In case CONFIG_TRACING is set, kmem_cache_alloc_trace will ball
slab_alloc, which will call slab_pre_alloc_hook which might_sleep_if.

The context in which it is called in this case, the
intel_sst_interrupt_mrfld, calling a sleeping kmalloc generates a BUG():

Fixes: 972b0d456e64 ("ASoC: Intel: remove GFP_ATOMIC, use GFP_KERNEL")

[   20.250671] BUG: sleeping function called from invalid context at mm/slab.h:422
[   20.250683] in_atomic(): 1, irqs_disabled(): 1, pid: 1791, name: Chrome_IOThread
[   20.250690] CPU: 0 PID: 1791 Comm: Chrome_IOThread Tainted: G        W         4.19.43 #61
[   20.250693] Hardware name: GOOGLE Kefka, BIOS Google_Kefka.7287.337.0 03/02/2017
[   20.250697] Call Trace:
[   20.250704]  <IRQ>
[   20.250716]  dump_stack+0x7e/0xc3
[   20.250725]  ___might_sleep+0x12a/0x140
[   20.250731]  kmem_cache_alloc_trace+0x53/0x1c5
[   20.250736]  ? update_cfs_rq_load_avg+0x17e/0x1aa
[   20.250740]  ? cpu_load_update+0x6c/0xc2
[   20.250746]  sst_create_ipc_msg+0x2d/0x88
[   20.250752]  intel_sst_interrupt_mrfld+0x12a/0x22c
[   20.250758]  __handle_irq_event_percpu+0x133/0x228
[   20.250764]  handle_irq_event_percpu+0x35/0x7a
[   20.250768]  handle_irq_event+0x36/0x55
[   20.250773]  handle_fasteoi_irq+0xab/0x16c
[   20.250779]  handle_irq+0xd9/0x11e
[   20.250785]  do_IRQ+0x54/0xe0
[   20.250791]  common_interrupt+0xf/0xf
[   20.250795]  </IRQ>
[   20.250800] RIP: 0010:__lru_cache_add+0x4e/0xad
[   20.250806] Code: 00 01 48 c7 c7 b8 df 01 00 65 48 03 3c 25 28 f1 00 00 48 8b 48 08 48 89 ca 48 ff ca f6 c1 01 48 0f 44 d0 f0 ff 42 34 0f b6 0f <89> ca fe c2 88 17 48 89 44 cf 08 80 fa 0f 74 0e 48 8b 08 66 85 c9
[   20.250809] RSP: 0000:ffffa568810bfd98 EFLAGS: 00000202 ORIG_RAX: ffffffffffffffd6
[   20.250814] RAX: ffffd3b904eb1940 RBX: ffffd3b904eb1940 RCX: 0000000000000004
[   20.250817] RDX: ffffd3b904eb1940 RSI: ffffa10ee5c47450 RDI: ffffa10efba1dfb8
[   20.250821] RBP: ffffa568810bfda8 R08: ffffa10ef9c741c1 R09: dead000000000100
[   20.250824] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa10ee8d52a40
[   20.250827] R13: ffffa10ee8d52000 R14: ffffa10ee5c47450 R15: 800000013ac65067
[   20.250835]  lru_cache_add_active_or_unevictable+0x4e/0xb8
[   20.250841]  handle_mm_fault+0xd98/0x10c4
[   20.250848]  __do_page_fault+0x235/0x42d
[   20.250853]  ? page_fault+0x8/0x30
[   20.250858]  do_page_fault+0x3d/0x17a
[   20.250862]  ? page_fault+0x8/0x30
[   20.250866]  page_fault+0x1e/0x30
[   20.250872] RIP: 0033:0x7962fdea9304
[   20.250875] Code: 0f 11 4c 17 f0 c3 48 3b 15 f1 26 31 00 0f 83 e2 00 00 00 48 39 f7 72 0f 74 12 4c 8d 0c 16 4c 39 cf 0f 82 63 01 00 00 48 89 d1 <f3> a4 c3 80 fa 08 73 12 80 fa 04 73 1e 80 fa 01 77 26 72 05 0f b6
[   20.250879] RSP: 002b:00007962f4db5468 EFLAGS: 00010206
[   20.250883] RAX: 00003c8cc9d47008 RBX: 0000000000000000 RCX: 0000000000001b48
[   20.250886] RDX: 0000000000002b40 RSI: 00003c8cc9551000 RDI: 00003c8cc9d48000
[   20.250890] RBP: 00007962f4db5820 R08: 0000000000000000 R09: 00003c8cc9552b48
[   20.250893] R10: 0000562dd1064d30 R11: 00003c8cc825b908 R12: 00003c8cc966d3c0
[   20.250896] R13: 00003c8cc9e280c0 R14: 0000000000000000 R15: 0000000000000000

Signed-off-by: Alex Levin <levinale@chromium.org>
---

 sound/soc/intel/atom/sst/sst_pvt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index 00a37a09dc9b..dba0ca07ebf9 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -166,11 +166,11 @@ int sst_create_ipc_msg(struct ipc_post **arg, bool large)
 {
 	struct ipc_post *msg;
 
-	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+	msg = kzalloc(sizeof(*msg), GFP_ATOMIC);
 	if (!msg)
 		return -ENOMEM;
 	if (large) {
-		msg->mailbox_data = kzalloc(SST_MAILBOX_SIZE, GFP_KERNEL);
+		msg->mailbox_data = kzalloc(SST_MAILBOX_SIZE, GFP_ATOMIC);
 		if (!msg->mailbox_data) {
 			kfree(msg);
 			return -ENOMEM;
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
