Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B137F61C3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:41:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E42E92;
	Thu, 23 Nov 2023 15:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E42E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700750504;
	bh=5MhT1TVk55kBpSiBvsQYP3NzkoQryQoHcrsBjVVmcwE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mGQ5m4UB+kA7mXjFI3Sje0dtYtgir1tc74kh3GMI2OUj0QVwuxs2/b9PRLJBXfFlu
	 bPS1/zODPRhF5NMDDZEABzNITDi4b4+9MAP+U7GOpK1l+gwcmfC1wnVS49HWYMqg/7
	 4KHhso3qfN505bj3JlCgI4ue3y34LgFoxCSfjvoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA3F4F8069A; Thu, 23 Nov 2023 15:39:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 607DEF8068F;
	Thu, 23 Nov 2023 15:39:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA367F802E8; Thu, 23 Nov 2023 11:52:10 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97E5EF80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E5EF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CYdZNzfq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AN5lWrm021272;
	Thu, 23 Nov 2023 04:52:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=RSshxsOe/WpI9Zh
	vx3znWw9Og1R8TvaJz6zt8sGGClA=; b=CYdZNzfqonmbYuLq5QqkJdfsvc9DRix
	siAT998YsCAn+2jS2Of1dNeua5XrpyLaSlpNNS6WgF4S3Xl5v74O7KPrvOaASjwh
	p8zaDsKjk73Dlb/9WtcAW/Is3uanjPbHk5TJJj7N5u0nJWA1+RG2DKIbQ6c2w6Jw
	PWV/XaH7u4d6SOZDtKtWAJSU2Kf5r1jT0a/D/EmTCGiwryfaPlMwUeNH2MSs5K4b
	5LFIA4BwCMYpuFs4HwlUVAKZFO0lB4MvRJmi6fFArTXspRkg62I/0JreYUMvAJCu
	oeMjo3dk3AW2YqkPSAmb8s5T/KtdfyECeWNVQRRyQD8pfsmq0di8ssQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj2dmwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 04:52:05 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 23 Nov
 2023 10:52:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Thu, 23 Nov 2023 10:52:03 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 27074357F;
	Thu, 23 Nov 2023 10:52:03 +0000 (UTC)
Date: Thu, 23 Nov 2023 10:52:03 +0000
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
Subject: Re: [PATCH v5] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <20231123105203.GP32655@ediswmail.ad.cirrus.com>
References: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
 <20231123104624.GO32655@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231123104624.GO32655@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: qKX3GwV0qDWZUXbT5DPlthRZsCGgZXz2
X-Proofpoint-GUID: qKX3GwV0qDWZUXbT5DPlthRZsCGgZXz2
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=6691092e0a=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: DWYBTGZDBSKUKWBVYLR2F6YKJ5QBKP32
X-Message-ID-Hash: DWYBTGZDBSKUKWBVYLR2F6YKJ5QBKP32
X-Mailman-Approved-At: Thu, 23 Nov 2023 14:39:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWYBTGZDBSKUKWBVYLR2F6YKJ5QBKP32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Nov 23, 2023 at 10:46:24AM +0000, Charles Keepax wrote:
> On Thu, Nov 23, 2023 at 09:06:58AM +0000, Maciej Strozek wrote:
> > Add a polling mechanism that will keep the driver operational even in
> > absence of physical IRQ connection. If IRQ line is detected, the driver
> > will continue working as usual, in case of missing IRQ line it will
> > fallback to the polling mechanism introduced in this change.
> > This will support users which choose not to connect an IRQ line as it
> > is not critical to part's operation.
> > 
> > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > ---
> 
> Sorry hang on this doesn't apply to Mark's tree, will need a v6.

No that is me being a moron, apologies ignore this noise.

Thanks,
Charles
