Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E12479ABE
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 13:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939F11A6A;
	Sat, 18 Dec 2021 13:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939F11A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639830679;
	bh=U+F3sjqkPv8Qo2F2o5Tq70k/NgtEFbuo/JJzYHeTihc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/0FnTT64eeu0X4u7Ro6UvaUCdaVL+WUzaB0a+eppy2s4Cuvnf9oWuuc9xoAsje6y
	 AvCWLFKTsqJPeQj09OZ76popaHCAiLVBY17oaRj7hGvVUvvSOX2HC8FZZfJbD21F0X
	 5GC46edMIXZF54suzcAqrz7uXg6ifSyByAvp2pi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C7AF800F4;
	Sat, 18 Dec 2021 13:30:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E01C8F80139; Sat, 18 Dec 2021 13:30:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, SORTED_RECIPS, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8D3F800E9
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 13:29:55 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DD70DA003F;
 Sat, 18 Dec 2021 13:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DD70DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639830594; bh=b6Fmz+wyxMl12NKeEZ4nicex/pDNEYbXV2fvvJpGl88=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=CtfIb210wnTBfmzIKu220oPA2XBRQZ9BKIS/KYiOqgxTVl5OgqgRYGtGhPQc8ZE+U
 p+owvUTNewy49/G4hBmq3OekDhvHKgjCliNzzSyQ9ENkceUhjF1mYs88rShu84T5oD
 LOSYO3C3F6nv+Gyz0nyij1hfzecCQzGTkSyZQ4zU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 18 Dec 2021 13:29:43 +0100 (CET)
Message-ID: <9603b40e-d038-1252-d613-8ece55029f07@perex.cz>
Date: Sat, 18 Dec 2021 13:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [syzbot] KMSAN: uninit-value in snd_rawmidi_ioctl
Content-Language: en-US
To: syzbot <syzbot+88412ee8811832b00dbe@syzkaller.appspotmail.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org, coding@diwic.se,
 colin.king@intel.com, glider@google.com, joe@perches.com,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tiwai@suse.com
References: <0000000000004255b405d369cd72@google.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <0000000000004255b405d369cd72@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18. 12. 21 12:17, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8b936c96768e kmsan: core: remove the accidentally committe..
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=11791d89b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e00a8959fdd3f3e8
> dashboard link: https://syzkaller.appspot.com/bug?extid=88412ee8811832b00dbe
> compiler:       clang version 14.0.0 (git@github.com:llvm/llvm-project.git 0996585c8e3b3d409494eb5f1cad714b9e1f7fb5), GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a7abf9b00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=172410b9b00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+88412ee8811832b00dbe@syzkaller.appspotmail.com
> 
> =====================================================
> BUG: KMSAN: uninit-value in snd_rawmidi_ioctl+0xf1e/0x1330 sound/core/rawmidi.c:887
>   snd_rawmidi_ioctl+0xf1e/0x1330 sound/core/rawmidi.c:887

Nice catch. I wonder why the problem was not detected by tests. The patch 
bellow should initialize the user_pversion variable:

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 6f30231bdb88..befa9809ff00 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -447,6 +447,7 @@ static int snd_rawmidi_open(struct inode *inode, struct 
file *file)
                 err = -ENOMEM;
                 goto __error;
         }
+       rawmidi_file->user_pversion = 0;
         init_waitqueue_entry(&wait, current);
         add_wait_queue(&rmidi->open_wait, &wait);
         while (1) {

I'll send the path in the proper format ASAP.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
