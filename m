Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E419690F82
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 10:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8791667;
	Sat, 17 Aug 2019 10:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8791667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566030802;
	bh=aXiloChMUsy7qn/I/sn1ZCdJXBBqUyF0azxgVE2Bbf4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvTC5FsRNOck2btM+W/5JkC+C93ZTQVqNATvqrz6Etkqnh4tEwRAgYOmYmwYggJ36
	 Vh7wX4N8ezOse9Kl7Qag7brYs6iox0O/1AyXjCkcL4gLsMnB4LSvQ83eg8uaSFjhpu
	 JCovS45uJ5RReEwylzTcN7LbOalodRJJI9RvdUQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB2CF801DA;
	Sat, 17 Aug 2019 10:31:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72769F8044C; Sat, 17 Aug 2019 10:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FAF9F801DA
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 10:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FAF9F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bnEjnPLg"
Received: from localhost (unknown [171.76.122.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB55720880;
 Sat, 17 Aug 2019 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566026154;
 bh=CE4AEJvu5Hekiw/HsMR351wf16SY1xY2kqztonk4go4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnEjnPLgiNNg4bURqzWsb9i5145OE7C6QHYiRcq9EdT0yPJ8vUQtjv10TeCB+SrMz
 2rE6kZ56/Y8k+9yaDfDXB9ztHZALG5d+HI4LAKcrt8x8PGUGZD6gtmaUpy5xLa9qTA
 1K8U3xu2c9cLnkmq15mkyDvWfsOQVY9VuCz7d3bU=
Date: Sat, 17 Aug 2019 12:44:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190817071440.GD12733@vkoul-mobl.Dlink>
References: <000000000000b4126c059030cfb6@google.com>
 <63c0dc1e-323d-d46e-2d4a-b5b6d6916042@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63c0dc1e-323d-d46e-2d4a-b5b6d6916042@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, nstange@suse.de, gregkh@linuxfoundation.org,
 x86@kernel.org, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, yakui.zhao@intel.com, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, sanyog.r.kale@intel.com,
 syzbot <syzbot+6593c6b8c8b66a07cd98@syzkaller.appspotmail.com>,
 tglx@linutronix.de
Subject: Re: [alsa-devel] INFO: rcu detected stall in __do_softirq
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 16-08-19, 09:55, Srinivas Kandagatla wrote:
> =

> =

> On 16/08/2019 01:10, syzbot wrote:
> > syzbot has bisected this bug to:
> > =

> > commit 2aeac95d1a4cc85aae57ab842d5c3340df0f817f
> > Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Date:=A0=A0 Tue Jun 11 10:40:41 2019 +0000
> > =

> >  =A0=A0=A0 soundwire: add module_sdw_driver helper macro
> =

> Not sure how adding a macro with no users triggers this rcu stall.

And config used doesn't have soundwire set :D
> =

> BTW this was in mainline since rc1.

This is caused by something else!

> =

> --srini
> =

> > =

> > bisection log:=A0 https://syzkaller.appspot.com/x/bisect.txt?x=3D114b45=
ee600000
> > start commit:=A0=A0 882e8691 Add linux-next specific files for 20190801
> > git tree:=A0=A0=A0=A0=A0=A0 linux-next
> > final crash:=A0=A0=A0 https://syzkaller.appspot.com/x/report.txt?x=3D13=
4b45ee600000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D154b45ee600=
000
> > kernel config:=A0 https://syzkaller.appspot.com/x/.config?x=3D466b331af=
3f34e94
> > dashboard link:
> > https://syzkaller.appspot.com/bug?extid=3D6593c6b8c8b66a07cd98
> > syz repro:=A0=A0=A0=A0=A0 https://syzkaller.appspot.com/x/repro.syz?x=
=3D16b216b2600000
> > =

> > Reported-by: syzbot+6593c6b8c8b66a07cd98@syzkaller.appspotmail.com
> > Fixes: 2aeac95d1a4c ("soundwire: add module_sdw_driver helper macro")
> > =

> > For information about bisection process see:
> > https://goo.gl/tpsmEJ#bisection

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
