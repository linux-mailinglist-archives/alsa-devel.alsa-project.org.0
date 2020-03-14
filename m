Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17418551B
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Mar 2020 09:00:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A46C1861;
	Sat, 14 Mar 2020 09:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A46C1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584172853;
	bh=UlAUPLA56zXzBOp6VKFUSV0LiqlMtR/+JGZICzS1Y24=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IoF+jc39nOLrhgfVZwMtgXg612xtI8PhZL8GEIgIG/DhiFf4DE3G69h/k5HWBRC22
	 AhaiCFbU3ffgwR7gjYmm8EyADdps0QzA2fx6q1IkoSIzdcEZnK2NvMnCRw5LDGsLFZ
	 yQMMEwIpHcb9sZ6lq/7YQcYYrTPNX/Dr5YiWqrO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B0A6F8013C;
	Sat, 14 Mar 2020 08:59:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B51F801D9; Sat, 14 Mar 2020 07:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EE9F8013C
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 07:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EE9F8013C
Received: by mail-io1-f71.google.com with SMTP id b136so3100544iof.15
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 23:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=OXIiMb21nMuToBa09iBerZ4zSwKKsiaz46UUaxnA9wY=;
 b=nhFMI0OwMpbjxxDiG2+X4S13ngVR0VdLA3UQKTmWWhe7e9keftBRFadSvJDCOhU1qq
 9DfwDOMUSHTbeiyxpT1FfvZja4AuHaeuR2yUEvxw26vIvXpqxynl26UlxiSofqv3iWiZ
 6un0U1RZzqGUXerU9Apj6Bl1tXzKdO4iV6zWtFxdvEM0lU3t914Lxa3b+rU4fUT0XDql
 44m9hX6tSpzHuN78z4nF851y26dsK2z0oEA92A6y76a3jQnMCBMy5m9ZMdB44veKmcwd
 STwotAKFcQJL/+cR6foP3HKwp8qViQ0sjIdnPZOukPIU0Lo31TrUjQBxzPsZiLVVIuAg
 HZdA==
X-Gm-Message-State: ANhLgQ3tq+CFFTPFS4wcwwH8yAdP9W9mdspXfgEW865R6flxC+NqgDNJ
 RMNqCvuwos05F/2VtgOoBgGLCfI+MFzR+EtanALBmHF+8hMO
X-Google-Smtp-Source: ADFU+vun2pqyW2VerBTIxX71FDFK/o02Hiw+MRbvsmIM8i1J/NP/s2umzPgnY3nwd6KWQB2Gj6SGp2TvBjbsmKIpwKUCc6Io8HDB
MIME-Version: 1.0
X-Received: by 2002:a6b:3944:: with SMTP id g65mr442793ioa.78.1584167833088;
 Fri, 13 Mar 2020 23:37:13 -0700 (PDT)
Date: Fri, 13 Mar 2020 23:37:13 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4b79505a0cad08b@google.com>
Subject: BUG: unable to handle kernel NULL pointer dereference in corrupted (5)
From: syzbot <syzbot+8b0e78e390d1715b0f4e@syzkaller.appspotmail.com>
To: allison@lohutok.net, alsa-devel@alsa-project.org, 
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 rfontana@redhat.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 14 Mar 2020 08:59:08 +0100
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

Hello,

syzbot found the following crash on:

HEAD commit:    30bb5572 Merge tag 'ktest-v5.6' of git://git.kernel.org/pu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15d300b1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5295e161cd85b82
dashboard link: https://syzkaller.appspot.com/bug?extid=8b0e78e390d1715b0f4e
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a57709e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13de9e91e00000

The bug was bisected to:

commit 271213ef4d0d3a3b80d4cf95c5f2bebb5643e666
Author: Takashi Iwai <tiwai@suse.de>
Date:   Tue Dec 10 06:34:50 2019 +0000

    ALSA: pcxhr: Support PCM sync_stop

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1566b08de00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1766b08de00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1366b08de00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8b0e78e390d1715b0f4e@syzkaller.appspotmail.com
Fixes: 271213ef4d0d ("ALSA: pcxhr: Support PCM sync_stop")

BUG: kernel NULL pointer dereference, address: 0000000000000086
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD a27fa067 P4D a27fa067 PUD a2185067 PMD 0 
Oops: 0010 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 9168 Comm: syz-executor418 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:0x86
Code: Bad RIP value.
RSP: 0018:ffffc90002c9f998 EFLAGS: 00010086
RAX: ffffc90002c9f9c8 RBX: fffffe0000000000 RCX: ffff8880a31b6280
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000ec0 R08: ffffffff839888d3 R09: ffffffff811c7d9a
R10: ffff8880a31b6280 R11: 0000000000000002 R12: dffffc0000000000
R13: fffffe0000000ec8 R14: ffffffff880016f0 R15: fffffe0000000ecb
FS:  0000000000981880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000005c CR3: 00000000986d2000 CR4: 00000000001426e0
Call Trace:
Modules linked in:
CR2: 0000000000000086
---[ end trace 7c78bc94cfc0a37d ]---
RIP: 0010:0x86
Code: Bad RIP value.
RSP: 0018:ffffc90002c9f998 EFLAGS: 00010086
RAX: ffffc90002c9f9c8 RBX: fffffe0000000000 RCX: ffff8880a31b6280
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000ec0 R08: ffffffff839888d3 R09: ffffffff811c7d9a
R10: ffff8880a31b6280 R11: 0000000000000002 R12: dffffc0000000000
R13: fffffe0000000ec8 R14: ffffffff880016f0 R15: fffffe0000000ecb
FS:  0000000000981880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000005c CR3: 00000000986d2000 CR4: 00000000001426e0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
