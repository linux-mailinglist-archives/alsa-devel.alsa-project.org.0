Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7C3D0AEE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 11:02:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A09616C7;
	Wed, 21 Jul 2021 11:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A09616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626858166;
	bh=UP0/jEnNRbN8ulLP4gw1Rid+7PSzckg35vqJQW7vfSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rI0ZJlHzBrvtsaPtagEfbCBer87IbokI2NFjb7SM+L/WVdW0zM4liyt2+qbmH/XUh
	 t4yP3WSocLIRvyM06AlOProjimL+vfQU0w7+XoVWCr+kyMl3K/AUknLDC5RSAnX4LT
	 jzDNoN7eR8kFdcSidVikYIlbXooy85bQw2gyAzUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F72F800FD;
	Wed, 21 Jul 2021 11:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A224F804AC; Wed, 21 Jul 2021 11:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A323F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 11:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A323F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YT3rCQyU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16L7ljnr024823; 
 Wed, 21 Jul 2021 04:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=jenr9Yofk5IIE9xs4fo32xKNuQyB9DPegxWHQAISzXE=;
 b=YT3rCQyUO6sdx4r7ImNQ/8llcaxMBCTh3n0q5aENbBMqUGH7M/cd3ObkRc61uhaxhdMe
 t2FwDzbsx2aId/FaHxAUw51qLF+iBPoui3D2xlj0QGAE+Bd+anS/ExEukA+Pl0vgliWj
 0gEiIsMkBKBCINoDyTa4g3e8BAR2EWXdIdystk4E60qvXk2wdnRdabnx+/sFtzU2lXI5
 23BLFdDVcNhrzbb2gXDNrDslH8rp7ozYJ3+/MpAajtox6JdhmusVNi0isi7d/tjt/In3
 wspPG6uKbUqcq9xE+yWe6+JQFahOJv3f1pJ5S11OMGh0hDn3cpNWYn5IDuYqDofoPM0e rg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39wqrm9n3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 21 Jul 2021 04:01:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 10:01:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 10:01:04 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C9DB146E;
 Wed, 21 Jul 2021 09:01:04 +0000 (UTC)
Date: Wed, 21 Jul 2021 09:01:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
 <20210712150341.GF4435@sirena.org.uk>
 <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: o55U-vzgK7eFgvn6ph36r8oiAEk7j1FY
X-Proofpoint-GUID: o55U-vzgK7eFgvn6ph36r8oiAEk7j1FY
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 impostorscore=0 mlxlogscore=941 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210050
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

On Tue, Jul 20, 2021 at 05:18:09PM -0500, David Rhodes wrote:
> On 7/12/21 10:03 AM, Mark Brown wrote:
> >On Fri, Jul 09, 2021 at 06:11:28PM -0500, David Rhodes wrote:
> >>On 7/5/21 2:20 PM, Mark Brown wrote:
> >
> >>>I can't see any references to GLOBAL_EN outside this function, why might
> >>>it not be set?
> >
> >>This check prevents an incorrect 'PDN Failed' message if DAPM initializes
> >>and turns the widget off at boot (with no prior power-up).
> >
> >In what way does it prevent this message and why is this a good approach
> >to the issue?
> >
> 
> There is a better approach that I will include in v4.
> The chip has a bit field that indicates if GLOBAL_EN has been asserted.
> The 'PDN Failed' message can be skipped if this bit is not set.

I am not sure that really addresses the comment here. The issue isn't
so much the way you are avoiding printing that error message, but
why that is necessary in the first place. AFAIK DAPM won't attempt
to power down a widget without powering it up first. So, at least
to me, its not clear how you get to this code without GLOBAL_EN
having first been set by the power up?

Often with comments like this what people are looking for is for
you to explain more about why the code does what it does, rather
than just jump to a new implementation. After the reasoning is well
understood then its much easier to have a discussion about if it
is the right way to solve the problem.

Thanks,
Charles
