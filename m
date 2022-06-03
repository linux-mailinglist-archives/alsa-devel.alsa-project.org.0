Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF953C8E6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183A9182B;
	Fri,  3 Jun 2022 12:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183A9182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654253177;
	bh=zofgpMJn7Hvl5LnlmSbTTQYwLzTBdiaGkBAnJRNbdl4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqAaBodQvX0IRGL4JcNDxX+7Aht8u23UAsMAreFVFJAho3OpUHCbrp4LvjUWYWC87
	 XjLPKhBHFmhcvsa8H3I14GsF1tgJfKCoqi8FFJp7ONpnlJo5Khr/YF4rqy2dpxyQZA
	 thK44Z0BONNc5GQdPCuNaAqCJ7G0rdEVCuOhD6Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B70F804D1;
	Fri,  3 Jun 2022 12:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D44F80089; Fri,  3 Jun 2022 12:45:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734DBF80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734DBF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MmyeIz1c"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2539Oi5J017256;
 Fri, 3 Jun 2022 05:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=iI3raUSgEJbmfvAvu8U+TYPzDJF7wPMcUqsfp59j0mg=;
 b=MmyeIz1csu6WJBl44nfRnSZ8/2TNc2a8y4fw7ypDWBP7RiNtwDqlk/8IxH5V3c6WdYCj
 6yfXVehNuAwstqoCy5LVvNlaoryluLUf04mx9p5mbp3AkvXbnM56dmb8i7XikFnItCIw
 pHTctng/8+ZzHM4NUcTDRvR461SoOgiNFOaDWjyETRiuTYasPE6ZssbQxHrm1AQOjq1h
 oDebS2p5IX2SfV1CgbboVNg7nBA1cE5t2OI4OfivXs4TV1NGL0tGn4/Ct1xPFElBDGsj
 S1dnMfFJhrx01BSb7be1+JJT2d1OKJ2RU6hT9WdHPyDz7KnDGt0npWNJ5wa8jR3aj5Mk 2w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gbg5npngk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Jun 2022 05:45:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 3 Jun
 2022 11:45:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 3 Jun 2022 11:45:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 689B0459;
 Fri,  3 Jun 2022 10:45:07 +0000 (UTC)
Date: Fri, 3 Jun 2022 10:45:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Clarify snd_soc_info_volsw_sx()
Message-ID: <20220603104507.GY38351@ediswmail.ad.cirrus.com>
References: <20220602092921.3302713-1-broonie@kernel.org>
 <20220602162611.GX38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220602162611.GX38351@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: iO3HVwrONF0e4V99t-jiOXxz2Z0i12es
X-Proofpoint-GUID: iO3HVwrONF0e4V99t-jiOXxz2Z0i12es
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

On Thu, Jun 02, 2022 at 04:26:11PM +0000, Charles Keepax wrote:
> On Thu, Jun 02, 2022 at 11:29:20AM +0200, Mark Brown wrote:
> > Currently snd_soc_info_volsw_sx() is implemented indirectly, wrapping
> > snd_soc_info_volsw() and modifying the values it sets up rather than
> > directly setting up the values reported to userspace. This makes it much
> > harder to follow what the intended behaviour of these controls is. Let's
> > rewrite the function to be self contained with a clarifying comment at the
> > top in an effort to help maintainability.
> > 
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > ---
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

On cs35l41, seems to work fine to me.

Thanks,
Charles
