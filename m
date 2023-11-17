Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3577EF5C4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 16:58:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07203A4C;
	Fri, 17 Nov 2023 16:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07203A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700236698;
	bh=z88J+0FAgkWhymn0CNiT9mAHIqXzgxwGVyjDH5OOAys=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d+11XdOjysEHdpsGqu7AqgclGYLMX9DEj13uvheceOnhs8dBeXcS25ucXNnoz474J
	 Zp2nm7lPER97UpmAb1fKgPjmoketXiIxvGM/HwJmdfk2AeLN1Y8x8TdwDogUahy/jY
	 DqPoi+oxOj4YktN7focZ5gqENsKtouJkSqZP5LM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F29F8055A; Fri, 17 Nov 2023 16:56:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6ED8F80549;
	Fri, 17 Nov 2023 16:56:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A14F6F801D5; Fri, 17 Nov 2023 16:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1715AF80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 16:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1715AF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AGM0Slwu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AHFqPD0014089;
	Fri, 17 Nov 2023 09:53:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=qcmoqM99WUT5mR4
	4BmGtdcfqukhABXd6uBe07IyrQRE=; b=AGM0SlwusSlH9E1NPc0M7AEAgKk3qYB
	qahD0GReg2zT48lm2KuZsCyD7G7xQzKSA1cSAg8/XFRmYqeuA7azrET+cMLkZVIS
	mzYiIprojjDLKU9DSaqL81qPrtNA+m/klhJhSGRYxqXk/CCfIQf9+bEWgU6R4y9g
	CxsW448ENb8IPH+clKPIq50qrnakhVtYTaMsJrsOBVbMfoccWNfMOlE1kSf7LMpt
	rmlKaAQKPmTIhLhkZ7wm3D75Vf212FXN7eqq7abfc6+ev1OC5gZszlda47EPxmny
	lCpQKnp+/PW2lvQkT7OJLFZNFECi3psy/h2rd5qxOGSKkaBs0Mp3rvA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2qp27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:53:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 15:53:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Fri, 17 Nov 2023 15:53:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F8B1B12;
	Fri, 17 Nov 2023 15:53:53 +0000 (UTC)
Date: Fri, 17 Nov 2023 15:53:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] ASoC: cs43130: Fixes and improvements
Message-ID: <20231117155353.GG32655@ediswmail.ad.cirrus.com>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 0x5K93HMr0eactcOtCnesHZrrH9SZOeO
X-Proofpoint-GUID: 0x5K93HMr0eactcOtCnesHZrrH9SZOeO
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=668542f8db=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: TMW3WF4ZLB2IUZM6KVALE7BLISASPQ5W
X-Message-ID-Hash: TMW3WF4ZLB2IUZM6KVALE7BLISASPQ5W
X-Mailman-Approved-At: Fri, 17 Nov 2023 15:56:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMW3WF4ZLB2IUZM6KVALE7BLISASPQ5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Nov 17, 2023 at 02:13:37PM +0000, Maciej Strozek wrote:
> This patchset aims to add minor fixes (first two patches) and
> introduce general improvements to the driver (rest of the patches)
> 
> Maciej Strozek (7):
>   ASoC: cs43130: Fix the position of const qualifier
>   ASoC: cs43130: Fix incorrect frame delay configuration
>   ASoC: cs43130: Allow configuration of bit clock and frame inversion
>   ASoC: cs43130: Store device in private struct and use it more
>     consistently
>   ASoC: cs43130: Add handling of ACPI
>   ASoC: cs43130: Allow driver to work without IRQ thread
>   ASoC:cs43130: Add switch to control normal and alt hp inputs
> 
>  sound/soc/codecs/cs43130.c | 311 ++++++++++++++++++++++++-------------
>  sound/soc/codecs/cs43130.h |   3 +
>  2 files changed, 204 insertions(+), 110 deletions(-)
> 
> --

Series looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
