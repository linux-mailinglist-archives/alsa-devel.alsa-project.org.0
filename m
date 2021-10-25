Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937FF43943C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:54:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7D05167B;
	Mon, 25 Oct 2021 12:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7D05167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159274;
	bh=uYWymehe04EuUxKUn00F4UiMaij/6ZTxsmHEwtB8gDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rq2+MfjC8P8v8VhAzoZCUtobvifZ5dk4HF9e2qFnco6UvcqNuK5dTUYtPgEkHUFgt
	 XFtderInQQwqhUNevTG9VXKiWB0dJR6DdRyeUSiDnJayerxa41nH5NqgbiuTn6G+79
	 IhLWZzerO0g/YKpOLwYdZYqSctTCguHpCkZ8/Bug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 578A8F80166;
	Mon, 25 Oct 2021 12:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F47CF8027B; Mon, 25 Oct 2021 12:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A530F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A530F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g/i/dZMv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P5nh0W025457; 
 Mon, 25 Oct 2021 05:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=6z+6s7o7bxg/tb0nSDrrdKr95XT+g6aj+Ee8kMOZJko=;
 b=g/i/dZMvd9ry7pbb1bkXXJ/m7J6N2pMlxRVxHEhR7ropUuBy/tIBzgggjjiqqdH4Tlym
 PfHHIMP+ZaRi/iQr6ZdjNK5GWjGMiuXIh9zRkwG5/+Z9ujK1JJNerHxIA76PKdiq5z15
 rjWpzeGQY0gkilhsnSN90OK+wVLcGAbvB+JGbhnme5UdtRgFasHAe5uJ14BRfSzXtF4B
 HW1p1+dir6Evqne1C5s56dYOJw+XPCcsOdLzR+9zHqQcc5TR183h6g4+ue8vuFbL0Ikm
 hOo9/w0VZDxv3t5c5dQXDik0Xdf71IKNwxUEzTZZT4Xmihr2sQ2yATa1vgmonbP4sdLd 5A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bwn2mrath-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Oct 2021 05:53:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 25 Oct
 2021 11:53:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 25 Oct 2021 11:53:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A506B11DB;
 Mon, 25 Oct 2021 10:53:27 +0000 (UTC)
Date: Mon, 25 Oct 2021 10:53:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Message-ID: <20211025105327.GD28292@ediswmail.ad.cirrus.com>
References: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 5xSA8DGx6tihKfVi-lg-Z1ZYYNDmRXws
X-Proofpoint-ORIG-GUID: 5xSA8DGx6tihKfVi-lg-Z1ZYYNDmRXws
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Adam Ford <aford173@gmail.com>
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

On Mon, Oct 18, 2021 at 04:01:11PM +0200, Geert Uytterhoeven wrote:
> Use the existing devm_clk_get_optional() helper instead of building a
> similar construct on top of devm_clk_get() that fails to handle all
> errors but -EPROBE_DEFER.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
