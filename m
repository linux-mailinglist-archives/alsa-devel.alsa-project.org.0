Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171A4D6563
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58BC19FE;
	Fri, 11 Mar 2022 16:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58BC19FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647014074;
	bh=mcDxrSm67BgJU56d4TaKJszZEiHbo00hxzz5O48m4d4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6jjc0+jApm6mOjlyKwyEb2rDTIMAEgTtEcQIVGv/IbmIWD8+s9g5vv1N10oW3hZ2
	 wlMf/hIl0hg/S8rBz6rhNEbE/lRV2TCc34u6FzMU0IGB0w9kRixJTDPteHYSHOG8yd
	 aD7H/gMcSlCSbVEtBWG84vf3VI5n4rKAQtqqdmWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47231F80085;
	Fri, 11 Mar 2022 16:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C78EDF80085; Fri, 11 Mar 2022 16:53:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D454FF80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D454FF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Dgzd+bcR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22BEUCEe002318;
 Fri, 11 Mar 2022 09:53:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=b4QiXZG/thFbq+m+ebbSVj3W8CFNFrkYYo6odJwuMpU=;
 b=Dgzd+bcRFHeUaVhrEEADbqve57F45PV/SeoPl8kkk1j98OTVkeDXWX/2YJSN9r6z6jMs
 IUlq2UqLux+UcrgWamyy+CIvk7IzahF7OdyO/9bZqDzJExcgeg5hDEOaZ2wIgHCygDD8
 S0pmXuKwXU2DPzjoLAerSJYEXMU2Z2ILqacDh3J02LH2yVo6jdVX16dT/uNHSfaUr3P7
 eJ2kZzcv5kFd4Jg/zQktr1C+f8MT2JUDnbzXGneM1nmmiPDB5blOLaRcCuaZa83477MU
 IgJWIVz2KCHijgeYHvZzGk7VnRTEpEHWWRA9AIXKVAXE9BoSAS0VKen8qUN5KgJRLX2v uw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656rq8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Mar 2022 09:53:16 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 15:53:15 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 11 Mar 2022 15:53:14 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E5451B1A;
 Fri, 11 Mar 2022 15:53:14 +0000 (UTC)
Date: Fri, 11 Mar 2022 15:53:14 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: soc-compress: Change the check for codec_dai
Message-ID: <20220311155314.GK38351@ediswmail.ad.cirrus.com>
References: <20220310030041.1556323-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220310030041.1556323-1-jiasheng@iscas.ac.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: k6M34B6HZjYCISxFO619goEskfvufoYP
X-Proofpoint-GUID: k6M34B6HZjYCISxFO619goEskfvufoYP
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, dan.carpenter@oracle.com
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

On Thu, Mar 10, 2022 at 11:00:41AM +0800, Jiasheng Jiang wrote:
> It should be better to reverse the check on codec_dai
> and returned early in order to be easier to understand.
> 
> Fixes: de2c6f98817f ("ASoC: soc-compress: prevent the potentially use of null pointer")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
