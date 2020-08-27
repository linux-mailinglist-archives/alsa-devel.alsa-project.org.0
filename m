Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98687254B70
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 19:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C8217BA;
	Thu, 27 Aug 2020 19:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C8217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547781;
	bh=NJXJs8mG124E/Dq7JG57w/b5om6P73IX0kaUZtkEQ8k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aw9jNEr9U5iWcptyQfB1etYuIy0JTwd0lDs7ZOlwEK33ShRooWMA67m+n8fPlP6Ys
	 MHlKZhvs7FxKmiTGD6P3iLArFiEQNg0skj9e8WIme9uiT0uCazc4yqaogJfja33HWB
	 FafhW0ddAxt1H8N4TUx/L/slLPdWqvFay8IwfDyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF09AF80361;
	Thu, 27 Aug 2020 18:51:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712F1F8016F; Thu, 27 Aug 2020 18:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F14E3F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 18:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F14E3F80105
Received: by nautica.notk.org (Postfix, from userid 1001)
 id CB8B4C01B; Thu, 27 Aug 2020 18:20:38 +0200 (CEST)
Date: Thu, 27 Aug 2020 18:20:23 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: INFO: task can't die in p9_fd_close
Message-ID: <20200827162023.GD31016@nautica>
References: <000000000000ca0c6805adc56a38@google.com>
 <20200826104919.GE4965@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826104919.GE4965@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:46 +0200
Cc: lucho@ionkov.net, alsa-devel@alsa-project.org,
 syzbot <syzbot+fbe34b643e462f65e542@syzkaller.appspotmail.com>,
 ericvh@gmail.com, netdev@vger.kernel.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 rminnich@sandia.gov, kuba@kernel.org, daniel.baluta@nxp.com,
 davem@davemloft.net
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

Mark Brown wrote on Wed, Aug 26, 2020:
> On Wed, Aug 26, 2020 at 03:38:15AM -0700, syzbot wrote:
> 
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10615b36900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a61d44f28687f508
> > dashboard link: https://syzkaller.appspot.com/bug?extid=fbe34b643e462f65e542
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15920a05900000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a78539900000
> > 
> > The issue was bisected to:
> > 
> > commit af3acca3e35c01920fe476f730dca7345d0a48df
> > Author: Daniel Baluta <daniel.baluta@nxp.com>
> > Date:   Tue Feb 20 12:53:10 2018 +0000
> > 
> >     ASoC: ak5558: Fix style for SPDX identifier
> 
> This bisection is clearly not accurate, I'm guessing the bug is
> intermittent and it was just luck that landed it on this commit.

It's a bug that's been present since day 1 pretty much.

I have a fix that had been overcooking for a while which I had planned
to take in this cycle -- I'll submit to -next during next week, so
hopefully syzbot will be able to spend its time more usefully after
that.

-- 
Dominique
