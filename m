Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19925E73C2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 15:36:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0881F01;
	Mon, 28 Oct 2019 15:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0881F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572273377;
	bh=9JDpjSt/WUnEOI3yp5ZX1TRKvnbm1dM+3eEjGxHW40Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCj/3aw9U5NfWrVJi/G2bCgk+WlIZzHr817NxT5wOrecYBgnV2Fc65eaHRuXH9KrV
	 ob2halwKPCo7QD4v+/V/6z1wz80a0KE3X1FzijDcfQvc6RanUq6rEvooiH6uEcwC7u
	 MIb56k7vhp+zRxtc8FU72Mi/6CQlJWBImFlrHVEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA7AF80361;
	Mon, 28 Oct 2019 15:34:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7D2F80361; Mon, 28 Oct 2019 15:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1FBF800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1FBF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="UwlgYWoR"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SETAd1128019;
 Mon, 28 Oct 2019 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=FAQdU1JCR9DULjDB0FZACrkp/IGyVtvK8bkE0lTp0p0=;
 b=UwlgYWoRvKbwsApjVD2nnCWAEa2CI26mXkDrCrGKKTrf7P74iv6W1i5pU6dfZ/1rc65D
 tek1qlKFkEMJ3pX7EYequeQgGCiVZPnj4TV7mK+r8+NWnk/rUP/cXHu/ThHhP07HEDWs
 Lc2wiqVYJ9hUNOT5l/mjpVh8sl3Z7I/hjpS8WvVGDpXIYxOrJibv5Tf+VSgy7LRcYXJB
 f20fRkEUb8tvZKS6EzlF4FfDGsIhzsCY2Xp6kOZc91DIgkQUQHKySe+04M1eedY5DIcd
 sgf1GOPHfJ8xQd54ee+aYgt4cwblJ56V8jyNWPUAa13FvT7iFPGDIxKhbJ2Mhf8x/9Qb Cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2vve3q2cj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Oct 2019 14:34:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SEWgNF138564;
 Mon, 28 Oct 2019 14:34:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2vvymyrpbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Oct 2019 14:34:25 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9SEYGrk030677;
 Mon, 28 Oct 2019 14:34:21 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 28 Oct 2019 07:34:16 -0700
Date: Mon, 28 Oct 2019 17:34:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191028143406.GE1922@kadam>
References: <000000000000df5189059580f8e9@google.com>
 <s5hsgnkdbsl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hsgnkdbsl.wl-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9423
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910280151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9423
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910280150
Cc: alsa-devel@alsa-project.org, g@b4.vu, yuehaibing@huawei.com,
 andreyknvl@google.com, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tiwai@suse.com,
 syzbot <syzbot+0620f79a1978b1133fd7@syzkaller.appspotmail.com>,
 benquike@gmail.com
Subject: Re: [alsa-devel] KASAN: slab-out-of-bounds Read in
	build_audio_procunit
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

I wish that this could have been detected with static analysis...

On Tue, Oct 22, 2019 at 05:45:14PM +0200, Takashi Iwai wrote:
> diff --git a/sound/usb/validate.c b/sound/usb/validate.c
> index 3c8f73a0eb12..a5e584b60dcd 100644
> --- a/sound/usb/validate.c
> +++ b/sound/usb/validate.c
> @@ -75,7 +75,7 @@ static bool validate_processing_unit(const void *p,
>  
>  	if (d->bLength < sizeof(*d))
            ^^^^^^^^^^^^^^^^^^^^^^^
So we know that d->bLength is >= 10.

>  		return false;
> -	len = d->bLength < sizeof(*d) + d->bNrInPins;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Len is 1 or 0.

> +	len = sizeof(*d) + d->bNrInPins;
>  	if (d->bLength < len)
            ^^^^^^^^^^^^^^^^

So this condition can't be false.

>  		return false;

But it just makes this return into dead code and we have a lot of dead
code paths in the kernel so it doesn't make sense to generate a warning.
...  I don't know if I have a solution.

Maybe some day we will have a vim pluggin which will highlight all the
dead paths and someone would notice that it that way.

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
