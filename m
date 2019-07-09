Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5463653
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 15:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA03166C;
	Tue,  9 Jul 2019 14:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA03166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562677231;
	bh=/hjenysKNH+8SI8T6H8N9AkUXSjyM1VEZNa7AexhHmk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4FJK0IJWof7Zts2ixB4Z7oR1dNTX9wJXmTBb+mZleI3/DU895Xv7jKnw0IXBwNPl
	 DEuu0dZG2GMgXpq46pkk/XQ53VPZTmIQpAIOHii8NtH4PDdRbZ2UJuNMLTdzBp3XaN
	 UasydfbqO7hf/r2ym2cXN/bhgC/Lubv3hGEAJZXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B570F80274;
	Tue,  9 Jul 2019 14:58:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEFD8F80274; Tue,  9 Jul 2019 14:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA7EF801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 14:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA7EF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dn1EbSQQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69CdJKJ000648; Tue, 9 Jul 2019 07:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=pMPz69XQwrScwFGSFSnXFPJuzXDObEKGWOG19CJ3Hpk=;
 b=dn1EbSQQBIP+bIWJIUD20pZUXI4AQ6n6MqcK7D6m/j6NMuaIiDUKOzCMt3ORcKjLK0Tf
 ef9JsMbrbuQdIsju8h6tcuv4KOBpfquZrPHMBObEdW7SjNaCHoyXPk5+ij3twacU9Tyh
 ozxFsw087tj6SfRiFaer5FNS0v4c603/YjIQUXQgzuD8ciHhCT/h/37TYg6xhBFMADIv
 0wR5rbJw5+LiRA9gyn9/hFF4hiVM+fDsCVIO3q2qMdMjr/Nztn2vIc37tIbe3TV2SbTU
 eCtrreMi7SdSyIL2bhDkN6GvmYyZlaFZNcgd079oatrWpEqGrxpsxeFe9DR+P02ygJd/ eQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tjs204hws-1;
 Tue, 09 Jul 2019 07:58:34 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 1922C611C8B1;
 Tue,  9 Jul 2019 07:58:34 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 9 Jul
 2019 13:58:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 9 Jul 2019 13:58:33 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BB3045;
 Tue,  9 Jul 2019 13:58:33 +0100 (BST)
Date: Tue, 9 Jul 2019 13:58:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190709125833.GJ54126@ediswmail.ad.cirrus.com>
References: <20190709105211.11741-1-ckeepax@opensource.cirrus.com>
 <20190709105211.11741-3-ckeepax@opensource.cirrus.com>
 <20190709113633.GL2911@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709113633.GL2911@vkoul-mobl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=763 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090152
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH 3/4] ALSA: compress: Don't allow drain
 operations on capture streams
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

On Tue, Jul 09, 2019 at 05:06:33PM +0530, Vinod Koul wrote:
> On 09-07-19, 11:52, Charles Keepax wrote:
> > would make sense on a capture stream but currently the implementation
> > of drain involves the kernel waiting for the DSP to consume its
> > available data, whereas a capture drain would involve waiting for
> > user-space to consume the data available on the DSP. Disallow drain
> > on capture streams until that is implemented.
> 
> Well it in unclear to me about the support required in kernel! Kernel
> issues drain request to DSP and waits for that to be done. When DSP has
> encoded and copied the data the notification should make drain complete.
> So I dont see anything in kernel required for that
> 

Ok that makes sense I think what I missed there is we are looking
at the capture drain being complete when the data is in the DSP
buffer, not when it has been pulled by user-space as I had.

I will update the patch to remove this one.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
