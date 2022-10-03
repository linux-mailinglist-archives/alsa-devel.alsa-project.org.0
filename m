Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25C5F2E9D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1AE2074;
	Mon,  3 Oct 2022 12:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1AE2074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664791599;
	bh=KyYkafdB+19sfi0DIGPpUXAYQ/+h3/2suevTB68G38Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AF6T8yCGTJ1Nj9zSjXNIK/9X0F/QHhRk5RrS4ggmcSGhfTgmQE3UX3uVgbLiuAzjj
	 lUBtMQhyNatpHAKYyacWRkjL8BHfVsaM5yxnjtiiRGnXyeLGn8CuUl7sIzrHte2wFf
	 y14XPDPOsR6XCxZoAURKUs64dDU3GUAh7NNn8Gqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5482F804E4;
	Mon,  3 Oct 2022 12:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C1AF80224; Mon,  3 Oct 2022 12:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E3DDF80224
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E3DDF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d29Haa3c"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2936CClu000542;
 Mon, 3 Oct 2022 05:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LETYOcqMKmRIW5Ml2aZbCyaGwXdd/RSeSDnvMQtfO8o=;
 b=d29Haa3coy1kvCdXdTF6J396Y4w4bfimGRckt+hDp4P3cvECt5RAIPdi994XWwBYBr8o
 HzmFXJ4Cszcu/77Ndb35ihVrV2HPGv7/puwUTpxtBgj66R/vfc7cHILVSRkEIuWIGtFU
 FnAKZYJQut+y/81mRWLBuJhT3VMB6i5qo3o81Xgs+SQjEKqqmL9nI66DL+cK6WBriHUU
 Xtb0PBdIuDbB5IwGulY9OB/6jA6B2j4uCnQkhMspqMjz9EhK2khu3hcY9DOXdcifTdDX
 1qY5jiZQ1kJ5Fg98Onl58eEiarZxJbpVCMdwbyLyRIOgIIwE5nfyFsjdla3F08XpMAHx IA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jxhyq21m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:05:29 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:27 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 3 Oct 2022 05:05:27 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5E4AA475;
 Mon,  3 Oct 2022 10:05:19 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 2/4] ASoC: wm5110: Fix PM disable depth
 imbalance in wm5110_probe
Message-ID: <20221003100519.GW92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-3-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Jj6B02k2pl_94dotnCNhMQNlthfawMH2
X-Proofpoint-ORIG-GUID: Jj6B02k2pl_94dotnCNhMQNlthfawMH2
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

On Thu, Sep 29, 2022 at 11:06:51PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_enable when error returns.
> 
> Fixes:5c6af635fd772 ("ASoC: wm5110: Add audio CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns.
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
