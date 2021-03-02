Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8D32A059
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 14:20:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D925A1701;
	Tue,  2 Mar 2021 14:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D925A1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614691253;
	bh=20Pih5eYSXBIOnPpCPRKxQEQzRyoG04Lb3OCnmA+K28=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGCNe7FTQRhyJ+SBn2GNAllqy63wLA9sHE8uARpTfuo3iXjtE1H1TV+b6RcvVyAQZ
	 ZU2oI51PGajyEkmXq56oaQ1lMk0+Wr3ayDLEb9+DMaoIvtFX5uvvDxxgD9QUUL8Bd4
	 g6hhFVbJtSA4FBXmLr9O/21089dBX07qxBGs4zLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3276CF8012D;
	Tue,  2 Mar 2021 14:19:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6FD1F80269; Tue,  2 Mar 2021 14:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6218F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 14:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6218F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NGIJpzeA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122DGtvB027209; Tue, 2 Mar 2021 07:19:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=t2lwxX1hbQrJ3MKSvW2tSY+53xgKeDE6McOV5fU3ESU=;
 b=NGIJpzeAIxgLR2Cj+tOOqX9SOBQXThs4BVB6YvQjvva8vWnC2tooORQ9B7YXS1JBA3JP
 rwiloKHRhYzmmw7LEPpwt+4qbX5GJadPhTdYKaasqbo+w4p9F/mGoOrV2AvDWVnIUC1m
 VO2BVJKfX3aZe/mq+7XptR0ymXFEcL1VqoaNJigw95iAcU2BlFdiJJp3TVR16ekhAjHI
 kZ5nWRIdinEUIc0fqt+o1LvOXWrzjIkW3+fCBwQYVzLtE93cDd9Y4dMUdFnx0dm+9t62
 BBvNz3zSbYTIL0874dL7uqjLBUB+y3XWOSN/jrDkp4oFzzlxQ+OJSRV/huhI9bUGJqBc bQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctkc7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 07:19:12 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 13:19:10 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 13:19:10 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 824B011CB;
 Tue,  2 Mar 2021 13:19:04 +0000 (UTC)
Date: Tue, 2 Mar 2021 13:19:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Remove bitclk relax condition
Message-ID: <20210302131904.GC106851@ediswmail.ad.cirrus.com>
References: <1614683891-29255-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1614683891-29255-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=934 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020109
Cc: kstewart@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, tglx@linutronix.de, info@metux.net,
 ckeepax@opensource.wolfsonmicro.com, allison@lohutok.net
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

On Tue, Mar 02, 2021 at 07:18:11PM +0800, Shengjiu Wang wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Using a higher bitclk then expected doesn't always work.
> Here is an example:
> 
> aplay -Dhw:0,0 -d 5 -r 48000 -f S24_LE -c 2 audio48k24b2c.wav
> 
> In this case, the required bitclk is 48000 * 24 * 2 = 2304000
> but the closest bitclk that can be derived is 3072000. Since
> the clock is faster than expected, it will start to send bytes
> from the next channel so the sound will be corrupted.
> 
> Fixes: 82bab88910ee ("ASoC: codec: wm8960: Relax bit clock computation when using PLL")
> Fixes: 3c01b9ee2ab9 ("ASoC: codec: wm8960: Relax bit clock computation")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

I think this is probably going to need a much more involved fix.
The problem is that there are systems that depend on this
behaviour, so you can't just flat out revert it. And to be fair
the I2S specification says that bit clock can run at a higher
rate than required for the data, so the behaviour is correct as
well.

Probably the best solution here is to add additional contraints
from the machine driver on which rates/bit depths/channels are
supported.

Thanks,
Charles
