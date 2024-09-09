Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D90971CBB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 16:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC92836;
	Mon,  9 Sep 2024 16:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC92836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725892626;
	bh=2p1aBZqsUmCuXQ3jiGz0sZlXSSmxwwNLGq3tOI53ZZA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nAvoYRYvthJwFwTBPvfPdYVQeezcTPOQ/V+Iqwfk80pZk3FesXCIe4CUepzVtKvfI
	 Hz5La06Eo0CnaivzJwI+Z9r8HyFyEL6+qWfPvGqsaRz21wH5DtcEwBRjoqSUrTDNrr
	 G3pg0O73x7TZiatituGZmT+PvJBzk2fvVR3hcqaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2552F805A0; Mon,  9 Sep 2024 16:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 401FDF805B2;
	Mon,  9 Sep 2024 16:36:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9374F801F5; Mon,  9 Sep 2024 16:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CE55F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 16:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE55F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ye20z4xF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4895bCw5012744;
	Mon, 9 Sep 2024 09:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9tHyNH/L4dVK8ecBDE
	2nZgXN5xeNAU1JDx+oAdHfNpw=; b=Ye20z4xFy8uOsE9ahafBpm8JfZKh5Nui/K
	oLuSts1jvOi2YDbruSgNoMn4X4tMkADO2gDYdsK/3BF20y5Vz5iVevIJOzkiD84W
	C1COTjSiM/rvARPNit0Je9225+X9jafXgHi96GsLCMlW10OvaD42Z+B1cWBBnEUc
	HMI9yd85llVYl0kZCe6M8+RqAD+4C/3Et/K4LFHlDS98smjAPF8LDQtdaTt5ZoMZ
	j86sjBTBCe38VrZ5NpUveqADJWDA0ChMTprWzAx0c2oCWTgT/BeNFOcufGRRV+Rr
	9xkHuXYHNsSI/Xz6cRtVVGTkNx+gh48hYLJE5yOQKFE6Cd9m5S3Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1qcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:36:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:36:24 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:36:24 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9B557820249;
	Mon,  9 Sep 2024 14:36:24 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:36:23 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <Zt8H530FkqBMiYX+@opensource.cirrus.com>
References: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: UWsB2DbKv8vFLqSDML-G28WGcjBtvHa_
X-Proofpoint-ORIG-GUID: UWsB2DbKv8vFLqSDML-G28WGcjBtvHa_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EVQH6XM4AFSF77GOHV3ZMIN6IBICX4AG
X-Message-ID-Hash: EVQH6XM4AFSF77GOHV3ZMIN6IBICX4AG
X-MailFrom: prvs=698262c8fd=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVQH6XM4AFSF77GOHV3ZMIN6IBICX4AG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 04:52:28PM +0200, Krzysztof Kozlowski wrote:
> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
> breaks codecs using non-continuous masks in source and sink ports.  The
> commit missed the point that port numbers are not used as indices for
> iterating over prop.sink_ports or prop.source_ports.
> 
> Soundwire core and existing codecs expect that the array passed as
> prop.sink_ports and prop.source_ports is continuous.  The port mask still
> might be non-continuous, but that's unrelated.
> 
> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Would be good to merge this as soon as we can, this is causing
soundwire regressions from rc6 onwards.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
