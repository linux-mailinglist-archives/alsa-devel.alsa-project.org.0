Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB78A9AC6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 15:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1D0DEE;
	Thu, 18 Apr 2024 15:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1D0DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713445424;
	bh=Zb0FoMjxs0n61sYEGfUe+TJZmKIF3dIF1soB4gHZJSs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FlOs58EJYGs6fD1+TJLSekCIX4qhhm9W//5OgclKnxMFRqKLUQc7bWhebehrq127J
	 xizw+kfkK8Hk/jdoxnCzjugOZJagkxs6/MwJhz+9Qv1uqTYAUKAjDzoG7d26qW6hsV
	 WfSTajhhWk64L+tKVHXnv1/mPgCYmmDGq1emIVps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF578F8058C; Thu, 18 Apr 2024 15:03:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A2D7F8025A;
	Thu, 18 Apr 2024 15:03:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2A78F8025A; Thu, 18 Apr 2024 15:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 512CAF8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 15:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512CAF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WDVttgJs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43I4jfe8023908;
	Thu, 18 Apr 2024 08:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=r8zK1/13z0HJ+6I
	XCaTJo+f0tyrzjy+dr5hvebpgKvk=; b=WDVttgJs4TWFLFOt2u3HwGc82O4VJMZ
	JpPLaIEPA560L2ISXdpx49dIaNfSduSevhxJrzZXrRwPh4BSGjMHS7GsO2LsRTdv
	ogzz31p4bfkyLdR3hHWa3+kJ0H3rNZAU/gFOPyYglee3TXqQYbL58nsz+Vtyilby
	NpBjwk33k5SZr/se6ZT5IgNETpzQk8FTYZZYt3C49J7iPYCntUamC4JxKDRcHB07
	1aJ6YrK3KSwRDMzdWIUooaiLQbbVJNyi0FvcPKLEWmS0UinljgXCnbOOTpZPIdQp
	6eeWjSLqcs8sdXI+ILeTi5TfLkKf2pbrZ2WE9AjCykfTBRr/83WJcew==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xfqeycrt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 08:02:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 14:02:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 18 Apr 2024 14:02:50 +0100
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B47C1820245;
	Thu, 18 Apr 2024 13:02:50 +0000 (UTC)
Date: Thu, 18 Apr 2024 13:02:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] spi: cs42l43: Correct name of ACPI property
Message-ID: <ZiEZ+aSNM0d1/X+2@ediswmail9.ad.cirrus.com>
References: <20240418103315.1487267-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240418103315.1487267-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-GUID: xcKt_Uew1h2qac4f3ucpYGS5MbEk8KYz
X-Proofpoint-ORIG-GUID: xcKt_Uew1h2qac4f3ucpYGS5MbEk8KYz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7C7YRE7K2QEAWTYQD3MHJLCL54BH66RO
X-Message-ID-Hash: 7C7YRE7K2QEAWTYQD3MHJLCL54BH66RO
X-MailFrom: prvs=1838e553da=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7C7YRE7K2QEAWTYQD3MHJLCL54BH66RO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 18, 2024 at 11:33:15AM +0100, Maciej Strozek wrote:
> Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
