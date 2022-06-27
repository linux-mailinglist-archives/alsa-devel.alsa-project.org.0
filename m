Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684355B9AD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803D9166E;
	Mon, 27 Jun 2022 15:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803D9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656335343;
	bh=QF9ZJAMhRoW6IKm9J4BGhiGuAvZmmkwvhlSUuVWIIaU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCz6SgzxR0eJ5mSh8GXAGu8VI/kQl0M0BS1dRjk15V4OjvWFaELJO3QDi/1TCyZcy
	 zy+Y3bOLDqHwCP/jhcMH4uVGMx6PXeEqInZexB9RULGw/DzWpmKe8RxePdH2xkZOLo
	 1hcDTAe+st7gXERkiDHE6ufb/1lJIC8GU6Lv+WlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB477F8028D;
	Mon, 27 Jun 2022 15:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073BCF8028B; Mon, 27 Jun 2022 15:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03C88F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C88F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GQ/6QxyS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCMpjp014019;
 Mon, 27 Jun 2022 08:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GrOloieBaIyDgUypeGB2lfu4ByBgp/A0DVGfWo/Eq/I=;
 b=GQ/6QxyS+UBoWXtUPLJTiYqBz5qRBN93NiXxGZHs4Er2GeEFWAztSgrb/fRouL6ZfgpT
 JREkFSEylM8pjCYB3Io4ernzfXKfUv9/vKJ85rH6TOCSHfT6Ey88KOYPyV3iJ1+HVQyz
 48hvl1uwOqB16bR5PIXsBBDSngCFxvvvIMhiUaiT/dFgaGe8afHskZogDDR/KXuR1Ojf
 wxFk/+XscQmXvGp8p2G76K2gQaT04JdvF2RgOIqvqd2wCma5NDey6YLhlycFcaQGD+0s
 XiqNtTJCF4HKfMJDnxX9tGoUbVnOY3q6URF+V7BqNLoXO3k04Y9u1R9lP5uCUomUL1LH jQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq2mqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 08:07:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 14:07:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 27 Jun 2022 14:07:49 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0B345B10;
 Mon, 27 Jun 2022 13:07:49 +0000 (UTC)
Date: Mon, 27 Jun 2022 13:07:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Message-ID: <20220627130749.GH38351@ediswmail.ad.cirrus.com>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
 <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
 <YrmYbZV4mj9d9++t@sirena.org.uk>
 <a25126ed-ef39-8316-6ae5-9551aa8120b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a25126ed-ef39-8316-6ae5-9551aa8120b0@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: M6X0Z1D8p84pbdtMCuK-AEUuWM_Q7r8V
X-Proofpoint-ORIG-GUID: M6X0Z1D8p84pbdtMCuK-AEUuWM_Q7r8V
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, jrdr.linux@gmail.com
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

On Mon, Jun 27, 2022 at 02:11:13PM +0200, Krzysztof Kozlowski wrote:
> On 27/06/2022 13:45, Mark Brown wrote:
> > On Mon, Jun 27, 2022 at 11:49:46AM +0200, Krzysztof Kozlowski wrote:
> >> On 27/06/2022 11:43, Charles Keepax wrote:
> >>> The conversion of the set_fmt callback to direct clock specification
> >>> included a small typo, correct the affected code.
> > 
> >>> Fixes: 91c49199e6d6 ("ASoC: samsung: Update to use set_fmt_new callback")
> > 
> >> Where is this commit from? It's not in next.
> > 
> > 0b491c7c1b2555ef08285fd49a8567f2f9f34ff8 - if you can't find something
> > search for the subject, people often get things wrong.
> 
> Finding it by subject does not solve problem with Fixes tag, that it
> might be pointing to incorrect commit (e.g. rebased).
> 

Apologies I will resend with the SHA corrected there and sorry
about missing the issue in the first place. I was pretty careful
trying to make sure I built everything but somehow missed this
one.

Thanks,
Charles
