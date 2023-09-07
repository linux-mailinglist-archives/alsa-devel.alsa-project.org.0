Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B19677970DD
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 10:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB5C93A;
	Thu,  7 Sep 2023 10:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB5C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694075959;
	bh=mXqANi+vYJGrlRBWUeOBl31hi1uarpvf/p4TQvPrNhE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=epGG1ynZxuDx0YKbCBQR1G52kQQoX8BlM670xl+ElnBHupdm/egwzKkFMb08CVdXr
	 VZPFPpxj01kfLxTrDsnG4s2IpQRmNj+c8RGip3whMnKK1w8Z6tHHLl02Nf7WsLpOHD
	 ik6L3a56Yn0kiEFxG/0HDETVZ096J3jN2A+Qq2h8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 685FCF8047D; Thu,  7 Sep 2023 10:38:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D20C5F8047D;
	Thu,  7 Sep 2023 10:38:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795A4F80494; Thu,  7 Sep 2023 10:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40C3AF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 10:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C3AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qxm9g5NT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3875p76G004490;
	Thu, 7 Sep 2023 03:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=s4QvFLjCdfbxhAG
	nuFXV1BMWi0jA62lbyy724T4ih1E=; b=qxm9g5NT1lV0RyQTZP45Xbd81weIPfD
	HKnQjq9fkyeKIHp/y0QE7TicQcvdoLTOrc5jSIHDAcOzmygYNQawuSysrhRekgn2
	B6nqWDb6gzQO8yGw+pQua8PxRZNPwaSB2xXLM0lYnWhWPOb+FPXlxI/YkKE9EHGY
	mjYnecqjTbJuLOvyOkrd4t8H6jj3BRY9+86FdTsqbU65FG+Qm4HAxYzqs9JABDUx
	H+D60gCiUV2jWrdwHjVY2Yv3thAyKao7bgtrz0vAfey+4U04JZMvFkkdBEras5Lp
	3j+w22JmLaMtGsEsI/rYCruaA4qNpSwuPXmrLE+GYNP6mNMB0soEJZw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex6b2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 03:37:09 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 7 Sep
 2023 09:37:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 7 Sep 2023 09:37:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 87ACF458;
	Thu,  7 Sep 2023 08:37:07 +0000 (UTC)
Date: Thu, 7 Sep 2023 08:37:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 9/9] ASoC: cs35l41: Use devm_pm_runtime_enable()
Message-ID: <20230907083707.GO103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
 <20230905094535.GK103419@ediswmail.ad.cirrus.com>
 <953eb242-4d52-4cdc-8f7d-71af003778c5@collabora.com>
 <20230906163725.GN103419@ediswmail.ad.cirrus.com>
 <de9bf872-16ca-4b4e-9543-87f463b985a0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <de9bf872-16ca-4b4e-9543-87f463b985a0@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: Ar4ROd4euK5R8TVCYvRjiOa-S15YGxFV
X-Proofpoint-GUID: Ar4ROd4euK5R8TVCYvRjiOa-S15YGxFV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LCZWRPAKXAA6NZ3GQUOTCFYFIS243CMW
X-Message-ID-Hash: LCZWRPAKXAA6NZ3GQUOTCFYFIS243CMW
X-MailFrom: prvs=461438fb73=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCZWRPAKXAA6NZ3GQUOTCFYFIS243CMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 06, 2023 at 10:55:28PM +0300, Cristian Ciocaltea wrote:
> On 9/6/23 19:37, Charles Keepax wrote:
> > On Tue, Sep 05, 2023 at 10:15:46PM +0300, Cristian Ciocaltea wrote:
> >> On 9/5/23 12:45, Charles Keepax wrote:
> >>> On Sun, Sep 03, 2023 at 12:06:21AM +0300, Cristian Ciocaltea wrote:
> Agree, let's keep it simple. I will revert the change and instead ensure
> a proper cleanup of pm_runtime_use_autosuspend(), according to the
> documentation:
> 
> "It's important to undo this with pm_runtime_dont_use_autosuspend() at
> driver exit time unless your driver initially enabled pm_runtime with
> devm_pm_runtime_enable() (which handles it for you)."
> 

Good spot was not aware of that, thank you.

Thanks,
Charles
