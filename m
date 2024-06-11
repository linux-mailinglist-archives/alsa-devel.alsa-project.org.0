Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64030904230
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 19:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8168A4A;
	Tue, 11 Jun 2024 19:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8168A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718125893;
	bh=bJBl+PlfjanSE1Eg6G1C2wEirLeTb7Y9hb7ms4wt5Sk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BzavnrIT1DZJuu3mmll8K7QMWasXvkThE+pS9eQI9vBb/nNNcDe90lGqAStFI3PVg
	 8Oiu1wwm762xrXM7NF6F+N7obXgi+2seiNbSojc5/M/pUqFvSfOHyy0ZQ5Ey5mwx2b
	 Rb/3ZkLWaPQKaExvSIRL/LRZbg+AC0230HdN8aUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36048F8058C; Tue, 11 Jun 2024 19:11:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8947F805AC;
	Tue, 11 Jun 2024 19:11:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D09AFF8057A; Tue, 11 Jun 2024 19:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56137F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 19:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56137F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fYjpVsu3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45B4c4ag010402;
	Tue, 11 Jun 2024 12:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BIhOXmsqkEoOXO78P5
	ESWns7BwfqoAGaVVQe7oaV3Gs=; b=fYjpVsu33NhFd/aKifFg+mfk/OadJZMqHn
	8QrckYPYp9zNGG/mOMSwDnXlR14bxHBw8pj9DJwOu1v9SIy3cwAqcJwzE6bBX5dE
	/1jE/4plaPbR4AN5nFtld9iiTTjLlwzi35jH24448VquZr514jusiNo7lFNQ4QFR
	6D2/2vRImyPtKCiwy0M0YGEkGRLOHxoGXbRiAQMTAhTeOwxOPv0LD83vaqAS4Ddj
	6DzyMhwLrKKDXHPZCTjKLoUYnSnGXAgS4B4rM5KScyrgaP+sCELHouz+QKzgizz9
	Ar3/RKnDaahH8HI+bjmgwxVKeH8K2ziUnoTMblrW7wggXzRXjo6Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhu5ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:10:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 18:10:42 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 11 Jun 2024 18:10:42 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E56F5820244;
	Tue, 11 Jun 2024 17:10:41 +0000 (UTC)
Date: Tue, 11 Jun 2024 17:10:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
Message-ID: <ZmiFEAw/IkkLWx2O@opensource.cirrus.com>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
 <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
X-Proofpoint-GUID: _J5zIlRbkHY3ImhYwjrPmJug-zBav0AV
X-Proofpoint-ORIG-GUID: _J5zIlRbkHY3ImhYwjrPmJug-zBav0AV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OAJDRVWSBZCC2TKQVAQ6J4G7R3EO2O4A
X-Message-ID-Hash: OAJDRVWSBZCC2TKQVAQ6J4G7R3EO2O4A
X-MailFrom: prvs=3892fbd46d=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAJDRVWSBZCC2TKQVAQ6J4G7R3EO2O4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 05:12:06PM +0100, Mark Brown wrote:
> On Tue, Jun 11, 2024 at 03:57:46PM +0100, Richard Fitzgerald wrote:
> > If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
> > sources should be initialized to disconnected.
> > 
> > The silicon default is for the mixer source registers to default to
> > a collection of monitoring sources. The problem with this is that it
> > causes the DAPM graph to initialize with the capture path connected
> > to a valid source widget, even though nothing setup a path. When the
> > ASP DAI is connected as a codec-to-codec link this will cause the other
> > codec to power-up even though nothing is using it.
> > 
> > Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> > Fixes: dfd2ffb37399 ("ASoC: cs35l56: Prevent overwriting firmware ASP config")
> 
> This doesn't seem particularly different to any other unhelpful chip
> default, I'm not sure why it'd be so urgent that we'd hard code a
> default?  There were some other devices with things like bypass routes
> set up.  The capture path getting spuriously triggered feels like
> something that should just be sorted in general (TBH I thought that
> worked OK but it's been quite some time since I looked properly).

Mostly the problem here is it causes a bunch of errors in the
kernel log. The cs42l43 can only be clocked from the soundwire,
and the rate of that is only passed to the cs42l43 when audio plays.
When the ALSA control restore runs, you end up with a temporary route
(cs42l43 VMON -> cs35l56 ASP -> cs42l43 ASP -> cs42l43 Speaker). But
as there is no audio at that point there are no settings for the
PLL. I don't think it causes any lasting issues, but it does cause a
bunch of fat warnings in the log which people then complain about.
Plus also having things not routed by default is just nicer,
especially when the defaults are things that are an actual source
so likely to cause things to power up inadvertantly.

Thanks,
Charles
