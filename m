Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA6439451
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D64616AC;
	Mon, 25 Oct 2021 12:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D64616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159411;
	bh=6wX2ot9GHj+qrz01lOJ+vCsoGYrF3T+xAIR9NfF7LgY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kx3IJLV0JfODNjGbxc2WH08McUJn0Ycx4HKynVkWHWYdfM2na09lg/jko3+xmLY9z
	 je7WQQUJK2pRqkgwUtRZ31tPtx+QXmlCvbioI7HIRo76VWXaDmNuMmEMtpvrfGPjo1
	 buh0JEuulg0Jrynq+2KPedJMve9MEtagluCqCUg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F6ACF80431;
	Mon, 25 Oct 2021 12:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E23DFF8032B; Mon, 25 Oct 2021 12:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70AAF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70AAF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="J708z5SL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P5oWEs027295; 
 Mon, 25 Oct 2021 05:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=qFvaqnHxIJaOtzxuuJgrGRnygfEjQgI9lf4v7oYzfLg=;
 b=J708z5SL48TZPr1RHFX9AtPCiy/gAE565zjvmGh//lpigQW/XzU9DKt34z2GxfI2O81/
 NW0BAWWh6sb5QC/5ImyCrJo5y8PlLzRVPomBWLlOuMXATvQumUgYTk8kNe1sx8SBK/gc
 urQtgTIn1TRsPx24J7McsfL4LF4t5CnvXnb/I6VH2knQTqpTsX0mm6LJopfWrI/D9rYs
 rFqzUTuz4QKsIkLMZgV5lTZcuFw3Wglq/buxL9J8bvca4uGPH7GuKAE2u9OTi6IQjLfd
 kuMAE7pfgi0Q+T7pe1izQvsIkPmCX6uvj2IkkKUNduajFlrQYVEhYuvXEKpbSoFF31oX mA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bwn2mrav2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Oct 2021 05:55:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 25 Oct
 2021 11:55:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 25 Oct 2021 11:55:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8E94911D2;
 Mon, 25 Oct 2021 10:55:09 +0000 (UTC)
Date: Mon, 25 Oct 2021 10:55:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoc: wm8731: Drop empty spi_driver remove callback
Message-ID: <20211025105509.GF28292@ediswmail.ad.cirrus.com>
References: <20211020125803.23117-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020125803.23117-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: tfmYHaHUmvsA182KArEsuB5p548NG0UP
X-Proofpoint-ORIG-GUID: tfmYHaHUmvsA182KArEsuB5p548NG0UP
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@pengutronix.de
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

On Wed, Oct 20, 2021 at 02:58:03PM +0200, Uwe Kleine-König wrote:
> A driver with a remove callback that just returns 0 behaves identically
> to a driver with no remove callback at all. So simplify accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
