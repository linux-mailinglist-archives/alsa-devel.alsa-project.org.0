Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2DF52BB94
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 15:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17EA01FC;
	Wed, 18 May 2022 15:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17EA01FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652881591;
	bh=gGHAConj81pF+14BkY1BUj6tEp8/yktBC4DCzrjD4W8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGtqXAV5juRFIe1iWvdlpNTH6lOrREThwC3oqlPLOX2/DFkLffiLTPnFnHfTkAOCm
	 gjayyJZpmQPbQnT2iA8+wYMQlJySTBfKVG1dCJdUsHFL3/y9fqrTyBK+pHuc6Va+xR
	 0pDH2tEq6b6Rashw4pcFbK/NNsrWiRahPLuv/nj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 661CAF80279;
	Wed, 18 May 2022 15:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E60F8023B; Wed, 18 May 2022 15:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD4C2F800E1
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 15:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD4C2F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jJqGPkOU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I5xw9k005166;
 Wed, 18 May 2022 08:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/v+nztOH8pMiCldPuv2onTZr9sRDaO7ZE4i23WJ4K5o=;
 b=jJqGPkOUdeC/L4ZyYUnC6X9sEc6RTnXH/TCZUrzLpo10aLccXsSaQ5Gh7PWNyyTk9an4
 mLFfI6Vm4S1nGIDnnCnH+5UfcP+yZ0M+OXu35f4oFe99XWmmdA2m1TYIO9Wx4oc48EyB
 E+PwooMR8Mw9YVvGtUcQdWFGmlqCFOio1JhIexHAnTWUQh8EC5H4uIW/xePkvXF3R2UE
 nJJW++M+txPsTxeHfikhosSeWl01oawvw19rL8GgnKy+2+eUVrLrA17lRGIVoyoYTWBl
 mSBZVGDyaPatwAoYd1iH4vZ3o4JuSn+J0G5JKkT21y6DDAg9BvWVP7kNuIlACTq+NUGC Rg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28updkk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 18 May 2022 08:45:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 18 May
 2022 14:45:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 18 May 2022 14:45:15 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 94983B16;
 Wed, 18 May 2022 13:45:15 +0000 (UTC)
Date: Wed, 18 May 2022 13:45:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: wm2000: fix missing clk_disable_unprepare()
 on error in wm2000_anc_transition()
Message-ID: <20220518134515.GJ38351@ediswmail.ad.cirrus.com>
References: <20220514091053.686416-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220514091053.686416-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: F0-9IuOAChH6CS56puNXd2LLsGwWYKkN
X-Proofpoint-ORIG-GUID: F0-9IuOAChH6CS56puNXd2LLsGwWYKkN
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Sat, May 14, 2022 at 05:10:53PM +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from wm2000_anc_transition() in the error handling case.
> 
> Fixes: 514cfd6dd725 ("ASoC: wm2000: Integrate with clock API")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
