Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899A8A9721
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 12:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D7AE9D;
	Thu, 18 Apr 2024 12:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D7AE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713435570;
	bh=z/hUMpplzHibHsKJBgmNXuW8EzCM6xcWFg+5AA3gd78=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pkWUE65GOly/A6tU4UXn0CG6AxwenkuqFKhCYSCvVoi2doPpq9zmKx6izETFInVdV
	 59QjXAYxjvhq2Z2yyTViEC9afc24A+KmJQJBDgyEABBCYy192kMjGZkHWWTSAr/Wd1
	 gzP/M44C7glvHMe68JM3Iq01MUA52oJp5E4xPlY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E727F80580; Thu, 18 Apr 2024 12:18:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 992F3F80588;
	Thu, 18 Apr 2024 12:18:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FBCEF8025A; Thu, 18 Apr 2024 12:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67D8EF8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 12:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D8EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fEC7K/qW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43I5vTHo004756;
	Thu, 18 Apr 2024 05:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=u5oDewUAuxPt3nz
	bwd1BP8yEuLREuEnZJS3DESJidV0=; b=fEC7K/qWfUze9cDg1UO0qN+v5xn0AEG
	XBUIThLiHcBGR0YaAGg8XXEcECPuDZRXtWSXF2+iJDne86KfYIv8KbG+Qeas5fiu
	xb4GFTVqHe0t5c4PDiKlcWb1BHpkIZtICAP+Ntq+8TH8+aVP333rwtRy90sTvlr6
	9SDtTZmQ9fJuAUw/EhLjtwU0sybw5ZHEpQDdeXxGdn4ptOIpi+0c82ZwXHp09Fhn
	udbRHpEk59uVjkryzYyiCRqHwB2iBxqwsXvlIlw9bDV+2htVhrSAiBDmxxBSn9Bw
	vP3rYHN8P01RSTQGOH0gnqKTee3jq/wf/G468KR6b9/whbr/dEU7RTg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhvmct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 05:18:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 11:18:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 18 Apr 2024 11:18:41 +0100
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F00FD820245;
	Thu, 18 Apr 2024 10:18:40 +0000 (UTC)
Date: Thu, 18 Apr 2024 10:18:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] spi: cs42l43: Correct name of ACPI property
Message-ID: <ZiDzf4pdS5V4V4F6@ediswmail9.ad.cirrus.com>
References: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: 6qytccbZeZ-buVVOdIzPt7C1jCys4bq4
X-Proofpoint-GUID: 6qytccbZeZ-buVVOdIzPt7C1jCys4bq4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: P5DUSUJYHJPOYATMHLJF5XCZBPH5HPPG
X-Message-ID-Hash: P5DUSUJYHJPOYATMHLJF5XCZBPH5HPPG
X-MailFrom: prvs=1838e553da=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5DUSUJYHJPOYATMHLJF5XCZBPH5HPPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 18, 2024 at 10:42:06AM +0100, Maciej Strozek wrote:
> Fixes: 1f05252a3a95 ("Add bridged amplifiers to cs42l43")
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Apologies about this one bit of a curve ball from our Windows
team.


Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
