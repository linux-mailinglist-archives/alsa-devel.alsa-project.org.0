Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A272BA05
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4394825;
	Mon, 12 Jun 2023 10:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4394825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557777;
	bh=U9RHxZGx6FHWCQJYQE24SXPUitLyJdi8v+PBM+b7VKk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPq7LMbTYSmODbvAgrEfyiWES9t99fwKZ2A0l8pUlTA3E2NNsqSLZVYsM/wsb/ksQ
	 EeW5hJ6OYVd6an7St0zxLRGkgOJo2gx1I/paaZHYgQ2eePZnqXpi76H4ybFXI6/row
	 35wCnCUkPo/70AIF9MiT9CNJ4YaFxTgLk4EMCIN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84573F8025E; Mon, 12 Jun 2023 10:15:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E698F80130;
	Mon, 12 Jun 2023 10:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CD9AF80132; Mon, 12 Jun 2023 10:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9400FF800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9400FF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gsY2m7BO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C71Lpx018825;
	Mon, 12 Jun 2023 03:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LXNNqMvoD7R1b7HLxV4yMelCLvRV9Z70WNPNInx5Fxw=;
 b=gsY2m7BOfomtt5OnPtJqdTKX9hWKkX7cXy5zYh1yTmK/WTZHU9forn3x3P5uiesB4F4P
 rdikQePvKWttv+B+w8too2b4C3QUu5dFY3c6gLgeKLc+hEPyIhrnFiwmgzJksbSDIQSe
 OCk6jBpiheTCmG3G4No3UtfU8kzxqM2sgQTpj2pZdVD2hJEhrQi14PTaY5b6YWHDUsrt
 Y1LzYf09foGPW1c717OEcVsaDx5bKp3eArk28uwAGJQ1OUJYK6qTMoYAZ9zwVOJJH08W
 kbU/sIPNFq7/NDwgLBYhjuk0GSurkPszRpbvYU692Jm1S0p5WUJc5vcKFFubgPxEwlMa GA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r4nkm9kub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 03:15:16 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 12 Jun
 2023 09:15:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 12 Jun 2023 09:15:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6EE0D11C6;
	Mon, 12 Jun 2023 08:15:14 +0000 (UTC)
Date: Mon, 12 Jun 2023 08:15:14 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs35l45: drop unneeded quotes
Message-ID: <20230612081514.GP68926@ediswmail.ad.cirrus.com>
References: <20230609140658.64557-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230609140658.64557-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fziVmXJwX3F20HoqU3eyPXMVoC6H7DZw
X-Proofpoint-ORIG-GUID: fziVmXJwX3F20HoqU3eyPXMVoC6H7DZw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3C4N5ADMWUSFXNC7XAHPNYCBPLCSGPE2
X-Message-ID-Hash: 3C4N5ADMWUSFXNC7XAHPNYCBPLCSGPE2
X-MailFrom: prvs=1527555ab5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3C4N5ADMWUSFXNC7XAHPNYCBPLCSGPE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 09, 2023 at 04:06:58PM +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
