Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAF754EBF
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 15:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF07DEB;
	Sun, 16 Jul 2023 15:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF07DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512923;
	bh=WiIqbD/NzqJJszvO1N9enMMHatBX+E/8PXNtOTBB5xE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cz+ZYRwoRl8ax7Lahj9kY+wAAYcj5fT4p8t/lTI1tW6dWqTYsP29kjOxhau30IIER
	 Xr9K5ciLfiEIv1RY1SJ3UASzVflXa7XpHtLUY08krHdC0ZEGUWlorrXbOdmLCltwx0
	 CPcNsSbFmO9Xk6xj9mOPOX0MBqi1lg9Ot1A/yuUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 523B5F80520; Sun, 16 Jul 2023 15:07:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2ECEF8032D;
	Sun, 16 Jul 2023 15:07:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF1D2F8047D; Sun, 16 Jul 2023 15:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D85C8F8027B
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 15:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85C8F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hQ3EqsRw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p4paIBZq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30A8A218F2;
	Sun, 16 Jul 2023 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689512844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AtYK9H6OEFphuJ+7xGg8FXecY+/gGpOOXHIVq4Nm0Y=;
	b=hQ3EqsRwAhiMBD02CyvRlJD10ouY1Gg7CTjKztqt3HmuqJdPadnsfF5rIIxLzqNx9qMfdq
	52NHfjiOTnGMzhefq2LRccYKaazu5394f45vmpGtpsTVoD5luiQPMHiPE+kgn9EeTNjRV3
	l6pttHqRko0QCWUXAKldY/Tf3P0j8cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689512844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AtYK9H6OEFphuJ+7xGg8FXecY+/gGpOOXHIVq4Nm0Y=;
	b=p4paIBZq6Eq6jnI8esXqfm/daNrNu+5LvAY9EcswEOpkFVjsHrUIjZrogi64S83jLkwAGI
	LBMUAzEO1E68RpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 097C113252;
	Sun, 16 Jul 2023 13:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ndCCAYzrs2T2fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 16 Jul 2023 13:07:24 +0000
Date: Sun, 16 Jul 2023 15:07:23 +0200
Message-ID: <87v8ekattg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
In-Reply-To: <00000000000098ed3a0600965f89@google.com>
References: <00000000000098ed3a0600965f89@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GN66YFA5XT3OIWCPBJWV7OAKTMLBVNLO
X-Message-ID-Hash: GN66YFA5XT3OIWCPBJWV7OAKTMLBVNLO
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GN66YFA5XT3OIWCPBJWV7OAKTMLBVNLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Jul 2023 10:21:49 +0200,
syzbot wrote:
> 
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3f01e9fed845 Merge tag 'linux-watchdog-6.5-rc2' of git://w..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14b07344a80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=75da4f0a455bdbd3
> dashboard link: https://syzkaller.appspot.com/bug?extid=cf8e7fa4eeec59b3d485
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15877dc2a80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12905004a80000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/441fb7ea58b8/disk-3f01e9fe.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/8fa7790ba0c3/vmlinux-3f01e9fe.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/5e7a6471dadf/bzImage-3f01e9fe.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
> 
> Warning: Permanently added '10.128.1.1' (ED25519) to the list of known hosts.
> executing program
> executing program
> BUG: memory leak
> unreferenced object 0xffff888100877000 (size 512):
>   comm "syz-executor257", pid 5012, jiffies 4294941742 (age 12.790s)
>   hex dump (first 32 bytes):
>     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
>     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
>     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
>     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
>     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
>     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
>     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
>     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
>     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
>     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
>     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> BUG: memory leak
> unreferenced object 0xffff888106742c00 (size 512):
>   comm "syz-executor257", pid 5013, jiffies 4294942276 (age 7.450s)
>   hex dump (first 32 bytes):
>     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
>     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
>     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
>     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
>     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
>     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
>     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
>     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
>     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
>     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
>     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

Likely a forgotten kfree() at the error path.
The patch below should fix it.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: seq: Fix memory leak at error path in
 snd_seq_create_port()

We forgot to release a newly allocated item at the error path in
snd_seq_create_port().  This patch fixes it.

Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000098ed3a0600965f89@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 9b80f8275026..f3f14ff0f80f 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -149,6 +149,7 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	write_lock_irq(&client->ports_lock);
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->addr.port == port) {
+			kfree(new_port);
 			num = -EBUSY;
 			goto unlock;
 		}
-- 
2.35.3

