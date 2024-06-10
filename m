Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C17902524
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 17:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE539839;
	Mon, 10 Jun 2024 17:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE539839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718032453;
	bh=CmL2clMiceh98ITdDb3nHytGm31ml3VGWT8md7qDVwo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bdE4NXord6YgiTPZMKuY3zJKtO1gCGhpkc2npKqpb9ky78Ji3QL8voCu+PeQCGy/l
	 sRgTTfdg3zTbPTcwcsk9RqZBIBTx0EHI5X0SeMCCkDSH21U+SaRgQ5l64nQua5cd4i
	 YAzPCxiNHDLUDJjiCXwHQ6leUtBFs988ns/aXblU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9913FF80587; Mon, 10 Jun 2024 17:13:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F9FBF805B3;
	Mon, 10 Jun 2024 17:13:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 602C1F80578; Mon, 10 Jun 2024 17:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39ACEF80578
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 17:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39ACEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JLlg+p4V
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45AEODuh023922;
	Mon, 10 Jun 2024 10:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=oPwV6DNi2iZ8a+TnR3
	efBN2gwSgK39HaMgBTQJnht74=; b=JLlg+p4VYPz8ilvfWSFJTE0HSrJQ4frDxh
	p2hLGcgK8M2GR2/naflIlT+9bXewM+By3kece5B6+DdnIPUCtTx400GDFS4gKOhG
	s+tjhwrg4l7I/O7a0dDYRDeskV0p+2KLt/u5l1xRiy4IHOnvMYtzqgKlVcjgH5m5
	1LpMb0/z+IUP3q8VQoYWtizbH4XxiTe4ucuzywjyv8NDJQ/5umuYy02kCJ2yIOds
	B2fXX0E0zGAbb+tlScmcmmaONuNhcEqGLeslKrl3r86s9XQLOgSButeTF/ufzqN8
	gbkFCNbHlXeA7dUlFCo3fKLY/+diVsQG01haB8WShDHUd/0lFeNQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhstmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:13:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:13:27 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 10 Jun 2024 16:13:27 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 16B69820249;
	Mon, 10 Jun 2024 15:13:27 +0000 (UTC)
Date: Mon, 10 Jun 2024 15:13:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Lee Jones <lee@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Simplify with
 spi_get_device_match_data()
Message-ID: <ZmcYFgEKgg0plA7k@opensource.cirrus.com>
References: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: ohGpH9_75i7nI5hbz6N2WSEP-b4nldDS
X-Proofpoint-ORIG-GUID: ohGpH9_75i7nI5hbz6N2WSEP-b4nldDS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HGUZXSI6Y6GGKRODUF6IFJX3E427QKWO
X-Message-ID-Hash: HGUZXSI6Y6GGKRODUF6IFJX3E427QKWO
X-MailFrom: prvs=3891f53e6a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGUZXSI6Y6GGKRODUF6IFJX3E427QKWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 04:24:56PM +0200, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
