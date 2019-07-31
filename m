Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B507BB26
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 10:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9B61717;
	Wed, 31 Jul 2019 10:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9B61717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564560393;
	bh=I9dGLbccxwNwb6UGIyNsSWfFO6ePt+My32vWttPcHQI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ss3hZqJO1Xg6E6S4BPjSnvlNLpoTgAh9uQ4HFYnb54kghDVD6BnTocApT3WlkvVNB
	 hOZFVrVB6afRfLgT+bzQaTGR75aJ9eEwKcYGYBodIuyTUX77lYvUGHuQNc46DrAqlJ
	 65PNLipgq8pZMzdp8AiseoLe3xo/nABzhOlsGv70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9416EF80440;
	Wed, 31 Jul 2019 10:04:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87D0F80483; Wed, 31 Jul 2019 10:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C22F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 10:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C22F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CeLUn4vb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6V80Yw8014879; Wed, 31 Jul 2019 03:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=iQoo/3Gx2EEiQL/F/oE5WOjxkza6YDCbYqBVhCONHIo=;
 b=CeLUn4vbGznXh0XIvlePWeW6sr0yWHp+5oKz98Y1JvpBACVGENhJyWux5WQiDU5O9d2e
 TqspA7VHmxeN7gilJ2OQXKLHDGbHXtZMkAcn2p71NfPLSWNDC0zK/OZk/0pTo8CnkwU0
 2FHlgnhTeUBUEyyG6YZFcDFuegBh2rtthbczBtuXmP904LriQzKngwSNEn+2ffnfhpJZ
 5ltD68RzypoB2qAaIMNsSy71GmNzFt4TiXTRYIgP25VZgvWjvOBcGeTBk4q4XQc9Ac2L
 TNbUEZonQVIWfenh21kAH+owpGF4WrtCP0fqxduHAKMssuE2UtLAniqcSnUWZJgDwI1p Zg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2u0k1qww6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 31 Jul 2019 03:03:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 31 Jul
 2019 09:03:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 31 Jul 2019 09:03:31 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 942FE45;
 Wed, 31 Jul 2019 09:03:31 +0100 (BST)
Date: Wed, 31 Jul 2019 09:03:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190731080331.GJ54126@ediswmail.ad.cirrus.com>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907310085
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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

On Tue, Jul 30, 2019 at 05:28:11PM +0100, Thomas Preston wrote:
> On 30/07/2019 16:50, Mark Brown wrote:
> > On Tue, Jul 30, 2019 at 04:25:56PM +0100, Thomas Preston wrote:
> >> On 30/07/2019 15:19, Mark Brown wrote:
> > 
> >>> It is unclear what this mutex usefully protects, it only gets taken when
> >>> writing to the debugfs file to trigger this diagnostic mode but doesn't
> >>> do anything to control interactions with any other code path in the
> >>> driver.
> > 
> >> If another process reads the debugfs node "diagnostic" while the turn-on 
> >> diagnostic mode is running, this mutex prevents the second process
> >> restarting the diagnostics.
> > 
> >> This is redundant if debugfs reads are atomic, but I don't think they are.
> > 
> > Like I say it's not just debugfs though, there's the standard driver
> > interface too.
> > 
> 
> Ah right, I understand. So if we run the turn-on diagnostics routine, there's
> nothing stopping anyone from interacting with the device in other ways.
> 
> I guess there's no way to share that mutex with ALSA? In that case, it doesn't
> matter if this mutex is there or not - this feature is incompatible. How
> compatible do debugfs interfaces have to be? I was under the impression anything
> goes. I would argue that the debugfs is better off for having the mutex so
> that no one re-reads "diagnostic" within the 5s poll timeout.
> 
> Alternatively, this diagnostic feature could be handled with an external-handler
> kcontrol SOC_SINGLE_EXT? I'm not sure if this is an atomic interface either.
> 
> What would be acceptable?

You could take the DAPM mutex in your debugfs handler that would
prevent any changes to the cards power state whilst your debug
stuff is running.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
