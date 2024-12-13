Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88B9FDED7
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3F9604F1;
	Sun, 29 Dec 2024 13:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3F9604F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735476918;
	bh=estDcRIo9Ps/V70akpJUOEghJnsuWqhCaWrCUbyCJD8=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vJNbV+rQMJ2ci+IA55CoPL8Esbj2yQ6+uhmUPJKV0wHUR3kpCbWuuSXbRLqgx0xPj
	 kW3qyrRcM6/udubhVBddW9sevp3oSfu0vwV651cq4gyKxbvP/t9WpEjpXzid67nrmp
	 x9zLh7grL5ZNNqcW8lWvRCfpTuw5lu/oycHztM3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51860F805C3; Sun, 29 Dec 2024 13:54:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C4AF805BB;
	Sun, 29 Dec 2024 13:54:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E60EF80212; Fri, 13 Dec 2024 12:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DF34F8011B
	for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2024 12:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF34F8011B
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a814bfb77bso26875905ab.0
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Dec 2024 03:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090182; x=1734694982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6njtYwuuhlt+oJFig9mpzBM61IwvHlJyPr4iUNckOYs=;
        b=mstG4rd/5AyB1xRfA/WHKGach4K80ZVV5bBL8DVoodBYDNxcclFBvECi2ei8nVJmJk
         iY92CQ6Iy5QspLPyrb9Ym6/9bNzSzcRc4KhvzOQUVc3BFRvYwVOjfjm4sbrcicLLZUO0
         7DfbshuiIvuxMsV0wzYrCOCte7/ubZaggb2vZIL9oIpoGouHxSmAGFa3BBBitRJB9eCo
         FeOOrnWbEuk599bcQkDW5iPOrxaU2PA27umjFzol+jcCcUSoFR0ChaZZoe6aF53ZmZMM
         y2GN0mrX1whrUCSgSeBt8LOZn0Mo9KxCw16YxFE+vM1BaUkk5qBYGb89jd5JzST4ipfX
         F3vg==
X-Gm-Message-State: AOJu0YzlFSwinm7Pmb04oR5Ut6GKZvw78dGJmcBPS48vDo0LT2uNBBdP
	VWp5gLWtEhmbVc0Ui8ZndGk3EZPilX+yeK9uTx4bh135YCzwq+W8hpMDpEnKFmo2W9aLiOlRybh
	xMyT+VB8KVemDdvPk87jFjC4l43u0r3bKnjBfiAGUY17J/WNHhqARlmY=
X-Google-Smtp-Source: 
 AGHT+IHDAFY/TJurokeAD58Ic6k8Gv/vDg0siFvYAkQ1NFVck19SuU1w02dmhAQMhWSSadJDht8QTW+J8baOcxgzM5T4zE7FxWYz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c47:b0:3a7:c81e:825f with SMTP id
 e9e14a558f8ab-3b02d78812bmr23955515ab.9.1734090182295; Fri, 13 Dec 2024
 03:43:02 -0800 (PST)
Date: Fri, 13 Dec 2024 03:43:02 -0800
In-Reply-To: <675b61aa.050a0220.599f4.00bb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675c1dc6.050a0220.17d782.000c.GAE@google.com>
Subject: Re: [syzbot] [tipc?] kernel BUG in __pskb_pull_tail
From: syzbot <syzbot+4f66250f6663c0c1d67e@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, asml.silence@gmail.com, axboe@kernel.dk,
	clm@fb.com, davem@davemloft.net, dennis.dalessandro@cornelisnetworks.com,
	dsterba@suse.com, edumazet@google.com, eric.dumazet@gmail.com,
	horms@kernel.org, io-uring@vger.kernel.org, jasowang@redhat.com,
	jdamato@fastly.com, jgg@ziepe.ca, jmaloy@redhat.com, josef@toxicpanda.com,
	kuba@kernel.org, kvm@vger.kernel.org, leon@kernel.org,
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, miklos@szeredi.hu, mst@redhat.com,
	netdev@vger.kernel.org, pabeni@redhat.com, pbonzini@redhat.com,
	perex@perex.cz, stable@vger.kernel.org, stefanha@redhat.com,
	syzkaller-bugs@googlegroups.com, tipc-discussion@lists.sourceforge.net,
	tiwai@suse.com, viro@zeniv.linux.org.uk,
	virtualization@lists.linux-foundation.org, ying.xue@windriver.com
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3xh1cZwkbALMlrsdTeeXkTiibW.ZhhZeXnlXkVhgmXgm.Vhf@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J2UJG2HFTHQKNK7HQUDWBY4K3D3YBRPF
X-Message-ID-Hash: J2UJG2HFTHQKNK7HQUDWBY4K3D3YBRPF
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:54:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2UJG2HFTHQKNK7HQUDWBY4K3D3YBRPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

syzbot has bisected this issue to:

commit de4f5fed3f231a8ff4790bf52975f847b95b85ea
Author: Jens Axboe <axboe@kernel.dk>
Date:   Wed Mar 29 14:52:15 2023 +0000

    iov_iter: add iter_iovec() helper

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17424730580000
start commit:   96b6fcc0ee41 Merge branch 'net-dsa-cleanup-eee-part-1'
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c24730580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c24730580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1362a5aee630ff34
dashboard link: https://syzkaller.appspot.com/bug?extid=4f66250f6663c0c1d67e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166944f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1287ecdf980000

Reported-by: syzbot+4f66250f6663c0c1d67e@syzkaller.appspotmail.com
Fixes: de4f5fed3f23 ("iov_iter: add iter_iovec() helper")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
