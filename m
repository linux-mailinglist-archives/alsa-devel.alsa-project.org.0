Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B01792186
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 11:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24277825;
	Tue,  5 Sep 2023 11:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24277825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693906611;
	bh=c9Vx8xfPCcIN9RedRaiwJvQlWh5UnObWPz6qdQfqIIk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eVGbz2L4FeoSf/ZjdVBPFY700j8Veptzeih+NezfAFhMaUGiW/SEhoXNCx5/yw3Qt
	 6+YkePnC1YkqCXaHInJPLZAnmKrCh2AAp5H9ScUODcW3dPVx9wgftnCImg7GC88kVf
	 vETR5PMcbNIHs8Zof6o6PIpFJljt64bJgqpkMAyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD14F80141; Tue,  5 Sep 2023 11:36:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13152F80431;
	Tue,  5 Sep 2023 11:36:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE6FDF8047D; Tue,  5 Sep 2023 11:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BC16F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 11:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC16F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Lbdd/jnX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38560m0a022304;
	Tue, 5 Sep 2023 04:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=u8RsEiVnxGIRCjJ
	Uubq0Hke4cPj+jFtYZPO6tL1DCmY=; b=Lbdd/jnXlKUKTKZmHrHH+vG8oIkD46S
	It7lWtBYwA2rtRPib55neHBLbPwpo7UHxH/E4NuUmmcFHMrSYT7dx+I6ry99PLoD
	hQdE+dEMo19iCLOOmsWO5Ihl5XR+3mzVQwJNVi2BOJt2WYaUpwAt3SstqM32YhFg
	ghN4Mlddvfr7juApYsYuncechNuoXr9SeQ4Vzda4tQgTL++Q6IyWiyFI2XbY0GLv
	JN6VDka9+2v5Ub2KfnLa0V+B6g9SBx1YsDN/e/2r2gfgExF1xq6VCSc5csX+bHtB
	PA7cWuDwXDa7TZe19tzKUcE3w1KHNRy2TIsoqgb+iQg4X6QZzF9eIxw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex3bkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 04:35:47 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 10:35:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 5 Sep 2023 10:35:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AD24011AA;
	Tue,  5 Sep 2023 09:35:45 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:35:45 +0000
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
Subject: Re: [PATCH 5/9] ASoC: cs35l41: Rename pll_lock to pll_lock_done
Message-ID: <20230905093545.GG103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-6-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230902210621.1184693-6-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 7Jjl0OweStK7Z5zUba6kZrt9qC4OpDgX
X-Proofpoint-GUID: 7Jjl0OweStK7Z5zUba6kZrt9qC4OpDgX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZF2HFOAVLSCCNGKZAS2TYRWBXQP72CXG
X-Message-ID-Hash: ZF2HFOAVLSCCNGKZAS2TYRWBXQP72CXG
X-MailFrom: prvs=4612d7e67e=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF2HFOAVLSCCNGKZAS2TYRWBXQP72CXG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 12:06:17AM +0300, Cristian Ciocaltea wrote:
> Use a more intuitive name for 'pll_lock' completion, which helps
> improving code readability a bit.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
