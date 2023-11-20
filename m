Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D77F0F48
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 10:44:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B6EA4B;
	Mon, 20 Nov 2023 10:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B6EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700473472;
	bh=8ZP66TLSvjTEUvR7ayi8pSZB7Tjzcxa3pmilWNWmW54=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jmjhc9aitHR74m6uWZtUevYAb7cyw3EseTwRzLEVIYIIyRH23YTehDEmJP2laXU0I
	 WTjH7/c1X3a1mqkRpZtKjq2+nj1zd7DAYNxQvpOcSQiJC193v2YKbv0jp0HD8c2CEo
	 zsyTEGTC0fi0Wd9zOgh1QB3539XWx3Q2HAUpf2lc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB75BF80310; Mon, 20 Nov 2023 10:43:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80ED1F80093;
	Mon, 20 Nov 2023 10:43:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413DDF80254; Mon, 20 Nov 2023 10:43:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD69F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 10:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD69F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VBjMI8Hw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AK6U480003527;
	Mon, 20 Nov 2023 03:43:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=
	PODMain02222019; bh=vQ2IyIVC8216MO+P/8nCTcn6PLpw2lKV/uP0jokEWtI=; b=
	VBjMI8HwRLIsrP6WwoQguHOkThfazIJH16oqinw0aoeCAysbWjuQgh9cLDnWt2Yl
	rBOdyyHZeaqkIY8JT/RR/jiTkwV8NN6g/+NHfv9M7U++kqK8K5mSnNmom2LiELFS
	ErRyCpzbX+Qh2CsmB2d5vMrqGXjr0n+8WxdOrOqXU6i28jdV2yhlVQVutFiWFcUP
	M8F0GbVE+WaZK4n2kEOAwzchSdLKAtdNDSR0SJCkR8XKskbmpeXBXCZVoY8L7f6j
	/m+hIM+ntu8VKvdm6f/cr+toW8OKnqcVoVOunLd9nE9kVT5Se75+s34fV3isQ0XX
	yI3U5mgUkxlWbTIFScWMzg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjp9n93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 03:43:29 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 09:43:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 20 Nov 2023 09:43:25 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.251.123])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 81E9215B9;
	Mon, 20 Nov 2023 09:43:25 +0000 (UTC)
Message-ID: 
 <153531080cd3d36fea86263d393ef885533f6e44.camel@opensource.cirrus.com>
Subject: Re: [PATCH 6/7] ASoC: cs43130: Allow driver to work without IRQ
 thread
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date: Mon, 20 Nov 2023 09:43:25 +0000
In-Reply-To: <ZVeWfefrEQJIx0YL@finisterre.sirena.org.uk>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
	 <20231117141344.64320-7-mstrozek@opensource.cirrus.com>
	 <ZVeWfefrEQJIx0YL@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4ZFKJ0HZR7aS3bXlufFbMGcIRNV3gggY
X-Proofpoint-ORIG-GUID: 4ZFKJ0HZR7aS3bXlufFbMGcIRNV3gggY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YW7TD667ZKGOGMTRO2MGFTSISSTHEZNU
X-Message-ID-Hash: YW7TD667ZKGOGMTRO2MGFTSISSTHEZNU
X-MailFrom: prvs=668862412b=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW7TD667ZKGOGMTRO2MGFTSISSTHEZNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W dniu pią, 17.11.2023 o godzinie 16∶36 +0000, użytkownik Mark Brown
napisał:
> On Fri, Nov 17, 2023 at 02:13:43PM +0000, Maciej Strozek wrote:
> > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > ---
> >  sound/soc/codecs/cs43130.c | 56 +++++++++++++++++++++++++++++++---
> > ----
> >  sound/soc/codecs/cs43130.h |  1 +
> >  2 files changed, 47 insertions(+), 10 deletions(-)
> 
> Why?  This isn't some obvious fix, you need to write a changelog
> motivating open coding interrupt handling if there's some reason for
> doing that.

This is to support systems without physical IRQ connection. The device
only requires the IRQ for a couple of internal delays, this polling
mechanism is a fallback when no IRQ is specified.

