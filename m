Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091B902528
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 17:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B64852;
	Mon, 10 Jun 2024 17:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B64852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718032504;
	bh=fPnKg9UID+mW1zrXenYbwf76f9AMLdNbTU/wD+Y1ggE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hxdWz93ZUxtN89yTREWBGR36fZYgZsHfR+7uTHOGFsBO5NzEGea1DtGCQD58TtKfG
	 iCuwmt+aylAM3P+aDh79ZPczfVnol7EJ1AeoUWTu5SpqKdW1M6TZRhalKyA/InS2il
	 sZJjPQTODWYRpqPJisHlYJ6gNlREV/Jnpi8gYQoc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6971AF805A1; Mon, 10 Jun 2024 17:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C8DF805B4;
	Mon, 10 Jun 2024 17:14:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B33F805A9; Mon, 10 Jun 2024 17:14:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BF00F80578
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 17:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BF00F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oYDXvN+f
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45AEOLGM023981;
	Mon, 10 Jun 2024 10:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FmhsMKY9VRZDBt7z9T
	hX2z5wmJchEAJOWcoteS0TQMo=; b=oYDXvN+fJav+XWjOxDewopJK5uVYcLEOzz
	ImNfoVFw45H3EOgwD5kGR4ZyvpZKjQmG49NzrQ/FpXnNqCD4cx9HUO0pqQKz1SuA
	+W4oMlc+g9FbYSUJAeTyjvDr1ObNDwmW4D0diujZb68xToMXNe9NOmHfQrtD7q+A
	kwRp0uCMnRe9LEnJPkwd2cwDjpNVMEz/ExqfwOExlmJjuMBivA8oaZgv8AEd83bt
	S1nwrJnsjwIRqpI6d7HGsJ8EWNYtRPLT+rgysDp3J+tnVU+NYG5Rg/ultP1EYpNd
	dYi/90EcrY7G80iJhfuITf9/ClRkpdCEmEUAuIJl3weorNuRdRfA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhstn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:13:57 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:13:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 10 Jun 2024 16:13:48 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id A6B54820249;
	Mon, 10 Jun 2024 15:13:48 +0000 (UTC)
Date: Mon, 10 Jun 2024 15:13:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Lee Jones <lee@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] mfd: madera: Simplify with
 spi_get_device_match_data()
Message-ID: <ZmcYK6JNAzjFAukn@opensource.cirrus.com>
References: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
 <20240606142457.130553-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606142457.130553-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: aejApCCrLxPpTbOgXJWX5wnk5n1pe2Nx
X-Proofpoint-ORIG-GUID: aejApCCrLxPpTbOgXJWX5wnk5n1pe2Nx
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BEII4WXXFYZZW3AYQAJFMMJGVR7N6OHD
X-Message-ID-Hash: BEII4WXXFYZZW3AYQAJFMMJGVR7N6OHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEII4WXXFYZZW3AYQAJFMMJGVR7N6OHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 04:24:57PM +0200, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
