Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21D511B91
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 16:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0F7166C;
	Wed, 27 Apr 2022 16:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0F7166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651071588;
	bh=pRMu9ygaYE2WcBQSQ/Y9Ng8duVfYBxEfcWXE3N8BRrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFRLMi4IqZrj8wOwx+bX+SzUkXufCvdxdl+CvNru8B1cYuC4G8lpRU2mCDqb7BAxg
	 EaeoOa4Kh4ka96nQ/mpLpQ1fMaBTbqRWcG7LUYTRzEAEwU9iY7gLRGak2QPKBsIXqz
	 gAl5pSScGdaCxMwACvjkyF+ws2nAsFR1v/dY6g1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0101DF80253;
	Wed, 27 Apr 2022 16:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65702F8016E; Wed, 27 Apr 2022 16:58:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1781F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 16:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1781F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="c+DFPOiL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6M8vA014103;
 Wed, 27 Apr 2022 09:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=rVHlZ2BnSRlpi446ChyiKIay+nCt3k9q76+aezgb3EU=;
 b=c+DFPOiLHgH6yguBpTWsqweG5q/Ds5/iCcFLr4oKqUPjR58/RHAS4SaTjL1gEPPpcRgz
 HfEQzaVD8HDL5A+4USO9OGc2R9FZRboR19Y2nn/tDLqM6qmSjBmRB1try2ZBio9Zx7A+
 l/Ph5dAbJrb58Z3Pf3JClcDeOk3P/+Yy/uOCfbPlHAgvKzynR9qWVqkedeVj4+fl7mpI
 6ISkPdoPWJqNpVVSttwFLKhu2eM/9SZ/klj5787sIzGSVPeB39viPvEe6gBp/cEGecpt
 COtm3d4fdhDkr0uQEqFr/SOZLM7oT0It4FYlUR4CBUkWubczytTdTIReqsqxEZNVIDKU yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 09:58:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 15:58:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 15:58:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A09AB478;
 Wed, 27 Apr 2022 14:58:45 +0000 (UTC)
Date: Wed, 27 Apr 2022 14:58:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: WM8962 crashing on suspend
Message-ID: <20220427145845.GF38351@ediswmail.ad.cirrus.com>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <YmlDVsDQY3oL8SYs@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YmlDVsDQY3oL8SYs@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 0gfZF82eW7AfjdDA2-eMvkWZ3NQ_NNwT
X-Proofpoint-ORIG-GUID: 0gfZF82eW7AfjdDA2-eMvkWZ3NQ_NNwT
X-Proofpoint-Spam-Reason: safe
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Adam Ford <aford173@gmail.com>
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

On Wed, Apr 27, 2022 at 02:21:26PM +0100, Mark Brown wrote:
> On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> > I found this:
> > static const struct dev_pm_ops wm8962_pm = {
> > + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> > SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> > };
> 
> > I applied this, and it appears to make the issue go away on a 5.15
> > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > would that be an acceptable solution to push upstream?
> 
> Yes, that's fine - it's fixing the thing I was pointing out with only
> having runtime suspend but no system suspend.

:-) Well in that case ignore my email, I don't mind if we want to
go this way too.

Thanks,
Charles
