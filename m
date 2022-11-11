Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F5625ADE
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 14:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B598B164D;
	Fri, 11 Nov 2022 14:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B598B164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668171745;
	bh=+40uSYmIUuvOmYCKBWrKxucN9eaU2YEI8C7q5zHgSns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XY1qbqEdVfSWT4H5aOocL7FrqUAs6AOQfylaSEFkaSMuwwTDiJwOkpENzpPCmrLsQ
	 691RlJlX4UaJ97D/K1HiYJiFrhT9/iCGWsrV1v7nhbliWlQ6U3hZ176B5IYeciels2
	 WzcZra+TGWkwT24IP87GPvfA18V5DPZ/yqmHbx9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73AE7F804AB;
	Fri, 11 Nov 2022 14:01:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A33AF804AB; Fri, 11 Nov 2022 14:01:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A504BF800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 14:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A504BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GVY43Q5h"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB8vlrS024478; Fri, 11 Nov 2022 07:01:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=arsKwLFQpMknXDHWPffdQfi+mQBzA9ITsUa1V2QBBRo=;
 b=GVY43Q5hxhAu4yDFXIgOzjF/02QKzGxvgGGyLb2feftX4iR1HpISVPGBvqLR/Mzae/fH
 P1i0fa9IuvayCdOZqGPyuv6dwgwsZeKMvp0ePP4tBgjRfWIq9tnCAb+++6tD/QifuNGT
 4NZ6hriWhXLimWu/XQCXqPmdyL08dVF32S9c5tAeCkD5l2nW8AFY9bkFgno5DdhCn32E
 xK2HOC5vYrB4cRCA0NoQ1dtCt062bo7tf8lli5YREqI44zJ+FeGCXLTGfYeT0Db3uD+B
 HIbTBOwTLxCNChvHqDrUumL+tBYYb17avcy+FKn4zwEcCrbuvDEwFl12VN6v3XDVr5yz Sg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81rxu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 07:01:22 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Fri, 11 Nov
 2022 07:01:20 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Fri, 11 Nov 2022 07:01:20 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91854B06;
 Fri, 11 Nov 2022 13:01:20 +0000 (UTC)
Date: Fri, 11 Nov 2022 13:01:20 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Message-ID: <20221111130120.GJ10437@ediswmail.ad.cirrus.com>
References: <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
 <86pmdvow5y.wl-maz@kernel.org>
 <ef60cbdb-f506-7bd6-a8e1-c92b6963a0f4@opensource.cirrus.com>
 <86k042q1uc.wl-maz@kernel.org>
 <05ae0e20-b472-f812-1afc-ef8c2a97cdeb@opensource.cirrus.com>
 <87iljmve87.wl-maz@kernel.org> <Y21gwGDb5CFft0kp@sirena.org.uk>
 <87h6z5vs39.wl-maz@kernel.org>
 <20221111111611.GH10437@ediswmail.ad.cirrus.com>
 <Y242xYJQMC2JlMtH@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y242xYJQMC2JlMtH@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 6OWPJbfmcAph1DMxGRzvxH6w1CDxkx0H
X-Proofpoint-GUID: 6OWPJbfmcAph1DMxGRzvxH6w1CDxkx0H
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Marc Zyngier <maz@kernel.org>, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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

On Fri, Nov 11, 2022 at 11:49:25AM +0000, Mark Brown wrote:
> On Fri, Nov 11, 2022 at 11:16:11AM +0000, Charles Keepax wrote:
> > On Fri, Nov 11, 2022 at 08:00:10AM +0000, Marc Zyngier wrote:
> > 
> > > > ACPI gets to be a lot of fun here, it's just not idiomatic to describe
> > > > the internals of these devices in firmware there and a lot of the
> > > > systems shipping this stuff are targeted at other OSs and system
> > > > integrators are therefore not in the least worried about Linux
> > > > preferences.
> 
> > I would echo Mark's statement that going the way of moving this
> > into DT/ACPI will actually likely necessitate the addition of a
> > lot of "board file" stuff in the future. If the part gets used in
> > any ACPI systems (granted support is not in yet but this is not a
> > super unlikely addition in the future for cs48l32) we will need to
> > support the laptops containing the part in Linux and the vendors are
> > extremely unlikely to put internal CODEC IRQs into the ACPI tables.
> 
> It's a bit of a stronger issue than that in that it's not how ACPI is
> usually expected to work (it draws more from the PCI model where you
> just get a top level ID from the device and have to figure the rest out
> yourself).
> 

Hmm... yes ok true ACPI isn't going to put the elements of the
MFD in either so we would then need something to bind all those
in as well.

Thanks,
Charles
