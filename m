Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7323489DB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 08:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9271669;
	Thu, 25 Mar 2021 08:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9271669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616656182;
	bh=YjPcqewPOYSiEC+bYLpDi950yzL4aEwMbn8/k6s2TUo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K45t67KkbKGskVUJzNyt6N03NdYw7kB9NyfFOjHYv+k+LCV3dNY2k4lhmGOtGqVgR
	 UIF6jPuZOeeZWlRCaobySYn+2V5Z7WZ/43ThGxNPGTrfy1e7oK0UFosgccffAzukGO
	 9A2bacHHMxHFH2djXuCYn7Lnp6HGwA69l9YOMklg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 180A4F80268;
	Thu, 25 Mar 2021 08:08:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5AA5F8025F; Thu, 25 Mar 2021 08:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43651F800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 08:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43651F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="PDlojjzB"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P704Bd177227;
 Thu, 25 Mar 2021 07:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=VaoZTJ6LkffLVohHJ9mc4VH0Jy4omsa7wqQBqnPFKw0=;
 b=PDlojjzB+QL3ixZ8xdY8QeMv+KqyhzAq0YcwMUyrx2e9VvG10RBpEmB6BsJ7DHaWVU8j
 fQwM0SV3DtCMV6Kf2W/CsTKOHJElmZBxnlTkTRVIuiAvBafCe5vcAiCuNFm9c+4aSW9R
 mgWsujl8QSOBRQUyGZd3v5mQBXXIf9J68yAt73tpLu5xC8mnEQ/7bI0FxwIThJ+R/MXC
 YU91fw3QcuaAiL4PW9FmukZWjRoIVtbSbIETWjgLeiaVO1PWj1bYG8vV+70FNpoBInB0
 cDtnzyYVwYcsluAoe13Ay1jZkb/qKuAsGigbmfMIgh2WXhNwIQ0evPF22oLwxlAP3CZm DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 37d90mn6fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 07:08:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P711nf140464;
 Thu, 25 Mar 2021 07:08:03 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 37du00tqrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 07:08:03 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12P77xmT003688;
 Thu, 25 Mar 2021 07:07:59 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Mar 2021 00:07:58 -0700
Date: Thu, 25 Mar 2021 10:07:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Muhammad Usama Anjum <musamaanjum@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix missing return assignment
Message-ID: <20210325070751.GU1667@kadam>
References: <20210324172604.GA380592@LEGION> <20210324185047.GP1667@kadam>
 <abc46d0ad37b9e59ac71288d04e43c9911f71072.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc46d0ad37b9e59ac71288d04e43c9911f71072.camel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250051
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250051
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 colin.king@canonical.com
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

On Thu, Mar 25, 2021 at 01:24:23AM +0500, Muhammad Usama Anjum wrote:
> On Wed, 2021-03-24 at 21:50 +0300, Dan Carpenter wrote:
> > > -			usb_driver_claim_interface(driver, iface, (void *)-1L);
> > > +			err = usb_driver_claim_interface(driver, iface, (void *)-1L);
> > 
> > This is in a loop so only the last return value is used.  Which seems
> > sort of weird and pointless that the last value would matter more than
> > the others.
> > 
> Correct. Lets not store the return value. To stop the static analyzers
> to report the missing return assignment, can we add (void) in start of
> this function call? I've not seen use of (void) this way in the
> kernel. Is there any other way used in the kernel?

Don't add (void).  Don't add any code just to help static checkers, only
do it if it helps humans.  The (void) stuff is ugly.  We have a
__must_check annotation for functions where it's a bug not to check the
return and the usb_driver_claim_interface() is not a __must_check
function.  Just ignore the static checker when it's wrong.

When I'm reviewing static checker warnings, I only look at the new ones.
Then after I've looked at them, I mark them as old.  I currently have
65k old ignored warnings.

regards,
dan carpenter

