Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74F185517
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Mar 2020 08:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F251186A;
	Sat, 14 Mar 2020 08:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F251186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584172562;
	bh=ecEsYpjdbAx8lnHx19jHFPgpBSNOJmHBAYT0FGGu2Z4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2wAu5qftlqy4ozT6DQSWjgAnxMzXbyu3tYHF1R/W4sfUVIVebl8z53NPufS3b1Pg
	 34gHBTE11xn8QvsGX2zghID8YvoeYCsElGHrNVH4Zl616n1C1s38dSqvD2B5Tg4Mnr
	 eg7Tuqf0wo5UcakapLpqZ2ANSHFp0QG9z8EYI0bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F990F80246;
	Sat, 14 Mar 2020 08:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EB8DF8023F; Sat, 14 Mar 2020 08:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E2C8F801D9
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 08:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2C8F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Vfg9IUL1"
Received: by mail-qk1-x741.google.com with SMTP id j4so401163qkc.11
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAGBaGlP5UjGPHzk24EwmtbBIUN0VOZVoqYTIi4xf8s=;
 b=Vfg9IUL1wQtNRrZmPe6JtE+jjCAl0DofHknEisT0EbX3xBQN3Dz8aPLIm8ZvAFZLpW
 qN+z/fTYjhI9C4NcGE1LFZdKV+Yyf5pCx/sLqJrSab0GaDDcTFoL/opOC63Io96pVQ0N
 iC/I/5JKSpaT+w3wCUwKSbR0zsCKLzhxwnLbnolKriSY3W/NvvOuDw/x2xVh/OVQUlJ9
 vXwpCt7G8jpOrnUZ1gMzKxcrX249o0IWQR1VspqSENNXPDe5TD7sG7kjDa5ViEDOExG4
 QHRK48BSBvgJIqyfN5BwgCl20FR8cPE9CCt1C9ilZLLQO8f3ddEqV5vi2Zmq4wWcOxFI
 m7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAGBaGlP5UjGPHzk24EwmtbBIUN0VOZVoqYTIi4xf8s=;
 b=kjJjheSYL2PB6aOoN29j9fCeCduwKsOdai+zQVmtYeihEuoF6e91qafSnV/cC+BUud
 FtKMrY743brhFL3Acg2lepR07ixzLlSd4V05DWa0O+aCNwfz7ZCcWGTv/Jl9r6l/nlDQ
 wJbNbW4Or6P1FrFLCOn7myaTF83VtCTKE7AmYS1eUcftLUfupmm4SFkbNMHEp/UTApFk
 RwSnW8TAEMJCG/V1spFsHIcFjdNnwnYbc2ys3w8wBIhzu4hgUOrzu6DOOZjXgeIJ4B8h
 5Vmo0B+mbJLp0OO+hELoTZEcUE+j9Z/v/P9N9gPD/TOW3u08fFXP9BDv2IsB364YEVWf
 LgXA==
X-Gm-Message-State: ANhLgQ3tVm34ZjnGGMuP5HQ4AtBXd/MwVtKPxjBrmXcEBHdAwdglqef7
 1P2A3A8f61i6dK2+4e1KZlfCE3rLMOCJwafjy1sI2Q==
X-Google-Smtp-Source: ADFU+vsaWhVJeWwbcUR3mI1iOg1Kx7ily9lUjGMV/AaCuYWbtMaJdWvOnghbteC5GlnLye9vMTld7eLbldeE1uH+RS8=
X-Received: by 2002:a37:8b01:: with SMTP id n1mr15063650qkd.407.1584172414971; 
 Sat, 14 Mar 2020 00:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f4b79505a0cad08b@google.com>
In-Reply-To: <000000000000f4b79505a0cad08b@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 14 Mar 2020 08:53:24 +0100
Message-ID: <CACT4Y+YOYhEngp_aGHrzMG=dZO=dUVjpjC72vd6_L01fROUchQ@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 corrupted (5)
To: syzbot <syzbot+8b0e78e390d1715b0f4e@syzkaller.appspotmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, KVM list <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net
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

On Sat, Mar 14, 2020 at 7:37 AM syzbot
<syzbot+8b0e78e390d1715b0f4e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    30bb5572 Merge tag 'ktest-v5.6' of git://git.kernel.org/pu..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15d300b1e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a5295e161cd85b82
> dashboard link: https://syzkaller.appspot.com/bug?extid=8b0e78e390d1715b0f4e
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a57709e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13de9e91e00000

Looking at the reproducer, it's all KVM, +KVM maintainers.

> The bug was bisected to:
>
> commit 271213ef4d0d3a3b80d4cf95c5f2bebb5643e666
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Tue Dec 10 06:34:50 2019 +0000
>
>     ALSA: pcxhr: Support PCM sync_stop
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1566b08de00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1766b08de00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1366b08de00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+8b0e78e390d1715b0f4e@syzkaller.appspotmail.com
> Fixes: 271213ef4d0d ("ALSA: pcxhr: Support PCM sync_stop")
>
> BUG: kernel NULL pointer dereference, address: 0000000000000086
> #PF: supervisor instruction fetch in kernel mode
> #PF: error_code(0x0010) - not-present page
> PGD a27fa067 P4D a27fa067 PUD a2185067 PMD 0
> Oops: 0010 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 9168 Comm: syz-executor418 Not tainted 5.6.0-rc5-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:0x86
> Code: Bad RIP value.
> RSP: 0018:ffffc90002c9f998 EFLAGS: 00010086
> RAX: ffffc90002c9f9c8 RBX: fffffe0000000000 RCX: ffff8880a31b6280
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: 0000000000000ec0 R08: ffffffff839888d3 R09: ffffffff811c7d9a
> R10: ffff8880a31b6280 R11: 0000000000000002 R12: dffffc0000000000
> R13: fffffe0000000ec8 R14: ffffffff880016f0 R15: fffffe0000000ecb
> FS:  0000000000981880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000000005c CR3: 00000000986d2000 CR4: 00000000001426e0
> Call Trace:
> Modules linked in:
> CR2: 0000000000000086
> ---[ end trace 7c78bc94cfc0a37d ]---
> RIP: 0010:0x86
> Code: Bad RIP value.
> RSP: 0018:ffffc90002c9f998 EFLAGS: 00010086
> RAX: ffffc90002c9f9c8 RBX: fffffe0000000000 RCX: ffff8880a31b6280
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: 0000000000000ec0 R08: ffffffff839888d3 R09: ffffffff811c7d9a
> R10: ffff8880a31b6280 R11: 0000000000000002 R12: dffffc0000000000
> R13: fffffe0000000ec8 R14: ffffffff880016f0 R15: fffffe0000000ecb
> FS:  0000000000981880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000000005c CR3: 00000000986d2000 CR4: 00000000001426e0
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches
