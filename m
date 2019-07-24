Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C072A4F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 10:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F447192C;
	Wed, 24 Jul 2019 10:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F447192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563957612;
	bh=q+oGw5AnA/iMzC6O/E3psJKYNdFHwgjnlXJpIU3sjds=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhnf2mGigVXeCiEfQ4eElX2a3LpoqEv9DRajZwbvo/ms65DaWSc4jmdbEEiB1/UIA
	 YCM0XCOU0UbX8Mg9ObEzTUsPOsJTGbsOnNsvyciR9xLSs4W3ykOFOlbzQCESSWnSGq
	 0jd6vuVO7niANOI0WOjfyMQU06d+acIMcWS2hTJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D324F803D1;
	Wed, 24 Jul 2019 10:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3183AF803D1; Wed, 24 Jul 2019 10:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52DE8F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 10:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52DE8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Cmnujeva"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O8XmpJ020457; Wed, 24 Jul 2019 03:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=kq12ssq+svftp3GaCiDd/DAWyCN0IaOqRChAjOHdgDY=;
 b=Cmnujevayfe5Qmqny6wB9tF9BcjpfKA9FbE9wTjBP2tDWYwbkVhKMR1r7Harb/grcH53
 fk/MZd63Sbas/stidiuv+7LrVbmgRgoT8n/zPdF+N+qlY13bZPR4WKbxjoEyxjMxOPfk
 4DXekrBvlSBfDtFfNb7Hw2Jw1Dd6Q1McHe9+clJPxrNHDDgCQTOK6RgUtE5cBY3v9kYL
 nbohTHedhstZv170oqjBTmCr3GVYtbXQBPX5kfu8kdIOIgJXZr1Taf/o74reXiXLjK+8
 aHgiBcxFbo2Hg9JH9zo6j6ta4M4TkS12yAUDVKEHsBGiJYrs+R7dXdfJ7mkfV2kMcv86 ZQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s13ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 03:38:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 09:38:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 09:38:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 73DFC45;
 Wed, 24 Jul 2019 09:38:14 +0100 (BST)
Date: Wed, 24 Jul 2019 09:38:14 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20190724083814.GS54126@ediswmail.ad.cirrus.com>
References: <20190724052632.30476-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724052632.30476-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=845
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907240096
Cc: alsa-devel@alsa-project.org, gustavo@embeddedor.com,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8955: Fix a typo in
 'wm8995_pll_factors()' function name
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 24, 2019 at 07:26:32AM +0200, Christophe JAILLET wrote:
> This should be 'wm8955_pll_factors()' instead.
> Fix it and use it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
