Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA481887B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 12:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0701852;
	Thu,  9 May 2019 12:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0701852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557398832;
	bh=ri50IQniybmY0eA71UMSzhylWWMaXscNSQcElaQhdts=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCooDtu0AgKsyxojH9CCkGUdTrXj/2z063CVjEQjY6ujputs9tGL3ZOxwc0Y30Kj4
	 GYVmoVQ2K4HHqDTxGdeP4mVmefJjtzwADhHIDLwxVT1jr5osNLQsfmoDSYgH9Ra0FZ
	 i1ZbJqO0ZZtxGRoXd22dZz/fcLhU+izLq5b9CPU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A15F89682;
	Thu,  9 May 2019 12:45:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7DCFF89674; Thu,  9 May 2019 12:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3258EF8073C
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 12:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3258EF8073C
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x49AjG0J030909; Thu, 9 May 2019 05:45:16 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2scba3gk3k-1;
 Thu, 09 May 2019 05:45:15 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 80C95611C8AB;
 Thu,  9 May 2019 05:45:15 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 May
 2019 11:45:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 9 May 2019 11:45:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE6FD45;
 Thu,  9 May 2019 11:45:14 +0100 (BST)
Date: Thu, 9 May 2019 11:45:14 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Matt Flax <flatmax@flatmax.org>
Message-ID: <20190509104514.GB45394@ediswmail.ad.cirrus.com>
References: <20190508063313.18099-1-flatmax@flatmax.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508063313.18099-1-flatmax@flatmax.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=800 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905090066
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de,
 Brian Austin <brian.austin@cirrus.com>,
 Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC : cs4265 : readable register too low
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

On Wed, May 08, 2019 at 04:33:13PM +1000, Matt Flax wrote:
> The cs4265_readable_register function stopped short of the maximum
> register.
> 
> An example bug is taken from :
> https://github.com/Audio-Injector/Ultra/issues/25
> 
> Where alsactl store fails with :
> Cannot read control '2,0,0,C Data Buffer,0': Input/output error
> 
> This patch fixes the bug by setting the cs4265 to have readable
> registers up to the maximum hardware register CS4265_MAX_REGISTER.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
