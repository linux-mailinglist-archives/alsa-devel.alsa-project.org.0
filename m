Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F362301A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61F6201;
	Wed,  9 Nov 2022 17:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61F6201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668011120;
	bh=qRja1L3Uku5FhUSi3Ubc+GICg3wV8hdrB5yRQEddy3k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ao5VWo/CIWzya1yXA9LF59QLXaZnHM00kF4+9hXslrnrhR6w1s1qwocxtRoQeL42v
	 5wiSqJhJV0/+1kHNUw17Oq5U4FbXh50d2RjvSKW28EVsNlKOmCbvY+bqO1paaxCt3z
	 sJ8JZAtTZyDn2BDlIrWx6VF4IuVVGnz8BwFJNWWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A400F800EC;
	Wed,  9 Nov 2022 17:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B054F80217; Wed,  9 Nov 2022 17:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 751CDF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 751CDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HD5wmr87"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EDLMk024619; Wed, 9 Nov 2022 10:24:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=4LdghTqwuCMPOdU9Ut4ETkmJT6zVE1bHF4jdVG2J6p8=;
 b=HD5wmr87wcyfInGnCIRbw6/GHA355PIbu6DG//AUXQK33MInwvfY9G0OibcchpC8x4Hg
 fzgx/AAvFzf6NqN3yVvIXOSKjQHUKM/wkeJr5pQHpL9qtguXbGgo5Zdy4PoYs4eMAvyW
 GTN6JO5w5+pqAvoqEkRi/bd43hHX5/ZlniRVJAeFfmSj0nABTvhBZD7sSbWcN3mqxyBO
 3X0MYm9uW6ZGJ8qLgeSxll618SHDUp6R+oCv5z3hc20EwMLKCSyCGl+5GqpFkRW7/j1Y
 ZC95ytAUS8zDe5cnbzaOYzHnCE/0YwqZry98qDh+zngmoDfsDHdEDZ6o8aUuDMUB0fI8 0g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81nj0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 10:24:14 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:24:12 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Wed, 9 Nov 2022 10:24:12 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ADF88B12;
 Wed,  9 Nov 2022 16:24:12 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:24:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: Wait for updated value of
 WM8962_CLOCKING1 register
Message-ID: <20221109162412.GG10437@ediswmail.ad.cirrus.com>
References: <20221109121354.123958-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221109121354.123958-1-chancel.liu@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: OB147xjjz1wIV99wseqVZ6HmdeMEacsz
X-Proofpoint-GUID: OB147xjjz1wIV99wseqVZ6HmdeMEacsz
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, xiaolei.wang@windriver.com, cmo@melexis.com,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, tiwai@suse.com,
 chi.minghao@zte.com.cn, lgirdwood@gmail.com, broonie@kernel.org,
 u.kleine-koenig@pengutronix.de, ojeda@kernel.org, steve@sk2.org,
 luca.ceresoli@bootlin.com, linux-kernel@vger.kernel.org
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

On Wed, Nov 09, 2022 at 08:13:54PM +0800, Chancel Liu wrote:
> DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
> correct frequency of LRCLK and BCLK. Sometimes the read-only value
> can't be updated timely after enabling SYSCLK. This results in wrong
> calculation values. Delay is introduced here to wait for newest value
> from register. The time of the delay should be at least 500~1000us
> according to test.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
