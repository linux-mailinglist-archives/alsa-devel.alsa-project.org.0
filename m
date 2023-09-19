Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DD7A5CEE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D88EA4E;
	Tue, 19 Sep 2023 10:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D88EA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695113519;
	bh=6cOoPWj+GZvgT0082a145YAy88WoPfT0Yw4wJjYcb2g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l+vuURFVJptnR6SNf8d5nzDj6hYjtMjNANKGNnNxx6jOyCNmnUxgdD58WVu1uMcDO
	 BEWg7obAkd6Lwf9FqjwWT5gvT350j2yXgegQQEIMQUFYG9P4myoVrxfpFw/BURY3Df
	 yT4Q1DazxsCwVHIgkb65GGwk9Fcj3ejL2mm4iaBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C18AF80125; Tue, 19 Sep 2023 10:51:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ABD6F80125;
	Tue, 19 Sep 2023 10:51:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E25F801F5; Tue, 19 Sep 2023 10:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37532F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37532F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fW7di/o4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J7c9GM005584;
	Tue, 19 Sep 2023 03:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=xUFcITs3ke7Ognj
	8MTOSnt5czIiaUfjbmz3OPrlqamM=; b=fW7di/o4901o1MfIawaTyJMNGFelWq1
	HB4guNxjIYanfzOaIPkv657DdDLyaPJUGbQ/K2gLAk7HxyHfLl9EqnRV9KNILSzC
	3eDw+tgMhnqMjJZDCFkmCFl44y17fzb6wK1aleevlbK951oYtdKYusL+LWRpJr7Y
	LvbIiJRez9t6GF81cyCjFbi+zNq1u6g7lx9FxJQ3ykOTOApih12MXuyMVfx3Io+t
	j9fAhSGHq1BhThEa1Tmw5LZ/0OCr01fkBa7vylIDovzb67/Sg34C6+fI4tj6wOZF
	jcSh8SjZuH+WlDzNF0re1lPJCTsn1yTrOAvr8gaiaEsqrB9YYXZ24eA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shttje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 03:50:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 09:50:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 09:50:57 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 22B3711AB;
	Tue, 19 Sep 2023 08:50:57 +0000 (UTC)
Date: Tue, 19 Sep 2023 08:50:57 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] mfd: cs42l43: add REGMAP_IRQ requirement
Message-ID: <20230919085057.GA103419@ediswmail.ad.cirrus.com>
References: <20230918193042.31524-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230918193042.31524-1-rdunlap@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: dH3EzAMkZGZ1vn6yBVZUCQxGxYMD8iK3
X-Proofpoint-ORIG-GUID: dH3EzAMkZGZ1vn6yBVZUCQxGxYMD8iK3
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L2GUCVOHSEGYN4MAULIEH5ZW2SQBYXVF
X-Message-ID-Hash: L2GUCVOHSEGYN4MAULIEH5ZW2SQBYXVF
X-MailFrom: prvs=4626caf035=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2GUCVOHSEGYN4MAULIEH5ZW2SQBYXVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 12:30:42PM -0700, Randy Dunlap wrote:
> The cs42l43 core uses devm_regmap_add_irq_chip(), so add REGMAP_IRQ
> to what the core driver selects in order to provide this API.
> This fixes a build error:
> 
> aarch64-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
> cs42l43.c:(.text+0x19d4): undefined reference to `devm_regmap_add_irq_chip'
> 
> Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: James Schulman <james.schulman@cirrus.com>
> Cc: David Rhodes <david.rhodes@cirrus.com>
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: alsa-devel@alsa-project.org
> Cc: patches@opensource.cirrus.com
> Cc: Lee Jones <lee@kernel.org>
> ---

Someone already sent a fix for this, that is awaiting review:

https://lore.kernel.org/lkml/tencent_E54C7156F583E15FFE320E576E3389C39A08@qq.com/

But just incase this one gets picked up:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
