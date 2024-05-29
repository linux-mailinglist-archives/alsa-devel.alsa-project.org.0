Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4415B8D3253
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 10:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39D583E;
	Wed, 29 May 2024 10:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39D583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716972840;
	bh=jNVKiNgDkAsBnYoKAy2Ps+z0ugzzdZzEwklzW+hysfI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wz7dmv40Fyg1iqZegvzuTYJBcOIQVlULmrz5ujK/9xz7D5+7v+mJwvCZ60e7pIdD6
	 epOVKZOobA4cY9HdMQvgCf2gyR+SrNcIB3xhWDEDZU0NvvYKf7AI6WBiabBVmvZwSI
	 J/juQNdHmZEHcsXrCrEuFH1+EsE/cSQUM7Ho0YIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBB34F8026D; Wed, 29 May 2024 10:53:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 855F8F8051F;
	Wed, 29 May 2024 10:53:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFD40F80149; Wed, 29 May 2024 10:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83DDCF80051
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 10:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83DDCF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gaq3V8gE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44T58VS2001831;
	Wed, 29 May 2024 03:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HnhwCfqGYqlEx05vQE
	5A99l1D3HRCI5OJeUnj1keqzM=; b=gaq3V8gE/O0pE31kBaZRSnzzZFPxl3YflL
	HzqRsNhiZKOEnPOsF4s5QdMQqXbgdhKc3Gt+cmA9qTQ0a/wKMfFrWVh4Byf0zhvj
	Bup4hL19yNhSmjwZehf8ahem7Yo5eiFVd0wnCRzBwl5cYr+BFx/QMMOvnSy0DLDE
	JzSsVqRfsSJc2dfavdRgx+zQTkB95ZEG5DABFAA/77D07gn1ODXzDZkO0zNb7xoM
	MFfxrw9cORNwAO7+n53kIQq8+N+BPWGYaV9u0cdWwbnF+9qaQQOXyANd23X7o/Sm
	Xp0jSIn5hC19OUMrqOBibHZTqOnEoMVHucVY4oW+pYWXDLOVNDNQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwuaf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 03:51:22 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:51:20 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 29 May 2024 09:51:20 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F2FDF820270;
	Wed, 29 May 2024 08:51:19 +0000 (UTC)
Date: Wed, 29 May 2024 08:51:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>
Subject: Re: [PATCH 11/18] ASoC: Intel: sof_sdw: Add quirks from some new
 Dell laptops
Message-ID: <Zlbshrm0aPIr/V/F@opensource.cirrus.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
 <20240527193552.165567-12-pierre-louis.bossart@linux.intel.com>
 <446f90c8-87de-4a9f-8f40-ba544754dd15@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <446f90c8-87de-4a9f-8f40-ba544754dd15@linux.intel.com>
X-Proofpoint-GUID: nlSa1_kuQxnqPKPOgEJwqM-3IaUT7H5q
X-Proofpoint-ORIG-GUID: nlSa1_kuQxnqPKPOgEJwqM-3IaUT7H5q
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TPJIPQTM45DIYMKLVDJPKAE4XGVD3B5K
X-Message-ID-Hash: TPJIPQTM45DIYMKLVDJPKAE4XGVD3B5K
X-MailFrom: prvs=3879dd8593=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPJIPQTM45DIYMKLVDJPKAE4XGVD3B5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 29, 2024 at 08:25:49AM +0800, Liao, Bard wrote:
> 
> On 5/28/2024 3:35 AM, Pierre-Louis Bossart wrote:
> > From: Charles Keepax<ckeepax@opensource.cirrus.com>
> > 
> > Add quirks for some new Dell laptops using cs42l43's speaker outputs.
> 
> 
> Please hold on. Dell just informed that they have not made final decision
> 
> to use Cirrus Logic codec for some of the SKUs.
> 
> Sorry for the inconvenience.
> 

Yeah just this patch the others should be good.

Thanks,
Charles
