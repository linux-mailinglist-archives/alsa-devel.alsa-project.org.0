Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8739339FD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CEF4E64;
	Wed, 17 Jul 2024 11:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CEF4E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208938;
	bh=0ZwX0N6cmTcPU6cUOhbMilU6Yelh76r3rbVgmSzYq0s=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JePJddbTR6HkUtvZx9wkKTfTNIDHcuLP6ryHE9R1KJFpl24rTww+9wibLAYO9sBrr
	 D5ChF13FsxeZNJmRqxNO3zXRd/JzWZjC1sJ+09IOly4a57cFG80bFLckFIUqvwOT31
	 ZMkvt/YgWVQx8dw71B0loKKe1jQAmZgk5PFA6sGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC53FF805A1; Wed, 17 Jul 2024 11:34:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E359EF805AE;
	Wed, 17 Jul 2024 11:34:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCBF7F801F5; Thu, 11 Jul 2024 13:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F12F8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 13:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F12F8013D
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-804b8301480so81521439f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jul 2024 04:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696263; x=1721301063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxg3UJPkzx7M07gbZ9SOx2eod/ecUaN/p77xgE8W3KQ=;
        b=sJ8eiq/8HhR+7xLDrOGwP6h2AOd5IcX5sNDX3xBnAleIjbdacdCZaQX6Ohoma2B5Uh
         HmwXQhISxMeNHJy0hkFsgXKuB1suHBubcvaJHGfDaOR8oXVU5Ubl5JP1FQh9cdRlWCiy
         hXFqlMLviwCfMkjxAb6dJ8/1gA+/1w0qO9hsr6gh4T/1eZ+CxXFIGBVDKFm0hqADaSLz
         khY7pZaVfXdUlyhAXtqvQUMjcCDlw4epQHl6rmy3J/X6cy9kGR4Zu/bzRlXHPzSUyMzM
         BkcakbgVm6FdZ8NvonauAHWXmpOg7rFO+/1nmwPYmAf3TXbSuFoXcco1r6k+DCfHpFFs
         ubEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCBLVWOluLSB7EJJ99mDpU8o4y6FE9+HHCZrcjtZnBPTqYe4aJ7/YEYI/fXJhgtx/vyjcKrZINxjIKiK2U0Yh7gu02y3w3oeaWeZc=
X-Gm-Message-State: AOJu0YwGLZb5rUn95oKnA+aS5N+4avlZ7foeBbLnH+9Q2jZlwvB/vT7K
	VyvqqRFSG0a0V1zwLsFmyOoRnpsPl13YnYeFpMdjVgyNuEDtikv+cguUX1fVqF/wmyou6KOdeEn
	bZZlyb31ZV4O7JFbocJaVWfkq2laADE/iENNHpjOOs6fpZQdvP36LHEE=
X-Google-Smtp-Source: 
 AGHT+IGBjGi2u0vQwkoJ9T1yTRI18dBxcqWGmgtHOfjU9ZTmOOpU364A1mpSXTEejum4DWNhNasVTJ0VRDyOX29dVNI3xFSozQ7R
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8601:b0:4c0:9a05:44c4 with SMTP id
 8926c6da1cb9f-4c0b24e9f62mr482571173.0.1720696262760; Thu, 11 Jul 2024
 04:11:02 -0700 (PDT)
Date: Thu, 11 Jul 2024 04:11:02 -0700
In-Reply-To: <0000000000008ac77c0615d60760@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000822b8b061cf6d171@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in sys_wait4 (4)
From: syzbot <syzbot+6969434de600a6ba9f07@syzkaller.appspotmail.com>
To: alsa-devel-bounces@alsa-project.org, alsa-devel@alsa-project.org,
	broonie@kernel.org, davem@davemloft.net, dcaratti@redhat.com,
	edumazet@google.com, jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org,
	lenb@kernel.org, lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org, oder_chiou@realtek.com,
	pabeni@redhat.com, pctammela@mojatatu.com, perex@perex.cz, rafael@kernel.org,
	shuah@kernel.org, shumingf@realtek.com, syzkaller-bugs@googlegroups.com,
	tiwai@suse.com, vinicius.gomes@intel.com, vladimir.oltean@nxp.com,
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3xr2PZgkbALstz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 56SVU4BYIIA7A4JFI2IHZLDC2KV6MJXR
X-Message-ID-Hash: 56SVU4BYIIA7A4JFI2IHZLDC2KV6MJXR
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:34:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56SVU4BYIIA7A4JFI2IHZLDC2KV6MJXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

syzbot suspects this issue was fixed by commit:

commit fb66df20a7201e60f2b13d7f95d031b31a8831d3
Author: Vladimir Oltean <vladimir.oltean@nxp.com>
Date:   Mon May 27 15:39:55 2024 +0000

    net/sched: taprio: extend minimum interval restriction to entire cycle too

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10593441980000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe78468a74fdc3b7
dashboard link: https://syzkaller.appspot.com/bug?extid=6969434de600a6ba9f07
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1091a5f6180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a22c13180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: net/sched: taprio: extend minimum interval restriction to entire cycle too

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
