Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1A7254B6B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 19:02:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29CE182B;
	Thu, 27 Aug 2020 19:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29CE182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547747;
	bh=7gGlzOt2LJFLKWQA79qDRg/oCSrvdjGZXwv4df3FRIc=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XpJ1cYiAJpgUL3AF8Z6Uwzyp19xow2q0llmxqq79kk6I4GSu1MTsxFnwRt1lzpsPX
	 WsC5BoTp+c4Cmai9NH9/M5MLcX1TzTgVT5GT5X3TEom/3DGkGj6xaZMo0InvGgoIwI
	 Fgug5rT+1zjz6OuNIU1CkdUsR3I5ydAI6YCen9JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 970DAF8034E;
	Thu, 27 Aug 2020 18:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B40DF8016F; Thu, 27 Aug 2020 13:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374CFF80085
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 13:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374CFF80085
Received: by mail-il1-f197.google.com with SMTP id q19so3887478ilt.13
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 04:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=pwNkg447Nvt9DP6BHMmIFvIl++UIZS1Yr2SQgfIT/uI=;
 b=WYe1CHFcTWzjMS+RaUEWNkgQTjYXnjYHB68001u44yD+97+ZZK4jf7bRIcmatodE6k
 MJ3H9FuMTD52ezgAOAMjtiB4PllyFJt3BaW4js00E/TMZjLtN4GpFbukFWqEYRNACQIu
 xgO31FfsZ24y4XUVRkOAfhEVZ99YC26XgQn+9RERofeXSrV0qBEznw797cbr47rUnDi9
 5ltiahilGCUUR79+hhpypb05HKcIlp75SsZm6+2j6vQL289ynQVGOWRrAizllL4zcoF9
 YlvcBorc9+0bxbeuVNKLhntv6pr3SEjiA7nP2eFn/Z1U3qB5oK4Z/LZyG4GnWoRb6+TK
 UeUg==
X-Gm-Message-State: AOAM533CHqN2VRESNwY4aXsaHD3JT/UZiNNxeS5pQdtC89Wt9vAeFVoi
 3bqNSnsSWUsZiCDj472X+D9m3mmBwR1rJJhdhmepzGA4yHiZ
X-Google-Smtp-Source: ABdhPJxDRrpZipHuFzQ757CmsZAIU/5jJofSaXf8x7xPsEtScojRDRY1s41xcjRSEzQrCEIS6tw+8a9moYMqcFRKFDnWyN4YaXIz
MIME-Version: 1.0
X-Received: by 2002:a02:234c:: with SMTP id u73mr19132402jau.141.1598526846052; 
 Thu, 27 Aug 2020 04:14:06 -0700 (PDT)
Date: Thu, 27 Aug 2020 04:14:06 -0700
In-Reply-To: <00000000000068340d05add74c29@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2adea05adda0870@google.com>
Subject: Re: WARNING: ODEBUG bug in get_signal
From: syzbot <syzbot+e3cf8f93cf86936710db@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, arnd@arndb.de, axboe@kernel.dk, 
 baolin.wang@linaro.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maz@kernel.org, oleg@redhat.com, perex@perex.cz, 
 peterz@infradead.org, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:46 +0200
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

syzbot has bisected this issue to:

commit a9ed4a6560b8562b7e2e2bed9527e88001f7b682
Author: Marc Zyngier <maz@kernel.org>
Date:   Wed Aug 19 16:12:17 2020 +0000

    epoll: Keep a reference on files added to the check list

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15e57751900000
start commit:   15bc20c6 Merge tag 'tty-5.9-rc3' of git://git.kernel.org/p..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17e57751900000
console output: https://syzkaller.appspot.com/x/log.txt?x=13e57751900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=978db74cb30aa994
dashboard link: https://syzkaller.appspot.com/bug?extid=e3cf8f93cf86936710db
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13236eb6900000

Reported-by: syzbot+e3cf8f93cf86936710db@syzkaller.appspotmail.com
Fixes: a9ed4a6560b8 ("epoll: Keep a reference on files added to the check list")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
