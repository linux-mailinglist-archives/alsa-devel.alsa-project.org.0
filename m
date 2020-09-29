Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168327D12F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 16:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E2418B5;
	Tue, 29 Sep 2020 16:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E2418B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601389964;
	bh=FrwpsUJb1or/8HuNZAIWorzieKrI7oOlB/R8990BS4Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gha5vKjiyx/BrFnhA6U++CSb9yeF/Y2qDdJSczLSNRy1sa86tw5uNzBZms+TGJPcV
	 x9U+FFatr6QlTbw7YsNeSKbUpgB0iwvYQXVk4IThIVU6cV9mqrz6G8sJyzzApywuIu
	 X48UfL7YtBa0C/iF/xQWJdkYDnoDK0FL6nMQb8Z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28987F802DB;
	Tue, 29 Sep 2020 16:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1DEF802D2; Tue, 29 Sep 2020 16:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADA7FF802A7
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 16:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA7FF802A7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E61E1AD0F;
 Tue, 29 Sep 2020 14:30:31 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5BF841E12E9; Tue, 29 Sep 2020 16:30:31 +0200 (CEST)
Date: Tue, 29 Sep 2020 16:30:31 +0200
From: Jan Kara <jack@suse.cz>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: BUG: unable to handle kernel paging request in dqput
Message-ID: <20200929143031.GP10896@quack2.suse.cz>
References: <00000000000067becf05b03d8dd6@google.com>
 <s5htuvjpujt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5htuvjpujt.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org, adi@adirat.com,
 kadlec@blackhole.kfki.hu, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, kaber@trash.net,
 syzbot <syzbot+f816042a7ae2225f25ba@syzkaller.appspotmail.com>,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, jack@suse.com,
 tiwai@suse.com, davem@davemloft.net, pablo@netfilter.org
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

On Sun 27-09-20 09:07:02, Takashi Iwai wrote:
> On Sat, 26 Sep 2020 22:48:15 +0200,
> syzbot wrote:
> > 
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=17930875900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=af502ec9a451c9fc
> > dashboard link: https://syzkaller.appspot.com/bug?extid=f816042a7ae2225f25ba
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133783ab900000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bb5973900000
> > 
> > The issue was bisected to:
> > 
> > commit 1d0f953086f090a022f2c0e1448300c15372db46
> > Author: Ioan-Adrian Ratiu <adi@adirat.com>
> > Date:   Wed Jan 4 22:37:46 2017 +0000
> > 
> >     ALSA: usb-audio: Fix irq/process data synchronization
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=133362c3900000
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=10b362c3900000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=173362c3900000
> 
> This commit looks really irrelevant from the Oops code path.
> It must be a different reason.

Yeah, it seems the bisection got confused because it hit a different error
during the bisection. Looking at the original oops, I think the actual
reason of a crash is that quota file got corrupted in a particular way.
Quota code is not very paranoid when checking on disk contents. I'll work
on adding more sanity checks to quota code...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
