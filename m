Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D541D391047
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 08:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A019170E;
	Wed, 26 May 2021 08:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A019170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622009036;
	bh=RSPdaHVgKOGv4QPP9G1PcGLbwbmlQ36uJiWWVEixB8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmK+0YZJhyu+fI71aVHKv3gB2oxl5qlzK+yDR0eAm9R5+JeZCw2HeV5ateiDsGkkn
	 ZEfDPseROQHgVIYvL8UCNb7DDHCkDdF3R6F2CxJ/Yz+8v02SkCgmIHkMo9dPOYV6my
	 KK+tu3GbjSM9eWDbCzY9c5/Le0FP59HodADbYx/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C205EF80158;
	Wed, 26 May 2021 08:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC42F80157; Wed, 26 May 2021 08:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B647AF80032
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 08:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B647AF80032
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="vby1xIST"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14Q60wQT077842;
 Wed, 26 May 2021 06:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=3UNcgT4ybb5827O0BBupTxctp2B0rJ6Vr3PPVarJzF0=;
 b=vby1xISTj8h1P0Z4xhzO4WzHrM/x8UgAMDYZNsnsyBu4ufMKO/GQ9lhkzHeaR6pfJHMa
 4ELYym6rr4cLZKRCKYjo0RMjRHKLHfZxg9h3PrntBW+ZfbjzkSHs2fhZYlJ6QWSOZoTC
 8olgByE7hWr+HT61Eim3PGZN1aeoROeYa13diy3r/oB8ReUTZaGoPGhBW3xncwZT6MEI
 s7kxcSkOOb0AaGEefAZm+5kuPY60ngGiGoUHoGasdF5/gHvkyGi2nsxfPP5gBlbprERs
 6twVM0T/q2IC033vi3mrn45ucjv9tOaqZwR5JkPoE6GQgvbmvwGGz6WvFom6rqBbro6Y mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 38ptkp7un2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 06:02:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14Q606q4155245;
 Wed, 26 May 2021 06:02:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0cejmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 06:02:17 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14Q62H8c161399;
 Wed, 26 May 2021 06:02:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38pr0cejmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 06:02:16 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14Q629hS012921;
 Wed, 26 May 2021 06:02:15 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 May 2021 06:02:09 +0000
Date: Wed, 26 May 2021 09:02:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Sparse errors
Message-ID: <20210526060203.GH24442@kadam>
References: <6b86f44e-82e0-3530-b579-1b054f459880@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b86f44e-82e0-3530-b579-1b054f459880@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: FreSydwuvXxnJlPQQJFip4E8HnzlCmTX
X-Proofpoint-ORIG-GUID: FreSydwuvXxnJlPQQJFip4E8HnzlCmTX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=983 phishscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260039
Cc: Takashi Iwai <tiwai@suse.de>, Colin Ian King <colin.king@canonical.com>,
 alsa-devel@alsa-project.org
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

On Tue, May 25, 2021 at 02:32:27PM -0500, Pierre-Louis Bossart wrote:
> Hi Takashi,
> Sparse reports a lot of new issues in our last checks with more options:
> 
> export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all -Wno-bitwise-pointer
> -Wno-pointer-arith -Wno-typesign -Wnoshadow -Wno-sizeof-bool"
> make -k sound/ C=2
> 
> most are linked to the __user and pcm_format_t restricted types, but I found
> the simpler ones below which are useless comparisons. I can send a patch for
> the last but not sure how to address the first two.
> 
> Thanks for your feedback
> -Pierre
> 
> sound/core/info.c:95:38: error: self-comparison always evaluates to false
> 
> 	if (pos < 0 || (long) pos != pos || (ssize_t) count < 0)
> 		return false;
> 
> not sure what the second comparison is meant to check?

It's checking for if a 32 bit system is using the upper 32 bits of a
u64.

This one is valid, the rest are nonsense code.

regards,
dan carpenter

