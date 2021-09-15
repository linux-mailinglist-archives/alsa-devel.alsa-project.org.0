Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2240C406
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 12:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020FE17E9;
	Wed, 15 Sep 2021 12:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020FE17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631703323;
	bh=oJFobtIHormOKcwdLXPRLCws/Xmf9GNA4Ac3SMzNgnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jo3QsE+01vDYBJZLkardro1QWan2u/IfBCY1BiXI1nJnym1vvx4ebhtJ/raPDPqxl
	 1xlDm+ZKGpzED3ZYqq5JMTgvT9icIbEdP7+QAg1QUbx5OmIhcqulh1ieII+Yt1DcVI
	 9PJB+F6SFpeMPHoWMQcCWUlcBTFzaSjG0Xxa9dJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681D9F80227;
	Wed, 15 Sep 2021 12:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95998F8027C; Wed, 15 Sep 2021 12:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794E2F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 12:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794E2F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KBMJY28D"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F6ipNv027851; 
 Wed, 15 Sep 2021 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=sYePhBIXuv6di4ai0k+SsAbkaG2l1XsoGF1RxxD3Sgk=;
 b=KBMJY28DtfL1gxixdiH9wUezw0HDqzfjcmiP6Pcp5DyzL/6hvrgNlB9ZJmA4cg8klS1+
 W27orDUH8+wTLa65WxcVrJYzxqLe4uiJvghDYRtWlUZAoplhyUqz8hSFkeBzq0HogZTr
 BDng2pdCz8GeBYwUn5MeryG141rS9IN45kUpM1PeWVLNWS+G5/om4BfcNU/yVl/GZzay
 Gbm8aFViBCkxEubuRhrPMt7wsx+e/kyoVVHchbPFv9pUr+lGDByFyYTYnRp3rj8rS1vf
 osZBttynmnOH0DCpUU3qJ0fo3bcOwqmMOODj9uKPfgY7eGrEJvoBkjFh8WznMiHKL7gd /A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b3287gp84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Sep 2021 05:53:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 15 Sep
 2021 11:53:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 15 Sep 2021 11:53:53 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0F7DB2F;
 Wed, 15 Sep 2021 10:53:52 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:53:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 6/6] ASoC: cs35l41: Fix a bunch of trivial code
 formating/style issues
Message-ID: <20210915105352.GC9223@ediswmail.ad.cirrus.com>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
 <20210914141349.30218-6-ckeepax@opensource.cirrus.com>
 <20210914142301.GF4434@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210914142301.GF4434@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LmbSnkzBGmBChBXSW0KbXJPSdOUODmWG
X-Proofpoint-ORIG-GUID: LmbSnkzBGmBChBXSW0KbXJPSdOUODmWG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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

On Tue, Sep 14, 2021 at 03:23:01PM +0100, Mark Brown wrote:
> On Tue, Sep 14, 2021 at 03:13:49PM +0100, Charles Keepax wrote:
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/codecs/cs35l41-i2c.c    |   5 +-
> >  sound/soc/codecs/cs35l41-spi.c    |  13 +-
> >  sound/soc/codecs/cs35l41-tables.c | 477 +++++++++++++++++++-------------------
> >  sound/soc/codecs/cs35l41.c        | 387 +++++++++++++++----------------
> >  sound/soc/codecs/cs35l41.h        |  81 ++++---
> 
> This was upstreamed with your review a week ago :/

Yeah sorry about that, they are all trivial patches (with the
exception of the first patch which I did only notice whilst
fixing up the other stuff) it didn't seem worth delaying the
series for another couple of rounds for such trivial commments.

Apologies if that was the wrong call.

Thanks,
Charles
