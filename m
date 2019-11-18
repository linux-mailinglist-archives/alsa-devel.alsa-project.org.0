Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59471004AD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 12:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188D3168F;
	Mon, 18 Nov 2019 12:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188D3168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574077744;
	bh=zK62iCqlvWCmF4UyA1DbzTfxTU43MH1lJZurFn5J/3A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITka4xiyZRJKitC3ehX0hPL4+3Y0TXQoVxu7tswNG0wtNYWhqlJw9e4ZlfAx2Qp9u
	 FfMmCkLSslAtglSSd30P69ApYOVbbf3CkyZaGIYj1B8UBVc2RC60siQY7+AmocFkoS
	 Ir+8sz/rUDU2MErzTSUwrUVp7hCx+0ESCkI0+aAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7216BF80100;
	Mon, 18 Nov 2019 12:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25990F8013B; Mon, 18 Nov 2019 12:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35070F800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 12:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35070F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="icrapQg7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIBkk25014994; Mon, 18 Nov 2019 05:47:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OM3MQeyRTgCY7g+moHKBnLM0sRNaezpSVyrjEwAMecc=;
 b=icrapQg74Qd4MPDUwNx097+RA3EOaBGON5SjPL0UpA+gMqF3J3FT+dZX4mSQKH7/6lVS
 GykNgPvbzoT22HQc6nstMduxd2/V9ADldP/R8cjpMGjI/FRP+gEmour4OZ26uKm4ayv7
 +O4p1N1ZIPT6M6QIZhgK8lJ6AA0o2o3G/slwqgDqcYnwqzeqQ9r4Z+3kEC5X68rg/bBI
 /PjUj7K2NB4wVzdqNwksJpLF+cDTC8AkY/di+D/MrLxtkOJEChyDvcTM8zC9/4vXmdmb
 9fKdxDF4U1+1fWQQla7YtN5UO/+NZP8CK3JCdlHodfD3GmuBFE/g/hql8ct2EpIIspTN 9A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2wafc82csb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2019 05:47:09 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 18 Nov
 2019 11:47:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 18 Nov 2019 11:47:06 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 105292A1;
 Mon, 18 Nov 2019 11:47:06 +0000 (UTC)
Date: Mon, 18 Nov 2019 11:47:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20191118114706.GF10439@ediswmail.ad.cirrus.com>
References: <20191118073707.28298-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118073707.28298-1-hslester96@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=714 mlxscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911180107
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wm5100: add missed pm_runtime_disable
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

On Mon, Nov 18, 2019 at 03:37:07PM +0800, Chuhong Yuan wrote:
> The driver forgets to call pm_runtime_disable in remove and
> probe failure.
> Add the calls to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
