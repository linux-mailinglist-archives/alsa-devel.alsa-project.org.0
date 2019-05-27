Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A42B048
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 10:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08951796;
	Mon, 27 May 2019 10:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08951796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558946073;
	bh=DNRIlQUq+8TIXUwDgJPaSiMATF1kt4HxHNolFfL8UzI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lB2pYELCxegr/KG/+pAku1wEgEm79np3DnvOTyLWJ/4SAz50Ksg/pu22BOVywx7Y3
	 4ZqtL4geJw2ccpCWTLIcEQi1WF5WUo7+oyt0rEkXrfOIuJUVkJQABj2+QLOKTxQbUm
	 2G9/GL8xPDS+S6DqcFeAHh1jtc8bEZKmcYClApkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC57F896E4;
	Mon, 27 May 2019 10:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B81F5F896E4; Mon, 27 May 2019 10:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FF35F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 10:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FF35F8072E
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4R8TkHI000652; Mon, 27 May 2019 03:32:39 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2sq340hxxp-1;
 Mon, 27 May 2019 03:32:39 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 1CAFB611C8BD;
 Mon, 27 May 2019 03:32:39 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 27 May
 2019 09:32:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 27 May 2019 09:32:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 733CF45;
 Mon, 27 May 2019 09:32:38 +0100 (BST)
Date: Mon, 27 May 2019 09:32:38 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190527083238.GD28362@ediswmail.ad.cirrus.com>
References: <20190524104158.30731-1-ckeepax@opensource.cirrus.com>
 <20190524104158.30731-2-ckeepax@opensource.cirrus.com>
 <20190524145603.GE2456@sirena.org.uk>
 <2f4ab4ff-5b1e-8ef5-3ef7-8dfe413b4b95@opensource.cirrus.com>
 <ae5eee88-0b79-1e58-5812-9e46e5bf3b75@opensource.cirrus.com>
 <20190526121846.GG2456@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190526121846.GG2456@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=838 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905270060
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 robh+dt@kernel.org, lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 2/5] ASoC: madera: Add common support for
 Cirrus Logic Madera codecs
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

On Sun, May 26, 2019 at 01:18:46PM +0100, Mark Brown wrote:
> On Fri, May 24, 2019 at 04:24:10PM +0100, Richard Fitzgerald wrote:
> > On 24/05/19 16:21, Richard Fitzgerald wrote:
> > > On 24/05/19 15:56, Mark Brown wrote:
> > > > This will delay both before and after every power up and power down.
> > > > Are you sure that makes sense?
> 
> > > I think that's correct but we can re-check with hardware people.
> > > It's not just a delay, it needs to ensure there are always a
> > > certain number of SYSCLK cycles in the hardware to avoid leaving
> > > certain state machines in limbo.
> 
> That sounds like you might want both _POST_PMU and _POST_PMD but do you
> really need the _PREs as well?

Yeah the requirement from the hardware guys was that we needed a
guard band between changing the SYSCLK state and other things
happening. So it has to happen both before and after the state of
SYSCLK changes. It is certainly far from ideal but it is what it
is.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
