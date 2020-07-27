Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB0122ED4C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 15:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89011697;
	Mon, 27 Jul 2020 15:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89011697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595856551;
	bh=TYcyRVEEiTAnox9nOWCy1yQ81Tma2kFuOQBYWkG85+s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLefqfR1qFGbS+DFD8uczsd8Sax+UIn4iSxnx+LzpXY7UlXPenWG2ffCLE8s3/C1T
	 sTfNmzTpY8kMEKUhPmxAPG9IMryBclve3vq8oRm42L0QCfTbrp6tA16FQp3tEtjfso
	 GQiIE/px2XDPhkHaC6uYAQPsXUVVW0Jy71njfx9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C420F801D9;
	Mon, 27 Jul 2020 15:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6315F80171; Mon, 27 Jul 2020 15:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AD1AF800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 15:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD1AF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HIT8LH3T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RDPZ89023190; Mon, 27 Jul 2020 08:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MnKiJyKcwNSjYCMOVvhy9WncfGIbfK4jBQKT0oeFr9s=;
 b=HIT8LH3TKkotiCcyA1p5YaB5S8CxaxEguIxTCmOrNWv2e/6mreetXCkYRTYjQpIGxsJb
 CI9lLZatINPDLilBq/m6aKAXr+J0gvMGr1bJGHsR3MQiSrNXsrV+UclS/CsvrsmS09Er
 jlqP34p/E7Cqk9N2R3oio3bW/OU/0/KR6eCQLMZy9DZXPmEWstVRU7PGBgy29ehLlNRZ
 NHePs0CvQrwX+OYyEXz6aSKvb1RJhvgiUdbvPL/HG2+Nv2V8lFscA9KZCDrlzOxorq5B
 7xj+IaDZs4RfxT1Gwq2QYrcCyt7IM+blrxX2JhyKV5yIiz1ne6u3XvnnwMHgY3FCYtz0 1A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 32gh5qjd92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jul 2020 08:27:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 27 Jul
 2020 14:27:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 27 Jul 2020 14:27:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A89B845;
 Mon, 27 Jul 2020 13:27:17 +0000 (UTC)
Date: Mon, 27 Jul 2020 13:27:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Message-ID: <20200727132717.GC10899@ediswmail.ad.cirrus.com>
References: <20200717135959.19212-1-festevam@gmail.com>
 <20200723092140.GB10899@ediswmail.ad.cirrus.com>
 <CAOMZO5DvR1CNwR2fG_e48Kv9FPdXj-UrboPpAbA9tTakOdpw6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5DvR1CNwR2fG_e48Kv9FPdXj-UrboPpAbA9tTakOdpw6A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 mlxlogscore=888 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270099
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, Jul 23, 2020 at 04:59:24PM -0300, Fabio Estevam wrote:
> Hi Charles,
> 
> On Thu, Jul 23, 2020 at 6:21 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> 
> > Ah ok I think I can see what is going on here, you get an EBUSY
> > if the regmap is in cache only and you try to read a register
> > which isn't in the cache. Is that what you are seeing?
> 
> After adding some debug info I got:
> 
> ************ register is 512
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> 
> ************ register is 515
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> 
> Both register 512 and 515 do not exist as per the WM8962 datasheet, so
> the driver should not try to access them, right?
> 
> This patch avoids reading from these unexisting registers, which makes
> sense IMHO.
> 
> Do you have any other suggestions to avoid these errors?

Alright fair enough, this is a good a fix as any for these two
registers. Although I would suggest considering my questions for
your additional control 4 issue, since there is a little more to
think about there.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
