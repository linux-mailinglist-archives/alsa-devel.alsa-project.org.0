Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0278A9739
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 12:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8278DE67;
	Thu, 18 Apr 2024 12:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8278DE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713435749;
	bh=P4sbd+3pJKDK4SD5ImAjJjDozCp4Sq4s5N8AojfbsIQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EOjRy26Qw3NqJaNEITOZbtsQga3zBvfU9c3kgSF7xaAPL04pIcgSRaCQ7D3eZ8BMX
	 mqpAF6wmVMbEedpO//HNuKeNJO8YebVP4cvMxdTP3ssf9lNju8rX+Kh92tQrXtBhFW
	 7JQsqVgmFWFh7hTpvfowmYhVjl8H9TzwkPg07Ceo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7467FF805AE; Thu, 18 Apr 2024 12:21:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D32E5F80578;
	Thu, 18 Apr 2024 12:21:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FC5F8025A; Thu, 18 Apr 2024 12:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5541BF8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 12:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5541BF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MHeb3n/2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43I4kSJ5025732;
	Thu, 18 Apr 2024 05:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=P4sbd+3pJKDK4SD
	5ImAjJjDozCp4Sq4s5N8AojfbsIQ=; b=MHeb3n/25i/TKPJsrqnriXd2rC2TgDS
	8/tjSdgVH1V4xB3TUPYyHgSwtaZ6+8EqT4ZZcy0UKdOflh+JuShpK5gfLet1xKj8
	rX/kZl+jhXtIlS8N/o6P8JzRFuHImDy9ZVb4j0q+K03YnDofm7+oIHtwXeG4rw9n
	KAFRQDESnUXto70t9c60T3rnbuzFGgeMwrEqeYnoRomjcnBo/D+m4kcPdvDMXJOP
	UXoWoDyzEkPA1/K+oXbcvEX9WxIF8w2Jx4RJkw3nJrRF6unBiNWM8JiEHdJyhATE
	KEdyGe+TzBT0+R5GioQHY4gmG2sf047Lcj8rDG8aoqcWdoXWTMgUmzQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xfqeycmcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 05:21:46 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 11:21:44 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 18 Apr 2024 11:21:44 +0100
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id A0F57820245;
	Thu, 18 Apr 2024 10:21:44 +0000 (UTC)
Date: Thu, 18 Apr 2024 10:21:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] spi: cs42l43: Correct name of ACPI property
Message-ID: <ZiD0N24MpYX7uj1U@ediswmail9.ad.cirrus.com>
References: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-GUID: iOergdAmvvoNkdmHzP23eCDEat5Yd9v_
X-Proofpoint-ORIG-GUID: iOergdAmvvoNkdmHzP23eCDEat5Yd9v_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: C767YPJVTUSDC26CXAYSBVPIN2S3HNSN
X-Message-ID-Hash: C767YPJVTUSDC26CXAYSBVPIN2S3HNSN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C767YPJVTUSDC26CXAYSBVPIN2S3HNSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 18, 2024 at 10:42:06AM +0100, Maciej Strozek wrote:
> Fixes: 1f05252a3a95 ("Add bridged amplifiers to cs42l43")

Sorry actually are you sure this commit ID is right, I don't
think it matches the one in Mark's tree?

Thanks,
Charles
