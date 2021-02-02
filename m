Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E930C5BB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5801753;
	Tue,  2 Feb 2021 17:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5801753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612283544;
	bh=ctweL5WqgKvnTBt5R3agoNbk+YKSe/PKif1hZ4SmjFA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s1DpqdnljTsrtlh4jmoOkwiTNFZa5XXVLJ828nDAQf6zGVckEDKy4BIifxfC0VnLJ
	 7iY9vQ1GcmnQZdjNxP643T2Rd3NRjXYMFe1m4J+LxF7xlmorJjv9hJUYBjWYReYgWv
	 2+xVW4b4S8G3iW+Xq5e8L6gvFOD/KjnCHoJKo7go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539D4F801F7;
	Tue,  2 Feb 2021 17:30:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB130F80171; Tue,  2 Feb 2021 17:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fireflyinternet.com (unknown [77.68.26.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 647CFF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647CFF8013C
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23774610-1500050 for multiple; Tue, 02 Feb 2021 16:30:35 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Takashi@alsa-project.org, "Iwai <tiwai"@suse.de
Subject: Oops with "ALSA: jack: implement software jack injection via debugfs"
Date: Tue, 02 Feb 2021 16:30:36 +0000
Message-ID: <161228343605.1150.8862281636043446562@build.alporthouse.com>
User-Agent: alot/0.9
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

commit 2d670ea2bd53 ("ALSA: jack: implement software jack injection via
debugfs") is causing issues for our CI as we see a use-after-free on
module unload (on all machines):

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/fi-skl-6700k2/pstore0-=
1612277467_Oops_1.txt

<4> [241.294412] general protection fault, probably for non-canonical addre=
ss 0x6b6b6b6b6b6b6c13: 0000 [#1] PREEMPT SMP PTI
<4> [241.294424] CPU: 7 PID: 5820 Comm: i915_module_loa Not tainted 5.11.0-=
rc6-CI-CI_DRM_9715+ #1
<4> [241.294432] Hardware name: System manufacturer System Product Name/Z17=
0 PRO GAMING, BIOS 0802 09/02/2015
<4> [241.294438] RIP: 0010:__lock_acquire+0x61a/0x25a0
<4> [241.294444] Code: 00 00 83 f8 2f 0f 87 a0 00 00 00 3b 05 97 61 07 02 c=
7 44 24 18 01 00 00 00 0f 86 d4 00 00 00 89 05 83 61 07 02 e9 c9 00 00 00 <=
48> 81 3f 80 14 d9 82 41 bc 00 00 00 00 45 0f 45 e0 83 fe 01 0f 87
<4> [241.294451] RSP: 0018:ffffc90000e77b78 EFLAGS: 00010002
<4> [241.294454] RAX: 0000000000000000 RBX: ffff888137d50040 RCX: 000000000=
0000000
<4> [241.294458] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 6b6b6b6b6=
b6b6c13
<4> [241.294461] RBP: 0000000000000001 R08: 0000000000000001 R09: 000000000=
0000000
<4> [241.294464] R10: 0000000000000001 R11: 00000000d2337ff6 R12: 000000000=
0000001
<4> [241.294467] R13: 0000000000000000 R14: 0000000000000000 R15: 6b6b6b6b6=
b6b6c13
<4> [241.294470] FS:  00007f0e00616e40(0000) GS:ffff88824db80000(0000) knlG=
S:0000000000000000
<4> [241.294474] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [241.294477] CR2: 00007f375bda2cb0 CR3: 000000010ddd6001 CR4: 000000000=
03706e0
<4> [241.294480] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
<4> [241.294483] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
<4> [241.294486] Call Trace:
<4> [241.294489]  lock_acquire+0xd0/0x3b0
<4> [241.294493]  ? lockref_get+0x9/0x20
<4> [241.294498]  _raw_spin_lock+0x2a/0x40
<4> [241.294501]  ? lockref_get+0x9/0x20
<4> [241.294505]  lockref_get+0x9/0x20
<4> [241.294508]  simple_recursive_removal+0x31/0x2a0
<4> [241.294511]  ? debugfs_remove+0x50/0x50
<4> [241.294515]  ? _raw_spin_unlock+0x24/0x40
<4> [241.294519]  debugfs_remove+0x3b/0x50
<4> [241.294522]  snd_card_free+0x76/0xa0
<4> [241.294527]  pci_device_remove+0x36/0xb0
<4> [241.294531]  device_release_driver_internal+0xf2/0x1d0
<4> [241.294820]  unbind_store+0xeb/0x120
<4> [241.294824]  kernfs_fop_write_iter+0x11d/0x1c0
<4> [241.294828]  new_sync_write+0x11d/0x1b0
<4> [241.294832]  vfs_write+0x260/0x390
<4> [241.294835]  ksys_write+0x5a/0xd0
<4> [241.294838]  do_syscall_64+0x33/0x80
<4> [241.294842]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
<4> [241.294845] RIP: 0033:0x7f0dffd80281
<4> [241.294848] Code: c3 0f 1f 84 00 00 00 00 00 48 8b 05 59 8d 20 00 c3 0=
f 1f 84 00 00 00 00 00 8b 05 8a d1 20 00 85 c0 75 16 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 57 f3 c3 0f 1f 44 00 00 41 54 55 49 89 d4 53
<4> [241.294855] RSP: 002b:00007fff5a3a9c88 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000001
<4> [241.294860] RAX: ffffffffffffffda RBX: 0000555708dc2cf0 RCX: 00007f0df=
fd80281
<4> [241.294863] RDX: 000000000000000c RSI: 0000555708dc2ddb RDI: 000000000=
0000006
<4> [241.294866] RBP: 00007fff5a3a9d20 R08: 0000555708dc2ddb R09: 000000000=
000000c
<4> [241.294869] R10: 00000000fffffff4 R11: 0000000000000246 R12: 00007fff5=
a3a9c90
<4> [241.294872] R13: 00007f0e00007b18 R14: 0000000000000006 R15: 000055570=
8dc2ddb
<4> [241.294877] Modules linked in: vgem snd_hda_codec_hdmi snd_hda_codec_r=
ealtek snd_hda_codec_generic ledtrig_audio i915 mei_hdcp x86_pkg_temp_therm=
al coretemp crct10dif_pclmul crc32_pclmul snd_hda_intel snd_intel_dspcfg gh=
ash_clmulni_intel snd_hda_codec snd_hwdep snd_hda_core e1000e mei_me snd_pc=
m mei ptp pps_core prime_numbers [last unloaded: vgem]
<4> [241.294901] ---[ end trace 98e116c0344cf275 ]---
<4> [242.399691] RIP: 0010:__lock_acquire+0x61a/0x25a0
<4> [242.399698] Code: 00 00 83 f8 2f 0f 87 a0 00 00 00 3b 05 97 61 07 02 c=
7 44 24 18 01 00 00 00 0f 86 d4 00 00 00 89 05 83 61 07 02 e9 c9 00 00 00 <=
48> 81 3f 80 14 d9 82 41 bc 00 00 00 00 45 0f 45 e0 83 fe 01 0f 87
<4> [242.399705] RSP: 0018:ffffc90000e77b78 EFLAGS: 00010002
<4> [242.399709] RAX: 0000000000000000 RBX: ffff888137d50040 RCX: 000000000=
0000000
<4> [242.399713] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 6b6b6b6b6=
b6b6c13
<4> [242.399716] RBP: 0000000000000001 R08: 0000000000000001 R09: 000000000=
0000000
<4> [242.399719] R10: 0000000000000001 R11: 00000000d2337ff6 R12: 000000000=
0000001
<4> [242.399722] R13: 0000000000000000 R14: 0000000000000000 R15: 6b6b6b6b6=
b6b6c13
<4> [242.399725] FS:  00007f0e00616e40(0000) GS:ffff88824db80000(0000) knlG=
S:0000000000000000
<4> [242.399729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [242.399732] CR2: 00007f375bda2cb0 CR3: 000000010ddd6001 CR4: 000000000=
03706e0
<4> [242.399735] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
<4> [242.399739] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
<6> [242.399742] note: i915_module_loa[5820] exited with preempt_count 1
<3> [242.399745] BUG: sleeping function called from invalid context at incl=
ude/linux/percpu-rwsem.h:49
<3> [242.399749] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 582=
0, name: i915_module_loa
<4> [242.399753] INFO: lockdep is turned off.
<4> [242.399755] irq event stamp: 125679
<4> [242.399757] hardirqs last  enabled at (125679): [<ffffffff81a9e36f>] _=
raw_spin_unlock_irq+0x1f/0x40
<4> [242.399763] hardirqs last disabled at (125678): [<ffffffff81a9e151>] _=
raw_spin_lock_irq+0x41/0x50
<4> [242.399768] softirqs last  enabled at (125054): [<ffffffff81e00342>] _=
_do_softirq+0x342/0x48e
<4> [242.399773] softirqs last disabled at (124021): [<ffffffff81c00f52>] a=
sm_call_irq_on_stack+0x12/0x20
<4> [242.399779] CPU: 7 PID: 5820 Comm: i915_module_loa Tainted: G      D  =
         5.11.0-rc6-CI-CI_DRM_9715+ #1
<4> [242.399784] Hardware name: System manufacturer System Product Name/Z17=
0 PRO GAMING, BIOS 0802 09/02/2015
<4> [242.399787] Call Trace:
<4> [242.399790]  dump_stack+0x77/0x97
<4> [242.399794]  ___might_sleep.cold.120+0xf2/0x106
<4> [242.399799]  exit_signals+0x2b/0x350
<4> [242.399803]  do_exit+0xc8/0xcb0
<4> [242.399807]  ? ksys_write+0x5a/0xd0
<4> [242.399811]  rewind_stack_do_exit+0x17/0x17
<4> [242.399814] RIP: 0033:0x7f0dffd80281
<4> [242.399817] Code: c3 0f 1f 84 00 00 00 00 00 48 8b 05 59 8d 20 00 c3 0=
f 1f 84 00 00 00 00 00 8b 05 8a d1 20 00 85 c0 75 16 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 57 f3 c3 0f 1f 44 00 00 41 54 55 49 89 d4 53
<4> [242.399824] RSP: 002b:00007fff5a3a9c88 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000001
<4> [242.399828] RAX: ffffffffffffffda RBX: 0000555708dc2cf0 RCX: 00007f0df=
fd80281
<4> [242.399831] RDX: 000000000000000c RSI: 0000555708dc2ddb RDI: 000000000=
0000006
<4> [242.399834] RBP: 00007fff5a3a9d20 R08: 0000555708dc2ddb R09: 000000000=
000000c
<4> [242.399838] R10: 00000000fffffff4 R11: 0000000000000246 R12: 00007fff5=
a3a9c90
<4> [242.399841] R13: 00007f0e00007b18 R14: 0000000000000006 R15: 000055570=
8dc2ddb
Created at 2021-02-02 17:16:13
