Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8B50B93A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C045617F6;
	Fri, 22 Apr 2022 15:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C045617F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635694;
	bh=bk1RzOmWO6+F8HELlpkoiR1AiCW8egI0XWv7ebz23vU=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F7htT4vNkof17SqPYEaWnz0UANwT11awJs4jAKgyVIu76oZSgC3CXqf//Vi7Ilq1V
	 K0ZKUHaSiUpcbELCGdDA0wuta9XbyCpLWlqymIP4bOmuILmQh0bAiFce/Xzbiblfj9
	 EidTDw2gkqJwEVbzcoUK0jKuPMipzdd7Dpc+SwhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B349F80C0B;
	Fri, 22 Apr 2022 15:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7145BF80125; Wed, 20 Apr 2022 23:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8614F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8614F800F8
Received: by mail-il1-f200.google.com with SMTP id
 l2-20020a056e0212e200b002cc235e7488so1606396iln.21
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 14:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=6orOFsy74rNN5Tn6BrnH+g4zIxPrQE5SyUBi8riN0xM=;
 b=I4F1krMOibpKaTH9PnqZWCI0Aj/Ad+w7diYRgnPZU4WC1ft68HQLCz18Zej0S22iqk
 RJqlw48502A5fjRUMmFU2MNcs2RrwP7MYECxuX+r9j/ztibWC8J+TUSLTBRKtyomHSXZ
 m5pk6hj3T82pNJX0wrhUmiHZZit05dKNSf7/XIFypxLp58/k56pes8u/yWYdUjSj6XAS
 ryz6Qaq4UT5/jvkSWHA5TgTRdyfVcAPTTZmTvH/A5jbqv1efi2YH/TMtJtGC0h+eWriI
 3T+h8BOHc/uG9o3DnGP14+rgSKtQ2bFCZ5mrNvOnGcpLD+Ppfgr8Wkw7woilAxE4j7VX
 CLww==
X-Gm-Message-State: AOAM532fuEGDr/OWKZU2Xuy/5jAL+QvIkqwK/ZMJj2LL0atYJyUPWN6S
 UvA4cuZXPO9MsSn6s+ZFKfDvQ4gWjK7mFnZq/UNa6hHKZ6aC
X-Google-Smtp-Source: ABdhPJzgN+9LkncxNGek29FEzvDqYn7T+0paLfjRepDM958YF10ope2I5QGSX4+kSi2/D4KHU/1JAYks7qeWBzSeF0qDXlyP38dc
MIME-Version: 1.0
X-Received: by 2002:a05:6638:19c8:b0:328:6a22:8258 with SMTP id
 bi8-20020a05663819c800b003286a228258mr9997908jab.103.1650490089346; Wed, 20
 Apr 2022 14:28:09 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:28:09 -0700
In-Reply-To: <0000000000004ecea505c28504b9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007b1cbd05dd1cab5a@google.com>
Subject: Re: [syzbot] general protection fault in pm_qos_update_target
From: syzbot <syzbot+f7d9295d2565ee819d21@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, len.brown@intel.com, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, pavel@ucw.cz, 
 perex@perex.cz, rjw@rjwysocki.net, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
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

syzbot suspects this issue was fixed by commit:

commit 3c3201f8c7bb77eb53b08a3ca8d9a4ddc500b4c0
Author: Takashi Iwai <tiwai@suse.de>
Date:   Tue Mar 22 17:07:19 2022 +0000

    ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=104e3034f00000
start commit:   dbb5afad100a ptrace: make ptrace() fail if the tracee chan..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=91ff0467ce169bc
dashboard link: https://syzkaller.appspot.com/bug?extid=f7d9295d2565ee819d21
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c75e73d00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
