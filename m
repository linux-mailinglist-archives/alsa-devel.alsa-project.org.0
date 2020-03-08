Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83F17D24D
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:50:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACDF1680;
	Sun,  8 Mar 2020 08:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACDF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653845;
	bh=QbJC4/96lR5EupLHOAhX1EOhGAALTNfJR1m7meDC6CI=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tcBc4FyqPEbhw6LUKp3aQYGbsZbkHSXJVwOand4c2IuH31RdttEMKmy9jDJRnZXsM
	 Tzm3O6qpqQd3PixBwn9evxrMQzWwvv4dBh6Hda6T6bcD2sjf8ZbhCTUimF0WF7emPz
	 XhCcNEldUgXodY+2PcfWIh3FxjXlCoVwBTBiXvxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBDBF8029B;
	Sun,  8 Mar 2020 08:46:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C1DF8021C; Sun,  8 Mar 2020 08:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DAB5F800B5
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 08:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DAB5F800B5
Received: by mail-il1-f198.google.com with SMTP id l10so5100954ilo.21
 for <alsa-devel@alsa-project.org>; Sat, 07 Mar 2020 23:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=Nrw2cp0bbSpLGRZ4GUAh0C3PbsjeyFM4BB9cqeU1ILc=;
 b=RqW7GK1f5wYyuTaPQvKuRNOQRKdZf5PrbtPdgSgXPyhaO9BjltKUVJjMGBGBP7EtWc
 zm+/ze7vTloY4FS1xehmpMQmfdv82X3cH/p/tAvlvm3uvdfWkar+WWQAXu9sVVPb0mTG
 GZ4CHkc4rwPzJKVpBicu4Gp7DbfuT9P1A7iDOs9e1LRNZfk0cyYLzuYikhwlNR/OAgQC
 kgTNGWJYsVrPgig23BUbvkzE91pTnIZBTBSCHSUhQ5jT2oP6A08YRFzWTW97FLrAdmTA
 R2lCfFAZNHfO7LOAU4H/DFXfq2Acz8vHLr2jAFKwuBAcwNf+LqsiEo2OZhGAP1MXWqXj
 Z7oQ==
X-Gm-Message-State: ANhLgQ0JGBuyiCBX0XJD/OJfomWrIyKnkTLaL54usw/iyJ8H/iAzc90v
 Z4oRbvy5RzsaTUFM1p01mtEQ/UBlh2qTLlvj5Og8ZfSXeOx8
X-Google-Smtp-Source: ADFU+vti+qKcPR/q+EH0OJg+DCaWyVsiPWSqvPGeLcShP48CU2z8PGEImsHyNDvy0tIir0jwu8FqLHXIPVcaj2uJUaolzgshL6fp
MIME-Version: 1.0
X-Received: by 2002:a5d:9c93:: with SMTP id p19mr8956311iop.81.1583652842882; 
 Sat, 07 Mar 2020 23:34:02 -0800 (PST)
Date: Sat, 07 Mar 2020 23:34:02 -0800
In-Reply-To: <000000000000b25ea005a02bcf21@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025d0e305a052e97f@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in resample_shrink
From: syzbot <syzbot+e1fe9f44fb8ecf4fb5dd@syzkaller.appspotmail.com>
To: alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 gustavo@embeddedor.com, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
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

syzbot has bisected this bug to:

commit ca0214ee2802dd47239a4e39fb21c5b00ef61b22
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Mar 22 15:00:54 2019 +0000

    ALSA: pcm: Fix possible OOB access in PCM oss plugins

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101931fde00000
start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=121931fde00000
console output: https://syzkaller.appspot.com/x/log.txt?x=141931fde00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
dashboard link: https://syzkaller.appspot.com/bug?extid=e1fe9f44fb8ecf4fb5dd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160e2e91e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=125f09fde00000

Reported-by: syzbot+e1fe9f44fb8ecf4fb5dd@syzkaller.appspotmail.com
Fixes: ca0214ee2802 ("ALSA: pcm: Fix possible OOB access in PCM oss plugins")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
