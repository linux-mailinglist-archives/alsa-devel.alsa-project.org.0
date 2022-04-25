Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6F50DD8B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 12:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A1F16E4;
	Mon, 25 Apr 2022 12:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A1F16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650881021;
	bh=Xib/67yb+a4Rz4/JC94WVq7A+4YYYt9tcF1g9kkZv1Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nu8O2UP7kxYu34F6MYrywlofPa4mixFNRKcs/Z4NuKF2WLbKDYZC6iZsRkH1RVSao
	 pQsXgWlUDVy1mtU6sEFCCVSqFYREdbVTEUdCM+eJQ5Ggc7p5wUNR1PZdr2cStDw1ru
	 JdQH65j2Z1ab+CI6R5twUZShtNmpUnHt9V17z2lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C576F8016B;
	Mon, 25 Apr 2022 12:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47DFBF8016A; Mon, 25 Apr 2022 12:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07200F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 12:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07200F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="l4OG3GyW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P6KC6N031455;
 Mon, 25 Apr 2022 05:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Z5YuVtU3yeCHJFHuOFw1Fh1OHZ3/W3ElUfaHLr4h05s=;
 b=l4OG3GyWOl/B6u5h5xayNavv2H4ks7yNFVIJbeEK025Ym8trfsJHEmOzgnPEocHHapth
 GOoFMazIiFFq7AMPSeWWw2afLJZzSXvHXGWZl0Pw4wqCmXiiMrCI5NohyuSK4jV+cx26
 u0N9WXuxFiIX6xCSbBdc7dOcjn3wqL6O9Ckmh9qyviyd83fBSmZNIcCBblhcSWfwR5WG
 oRqdgIbYx0qwp2hYp0yISRYaOAcqSp74Uim9FAdwrMS73Uh9xu9curbP/MoI1n+o0C3z
 GYaNfq5Xu7uyRsEYDgmLO1L4aL43jzLwA+MzYSDSURvbfEUqyKiJI0Kmoy6KurDQzmoT 7A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fmev31rnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Apr 2022 05:02:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 11:02:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 25 Apr 2022 11:02:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 577A7B16;
 Mon, 25 Apr 2022 10:02:29 +0000 (UTC)
Date: Mon, 25 Apr 2022 10:02:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cirrus: cs_dsp: Avoid padding bytes in
 cs_dsp_coeff_ctl
Message-ID: <20220425100229.GU38351@ediswmail.ad.cirrus.com>
References: <20220425095159.3044527-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220425095159.3044527-1-rf@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: FCrVFt3F1McrOxYFLs5iWCdjsCw45OTB
X-Proofpoint-GUID: FCrVFt3F1McrOxYFLs5iWCdjsCw45OTB
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 25, 2022 at 10:51:59AM +0100, Richard Fitzgerald wrote:
> Change the order of members in struct cs_dsp_coeff_ctl to avoid
> the compiler having to insert alignment padding bytes. On a x86_64
> build this saves 16 bytes per control.
> 
> - Pointers are collected to the top of the struct (with the exception of
>   priv, as noted below), so that they are inherently aligned.
> - The set and enable bitflags are placed together so they can be merged.
> - priv is placed at the end of the struct - it is for use by the
>   client so it is helpful to make it stand out, and since the compiler
>   will always pad the struct size to an alignment multiple putting a
>   pointer last won't introduce any more padding.
> - struct cs_dsp_alg_region is placed at the end, right before priv, for
>   the same reasoning as priv.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
