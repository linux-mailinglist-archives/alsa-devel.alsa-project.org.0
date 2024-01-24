Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137F83AD17
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B260484D;
	Wed, 24 Jan 2024 16:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B260484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109638;
	bh=zX7eqkGsLS6odL5uF8581JDrJBM5mU7ldiPJDj/CpiA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HClGjPZmZ8FuKUZHL5Ms2FV3h73vzlCl0/kDVBEqw6+XYr4Mes+FSvc+QcP7tKpN+
	 T2igSVhKAcGg9Klet3+se+DLYSzEvFoAqATkmar4FlNVpSc1dXufIvEEmmV6rUs9Fd
	 wfXIDx5k5qDE5O1HXj5mhNmUM1PuhVs3lvQM8bqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95E05F8057E; Wed, 24 Jan 2024 16:20:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20ED0F80568;
	Wed, 24 Jan 2024 16:20:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E229F8028D; Wed, 24 Jan 2024 16:20:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4861EF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4861EF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P7NbJN+z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O6UAwa025066;
	Wed, 24 Jan 2024 09:20:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=SrSKAtFBOmvPm4U
	4MUjJ2ZI1KavQKTqCbfxnpWUz/oM=; b=P7NbJN+zAv2xj8zxZabnO3tYXyWFS5p
	JP6OZyYfx92NyR1LphcFjt7gXbOMLBCwOg564XwZTE402nt8eQhbXNMbCQlfPBd+
	ErX+X3PMrN+f8FDweyj1X1heS8hdk2JJ6cqG+Y7r8lRVC3bBSycv44hDtvfWWuMy
	ykA8TA6rhUfHbb/VFGOVHr+4GKEc6rXSI7hdC7kyyreULhMIZqUsN/oSzV50A9X6
	FoXsZohci+6TUiZL5QTxpu7k5IUdBIuNEtNBTKyZlOkGQUICaRFhqNDFHYgn+w1M
	eLRSnsgZlGAH+USBbGNLPn6Gv5Pn07C51244yUOvt4SFHybfvZ0ZghQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:20:08 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:20:06 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:20:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B222C820246;
	Wed, 24 Jan 2024 15:20:06 +0000 (UTC)
Date: Wed, 24 Jan 2024 15:20:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>, <andy.shevchenko@gmail.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 1/6] mfd: cs42l43: Tidy up header includes
Message-ID: <ZbEqpbwTOlWBHrL2@ediswmail9.ad.cirrus.com>
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
X-Proofpoint-GUID: 2kAoorBE5-OQqpanyrE7qAA0Sjpd1n6f
X-Proofpoint-ORIG-GUID: 2kAoorBE5-OQqpanyrE7qAA0Sjpd1n6f
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EDSY2BRW55MRCQGRJILUTZZRB3FGJLIA
X-Message-ID-Hash: EDSY2BRW55MRCQGRJILUTZZRB3FGJLIA
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDSY2BRW55MRCQGRJILUTZZRB3FGJLIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 03:12:17PM +0000, Charles Keepax wrote:
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Apologies Andy, I forgot to CC you on this series, hopefully you
can pick up off the list, but let me know if you want me to
resend.

Thanks,
Charles
