Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3BF33256C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 13:24:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC819176B;
	Tue,  9 Mar 2021 13:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC819176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615292651;
	bh=iw44632LbrhNdw3iJItyYmBuaI6/SMlBRHnNUwKVRD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMUtOvhPE/A/R9wo6RhX/5uEQ+BlnXkTfakzIA2P/20EtuzgM4+TdsY4sbMNjqo/M
	 QRalvTh5wg6S4tQOX7D1XVILsnaansrYhfIaNFcwKbWREkitrw7roLep9ij8ZyPuQN
	 Jk38EGMW+EeDu4gIaMdwHngVTZ1S4ODeoxWDl8DQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC6DF8014E;
	Tue,  9 Mar 2021 13:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D8D2F80256; Tue,  9 Mar 2021 13:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ABFAF8019B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 13:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABFAF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="OLFv3V6C"
Received: by mail-qt1-x82d.google.com with SMTP id 18so10034920qty.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 04:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaluU7+laoFdMSiGRBWBubnNaFQ2+/bheB0XmnEpIQE=;
 b=OLFv3V6CAG8by+JMnfVRckkvkcAz28M62/0ZaQ6aULLqQG7AHZL/XPixSN0tTJM+/Z
 2TUCOW0gEDToBb7hIWk9r6qyoneNkot3tt8fG9M7hGZpN4JmTNVJ6YOATpKUw3DLEPVc
 mtcxKAer/EPhqeLJWBgr/bBQ9AZWFo/sKk3etYhgYLG7Pk5Nh56Qimmwfey+fuOrEfVd
 qA8rmSTiwDrplWq0fIzTTEYHGWRvU84GWQ45BcG+hnF5dnHSleffx9YdW+7ujgwN/PuH
 h4zlHn4GowuBSUAMULQOFW74LK0FKcIhBnWyIuW663VkdB0Fg+GGqiw4Zo3QUewYbOah
 kbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaluU7+laoFdMSiGRBWBubnNaFQ2+/bheB0XmnEpIQE=;
 b=mdLXBUIyOvPMRAWji6Qhv1bXbUW9LFGDpugJSLaqzbTRxKdZbXZbr/SKdS/05Gjm2p
 Amy4zsD6QhIz6WzHuYWNplpAYyIlZ52ULMovFLeMtY5MowgUCh00OAsH/hfpEKINN48U
 YCPlYZ8N+vnV+I42lSfTy+NZDAsxW2DP+1rdac3oaU/AquRb/dtv4iMQd2bVXhZXB9Yk
 qqT4DGk1nzV4/gXVzwNijxUnJPLgUvlIGqrvTmW4OVtS+NzZokGNsF5esmoWJEi8FZcx
 L6jvYMaOWstWXv/p2rkbxTUvUbaGzE9oo7B+lD1a6wc/i2iWudlxbufHhiYQihlFBuBs
 bWvg==
X-Gm-Message-State: AOAM531799d3zCHaZC2GTt3qf8+rTd2JNtqQoVbk+Y/jouEqwHexCnOg
 hsA4QxirxKb++jf7ZoR6XYcx1Pi0eby6FW1aM6/PnA==
X-Google-Smtp-Source: ABdhPJzmCfVC17pIjfZ+Ylf4jNQ4ubkjeGaI7xNlJT7//0VcLhKn1VKZ81xMeGpysCFzfG9otBPceL+QqaCD4ka5aZg=
X-Received: by 2002:ac8:5908:: with SMTP id 8mr24749802qty.66.1615292581938;
 Tue, 09 Mar 2021 04:23:01 -0800 (PST)
MIME-Version: 1.0
References: <000000000000217e4d05bd18e750@google.com>
 <s5him601rr3.wl-tiwai@suse.de>
In-Reply-To: <s5him601rr3.wl-tiwai@suse.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 9 Mar 2021 13:22:50 +0100
Message-ID: <CACT4Y+bWYQu3h8pJaX4GS1JdJpPheE416TJH4=K5zOaseAH4Fg@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in usb_audio_disconnect
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 kai heng feng <kai.heng.feng@canonical.com>
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

On Tue, Mar 9, 2021 at 12:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 09 Mar 2021 12:32:18 +0100,
> syzbot wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    4641b323 Add linux-next specific files for 20210305
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=103252ead00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b87b6a083d302a90
> > dashboard link: https://syzkaller.appspot.com/bug?extid=ffad4c74b3b3ea3aa9c3
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1122d35cd00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f6476cd00000
> >
> > The issue was bisected to:
> >
> > commit 9799110825dba087c2bdce886977cf84dada2005
> > Author: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Date:   Thu Mar 4 04:34:16 2021 +0000
> >
> >     ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166d91ead00000
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=156d91ead00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=116d91ead00000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+ffad4c74b3b3ea3aa9c3@syzkaller.appspotmail.com
> > Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()")
> >
> > usb 1-1: USB disconnect, device number 2
> > ==================================================================
> > BUG: KASAN: use-after-free in usb_audio_disconnect+0x750/0x800 sound/usb/card.c:918
>
> This must be fixed by the commit that was already merged to sound.git
> tree today:
> c5aa956eaeb0 ("ALSA: usb-audio: fix use after free in usb_audio_disconnect")


#syz fix: ALSA: usb-audio: fix use after free in usb_audio_disconnect
