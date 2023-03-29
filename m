Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E66CD0A4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 05:26:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D711F1;
	Wed, 29 Mar 2023 05:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D711F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680060398;
	bh=+3oU2ByYTjvXbvCzGceMS7gO2F8M6BoyBSDTCJXSRRs=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=jf4Hcht6xeELN+KqDsng+jYCaXCNwLq5PHUHTf0o3dqdF4mGPTAedRPIL1RuNNc5O
	 VSf30Afg5cLvpD3mtnMDEjbUGzoJb/C1f3cMlxAyZfurIYbo2TOauw9Oju2o1WZd7a
	 UOn8kLd2PNaF+beoEEGVfpMLHcz181SLu+GOZg1w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E1EF8024E;
	Wed, 29 Mar 2023 05:25:48 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Create card with device-managed
 snd_devm_card_new()
Date: Wed, 29 Mar 2023 06:24:22 +0300
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZ37K44SFBXTBNSPKD5TM54IUPFNPDIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006034583.26.17844726112057150916@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3D6CF80272; Wed, 29 Mar 2023 05:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC48EF80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 05:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC48EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=HtP5QI3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bNv+yStMtSpyGQxR9RmjPrZoWnslXaRV3vDgUKOdozg=; b=HtP5QI3kJpMvy5L16moJT5hT+u
	ypnKY+hvz+Hq1ibmG/C3518ckzjpVGVTa3L6l1tsEB+zHiU3Apg6HmmTgfwWahbCqtrE3i1bSauvD
	6gp8PjASS+gXY6VsTILJuM++00ovlJINJM/RFdPNi2y2Va+CFEIGGu1RdVO7j9z+fY6Y=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phMQv-00Gu2N-5X; Wed, 29 Mar 2023 06:25:09 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Create card with device-managed
 snd_devm_card_new()
Date: Wed, 29 Mar 2023 06:24:22 +0300
Message-Id: <20230329032422.170024-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZZ37K44SFBXTBNSPKD5TM54IUPFNPDIS
X-Message-ID-Hash: ZZ37K44SFBXTBNSPKD5TM54IUPFNPDIS
X-MailFrom: tasos@tasossah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, tasos@tasossah.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZ37K44SFBXTBNSPKD5TM54IUPFNPDIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_card_ymfpci_remove() was removed in commit c6e6bb5eab74 ("ALSA:
ymfpci: Allocate resources with device-managed APIs"), but the call to
snd_card_new() was not replaced with snd_devm_card_new().

Since there was no longer a call to snd_card_free, unloading the module
would eventually result in Oops:

[697561.532887] BUG: unable to handle page fault for address: ffffffffc0924480
[697561.532893] #PF: supervisor read access in kernel mode
[697561.532896] #PF: error_code(0x0000) - not-present page
[697561.532899] PGD ae1e15067 P4D ae1e15067 PUD ae1e17067 PMD 11a8f5067 PTE 0
[697561.532905] Oops: 0000 [#1] PREEMPT SMP NOPTI
[697561.532909] CPU: 21 PID: 5080 Comm: wireplumber Tainted: G        W  OE      6.2.7 #1
[697561.532914] Hardware name: System manufacturer System Product Name/TUF GAMING X570-PLUS, BIOS 4408 10/28/2022
[697561.532916] RIP: 0010:try_module_get.part.0+0x1a/0xe0
[697561.532924] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc bf 01 00 00 00 e8 56 3c f8 ff <41> 83 3c 24 02 0f 84 96 00 00 00 41 8b 84 24 30 03 00 00 85 c0 0f
[697561.532927] RSP: 0018:ffffbe9b858c3bd8 EFLAGS: 00010246
[697561.532930] RAX: ffff9815d14f1900 RBX: ffff9815c14e6000 RCX: 0000000000000000
[697561.532933] RDX: 0000000000000000 RSI: ffffffffc055092c RDI: ffffffffb3778c1a
[697561.532935] RBP: ffffbe9b858c3be8 R08: 0000000000000040 R09: ffff981a1a741380
[697561.532937] R10: ffffbe9b858c3c80 R11: 00000009d56533a6 R12: ffffffffc0924480
[697561.532939] R13: ffff9823439d8500 R14: 0000000000000025 R15: ffff9815cd109f80
[697561.532942] FS:  00007f13084f1f80(0000) GS:ffff9824aef40000(0000) knlGS:0000000000000000
[697561.532945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[697561.532947] CR2: ffffffffc0924480 CR3: 0000000145344000 CR4: 0000000000350ee0
[697561.532949] Call Trace:
[697561.532951]  <TASK>
[697561.532955]  try_module_get+0x13/0x30
[697561.532960]  snd_ctl_open+0x61/0x1c0 [snd]
[697561.532976]  snd_open+0xb4/0x1e0 [snd]
[697561.532989]  chrdev_open+0xc7/0x240
[697561.532995]  ? fsnotify_perm.part.0+0x6e/0x160
[697561.533000]  ? __pfx_chrdev_open+0x10/0x10
[697561.533005]  do_dentry_open+0x169/0x440
[697561.533009]  vfs_open+0x2d/0x40
[697561.533012]  path_openat+0xa9d/0x10d0
[697561.533017]  ? debug_smp_processor_id+0x17/0x20
[697561.533022]  ? trigger_load_balance+0x65/0x370
[697561.533026]  do_filp_open+0xb2/0x160
[697561.533032]  ? _raw_spin_unlock+0x19/0x40
[697561.533036]  ? alloc_fd+0xa9/0x190
[697561.533040]  do_sys_openat2+0x9f/0x160
[697561.533044]  __x64_sys_openat+0x55/0x90
[697561.533048]  do_syscall_64+0x3b/0x90
[697561.533052]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[697561.533056] RIP: 0033:0x7f1308a40db4
[697561.533059] Code: 24 20 eb 8f 66 90 44 89 54 24 0c e8 46 68 f8 ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 32 44 89 c7 89 44 24 0c e8 78 68 f8 ff 8b 44
[697561.533062] RSP: 002b:00007ffcce664450 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
[697561.533066] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f1308a40db4
[697561.533068] RDX: 0000000000080000 RSI: 00007ffcce664690 RDI: 00000000ffffff9c
[697561.533070] RBP: 00007ffcce664690 R08: 0000000000000000 R09: 0000000000000012
[697561.533072] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000080000
[697561.533074] R13: 00007f13054b069b R14: 0000565209f83200 R15: 0000000000000000
[697561.533078]  </TASK>

Fixes: c6e6bb5eab74 ("ALSA: ymfpci: Allocate resources with device-managed APIs")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 1e198e4d5..82d4e0fda 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -170,7 +170,7 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
 			   sizeof(*chip), &card);
 	if (err < 0)
 		return err;
-- 
2.25.1

