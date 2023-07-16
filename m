Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD267550D3
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 21:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585B4850;
	Sun, 16 Jul 2023 21:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585B4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689534483;
	bh=r/6dGjO1Lb7y1aaGQ1ycry0avK7//ySKSmi0Y5DfaBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c8JIGQRB7h7soi8hcB0jz+Gmr/gEJFKE1/sbTsAAr0Ia3oG9y4UQs4TgNYwrke1JY
	 6YwZqntGSuo18zSUkVcvVGA4bkIWvmo+JznUetrYcwiX9acqayk90tYdwK0K5m8NyB
	 btIPPw8OdgyzUWFKVauFsnOr1rhf5JXssqS2Uhbs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA693F8032D; Sun, 16 Jul 2023 21:07:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB79F8032D;
	Sun, 16 Jul 2023 21:07:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46A34F8047D; Sun, 16 Jul 2023 21:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 484C8F800D2
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 21:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484C8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=BjH28TL0
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a3e1152c23so2761787b6e.2
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jul 2023 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689534412; x=1692126412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2EJe7w5jbMWQu8It0Umpap5mz11OkZDUZVRBPS5DT8=;
        b=BjH28TL0yayN1QLQTzVZ7G+eab5w4mB0Flqwd6JhGMiffhLmBsq8zm77412UsdEua3
         YVQA4QhIePcNlZS5sAdOJNLXVtX4JYLUcPZ4SfLMKMVlDeYfoqwzv1hw4mL/puPEjRC3
         98yyev6szVQ+zf23p7WEHB4V+/2okuA4+9Ot30/n12a104zvWjIbX7LhEO0GQ4TKExh5
         kweLZ+/6jC8SZa4f5T9aGIL2KV2mImoSBoz9WVgd3xagaqv9MIEU1iBlEKM8cdxBULki
         e6YLzSbYdzcrnxIv1xe48Zuqwc5gnbyXZTTdfyPeOXGjHd0bBEU7XiRZz4gItkqOjw3U
         uFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689534412; x=1692126412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2EJe7w5jbMWQu8It0Umpap5mz11OkZDUZVRBPS5DT8=;
        b=GuBDiMLKAv20pQLfLLpOxf0lbSBvjvIq1SeI5OniTneSvjWXnGXkgR/4i6hU8esCN3
         brmK4+sZ8DQMJe9IhmQQT82v7FUOlQdcJTanvNQfDfHQXMM4PMHUEw0nTUjxIiifVFNl
         yLuXAEIxwfFCZ5oNvf+khyr4uPOzgwYceSlGSPCX/GqbCd/AMJPWznJ86J26YEcXjiFq
         2XJx8JeYfXdITyjxEh0EM1jDr09Bjl44HGF5t/L15jE5v2klS+bJg9WucE3LGTWz+5Vq
         nswtOIlFnu2+MXNJT96Y/tBzYc2s1x0HJ2yew0SOCWd6Bq+mMsOq2/M4H+e0M76mJhmM
         MpVg==
X-Gm-Message-State: ABy/qLaNHS/hy+lY/5LjSgTfa+L5+ZU/uuj2k3b4y1pZKvOajYtv8fWC
	qjcvTVYGwi9/E8MtBjilZKo=
X-Google-Smtp-Source: 
 APBJJlFfIbmqytyP90M456/Aj4+BiCISQVlOFJgEdIplC5uM+smDVuZ1Hd77bXUq1Y83x/PAGh4i6w==
X-Received: by 2002:a05:6808:20aa:b0:3a1:eb0e:ddc6 with SMTP id
 s42-20020a05680820aa00b003a1eb0eddc6mr10834019oiw.29.1689534411744;
        Sun, 16 Jul 2023 12:06:51 -0700 (PDT)
Received: from geday ([2804:7f2:8006:6f85:a102:899f:bf55:3c0a])
        by smtp.gmail.com with ESMTPSA id
 7-20020a4a0307000000b00565ef8db270sm6192456ooi.9.2023.07.16.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 12:06:51 -0700 (PDT)
Date: Sun, 16 Jul 2023 16:06:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
Message-ID: <ZLQ/zKgTGMHy/6Jn@geday>
References: <00000000000098ed3a0600965f89@google.com>
 <87v8ekattg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8ekattg.wl-tiwai@suse.de>
Message-ID-Hash: PMNFWFYRZYJFK2DAUY75PQO3YZ6WGWDZ
X-Message-ID-Hash: PMNFWFYRZYJFK2DAUY75PQO3YZ6WGWDZ
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMNFWFYRZYJFK2DAUY75PQO3YZ6WGWDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Jul 16, 2023 at 03:07:23PM +0200, Takashi Iwai wrote:
> On Sun, 16 Jul 2023 10:21:49 +0200,
> syzbot wrote:
> > 
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    3f01e9fed845 Merge tag 'linux-watchdog-6.5-rc2' of git://w..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14b07344a80000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=75da4f0a455bdbd3
> > dashboard link: https://syzkaller.appspot.com/bug?extid=cf8e7fa4eeec59b3d485
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15877dc2a80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12905004a80000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/441fb7ea58b8/disk-3f01e9fe.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/8fa7790ba0c3/vmlinux-3f01e9fe.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/5e7a6471dadf/bzImage-3f01e9fe.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
> > 
> > Warning: Permanently added '10.128.1.1' (ED25519) to the list of known hosts.
> > executing program
> > executing program
> > BUG: memory leak
> > unreferenced object 0xffff888100877000 (size 512):
> >   comm "syz-executor257", pid 5012, jiffies 4294941742 (age 12.790s)
> >   hex dump (first 32 bytes):
> >     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
> >     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
> >     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
> >     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
> >     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
> >     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
> >     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
> >     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
> >     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
> >     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
> >     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
> >     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > 
> > BUG: memory leak
> > unreferenced object 0xffff888106742c00 (size 512):
> >   comm "syz-executor257", pid 5013, jiffies 4294942276 (age 7.450s)
> >   hex dump (first 32 bytes):
> >     80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
> >     [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
> >     [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
> >     [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
> >     [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
> >     [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
> >     [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
> >     [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
> >     [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
> >     [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
> >     [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >     [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
> >     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> Likely a forgotten kfree() at the error path.
> The patch below should fix it.
> 
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: seq: Fix memory leak at error path in
>  snd_seq_create_port()
> 
> We forgot to release a newly allocated item at the error path in
> snd_seq_create_port().  This patch fixes it.

Thanks for the clarification and quick proposed resolution Takashi. As
an ALSA novice these bots always stunt me, personally. I understand how
helpful they are however, even if cryptic.

But shouldn't this be reported to security? It's always prone to bad
stuff when we forget a kfree()

Thanks,
Geraldo Nascimento

> 
> Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/00000000000098ed3a0600965f89@google.com
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/seq/seq_ports.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
> index 9b80f8275026..f3f14ff0f80f 100644
> --- a/sound/core/seq/seq_ports.c
> +++ b/sound/core/seq/seq_ports.c
> @@ -149,6 +149,7 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
>  	write_lock_irq(&client->ports_lock);
>  	list_for_each_entry(p, &client->ports_list_head, list) {
>  		if (p->addr.port == port) {
> +			kfree(new_port);
>  			num = -EBUSY;
>  			goto unlock;
>  		}
> -- 
> 2.35.3
> 
