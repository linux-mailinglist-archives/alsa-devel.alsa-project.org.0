Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C11395931
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 12:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E33E850;
	Mon, 31 May 2021 12:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E33E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622457949;
	bh=H2lKsOhkKbQMP1MMXXOhAOoBnemsF+QQm2+NfxhfV0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ji7ySs/38MQlA1ZElbN3YT59gxHSo3o0Q+DQXxItGXLem19clXpAq0ZUaeiX2fOlC
	 eyatHcpbywExf61G1s8YZxrGg8H3YK1AHOm7UMeKqnltAqRB9/kDvE8GP8fgXrt0qG
	 Pk9f+DMyt2tfMT+WWO859vbxLZETRTirUIb3VQZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC3FF802E2;
	Mon, 31 May 2021 12:44:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836B3F802E2; Mon, 31 May 2021 12:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2240F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2240F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="UG44VNpi"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14VAemX0005914; Mon, 31 May 2021 10:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SVAol3IkzdCV9rAUTFwVdAtE3YampEO4twUVPgNA/0w=;
 b=UG44VNpiXS9cO57AK+hh6Y9kh1z51yxMC/y4tPff4QNHl44Ip0XS2TvMgw9WIN1igflA
 +XkZnEjs5D95NjdAsbPeO+gDFJxPlSh42aIc9MZgjc9X7kxqiaQ6ZhWajQ4BRS3jPtXe
 ZK+uZBkYPIidiJXhNvTFM1kv5YgygtLp1FzYuoLyilLyDr0ZVElvPF0H1tb4+rcbVshv
 wYo5U0+cy7S7Fm4MFLQEHhjVAOhCzPOE6LQJqKduyb5m/B/qCcTc2bqv97wiuUu7DS8g
 bYRrbo8wOkIYTY1HjANiVZNbiEBNe/aNquQEt5tYmgMoC4t2ZMsfnQEAL6dWmQLClcgB 7g== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38vng405eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 10:44:10 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14VAdwXn071944;
 Mon, 31 May 2021 10:44:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38ude61en4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 10:44:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14VAi9L8096696;
 Mon, 31 May 2021 10:44:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 38ude61em3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 10:44:09 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14VAi3EC025081;
 Mon, 31 May 2021 10:44:06 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 May 2021 03:44:02 -0700
Date: Mon, 31 May 2021 13:43:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210531104355.GZ24442@kadam>
References: <CAD-N9QVjhDDJxRnNrDzwt05BNijr1o11nE8xjvq8GrakEJ8EuQ@mail.gmail.com>
 <20210531044022.GU24442@kadam>
 <CAD-N9QWBBP6_Wwi4z3e4yJM-tS54=1=CcvAA+2__Qj8NsTLq9g@mail.gmail.com>
 <20210531070337.GV24442@kadam>
 <CAD-N9QU-uqFr=b1hMi1h1ytq2Uf2XKL44f9OHBRhM70zhkiO7w@mail.gmail.com>
 <CAD-N9QW5C2ssA7H_U+eiM=SbsPj29Ooo6Sk=r4d1qELbZQjuPA@mail.gmail.com>
 <20210531084613.GX24442@kadam>
 <CAD-N9QVAdaitDcM6BGfwvNR=gMf7G6DK00n0Ev6ucXc6xNFFpw@mail.gmail.com>
 <20210531093817.GY24442@kadam>
 <CAD-N9QUTZ49CvrhW76pTUDOp8y=29JXxR45Z_W53qVz0PJHVLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QUTZ49CvrhW76pTUDOp8y=29JXxR45Z_W53qVz0PJHVLw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: XCihNY3fDneTXD-F4HpgD00nJDfkn9H2
X-Proofpoint-GUID: XCihNY3fDneTXD-F4HpgD00nJDfkn9H2
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Mon, May 31, 2021 at 06:35:33PM +0800, Dongliang Mu wrote:
> On Mon, May 31, 2021 at 5:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, May 31, 2021 at 05:10:49PM +0800, Dongliang Mu wrote:
> > > Hi Dan,
> > >
> > > I wonder if we shall split the current patch into two patches, one
> > > patch for each memory leak. It is better to satisfy the rule - "one
> > > patch only fixes one issue".
> > >
> > > We should absolutely fix all these memory leaks. But one patch for two
> > > different bugs with different objects and different paths is not very
> > > suitable.
> > >
> >
> > I would just send one patch, because I only see it as one bug.  But you
> > do what you think is best.
> 
> If you think they are the same bug, that's great. Just send and apply
> only one patch as it is. I will not send version v2.

Sorry for the miscommunication.  That's not what I meant at all.

Your patch only introduces one put_device().  We need all five to fix
the bug, and we'll have to change the kfree(link_whatever).  Use
device_unregister() instead put_device().  Include a Reported-by with
the correct syzkaller information.

> 
> BTW, could you please show me the syzbot link for the bug you tried to
> resolve? If it is not from syzbot dashboard, can you please show the
> bug report?

What are you talking about?  I'm not trying to fix a syzkaller bug.  I'm
just reviewing your patch.

regards,
dan carpenter
