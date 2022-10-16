Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE5605C66
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D689506;
	Thu, 20 Oct 2022 12:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D689506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262053;
	bh=eZpLo25I2m8rKQ8+S7IWvS+8t3ApetbFBYM97B0jY0c=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MyBWyLoqwZ6CXu+CBssy9AyWWdmBaEv5dQ4noGzTgWL3V5qg4HhI7CShIn7x1KLSH
	 iZlQXkN5Ebt8Hks9AoecFEn95yj8QxXuNKb4FwxV7NJwcd4u65ulr+q7EJYujCYCcb
	 RmJ7oA8uR7J0aLeCZeOFF6wlk0ZouveOUBWx1P2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077CCF804E5;
	Thu, 20 Oct 2022 12:33:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C472EF80271; Sun, 16 Oct 2022 19:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32749F80149
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 19:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32749F80149
Received: by mail-io1-f69.google.com with SMTP id
 u11-20020a6b490b000000b006bbcc07d893so5717369iob.9
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 10:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9HnUcMrpaOy4ZoL5ypHWvjmoyr0LqAIz7W4hYAK2fiI=;
 b=WtqlbH33NFB0d16Jr15OKYtGo0yGjvZ61tA6/hqjqlOZmKVb+OBld5Gf74P4d71557
 xWh7ait9/Wjj6PQdkSXJExGnXmr3+pF5gBAD2FQs7oYmSC99rNSiYsV5RXLLCzdtjD3D
 4yFmtxPVQGhOH4GCkFuSfPBIrO08RXNftYYL+XxY7qQIbVjSfr2Bp8mWMt7ME68uKxeH
 3ARW5wEhQrk9oNc7E5kTJSW0lkEPnSU+Fz+1LWmKckkva5pPrJUUqHYsZY5B2bm216am
 jR4PbML0qipSIs/2IfqTxtcwvRBuQ9ZMEwTYZH2DmUQdnBYpij5z3PBrvA+rIODoED5S
 Vs4A==
X-Gm-Message-State: ACrzQf0hapxUs0/hvpSBAFSmx1w0Y/86dKTRDOJKYxIeBx3QKcSquv0Z
 BVqDKJNNr5XTfC5zxo+BiK5yh8tTC+HbDcJ5JfSM38CtneGS
X-Google-Smtp-Source: AMsMyM7qspteAsrK5Mgq3OaCHRR/wYcZjGnfTnfsk7GdfkdP3jG+nm1SS/vzaXgUf0BQGOpO5QgR8XlS8g1zTVGBw7BHfTVjcerF
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184c:b0:2fc:4f65:9dee with SMTP id
 b12-20020a056e02184c00b002fc4f659deemr3194230ilv.154.1665941663602; Sun, 16
 Oct 2022 10:34:23 -0700 (PDT)
Date: Sun, 16 Oct 2022 10:34:23 -0700
In-Reply-To: <0000000000009d327505b0999237@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000013612005eb2a4525@google.com>
Subject: Re: [syzbot] INFO: rcu detected stall in batadv_nc_worker (3)
From: syzbot <syzbot+69904c3b4a09e8fa2e1b@syzkaller.appspotmail.com>
To: a@unstable.cc, alsa-devel@alsa-project.org, 
 b.a.t.m.a.n@lists.open-mesh.org, broonie@kernel.org, davem@davemloft.net, 
 dvyukov@google.com, edumazet@google.com, hdanton@sina.com, jhs@mojatatu.com, 
 jiri@resnulli.us, kuba@kernel.org, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, mareklindner@neomailbox.ch, 
 netdev@vger.kernel.org, pabeni@redhat.com, perex@perex.cz, 
 povik+lin@cutebit.org, steve@sk2.org, sven@narfation.org, 
 sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 tiwai@suse.com, tonymarislogistics@yandex.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:16 +0200
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

commit f8a4018c826fde6137425bbdbe524d5973feb173
Author: Mark Brown <broonie@kernel.org>
Date:   Thu Jun 2 13:53:04 2022 +0000

    ASoC: tas2770: Use modern ASoC DAI format terminology

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164d4978880000
start commit:   55be6084c8e0 Merge tag 'timers-core-2022-10-05' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=154d4978880000
console output: https://syzkaller.appspot.com/x/log.txt?x=114d4978880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df75278aabf0681a
dashboard link: https://syzkaller.appspot.com/bug?extid=69904c3b4a09e8fa2e1b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e2e478880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149ca17c880000

Reported-by: syzbot+69904c3b4a09e8fa2e1b@syzkaller.appspotmail.com
Fixes: f8a4018c826f ("ASoC: tas2770: Use modern ASoC DAI format terminology")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
