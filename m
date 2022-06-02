Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC353BC7F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 18:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5AD91779;
	Thu,  2 Jun 2022 18:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5AD91779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654187242;
	bh=rK0L9OJSzBpeiVRweSLD5D7cdODXp/Kyr9NyLp9HIGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PKZE0n6DOAYNEMWyD5whhYYUd1Sez8AUdZ51NUb7/YWwAUNLe/sEzuNHjg0vn0TnG
	 tJKAs+HAUi3XjAjNtgAjM4+qDkOW2H3DcFymL09gDRABP6Kn+OPgGZ97UGWeBjQphN
	 N5+rOhEq+COVIwcsaC04TRWWJCzMgak46909K6A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40429F80124;
	Thu,  2 Jun 2022 18:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6663F80158; Thu,  2 Jun 2022 18:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8549AF80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 18:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8549AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JrDBUjZt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252CI99E012512;
 Thu, 2 Jun 2022 11:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qn1gfqBoO5d2fKkeeyGV1AMqQmX/dZMtsX87CkcVAjA=;
 b=JrDBUjZtVIUEJKuDjMjT7oE42KSGNuP5U5kY+T7VA9xtgZnpxcmNmLJBtfXsffqTYpBZ
 S4E6fMhCJhUrb9mkSCz7nOFVUo5Xj6mptnc4/X1gcmC+k7ErLVCT2qSNAba3E5Zdjau8
 gpAdxDdb2J4Nwtdqa3LKF6b0CVCpzyxh/UB4llI2unkFZYvY2dOCFQj7uI/tg1KwM3mI
 I1eDXYvJD3LnmMmoiT5QSOzrpbUo/av4etCS3f3MVX2O87tIvT0gob4Lf51SCkj1paVT
 K4Dwf2Ax2DupZFRTOiKu2eJXgjsbDJLmE4VyhsWC7jEqamRoCGhpVr1XF4HnhOIF6xnl PQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51nq6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jun 2022 11:26:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 2 Jun
 2022 17:26:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 2 Jun 2022 17:26:11 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CFBA459;
 Thu,  2 Jun 2022 16:26:11 +0000 (UTC)
Date: Thu, 2 Jun 2022 16:26:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Clarify snd_soc_info_volsw_sx()
Message-ID: <20220602162611.GX38351@ediswmail.ad.cirrus.com>
References: <20220602092921.3302713-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220602092921.3302713-1-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: V5y8CAFruo2wIvtliFeboUo5y0sr-How
X-Proofpoint-ORIG-GUID: V5y8CAFruo2wIvtliFeboUo5y0sr-How
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>
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

On Thu, Jun 02, 2022 at 11:29:20AM +0200, Mark Brown wrote:
> Currently snd_soc_info_volsw_sx() is implemented indirectly, wrapping
> snd_soc_info_volsw() and modifying the values it sets up rather than
> directly setting up the values reported to userspace. This makes it much
> harder to follow what the intended behaviour of these controls is. Let's
> rewrite the function to be self contained with a clarifying comment at the
> top in an effort to help maintainability.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

I didn't quite get around to testing this today but I will
hopefully find a quick minute to test tomorrow/over the weekend.
That said it looks good to me.

Thanks,
Charles
