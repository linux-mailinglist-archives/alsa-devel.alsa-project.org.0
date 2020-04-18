Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B584A1AF845
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BDB7166D;
	Sun, 19 Apr 2020 09:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BDB7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282171;
	bh=xHUv9HzhLRbxWHH8wDr28q0tDHLcu4dmnw0YTwKWKrw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1ViumQjhXdxNfFKO8ENUN9k48wzbRfrfuoRwwjCOzYGCyYB0G/MkOBI5w+4w1FUc
	 Na0qJ/ic4NBq9xW3OCQXp7Zv3f3hZ+nCa74CE/lqZ6wfzyOKuidRHEVvpQ6N5oAwUW
	 yTYHReWfqVSMrqrQOPkhOZve3KuRuQqBWFU8Jmfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF677F802A0;
	Sun, 19 Apr 2020 09:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930FCF8014E; Sat, 18 Apr 2020 20:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D166FF8014E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D166FF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="XarPKwUM"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IIbvof110170;
 Sat, 18 Apr 2020 18:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=OMbwDKsG/vOO5AAoxKcfs/BIRelllRhJg9DLfQ0cROg=;
 b=XarPKwUMp7eFpqLRIA+E9xQ6HCh/1NBQo9ytJJXL2GWJvERJWITDG8npsHm0A3vtM/23
 AK2WjOnJN8Q+JnFN5kmACcUtBxWi6ByISqRcwrOTWuEZd5g1XrMTALImUQKyGTaASrZY
 c2gTo/F7Rtr2Bb+UaZJkRthP1d7dqHb1BoQFH/ah6DeWtsupMYIUzN7zvmKJF3TetZ6d
 LxI5gemgWLkr8CdWBGY1u6v3vxXBHogEkemzupqaynwk1+E7X7Nv5chOi5dOmEgXULA4
 ejp8E/PSLZXUmu6Thg9uKe42tMoDDyGAOA4OE0x2XWAKh2hrsC/CzOSCEc1P348Xlqib Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 30g6dwr26c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Apr 2020 18:46:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IIbSC4149674;
 Sat, 18 Apr 2020 18:46:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 30fqka563c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Apr 2020 18:46:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03IIjvac015073;
 Sat, 18 Apr 2020 18:45:57 GMT
Received: from anon-dhcp-153.1015granger.net (/68.61.232.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 18 Apr 2020 11:45:57 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <20200418184111.13401-7-rdunlap@infradead.org>
Date: Sat, 18 Apr 2020 14:45:55 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004180156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004180156
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, LKML <linux-kernel@vger.kernel.org>,
 Bruce Fields <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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



> On Apr 18, 2020, at 2:41 PM, Randy Dunlap <rdunlap@infradead.org> =
wrote:
>=20
> Fix gcc empty-body warning when -Wextra is used:
>=20
> ../fs/nfsd/nfs4state.c:3898:3: warning: suggest braces around empty =
body in an =E2=80=98else=E2=80=99 statement [-Wempty-body]
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "J. Bruce Fields" <bfields@fieldses.org>
> Cc: Chuck Lever <chuck.lever@oracle.com>
> Cc: linux-nfs@vger.kernel.org

I have a patch in my queue that addresses this particular warning,
but your change works for me too.

Acked-by: Chuck Lever <chuck.lever@oracle.com>

Unless Bruce objects.


> ---
> fs/nfsd/nfs4state.c |    3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- linux-next-20200417.orig/fs/nfsd/nfs4state.c
> +++ linux-next-20200417/fs/nfsd/nfs4state.c
> @@ -34,6 +34,7 @@
>=20
> #include <linux/file.h>
> #include <linux/fs.h>
> +#include <linux/kernel.h>
> #include <linux/slab.h>
> #include <linux/namei.h>
> #include <linux/swap.h>
> @@ -3895,7 +3896,7 @@ nfsd4_setclientid(struct svc_rqst *rqstp
> 		copy_clid(new, conf);
> 		gen_confirm(new, nn);
> 	} else /* case 4 (new client) or cases 2, 3 (client reboot): */
> -		;
> +		do_empty();
> 	new->cl_minorversion =3D 0;
> 	gen_callback(new, setclid, rqstp);
> 	add_to_unconfirmed(new);

--
Chuck Lever



