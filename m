Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF585398A4C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 15:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E90416F0;
	Wed,  2 Jun 2021 15:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E90416F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622640023;
	bh=Sjzu19d5Z2sPX/qzVsbIek0HLuzFjcK/k82Qyzk4ZG0=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O0CjXFyH/mfm6My4qwD9DxhKpU/cJMMuwQSl2PR+jOdSmgYLXqDi1AzzF0TCJ/Bwq
	 OSQIAktYOx0PSgE06FOWplG7l/NVQs0PAsSxID7PvLUf6JRaFx3YMdxgbxmBxg9tvR
	 Onk1+k7EO7xhVOCCMunyvnEsVQqvlgPVWrcjc5us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEDF8F80425;
	Wed,  2 Jun 2021 15:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A71F80424; Wed,  2 Jun 2021 15:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFDADF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 15:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFDADF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gPYKNhkE"
Received: by mail-ed1-x52e.google.com with SMTP id w21so2784415edv.3
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8sL249iFh5fLrh4+jcadscDil09cRaUNl+czqTJf9vc=;
 b=gPYKNhkEJakfzzuddkxy7II9Yimt2kWskOlB6F99t+fPqRNgukyZWgW7mbpDGhAhkt
 /6l37/9eUD3HgRrZkZq/Z+BH049YxHcCQ2XE0s01YqBEkMjsjm+bFSto9edmE6OregwJ
 +W7fPneQcN51SdI38E9WhLfBdO0NnEql5uuiTbRH6irmQA6INj1o8T5ETwHasEOnED4K
 ETLqjA1P9KKVZhTsjZNC705Tp/UoqBJ7PhFEXCSR1LvPf94g+BfrGE7ATntmHfNZ+HQl
 kNDaZ7gG+M0epS9KTYqKSk1qbUby5fV+GRhjN1KQTekgaNJa3z5mQf78uhy3SBz5cUxI
 qvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8sL249iFh5fLrh4+jcadscDil09cRaUNl+czqTJf9vc=;
 b=hi9fbwPJwyj/EFxsAKXPas8Rg7iG7M8x3/fkKEL483I9aQDaXZC48a6ZoT+7RJy6x3
 SRZyorWEFZlALfBDosJp0Jt5cPtwDhfXE+AzEfc7Cv7UnVFKs3J5Sc1kbeRI+6ZWNPy+
 ho8yM9GIFIe4sMWSOMXZFr8hcYqcO5Nwc40+U8pmyNB64asp4EIvsby0mN3hUxVcTAIJ
 nH1n4W35dP9/0uKzjCladoaVAbgMbW9UwEdoZWiWJdFmd00nbfwTOF/7siOGd1oK2frY
 EABZKRxK3L7P3RJdBAfJ/v2R5snif5/5+xJLJGPyUJzTYYSMekhxTq62RGgaW3Rjlhv7
 PX4g==
X-Gm-Message-State: AOAM530Hl6u6QFkMHbfFT40/MhUGFevxGwl/vZXxVHEUfjsXV1EjTf+e
 RBuNn7yFZiZPobKPsN/ovbForWWlRUGxxuGkCRc=
X-Google-Smtp-Source: ABdhPJz47BocwY9xcSwhxCvikVXfyfuBhdVjPKS/2iDg8AbJPZKbNtAG5EX6IPVWRf+i+9GESg6KeCKKuotUTGvK638=
X-Received: by 2002:a05:6402:4c5:: with SMTP id
 n5mr37891601edw.322.1622639920272; 
 Wed, 02 Jun 2021 06:18:40 -0700 (PDT)
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 2 Jun 2021 21:18:13 +0800
Message-ID: <CAD-N9QUDYbzkZXnDzf2P4b4Qk_kBQ_9ZVL3B4jhe9Xf2rgtpGA@mail.gmail.com>
Subject: [syzbot] UBSAN: shift-out-of-bounds in snd_timer_user_ccallback
To: allen.lkml@gmail.com, alsa-devel@alsa-project.org, 
 Joe Perches <joe@perches.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, romain.perier@gmail.com, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit: 5ff2756a Merge tag 'nfs-for-5.13-2' of git://git.linux-nfs..
> git tree: upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17872d5bd00000
> kernel config: https://syzkaller.appspot.com/x/.config?x=770708ea7cfd4916
> dashboard link: https://syzkaller.appspot.com/bug?extid=d102fa5b35335a7e544e
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d102fa...@syzkaller.appspotmail.com
>
> ================================================================================
> UBSAN: shift-out-of-bounds in sound/core/timer.c:1376:23
> shift exponent 105 is too large for 32-bit type 'int'
> CPU: 1 PID: 10368 Comm: syz-executor.1 Not tainted 5.13.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
> __dump_stack lib/dump_stack.c:79 [inline]
> dump_stack+0x141/0x1d7 lib/dump_stack.c:120
> ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
> __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:327
> snd_timer_user_ccallback.cold+0x19/0x1e sound/core/timer.c:1376
>
> snd_timer_notify1+0x243/0x3b0 sound/core/timer.c:525

The root cause of this bug is in the snd_timer_notify1 [1]. At the end
of this function, it calls "ts->ccallback(ts, event + 100, &tstamp,
resolution)".

Here the variable event is 5. It adds 100 and is passed as 2nd
argument of snd_timer_user_ccallback.

From the variable naming, the 2nd argument should an event, and in the
range of event enumeration. In fact, 105 (event + 100) is out of this
range. I don't quite understand the meaning of adding 100. Any thought
here?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/timer.c?id=5ff2756afde08b266fbb673849899fec694f39f1#n497

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
