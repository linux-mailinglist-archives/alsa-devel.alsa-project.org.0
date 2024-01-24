Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88D83AD21
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:21:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C051A4D;
	Wed, 24 Jan 2024 16:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C051A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109690;
	bh=agPLFUEFM5/Xl+Qkb3//4GKSlO6yApWCN4GTb4cujnA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bZsJUwioY3mF1mUWmEaK0ugvHN7Rpso3ktGvRwUdtgW49zOMGr2upE0FW2o0Y8S+g
	 X+RPiIz9y6dvOkubQGAVf3HcYreS1BP/KjpTv2uskp5IiKFqXkCHjTSqoSJKtVUAXI
	 zxAPzapGwY4burzOqJ5WfzOVMyzWLpdgOJPAPRTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2CC3F805A8; Wed, 24 Jan 2024 16:20:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A21F8057E;
	Wed, 24 Jan 2024 16:20:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBDF7F802BE; Wed, 24 Jan 2024 16:20:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7950F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7950F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=j83oTUWT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O6UAwg025066;
	Wed, 24 Jan 2024 09:20:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=vOohKh4Jlq7Gj3T
	yhebrNhjFZ8GR73TN9M0kxe4dS2c=; b=j83oTUWT5M9ESeQZKSOzQ5Y3U82cWCL
	S5SxfcNyFK34eUwgtzVeP59hos64i9+qSsM/otqeD0Cf7UYT+Gf2kj8lGSsFJ5G4
	u3QwIaTL5cnu+HvJwZPN9EHq5qGoJ7M7D6T/lllH0b22TjYRaKNIgA46EP43AiCG
	MtMiE7Ki72BVDpR5GKuJPHhbKRQ2zWIKhTc7AiRt74sFhCjWqGOYrvhtAZ7+DMj4
	4Ne5yC7ldNxdiciQq8xjcpsdMnlYlpSzHhwxSaKxgjWVkTZioBXRlN0WvkjFIcpj
	vspvfpCWN90l3p6g1+3g4cFMNx74/xeoRS8BkGdCVxZgYHl8L0B0e3A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:20:50 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:20:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:20:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E28AA820246;
	Wed, 24 Jan 2024 15:20:48 +0000 (UTC)
Date: Wed, 24 Jan 2024 15:20:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <lee@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 6/6] spi: cs42l43: Tidy up header includes
Message-ID: <ZbEqz31G+WfTtsZ/@ediswmail9.ad.cirrus.com>
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
 <20240124151222.1448570-6-ckeepax@opensource.cirrus.com>
 <8b8fcdbd-b1c8-4618-acf8-e31b6ab33be7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b8fcdbd-b1c8-4618-acf8-e31b6ab33be7@sirena.org.uk>
X-Proofpoint-GUID: kGDzglf-HN_pl0pxtUvti2jlDz9C3-0p
X-Proofpoint-ORIG-GUID: kGDzglf-HN_pl0pxtUvti2jlDz9C3-0p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KMGIQGF3FFTWDHQFNPLLDK34JISBURZZ
X-Message-ID-Hash: KMGIQGF3FFTWDHQFNPLLDK34JISBURZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMGIQGF3FFTWDHQFNPLLDK34JISBURZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 03:16:25PM +0000, Mark Brown wrote:
> On Wed, Jan 24, 2024 at 03:12:22PM +0000, Charles Keepax wrote:
> > Including some missing headers.
> > 
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > 
> > The changes to the MFD headers necessitate the inclusion of of.h here to
> > keep things building, hence my including this SPI change in the this MFD
> > series. The rest of the SPI fixups will be sent separately, as they are
> > also not dependent on this change.
> 
> If this is needed to keep things building then presumably it should be
> before or part of whatever change introduces the requirement, otherwise
> we have a bisection issue.  Anyway:
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Yup it should will, I forgot to CC Andy too, so this is a good
excuse to resend :-)

Thanks,
Charles
