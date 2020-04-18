Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F681AF84B
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939A81665;
	Sun, 19 Apr 2020 09:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939A81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282309;
	bh=XiiSG5BeGh6Dq2gdFfdf01LKxGJoaaGkGwx4YbM1C9U=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hg/5L2CLaDhNCmChDwP3TuVk0gQIY/JlnhqBm+zJu8/YbnPI4PrRUQPkSi1kPK/+l
	 cUiqj5q7uKdUODxpFgEOsXwY0R6kmf4+3lPFezuRlyGmvY3+TxAL9A5cRZuKOpXWMs
	 fr4KWFMS89Ugdm+317Pj1SEI9MFWDDuUExF2LcoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D03F1F802DF;
	Sun, 19 Apr 2020 09:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B70ADF8014E; Sun, 19 Apr 2020 00:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7742DF80122
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7742DF80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="x2TF6WJw"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IMWJax025251;
 Sat, 18 Apr 2020 22:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=zK4gJmDAQjm6odpqw+dWgt3X8Z8VkPHJX9eb1aKLC5g=;
 b=x2TF6WJw26JFS9DnzG1jjX7fP7mK0Gmueyj0VEUPz5H83bvjFEEwlne4gN+tk9eBscUm
 90ro37TBLrsx8aoPw+tGrpex6qPRAvhSHvbeBXswEwzL2kVQ3pz78kuJncF1HNoWMT2j
 QRoWUa/r0eaCnaztQlQ4n8h/igTGoktprS0Lj0IKrdFzvtpr1o3bwUEpjem5uQioamKj
 82bJVWqQoP+zfd1SQ+rPmWEF1NJGwV8Sey/KtKrs2TWKmazxhP9idWtuAFq86C+upl5u
 lJ2ZrAZYW+xzqm4vONNeX03aSz20xUVcvYXQ9z+0XJHfCyxQGRNSSE1mtNbDXfldBK+t HA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30fsgkj1d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Apr 2020 22:35:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03IMXRJG022075;
 Sat, 18 Apr 2020 22:33:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 30fqkadq8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Apr 2020 22:33:49 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03IMXbL4005563;
 Sat, 18 Apr 2020 22:33:41 GMT
Received: from anon-dhcp-153.1015granger.net (/68.61.232.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 18 Apr 2020 15:33:37 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <c838fc1d-3973-9cd8-ecc6-8739af514dd0@infradead.org>
Date: Sat, 18 Apr 2020 18:33:35 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4067786-F04F-4CE5-B84B-DE5BB0890529@oracle.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
 <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
 <d2e2f7967804446a825ec0ff61095e6640b5a968.camel@hammerspace.com>
 <c838fc1d-3973-9cd8-ecc6-8739af514dd0@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004180188
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9595
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004180188
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "zzy@zzywysm.com" <zzy@zzywysm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bruce Fields <bfields@fieldses.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "dave.jiang@intel.com" <dave.jiang@intel.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
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



> On Apr 18, 2020, at 6:32 PM, Randy Dunlap <rdunlap@infradead.org> =
wrote:
>=20
> On 4/18/20 3:28 PM, Trond Myklebust wrote:
>> On Sat, 2020-04-18 at 14:45 -0400, Chuck Lever wrote:
>>>> On Apr 18, 2020, at 2:41 PM, Randy Dunlap <rdunlap@infradead.org>
>>>> wrote:
>>>>=20
>>>> Fix gcc empty-body warning when -Wextra is used:
>>>>=20
>>>> ../fs/nfsd/nfs4state.c:3898:3: warning: suggest braces around empty
>>>> body in an =E2=80=98else=E2=80=99 statement [-Wempty-body]
>>>>=20
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: "J. Bruce Fields" <bfields@fieldses.org>
>>>> Cc: Chuck Lever <chuck.lever@oracle.com>
>>>> Cc: linux-nfs@vger.kernel.org
>>>=20
>>> I have a patch in my queue that addresses this particular warning,
>>> but your change works for me too.
>>>=20
>>> Acked-by: Chuck Lever <chuck.lever@oracle.com>
>>>=20
>>> Unless Bruce objects.
>>>=20
>>>=20
>>>> ---
>>>> fs/nfsd/nfs4state.c |    3 ++-
>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>=20
>>>> --- linux-next-20200417.orig/fs/nfsd/nfs4state.c
>>>> +++ linux-next-20200417/fs/nfsd/nfs4state.c
>>>> @@ -34,6 +34,7 @@
>>>>=20
>>>> #include <linux/file.h>
>>>> #include <linux/fs.h>
>>>> +#include <linux/kernel.h>
>>>> #include <linux/slab.h>
>>>> #include <linux/namei.h>
>>>> #include <linux/swap.h>
>>>> @@ -3895,7 +3896,7 @@ nfsd4_setclientid(struct svc_rqst *rqstp
>>>> 		copy_clid(new, conf);
>>>> 		gen_confirm(new, nn);
>>>> 	} else /* case 4 (new client) or cases 2, 3 (client reboot): */
>>>> -		;
>>>> +		do_empty();
>>=20
>> Urgh... This is just for documentation purposes anyway, so why not =
just
>> turn it all into a comment by moving the 'else' into the comment =
field?
>>=20
>> i.e.
>> 	} /* else case 4 (.... */
>>=20
>> 	new->cl_minorversion =3D 0;
>>>> 	gen_callback(new, setclid, rqstp);
>>>> 	add_to_unconfirmed(new);
>=20
> Like I said earlier, since Chuck has a patch that addresses this,
> let's just go with that.

I'll post that patch for review as part of my NFSD for-5.8 patches.


--
Chuck Lever



