Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96B86E4F1
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 17:05:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2BA3868;
	Fri,  1 Mar 2024 17:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2BA3868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709309121;
	bh=i9d0LaW7EoAnPFmI2AbKKlcUQ50fbZsyhqoiAmp4vZk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eTDWaaikzqxWU6H+JS+fl9pY4lD7OalYWE3bFD3UxLeKHUeUzycFSTYKSi/GtlDI2
	 KOH+G67nYmlZZs7LcYtgiYuD7lILBzdQjQOQayZEi/M7KCZYNtoZ0j7iFlryXg5M9p
	 sFBa9GM59Ge03qa6lsg7KzN7+9AYY1Rc2w5xqvZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE3EF80587; Fri,  1 Mar 2024 17:04:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52358F8026D;
	Fri,  1 Mar 2024 17:04:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58FD2F801C0; Fri,  1 Mar 2024 17:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6799DF8024E
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 17:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6799DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YuZsyiyx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421Ewl9U003471;
	Fri, 1 Mar 2024 10:03:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=uEcBiDAd0hStY3/
	Xc8YS/I7Yuem8HRIl7L9QOtD3Px0=; b=YuZsyiyx7a6dedT2hVO228gfatJ5WAP
	rzUyThGVKHj0uTARvlw+4Djzu/tVm/0IYfcCQ33nBMcIZ/gSi6DSrpT04uX7Iqce
	iuA9O2Ac7YHeL3Eb6+jKIqOjDA8lKL+/y2uf11ZDC64+6FtTLMHz8KsCtjWheiOF
	LTgkhaVeRFk3an46ZYdWcZwvRYJlhk0MPT2NxWRB0EdMFUJTM/1FnImKI0Qgf4V3
	ncCM4Jk3VCp8XuoFwJ8Fx0vdxBbY3wolB1AxEa/rV1GLBPNgCwec/6CD2MOMEDBv
	v5xsqto/K4jRvNtyzooHfgt7/exyUu+qQb83uJ6MUVep965JxhaOPwQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8r02ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:03:07 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 16:03:05 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 16:03:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id CD73382024B;
	Fri,  1 Mar 2024 16:03:05 +0000 (UTC)
Date: Fri, 1 Mar 2024 16:03:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Lee Jones <lee@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] mfd: cs42l43: Fix wrong GPIO_FN_SEL and SPI_CLK_CONFIG1
 defaults
Message-ID: <ZeH8OJnhuu2yWP6x@ediswmail9.ad.cirrus.com>
References: <20240301101547.2136948-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240301101547.2136948-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: Czjj9oyb3DfnqPmAnsuaCm3dTfRzzCTg
X-Proofpoint-GUID: Czjj9oyb3DfnqPmAnsuaCm3dTfRzzCTg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3XXNWMD2QQ76SFFZKKJGZYX6GSYONROA
X-Message-ID-Hash: 3XXNWMD2QQ76SFFZKKJGZYX6GSYONROA
X-MailFrom: prvs=0790fff71a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XXNWMD2QQ76SFFZKKJGZYX6GSYONROA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 01, 2024 at 10:15:47AM +0000, Maciej Strozek wrote:
> Two regs have wrong values in existing fields, change them to match
> the datasheet.
> 
> Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
