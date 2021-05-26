Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4836C391BDB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 17:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A23A1744;
	Wed, 26 May 2021 17:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A23A1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622042749;
	bh=1oOXnSXHfK8AQvo17tlkjJOyULYumtfpcsjeuMsSvbc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTuS/KFID9zuWvYWaZ1gM1clvIJ6+GJ+Fdpbrqf6VoR/Aub6gBJo+V54koKmrvcZL
	 eFFVut1FxTMYtqPuIFnMb4O+MPGa/ZcEnwdje47ISXWARo41oQWZutEfdteB1RMbNL
	 yKfnEh3Xsi3L7TK4n3El7dfB7p5pbuosz2eDzYKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF77F8011B;
	Wed, 26 May 2021 17:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA52F8024D; Wed, 26 May 2021 17:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED734F8024D
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 17:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED734F8024D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="t9c7JGFO"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14QFFA9U144464;
 Wed, 26 May 2021 15:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=XAI33YRZR+bZWsPJm5QcbsIAm7qoNBd0smZFCXUGmlQ=;
 b=t9c7JGFOG2lRSRcdvLsbBuLfSpYPS8+i1kYDLH6iS44jmYaMduYY2dk06Jgc2if7dBgM
 7H6F3BOFELfelZS8Sp4A9JPB1B/prVrXlqjmii+0EAa1yn5YRt4PuTyJGT71PUF80dQX
 r1QJnoSAmMSQr7S0uQ3GUNM7059V9qQYnKxlgpAxbgls0EKljxJbfafxH97yaLAWW3b5
 /HW0tD6kXQjyv1o4+UeC/fC5M8R+BRr8fUcjT0e1NvPwcbz7qGdC8DHuIjqaV9K6o9re
 pkEleHBHzZFZvYVHfLDZmX7dsrEYvzIkh6qXxtwdAgpCWBIjoIUF3Hd7mTlf0VjgH/JE ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38rne453nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 15:24:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14QFG8v8072953;
 Wed, 26 May 2021 15:24:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0ct25q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 15:24:13 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14QFODEB087589;
 Wed, 26 May 2021 15:24:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38pr0ct24t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 15:24:13 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14QFOATa019079;
 Wed, 26 May 2021 15:24:11 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 May 2021 15:24:10 +0000
Date: Wed, 26 May 2021 18:24:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Sparse errors
Message-ID: <20210526152403.GI24442@kadam>
References: <6b86f44e-82e0-3530-b579-1b054f459880@linux.intel.com>
 <s5ha6oiaqo6.wl-tiwai@suse.de>
 <afaf87c4-7ad9-626c-efb0-2b1c254950da@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afaf87c4-7ad9-626c-efb0-2b1c254950da@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: BP_rjekOMmJqi6xwkDiXiu8NEJQCiiKN
X-Proofpoint-GUID: BP_rjekOMmJqi6xwkDiXiu8NEJQCiiKN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260103
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

On Wed, May 26, 2021 at 09:17:18AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 5/26/21 2:40 AM, Takashi Iwai wrote:
> > On Tue, 25 May 2021 21:32:27 +0200,
> > Pierre-Louis Bossart wrote:
> > > 
> > > Hi Takashi,
> > > Sparse reports a lot of new issues in our last checks with more options:
> > > 
> > > export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all
> > > -Wno-bitwise-pointer -Wno-pointer-arith -Wno-typesign -Wnoshadow
> > > -Wno-sizeof-bool"
> > > make -k sound/ C=2
> > > 
> > > most are linked to the __user and pcm_format_t restricted types, but I
> > > found the simpler ones below which are useless comparisons. I can send
> > > a patch for the last but not sure how to address the first two.
> > > 
> > > Thanks for your feedback
> > > -Pierre
> > > 
> > > sound/core/info.c:95:38: error: self-comparison always evaluates to false
> > > 
> > > 	if (pos < 0 || (long) pos != pos || (ssize_t) count < 0)
> > > 		return false;
> > > 
> > > not sure what the second comparison is meant to check?
> > 
> > As Dan suggested, it's a check only for 32bit architecture for a 64bit
> > value.
> 
> Isn't there a better way to check this?
> 

I suppose you could do:

	if (pos > ULONG_MAX) {

I think Smatch used to complain about code like that but it doesn't
now?

Really the correct thing is to fix the static checker because the code
is fine.  To me as a human reader it was pretty obvious that the code
was deliberately checking that the value was still the same after a
cast.

regards,
dan carpenter

