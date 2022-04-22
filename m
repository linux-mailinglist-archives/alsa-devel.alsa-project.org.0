Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70250BBF2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 17:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2193216F9;
	Fri, 22 Apr 2022 17:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2193216F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650642276;
	bh=1nodNxZJ5LdStbzMRccD34qFw7gDtiRC2FWXulcQRxc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpiGG/pouUvrrhdIGIHp67huif1usUENksU8ZT+WtYsiXlZsjt4LXmDjCmfltxv4N
	 l5UTZN79T34BLsTOoWqFY4/jOL+n+s3IrB+0cFBtjInmVeJpSQA+8Be0hodctLUHjx
	 poQsMHCb/GEmOu3dkIHFqmnEs9sSgQst6DbYJtts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B583AF80154;
	Fri, 22 Apr 2022 17:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E10F80245; Fri, 22 Apr 2022 17:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79B75F80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 17:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B75F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YJBhtd6p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MEJHnM021886;
 Fri, 22 Apr 2022 10:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fenBppHCqSMkTOtbCAyA0rMB+B8GHtohN3PghEPtipc=;
 b=YJBhtd6p0zjBBrLju27yLFrIPpvE7OyjdrvA0iGEdWP890mzm1jgfpV2EtL4wa7tOW+d
 Cf8eNYDkhpuNu4JYp40X4/2YkVwkfAPg9bHWQ71iDFgpYTJmizm6f1hQPKJYa6D9r7Wx
 VmoIf95hoCX1tDgikD1NAwRROs1t3mkkVoa4yzdvM9nA3XjE1NwRc8cHi8xGiFFZBo1o
 7T/vLgzkqOe9+WMaPIljNs3LTnprmbWSE7ouQweeDn1SppyvLsccMWYqebQRG7tKigAm
 NpqjCl5ZfnoTt0xX8vLcgcM18IMRTWN9qYPqgW+/iLYtnoqhkWPJKs8MlHdrhLT1Uiu3 wA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fft7my7uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 22 Apr 2022 10:43:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 22 Apr
 2022 16:43:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 22 Apr 2022 16:43:23 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 483D2B16;
 Fri, 22 Apr 2022 15:43:23 +0000 (UTC)
Date: Fri, 22 Apr 2022 15:43:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: wm8524: remove constraint for FE-BE
Message-ID: <20220422154323.GS38351@ediswmail.ad.cirrus.com>
References: <20220422132125.1595729-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220422132125.1595729-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: j1JASBHoX_D_0TYdTNe8GfJY8B4ff8O8
X-Proofpoint-GUID: j1JASBHoX_D_0TYdTNe8GfJY8B4ff8O8
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, broonie@kernel.org,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

On Fri, Apr 22, 2022 at 10:21:25AM -0300, Fabio Estevam wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The constraint is not needed for back end bistream since
> the sample rate is fixed by dts and the constraint
> is propagated to front end bistream as they share the same
> snd_soc_pcm_runtime.
> 
> Fixes: 007b6a54c305 ("ASoC: codecs: add wm8524 codec driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
> Tested-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

There was some previous discussion of this patch here:

https://patchwork.kernel.org/project/alsa-devel/patch/1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com/

Thanks,
Charles
