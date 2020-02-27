Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD51171AF4
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 14:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9ECB16C1;
	Thu, 27 Feb 2020 14:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9ECB16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582811910;
	bh=wlwG82T68ZO7KgGXnEHi7VPxAoABSlzfz36aK7Y4au4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/NOWQgsC2upNNUx78Z9ya9ZKQGSUe9svL9aGcX/CHcFuealoyxbebY9UcIjHx6+R
	 3ZXRdJW5kx51ZkhJjg/QCVysXL4KTzXCSVfeGq1e+nMLWV8AXbH7fF532n2q1tMYEP
	 UnAu6MU6J8VpoZ53enGEkVtYGvHC5hGrpnWXS3hA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEEEF800E8;
	Thu, 27 Feb 2020 14:56:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8CC3F80142; Thu, 27 Feb 2020 14:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4AD7F800E8
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 14:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4AD7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dR3lnFyh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RDuC7d029248; Thu, 27 Feb 2020 07:56:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=amPxsDfm7SqjfykuCL5pbWIfRVa+H79NoUbKNKQcYwo=;
 b=dR3lnFyhMbd0Qb1zP/ziQMoQOlw4VTMPRg5csSA5OMHH/lGbcAo8Bfzxgoc7VSXhId08
 J0uqRFweXWSmZ5PvpXZ9NjaG+fSRENUZmKKocRd8FRpoxObE+Xbs8WiMDmkBWmrtaY7m
 jrMGoDuVajPXLPU7bFwBJK//Ip53b7/AFi+Hqm0NjfKxrHK1ktF63vCHOR2a13liDilt
 2n59FAzSSiwN5esy/1zFaxkAZXETnDKONOu0mdTEX9g0x7UfI4ScPHszBCBvGI2/5Npl
 fu9+/AxD0eYYOSgpnq7UXamQ7SPPV3ZSfhS55nFzcHMcKjafzn35f1Anq/sCXPMJjk2P Jg== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2ydcmbbkp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Feb 2020 07:56:42 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Feb
 2020 13:56:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 27 Feb 2020 13:56:41 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0F33445D;
 Thu, 27 Feb 2020 13:56:41 +0000 (UTC)
Date: Thu, 27 Feb 2020 13:56:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2] mfd: wm8994: Fix unbalanced calls to
 regulator_bulk_disable()
Message-ID: <20200227135641.GJ108283@ediswmail.ad.cirrus.com>
References: <20200226100802.16384-1-m.szyprowski@samsung.com>
 <CGME20200226100815eucas1p2f4448e3dea078bfc58a8acdc70340c11@eucas1p2.samsung.com>
 <20200226100802.16384-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200226100802.16384-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=556 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002270111
Cc: alsa-devel@alsa-project.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>
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

On Wed, Feb 26, 2020 at 11:08:02AM +0100, Marek Szyprowski wrote:
> When runtime PM is enabled, regulators are being controlled by the
> driver's suspend and resume callbacks. They are also unconditionally
> enabled at driver's probe(), and disabled in remove() functions. Add
> more calls to runtime PM framework to ensure that the device's runtime
> PM state matches the regulators state:
> 1. at the end of probe() function: set runtime PM state to active, so
> there will be no spurious call to resume();
> 2. in remove(), ensure that resume() is called before disabling runtime PM
> management and unconditionally disabling the regulators.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
