Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C65053FC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 15:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2931D16E8;
	Mon, 18 Apr 2022 15:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2931D16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650286928;
	bh=cXzORLLr4sbKO/BpplcbUAF8ddQjc3OjG4DDH7sbVuY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEcBhaygsVNAnFRQ/pWHCUWz/BlCOvsKkR4W4nNsasi1SVmpdxW4zFdqPtj6HREtB
	 9FwaOV+iUCX1nx9Grud6XIuEgkUY1UiP7uisYCKd3XJUkUWDdJXY28CxS9Dilpuvoq
	 L31npTdUuDV4ATj7VahNya70rGQKw2bgOIY8M7R4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A91E6F800D8;
	Mon, 18 Apr 2022 15:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B80D1F8014E; Mon, 18 Apr 2022 15:01:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78CA8F800D8
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 15:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78CA8F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cHG6J304"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IBd2un027093;
 Mon, 18 Apr 2022 08:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0XOMCRsLJEli4pwqJVwSkmm9Imnsr07cAJCh8WzK9BA=;
 b=cHG6J304RS/6msPYoGsVj9ki7BY45Y/QzSGz7QcvCyv8ivwtGCIyS78Tol+GeP0WA17G
 a9Z5o0MeSBuIb8UUmVkujtvtGm1D22SRnMoyJcMcRdW7G1sQL7SFXXSs7XOb2mTIDuV5
 rHkTzgLeUDyBny+8nr4T/OR4Zh8RXDBqLH+2BiREMd9jUG0QB8VJa11c3Uje5G+wN7SU
 +fCzXmO8UpFDT/ty6LnaHqWQnsKZBg3s+s54dYE6FuSldyHINPY0Ehv4woDoUpWpZ0Q5
 n9k/yAd2g6SOFMeELd012kZ6HoQx/adWeJSNN2ADFSwXES8bigHAneNk2ic+acyBeYKG tA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fft7msvf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Apr 2022 08:00:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Apr
 2022 14:00:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 18 Apr 2022 14:00:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 46FBAB10;
 Mon, 18 Apr 2022 13:00:54 +0000 (UTC)
Date: Mon, 18 Apr 2022 13:00:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <cgel.zte@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wm8962: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-ID: <20220418130054.GC38351@ediswmail.ad.cirrus.com>
References: <20220418110259.2559144-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220418110259.2559144-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: PsQS2BgAoLINJu4Xj1w7dDtiBR0lPfp-
X-Proofpoint-GUID: PsQS2BgAoLINJu4Xj1w7dDtiBR0lPfp-
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Mon, Apr 18, 2022 at 11:02:59AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
