Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F91BA16A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 12:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C07166D;
	Mon, 27 Apr 2020 12:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C07166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587983688;
	bh=8DM2BDMCOXMZfzvdZGR+QJC8xU5aKR5QMmGy/CT/IUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=spH/tR28TNTlrIk7BY3WyGZShc35VgAfNQqWa8QtjvOflXQSw0abq4G3X6LyAerPu
	 u8kcYcdP2C/kGKOig6lf/KC+49SJHCiEneT0FmpIbajfCar5CtoiHghdWmPXRJSvre
	 n1Q8rRILwZC2dtSnrymuKcOe1gaMHqKqTIneATpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C86F80257;
	Mon, 27 Apr 2020 12:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D130F8022B; Mon, 27 Apr 2020 12:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D9DF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 12:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D9DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Qn2mPZs3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RAT1DG001890; Mon, 27 Apr 2020 05:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LiJ2Fq3Jj+17nXSz7NwWSDtYILEvzTXxE2sPvciKCKA=;
 b=Qn2mPZs37tJ4JozsoGPJNk3cTpZKeLARKuByRZq20HeAutZkPBT/lroX9hj7eQD4iziY
 ebwNZrgu8POUODgJPLdCQu5E0Fzmj0jhZNlnp3Mdh3VRsHjHDCbMRjvMe6fCxogD8pc6
 RC3eITuHvQirWRPrTv5mgAsKzQlRVQKt6FINM6Seg+WLZit9sL7hYI+yKKl6SRisCapE
 hjI91AwhmxGfVgC+cwc4ddyjsm1MAxHWh72r9Da8Zyrlq2O8+F7JYLYV/tZCmjSEE9fc
 X5NFoh01HP+0gc32+zoB/3NGVrCYyctWKwEED+J7xyUz9eiIyux/KyWiXSKdQGX+lmo4 /Q== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 30mjm4ayq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Apr 2020 05:32:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 27 Apr
 2020 11:32:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 27 Apr 2020 11:32:06 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 47A852C6;
 Mon, 27 Apr 2020 10:32:06 +0000 (UTC)
Date: Mon, 27 Apr 2020 10:32:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200427103206.GL44490@ediswmail.ad.cirrus.com>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200427074832.22134-5-m.szyprowski@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=975
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270094
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Mon, Apr 27, 2020 at 09:48:32AM +0200, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> clocks in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
