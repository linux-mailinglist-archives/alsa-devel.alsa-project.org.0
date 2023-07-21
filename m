Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6975C19F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8DFEBB;
	Fri, 21 Jul 2023 10:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8DFEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689928118;
	bh=8BmxWIGg9jNFR6BeLXvoH5ZT3bQ9G/FM+7vijWpaXIg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6AbTzaWtcY/0e390kUdG/ILN30X08uyjLwNQJWkF5dpoPQfFuosLYJZgkWD7KNHl
	 fGuTgEVsrNhEOUT1KDjGv58OvfsFYhyQP9Cb1D24gtxhHWJ+O/m+cDhTD5JQDx0/mf
	 4fd2Sl/xZR+/f7M+D5FXdMtotmumVtEz2mRO4R3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1FE0F80552; Fri, 21 Jul 2023 10:27:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50C9DF804DA;
	Fri, 21 Jul 2023 10:27:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABC00F804DA; Fri, 21 Jul 2023 10:27:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8AEDF80520
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8AEDF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nVL5zMcO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36L6lJk1006552;
	Fri, 21 Jul 2023 03:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=TigA1hY1Lp5dH2f
	/AfywKcjJbfyrqtGA9PlhZpcqZG0=; b=nVL5zMcOd5WBpNgxVuyBhfKt948VOiU
	jqxO8lP+vlbPvbPsGiXxvESXQt1eUBGWYLMcyodW4nnEQ+P4wwpNx5pFMI+ORLII
	3iwS43SO3qOVFbTW4EJaLCt3i1JVGJSueZt85AYIgiPzUuL1ERQ7b2tWdUBBroRR
	0rvSVVfiyfpxeIqV9dN4WF1ZklKETAKq9HEctUWZjM6sHX8IIaf4J/PjBMgJq8n9
	eXIq2rfjUmBQaAQVX5RNvbHow+K6Afg/ax7zZp4gF81KFcXAMchZrqDCmeHy+uQd
	dg8507KSYsaEq7IxteO4BniTXffNe822AH+n3Z0jG2IzcVGAeHuPPig==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gy9c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 03:27:34 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 09:27:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 09:27:32 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C586445;
	Fri, 21 Jul 2023 08:27:32 +0000 (UTC)
Date: Fri, 21 Jul 2023 08:27:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, <vkoul@kernel.org>
CC: <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v5 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-ID: <20230721082732.GJ103419@ediswmail.ad.cirrus.com>
References: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
 <168992615492.1924396.13464534208592126033.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168992615492.1924396.13464534208592126033.b4-ty@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: yt4HPd4fkRFLiLXN7DRn-CNz-muYc-e7
X-Proofpoint-GUID: yt4HPd4fkRFLiLXN7DRn-CNz-muYc-e7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YVJZ4ISPB4WJFNIVMPMM3I4PXEKHC4N4
X-Message-ID-Hash: YVJZ4ISPB4WJFNIVMPMM3I4PXEKHC4N4
X-MailFrom: prvs=25666256d8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVJZ4ISPB4WJFNIVMPMM3I4PXEKHC4N4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 21, 2023 at 08:55:54AM +0100, Lee Jones wrote:
> On Mon, 19 Jun 2023 10:56:17 +0100, Charles Keepax wrote:
> > This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> > SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> > branch.
> > 
> > Thanks,
> > Charles
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
>       commit: e62ba8443b11f12b45c61444249458a2f8c2f4ef
> [3/6] mfd: cs42l43: Add support for cs42l43 core driver
>       commit: 843079209e1506c94fde797fc0ff914e2c9e6645
> [4/6] pinctrl: cs42l43: Add support for the cs42l43
>       commit: 85f034dd7ff0a66aded653cc91dbc406fba7cf1a
> 

Only slight hiccup here is there is a build dependency between
the MFD and SoundWire patch. So without the SoundWire patch
the SoundWire part of the MFD won't build.

Vinod, would be really good if you could have a look at the
SoundWire patch would be great to get this moving, this part is
seeing a fair amount of deployment at the moment so getting this
into mainline would be very helpful.

Thanks,
Charles
