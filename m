Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF07A6F9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 13:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606FA17DC;
	Tue, 30 Jul 2019 13:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606FA17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564486266;
	bh=7juOt4Ueu3De8owHTG0VKmhKDJE1DBQXEFfOBEh8iLk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M0IyFjHGDKSEaB9dB3pAs7T4JaiBohGbNJUNZk9FAzZSz40PuNtw/onVCqgLJBJ3X
	 X0PrS3Na3BN0Cx4ik8MsymqaOMiui4DP9TlGaFOMVfEWdTJv5mKT54d09O2MnrJevX
	 37WZct3lH3yCpomT7fDpS442p/5HgdXu5BAbK0mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D49F80482;
	Tue, 30 Jul 2019 13:29:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD787F804CA; Tue, 30 Jul 2019 13:29:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,
 RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165]) by alsa1.perex.cz (Postfix) with SMTP id B177AF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 13:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B177AF800BF
Received: from unknown (HELO localhost.localdomain)([222.131.77.31])
 by sina.com with ESMTP
 id 5D402A0300004B7E; Tue, 30 Jul 2019 19:29:09 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 21102245091830
From: Hillf Danton <hdanton@sina.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 Jul 2019 19:28:56 +0800
Message-Id: <20190730112856.876-1-hdanton@sina.com>
MIME-Version: 1.0
Thread-Topic: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix gpf in
 snd_usb_pipe_sanity_check
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Konovalov <andreyknvl@google.com>,
 syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix gpf in
	snd_usb_pipe_sanity_check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 30 Jul 2019 18:08:02 +0800 Takashi Iwai wrote:
>
> You don't have to copy the whole these texts at all.
> In general, it'd suffice to point out the dashboard URL, and if the
> stack trace is mandatory, drop the useless hex numbers and just show
> the significant part of the stack trace.
>
I am used to give readers as much info as appropriate, and learning that
an URL is enough in cases like this one. I will send you the pruned
version next time.

> > It was introduced in commit 801ebf1043ae for checking pipe and endpoint
> > types. It is fixed by adding a check of the ep pointer in question.
> >
> > Reported-by: syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
> > Fixes: commit 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
>
> Drop "commit" word.
>
Yes, Sir.

> > Cc: Andrey Konovalov <andreyknvl@google.com>
> > Signed-off-by: Hillf Danton <dhanton@sina.com>
> > ---
There is a typo, s/dhanton/hdanton/, as you pointed out in another mail.

> > This is to make syzbot happy for now and in long run we can make
> > snd_usb_pipe_sanity_check() available outside sound/usb by making
> > usb_urb_ep_type_check() a wrapper of the former. We will revisit
> > sound/usb once when things in the usb/core get in place.
>
> Actually I expected to apply the "long-term" fix now.

There is change in usb/core included in that fix as you see, and
according to the rule, one fix a patch, it is better and simpler
IMO to fix the sound part first.

> The same kind
> of fix was already submitted from me (<s5hlfwn376e.wl-tiwai@suse.de>),
> but I didn't merge it because working on the usb core helper would be
> a saner solution.
>
Feel free to merge that, Sir.

Thanks
Hillf

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
