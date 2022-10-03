Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA225F2E9E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4146D20CD;
	Mon,  3 Oct 2022 12:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4146D20CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664791620;
	bh=ifVakyxYdtVOFdRdEVSQLt2fVnyhRIlCJYK390eI1hI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHpUafieeReg3y/QVoZLFpC8DjyyrNqaPRMgYavJz5xE5TSw4oeqJC6tUng+JSa70
	 YRMZS4HXrnH9SNob3NnErmwodMja9fyUMTo8p0jFBe3IbhfJiC8csF/ypDwqrSffbI
	 lrEab7GKxIxD9XM70I+1cqjcXPSDdEkNwv5BowQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F471F8053B;
	Mon,  3 Oct 2022 12:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C7EEF80535; Mon,  3 Oct 2022 12:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7ED2F800C1
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7ED2F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AvAOIc/H"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2934nZPn015297;
 Mon, 3 Oct 2022 05:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=1moqP3A2bwl62SN56AGNJwGXJANlGVGyj/tqswbUkGI=;
 b=AvAOIc/HF35V3MGOYWM31SvHmh3FhOKU3OrtaD3/zE92voFS1mtXC/VAdvJJ2xuIXTc5
 7UzRhvniyAgrv3aq28cN1vFd+NLO6LfiYHcB9iWoB/9cYV84XJ2KtjKL++kvqHG+WMcf
 wdkHDiizPoIF9AhNiTPi+/nE+QiHO6ffK0EheBm+pDm0kp0e6zuaajn1GIeX1Rz5QszB
 Vql13YUPNc89r+mQDW3Q/iItOC9ijoRASZIhckDiOvMtDPxIytoJsnCkYEt1/Jhhoy6f
 TxdLO4GY1lVa1um9nCE2RFYVlefn8/g7hZhYCtYbIv9cEryqlkkjwSfxgY5qSkgVsqzQ mA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jxjy321hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:05:41 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:39 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 3 Oct 2022 05:05:39 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB8B3475;
 Mon,  3 Oct 2022 10:05:39 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 3/4] ASoC: wm5102: Fix PM disable depth
 imbalance in wm5102_probe
Message-ID: <20221003100539.GX92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-4-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-4-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: AATgxrvH0syWluTFEonSgN-vMsR87xO8
X-Proofpoint-ORIG-GUID: AATgxrvH0syWluTFEonSgN-vMsR87xO8
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com
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

On Thu, Sep 29, 2022 at 11:06:52PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:93e8791dd34ca ("ASoC: wm5102: Initial driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
