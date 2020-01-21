Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050671440A9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 16:41:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1111660;
	Tue, 21 Jan 2020 16:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1111660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579621281;
	bh=pf0bwxJUXf+wzbTERGOFdsdp3rFwInXOmlOirJUbaBU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqEvDEu884VCrX7pj6cbkefkBP32XVl+XmBcTYiLKPFC0HR5OybzH5/OdZkXyDA+v
	 OjYofKgkkCm6w75Nze/xBwLWsf4BXJo8mJq+238WVbkk9p2BXdK/SpeWptSiT9Kwyz
	 jBUvb8G/YGpKQIBHXWmzDjYeTHUhk5kAimP88ARg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2FF0F8015B;
	Tue, 21 Jan 2020 16:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE982F801EC; Tue, 21 Jan 2020 16:39:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00A7CF8015B
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 16:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00A7CF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Ndp7Y68g"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00LFcpUq013067;
 Tue, 21 Jan 2020 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=eQ4ik+FTutWCXRnK1enaA7jtow4c1d1i8Ndq/T4zYAI=;
 b=Ndp7Y68gPe+ml2WETz8GRmm7ySYkYQI0NldiFD/VFx3eOhu2KOhRQJ2/rtID7DxKaUiF
 V1hFJQ02DSIO0dBiXRER6K0C+1rw6ALZcMNLl03KL7CUYUmlH3M+2i3srS3GwsUGl9nf
 oS2iPLNMGx1dPrL0JdDQHd+hxwrqeUjLRCmKLacBsoPY3Uypu9HEft9cP4FTQ79m2zHm
 xyT4max28qK6ZvBEl8M0aMENvPC644cSJCL2CCNrEZpo0iZ1xfZoN3q4oNpH5lNp3AQK
 5DJ+KXsmyYXeE5IzoderN7nI407zhhSvJqSQFWwYfkrRoztrzwkQtdbiCiM5/fY+/qQC lA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xksyq5rv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 15:39:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00LFcV90056940;
 Tue, 21 Jan 2020 15:39:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2xnpfp7rte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 15:39:24 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00LFdFaW019191;
 Tue, 21 Jan 2020 15:39:17 GMT
Received: from kadam (/10.175.179.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Jan 2020 07:39:14 -0800
Date: Tue, 21 Jan 2020 18:39:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: syzbot <syzbot+3967c1caf256f4d5aefe@syzkaller.appspotmail.com>
Message-ID: <20200121153904.GA9856@kadam>
References: <000000000000de3c7705746dcbb7@google.com>
 <0000000000002c243a0597dc8d9d@google.com>
 <20191121201433.GD617@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121201433.GD617@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001210125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9506
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001210125
Cc: gerrit@erg.abdn.ac.uk, alsa-devel@alsa-project.org, dccp@vger.kernel.org,
 tiwai@suse.de, netdev@vger.kernel.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, davem@davemloft.net
Subject: Re: [alsa-devel] KASAN: use-after-free Read in ccid_hc_tx_delete
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

On Thu, Nov 21, 2019 at 11:14:33PM +0300, Dan Carpenter wrote:
> On Thu, Nov 21, 2019 at 07:00:00AM -0800, syzbot wrote:
> > syzbot has bisected this bug to:
> > 
> > commit f04684b4d85d6371126f476d3268ebf6a0bd57cf
> > Author: Dan Carpenter <dan.carpenter@oracle.com>
> > Date:   Thu Jun 21 08:07:21 2018 +0000
> > 
> >     ALSA: lx6464es: Missing error code in snd_lx6464es_create()
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10dd11cae00000
> > start commit:   eb6cf9f8 Merge tag 'arm64-fixes' of git://git.kernel.org/p..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=12dd11cae00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14dd11cae00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c8970c89a0efbb23
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3967c1caf256f4d5aefe
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11022ccd400000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124581db400000
> > 
> > Reported-by: syzbot+3967c1caf256f4d5aefe@syzkaller.appspotmail.com
> > Fixes: f04684b4d85d ("ALSA: lx6464es: Missing error code in
> > snd_lx6464es_create()")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> This crash isn't related to my commit, it's seems something specific to
> DCCP.
> 
> My guess is that the fix is probably something like this.  The old sk
> and the new sk re-use the same newdp->dccps_hc_rx/tx_ccid pointers.
> The first sk destructor frees it and that causes a use after free when
> the second destructor tries to free it.
> 
> But I don't know DCCP code at all so I might be totally off and I
> haven't tested this at all...  It was just easier to write a patch than
> to try to explain in words.  Maybe we should clone the ccid instead of
> setting it to NULL.  Or I might be completely wrong.
> 
> ---
>  net/dccp/minisocks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/dccp/minisocks.c b/net/dccp/minisocks.c
> index 25187528c308..4cbfcccbbbbb 100644
> --- a/net/dccp/minisocks.c
> +++ b/net/dccp/minisocks.c
> @@ -98,6 +98,8 @@ struct sock *dccp_create_openreq_child(const struct sock *sk,
>  		newdp->dccps_timestamp_echo = dreq->dreq_timestamp_echo;
>  		newdp->dccps_timestamp_time = dreq->dreq_timestamp_time;
>  		newicsk->icsk_rto	    = DCCP_TIMEOUT_INIT;
> +		newdp->dccps_hc_rx_ccid     = NULL;
> +		newdp->dccps_hc_tx_ccid     = NULL;
>  
>  		INIT_LIST_HEAD(&newdp->dccps_featneg);
>  		/*

Could someone take a look at this?  It seem like a pretty serious bug
but DCCP is not very actively maintained and a lot of distributions
disable it.

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
