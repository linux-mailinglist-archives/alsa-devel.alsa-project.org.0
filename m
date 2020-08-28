Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E60255E41
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CB518BA;
	Fri, 28 Aug 2020 17:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CB518BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598630148;
	bh=cl914DCj3NpC6BlBvqpTjZPyywvcdE1nFASzgS2VegE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qiUNlStK03thtprqjsbXg8Ih8uBnMxJq0q5gEQEkC2pIkaLwZhQyhi9v335H1Riw7
	 StwfnF7M/v2yiZvMxGXgTVprOW68rH5EcG79Aq35aMhAfXtexqcXec5PjxOZfpYfKq
	 gyHehwpJUdUYUP39jlCNW8cJhpZNAqKr2IVd/zNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D764F80143;
	Fri, 28 Aug 2020 17:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E23F8016F; Fri, 28 Aug 2020 17:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2BC6F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BC6F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bRuLBMoI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SFi0Uq021999; Fri, 28 Aug 2020 10:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qhUw5EM9tqAPaoYo4GOoztPzC9zw8DfW3LO1+A6Y+28=;
 b=bRuLBMoIsUU2RjJIR8qts3Oo4Pv64klBTiafZz/oeRXu54YUvre3T6GR6XdO8NoY+wS9
 H5LwBEmr8suz459X5hNyVLco6Er/QBsFs+uznnC5bK/pJ8dLewQQe/qqxNgyYShjnoGR
 3lj7BD1rKeyh+qIDgYHZ81wjltNgPX473U311KTEyoyMRLU10rgyopFs0seCy33pg3Mw
 JQ/qNZsjxEmbeuQXvXAenGsdaz+eQpjdx7Be+HfNgESXNmghb14L9Ekjdvo9rzSR+wfM
 d4SvcU9Ye8tzJQNtn07/GYi1iRT/QcMdi2NZOdfztWa0ttHtp8k/C4FTV7Aghf4jimVF +w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3330s3h7e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 28 Aug 2020 10:53:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 28 Aug
 2020 16:53:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 28 Aug 2020 16:53:49 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40F7A2C4;
 Fri, 28 Aug 2020 15:53:49 +0000 (UTC)
Date: Fri, 28 Aug 2020 15:53:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ASoC: wm8994: Ensure the device is resumed in
 wm89xx_mic_detect functions
Message-ID: <20200828155349.GK10899@ediswmail.ad.cirrus.com>
References: <20200827173357.31891-1-s.nawrocki@samsung.com>
 <CGME20200827173426eucas1p13f9f7d358dfcc440db160de3dc658ddf@eucas1p1.samsung.com>
 <20200827173357.31891-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200827173357.31891-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=766 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008280119
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, m.szyprowski@samsung.com
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

On Thu, Aug 27, 2020 at 07:33:57PM +0200, Sylwester Nawrocki wrote:
> When the wm8958_mic_detect, wm8994_mic_detect functions get called from
> the machine driver, e.g. from the card's late_probe() callback, the CODEC
> device may be PM runtime suspended and any regmap writes have no effect.
> Add PM runtime calls to these functions to ensure the device registers
> are updated as expected.
> This suppresses an error during boot
> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
> caused by the regmap access error due to the cache_only flag being set.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
