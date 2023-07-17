Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A29ED755C53
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 09:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860A3A4D;
	Mon, 17 Jul 2023 09:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860A3A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689577401;
	bh=zl9+A64emCRHfXVH7aUIIvIY77wCxcFspS8izrQ1OSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGyFPyjC4N+qnSMRjfCeB/LWqAUw2O0z6FxeabmdhcR+uosmk0b8q0+ov7V5vN0WG
	 wSoXjTanF2PKYGADj8z4CGyVzjZqKzihqAdcpMGey9Xm7+4Zp08fWNqV4n/Rzmevpw
	 wTucgSqQPsgoPOU186i4kwrAy7x1u3z4qzJ8mklQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6945F8007E; Mon, 17 Jul 2023 09:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F62F8007E;
	Mon, 17 Jul 2023 09:02:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F32DF8047D; Mon, 17 Jul 2023 09:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D00B7F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 09:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00B7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=Mz/Rypmj
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f86840c45dso3696e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689577340; x=1692169340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=12KfeSD9MMayl4iugwpxlpwtkls//PC2ordHuUGm4yM=;
        b=Mz/RypmjQK2KJw6jXx9+3DuK77oiWPflmUuJFPGsoVOjhWfkNBNyLtb/xjT9OepLiS
         iVEiAj7ZEMN/BFBtvxFWfJIgb8MQtYYM7kvQHJs7Hd8DOxAC4CKmjE0Vici6UUCtNCOD
         Z7Y9xMVqtvphCR7GVOE3oQErhu5A/zGuRWfJVwUKTTpH5sPVc2rcgKGSoEEm9rZut3wr
         Ro4w8dR+8wvIxNxT/nAzf3rwS3qdfNQEqSC0cHHm1KKenG1gB5hbnkFqzUp4SacLjYRY
         SxQ33mxoeO4qKvpqzByWuajYu8kptiBdxDYvOhCPekVpnpYVeQ+rHg8TQaAAHKHFi63v
         BGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689577340; x=1692169340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12KfeSD9MMayl4iugwpxlpwtkls//PC2ordHuUGm4yM=;
        b=LMHZNfQASAjVRx5kB3owChGs/GFV/Fa9s4VGJsm2wAG1CqFzHATjzY5qTYNuzRXZWI
         m6CYTh7MS5bWJw2T+aRiQgPPS7JdobL4nNoprANoTTgkShTNIsv1eq84nIdvroEnxKhL
         tq2NT8ixa1jqZ6ONbOOBtSxfKBFcRyM+QPBgEIkz6kqCJ9urRmtunyzWRB3lN109CktG
         5jnRpH7U/c2s0RmMpAG4ikIrBNDZ/hrAP2g+0xXdeudmwWOVSJ4m25ImCzNtaZq5+GVZ
         7FYYoQ59A4lgLBcQ1oNRsk+WVNkwaMpneFrrNn0HMZgOHKYx2dpBR+vaEBqYarc7wVWt
         x/lw==
X-Gm-Message-State: ABy/qLbDyuhmDsmjjYdWIC3sP2AUYeVpSCCrN1K05nZ1YoSoJHmIloHc
	tJc3yTE2B0ROBLcUBZcpik9ZxPCNKtSJQ3tGIUBkGQ==
X-Google-Smtp-Source: 
 APBJJlHEtR6u9F1Mb+3YI3LdPIt7e9gDeGhOoet/px6RkHkBLqBrWj/2Mx+h5iKeVLZPafpGXdcfDRLUV77OxnBuUQA=
X-Received: by 2002:ac2:414c:0:b0:4ec:5157:bb37 with SMTP id
 c12-20020ac2414c000000b004ec5157bb37mr329167lfi.2.1689577339751; Mon, 17 Jul
 2023 00:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000098ed3a0600965f89@google.com>
 <87v8ekattg.wl-tiwai@suse.de>
 <ZLQ/zKgTGMHy/6Jn@geday>
In-Reply-To: <ZLQ/zKgTGMHy/6Jn@geday>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 Jul 2023 09:02:07 +0200
Message-ID: 
 <CACT4Y+bXLZf9iAgiLcxo7coNsOCsn_1C26zuvNBa48qLp2Juxg@mail.gmail.com>
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
	syzkaller-bugs@googlegroups.com, tiwai@suse.com,
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HSEBCU6XBY3RCCTSTORMELJP5HQMO3AI
X-Message-ID-Hash: HSEBCU6XBY3RCCTSTORMELJP5HQMO3AI
X-MailFrom: dvyukov@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSEBCU6XBY3RCCTSTORMELJP5HQMO3AI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Jul 2023 at 22:47, Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
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

Hi Geraldo,

What exactly is cryptic in the report? Is there anything that can be
done to make it less cryptic?


> But shouldn't this be reported to security? It's always prone to bad
> stuff when we forget a kfree()
>
> Thanks,
> Geraldo Nascimento
>
> >
> > Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/r/00000000000098ed3a0600965f89@google.com
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/core/seq/seq_ports.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
> > index 9b80f8275026..f3f14ff0f80f 100644
> > --- a/sound/core/seq/seq_ports.c
> > +++ b/sound/core/seq/seq_ports.c
> > @@ -149,6 +149,7 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
> >       write_lock_irq(&client->ports_lock);
> >       list_for_each_entry(p, &client->ports_list_head, list) {
> >               if (p->addr.port == port) {
> > +                     kfree(new_port);
> >                       num = -EBUSY;
> >                       goto unlock;
> >               }
> > --
> > 2.35.3
