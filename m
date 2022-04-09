Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B084FD36F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803BC17B4;
	Tue, 12 Apr 2022 11:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803BC17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649757215;
	bh=dBPqAislZDH42mWFUyBAQrsMUKs66T7puIKAWAVWUjQ=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=K/gADlPmCGKLbdfWNKGYqzXrFNqDyDqP4No2v6l3LeQ/tHT602qcMHCZHP5OLU/kc
	 TBPODZAcUhms2l8KpkP1Cl/64hj1azqIIMvrXGQXFMTPxKQ42QBRnCDs+XT/6wrUzB
	 jYvg9bjEpExpNVQeILZrGghxQMYV5uXjzCt6CQdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 471F2F8011C;
	Tue, 12 Apr 2022 11:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FE5F8014E; Sat,  9 Apr 2022 02:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56E91F80054
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 02:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56E91F80054
Received: by mail-io1-f72.google.com with SMTP id
 w28-20020a05660205dc00b00645d3cdb0f7so6723457iox.10
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 17:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=p4tSdoEjjT6Vgz/3cnEspxzOcbZnhthfckc5hh0b6Hc=;
 b=o1+jVseYVakZuKSOSjtnZOdPEeWyKJ3uQuEe+k7OjLWLT+tGovG4Fr7gkkiLx2Lvpz
 QtfjinvZLQxeR/8FaK34WD8tGPV/AvIAdWmA25DmyKFPsSwC8zcwqK0ErG0OleZDmzoE
 LOYUldgT6IJokHURg0sQGdCKtQT0jtkZGQ6Vgy2kWZr0cWxZ7dANSmWL7SwtIDZukH7m
 TBcxG7ndG5HExtepYFd//B4RmNdlt3y0GzVQcbGGHGpX/NYPzCAPFHG5ZyqIUX5jwpiM
 Uxji/9dRYGwr3K/P+E5noW2R0O7QveDABhhc4ZFulPxc8JpZdGXGibx6uYaIMiQheFfW
 K1hw==
X-Gm-Message-State: AOAM532Tq0fi9SzuZKYbCQkIM48RmkZKY68W7hNsN/xlNsrHFo1eRIf+
 VdXW2NZKNcY21k6gAajfv9NxGwQoVd8JpTlXHpsdDrfR7SJk
X-Google-Smtp-Source: ABdhPJx08oINfFjBwA2dtIUwkZzRTuzr96IgUhEdMLKVuPWd3luAlN8gTq4QWs3UgOLw9oGD7vUyFyMaZQQlqejbX5bdGobM/kfo
MIME-Version: 1.0
X-Received: by 2002:a92:cd84:0:b0:2ca:3bf1:fa08 with SMTP id
 r4-20020a92cd84000000b002ca3bf1fa08mr10043708ilb.219.1649465467091; Fri, 08
 Apr 2022 17:51:07 -0700 (PDT)
Date: Fri, 08 Apr 2022 17:51:07 -0700
In-Reply-To: <4181875.ejJDZkT8p0@leap>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003c427705dc2e1b1d@google.com>
Subject: Re: [syzbot] KASAN: null-ptr-deref Write in snd_pcm_format_set_silence
From: syzbot <syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, fmdefrancesco@gmail.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:51:33 +0200
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

Reported-and-tested-by: syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com

Tested on:

commit:         1a3b1bba Merge tag 'nfs-for-5.18-2' of git://git.linux..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=df0c3f2244c64190
dashboard link: https://syzkaller.appspot.com/bug?extid=205eb15961852c2c5974
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17fb5d30f00000

Note: testing is done by a robot and is best-effort only.
