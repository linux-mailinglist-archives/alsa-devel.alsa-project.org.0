Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DCB4D1B6D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 16:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9037A1760;
	Tue,  8 Mar 2022 16:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9037A1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646752459;
	bh=qiiF2taxzKN9Kevagy5Zin1cIt41coxDPSmqwqwd9H0=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=siVP/dN4ABhUmNfEtbQHUX5md0MezdtBSLq8+FlV4zlpyVDXqdHDWgNj5qFpKSjit
	 xM44XEo+5x7QQ77Hu0DTtIPaV2nL2ADVGa0zSC+QYt5J0jDvod0XydwSFih6JXhW6o
	 y4y8I1Y3ESfgZoa7tRQK214YXHdYQGKvkeiyToZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A03F804F3;
	Tue,  8 Mar 2022 16:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36858F8013F; Mon,  7 Mar 2022 11:48:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 102C8F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 102C8F80124
Received: by mail-io1-f70.google.com with SMTP id
 i19-20020a5d9353000000b006419c96a6b4so10334172ioo.23
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 02:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=mgKhk7NgAb2oDXlFXPWe8Xc07sODDmNpvRz0YdTXBeo=;
 b=prBjdOxnR70X8zIK7A+ztJNBGT9wcHGKAowb9kjmXFD94t1i500Xi1Sc4EqXAUnu8H
 Oe9nVf2VWJav3skIIVt54LnlQgNTJIB5NwtsjWvBTINjPAqyHS3GK0KmhYVPbkLHMrzz
 fUKK5qb3zc+MfHFN9WZ8Nz21z+6daNWBEMzYLL5hMPfjXpY4ZZJfX2pGfigIe8VY5mi5
 P/RcM5RSDhZQI1DucG2A8WXU9kZg7qgzxX7nsOD6NPKdjovk4B68jYIv+b+fKmMkHtW0
 RB1+BChTgPijPp7qY8zP0uj15DwM9Qk2/0bjjHaetocrT/riFw5FOkhzH2oK3HYJVZwL
 07ow==
X-Gm-Message-State: AOAM531hT/BtSNS88uQj4fjxf7dj0B3nB+pk63dwKk9y2yz3vYzVG58/
 5dBgQl65+2IaMr8KCqbTqv90Sj14M5CgaO4MOOSn1/ckLbkL
X-Google-Smtp-Source: ABdhPJxoDUXiC7ecC99uyPVAsH4t+KASmXgoR4dfVGmxx07TXt3q7cBI8JX4Mw5ixuMrvIbQcPDEeLW6QbVovebXLWgUizCFqq+9
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cd:b0:2c2:f50c:278 with SMTP id
 s13-20020a056e0218cd00b002c2f50c0278mr10549727ilu.1.1646650089268; Mon, 07
 Mar 2022 02:48:09 -0800 (PST)
Date: Mon, 07 Mar 2022 02:48:09 -0800
In-Reply-To: <20220307103434.3310-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a3ec7605d99e99dd@google.com>
Subject: Re: [syzbot] possible deadlock in snd_timer_interrupt (2)
From: syzbot <syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, hdanton@sina.com, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
 tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Mar 2022 16:12:38 +0100
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

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com

Tested on:

commit:         38f80f42 MAINTAINERS: Remove dead patchwork link
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e9585407e09f75f
dashboard link: https://syzkaller.appspot.com/bug?extid=1ee0910eca9c94f71f25
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16c1baa1700000

Note: testing is done by a robot and is best-effort only.
