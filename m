Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2168755BB0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 08:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19757850;
	Mon, 17 Jul 2023 08:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19757850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689575372;
	bh=7Ae+aAsqt/SHHECIoCaSF6nOrvDXcJqzJe4n6bVtXVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HczLoUptJykA6nR7dxh4EieCYFz1cLkRsDwERPcEDzjN/5WHdw1uLZHemiN8/aW1H
	 MAhnX3Yb3IJGki21fcmx6x/rSkROkXAPYoeS3gGpl0/JJ/08kKQ4O99Qvcpd6tSb51
	 2OMMkjb3aZQJvlZEWug6JJ4EgHzjh17uGIz9N9iU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0EECF8055A; Mon, 17 Jul 2023 08:28:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CEBEF80551;
	Mon, 17 Jul 2023 08:28:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2734F80552; Mon, 17 Jul 2023 08:28:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8179BF80548
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 08:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8179BF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JOSnKJXG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CrR3EsCP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CFC41F74C;
	Mon, 17 Jul 2023 06:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689575269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsNv4azKi3xSr19TxcmgMG50aAmTKzfOB5hspGkaUKk=;
	b=JOSnKJXGqNPWF/p4DPpYQGBv/GgIqvVs5hWmllhitm0OIuRv/Yn0aDLLpcwZ6Y1OE/j7WE
	CJDL1gLTKtTI78LnQTCtGIMMMnFxCz7hQ8+VqvRMMrBFL0BmTS1FsElgTQXqaqdMu93gRg
	jXx7Zd3teNgGFUIqkfZ2c4hSrmQRpxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689575269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsNv4azKi3xSr19TxcmgMG50aAmTKzfOB5hspGkaUKk=;
	b=CrR3EsCP4rZJh8WfIl8qjG6jszkMsy5ePMyEp4RL5Tt2VbVCJwkG6R9mswuj+5YJGL3hq8
	fNzw4UTcGDdu/iDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 270AD13276;
	Mon, 17 Jul 2023 06:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id n3axCGXftGT2awAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 17 Jul 2023 06:27:49 +0000
Date: Mon, 17 Jul 2023 08:27:48 +0200
Message-ID: <87y1jfjbmj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
In-Reply-To: <ZLQ/zKgTGMHy/6Jn@geday>
References: <00000000000098ed3a0600965f89@google.com>
	<87v8ekattg.wl-tiwai@suse.de>
	<ZLQ/zKgTGMHy/6Jn@geday>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HYU4WYDHZ4DJAVADFRLZ76POIQATIQW6
X-Message-ID-Hash: HYU4WYDHZ4DJAVADFRLZ76POIQATIQW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYU4WYDHZ4DJAVADFRLZ76POIQATIQW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Jul 2023 21:06:52 +0200,
Geraldo Nascimento wrote:
> 
> On Sun, Jul 16, 2023 at 03:07:23PM +0200, Takashi Iwai wrote:
> > On Sun, 16 Jul 2023 10:21:49 +0200,
> > syzbot wrote:
> > > 
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    3f01e9fed845 Merge tag 'linux-watchdog-6.5-rc2' of git://w..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=14b07344a80000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=75da4f0a455bdbd3
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=cf8e7fa4eeec59b3d485
> > > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15877dc2a80000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12905004a80000
> > > 
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/441fb7ea58b8/disk-3f01e9fe.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/8fa7790ba0c3/vmlinux-3f01e9fe.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/5e7a6471dadf/bzImage-3f01e9fe.xz
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
> > > 
> > > Warning: Permanently added '10.128.1.1' (ED25519) to the list of known hosts.
> > > executing program
> > > executing program
> > > BUG: memory leak
> > > unreferenced object 0xffff888100877000 (size 512):
> > >   comm "syz-executor257", pid 5012, jiffies 4294941742 (age 12.790s)
> > >   hex dump (first 32 bytes):
> > >     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   backtrace:
> > >     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
> > >     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
> > >     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
> > >     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
> > >     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
> > >     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
> > >     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
> > >     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
> > >     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
> > >     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
> > >     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > >     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
> > >     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > > 
> > > BUG: memory leak
> > > unreferenced object 0xffff888106742c00 (size 512):
> > >   comm "syz-executor257", pid 5013, jiffies 4294942276 (age 7.450s)
> > >   hex dump (first 32 bytes):
> > >     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > >   backtrace:
> > >     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
> > >     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
> > >     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
> > >     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
> > >     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
> > >     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
> > >     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
> > >     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
> > >     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
> > >     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
> > >     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > >     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
> > >     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > 
> > Likely a forgotten kfree() at the error path.
> > The patch below should fix it.
> > 
> > 
> > Takashi
> > 
> > -- 8< --
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] ALSA: seq: Fix memory leak at error path in
> >  snd_seq_create_port()
> > 
> > We forgot to release a newly allocated item at the error path in
> > snd_seq_create_port().  This patch fixes it.
> 
> Thanks for the clarification and quick proposed resolution Takashi. As
> an ALSA novice these bots always stunt me, personally. I understand how
> helpful they are however, even if cryptic.
> 
> But shouldn't this be reported to security? It's always prone to bad
> stuff when we forget a kfree()

It's a bug that happened only on 6.5-rc1, so no need to bother too
much with security issue fiasco for distros.


Takashi
