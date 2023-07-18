Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA3757B6F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E940FDEF;
	Tue, 18 Jul 2023 14:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E940FDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682087;
	bh=BKnhPUJuH3UwaUN57oUyRdCbO4PDnoVtT2FfD8sf+hM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BflGAcJg7NOhkLfJKG+U5XUA58ilbCKB52psTOL5SYDUDKdxuhRpqDivsRctwSV3d
	 nWt0Ooxe8td9iVMUfnlWY4403TzpZ/uSWcyLKCf9UBe+C6sIRhWitGxTV0FpEeXTUM
	 Dpi/trdhkxj+tA6sVyqnY5bRXKrIDhDVP3AH+FYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C39F8027B; Tue, 18 Jul 2023 14:07:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D80F9F8032D;
	Tue, 18 Jul 2023 14:07:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47A91F8047D; Tue, 18 Jul 2023 14:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2631F8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 14:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2631F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=G5wBayth
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I6sZJf028650;
	Tue, 18 Jul 2023 07:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GO0frG2MMRLQ68A
	EIKXd4M9vzSlrAHKSIAcc+fFbHuQ=; b=G5wBaythIVIVsEmRrdiRBESewhSB3+e
	sJ6aSUaOeDbKNHzTmF0zXnoX7pvl0DtuAny7HhO8bFnE1jk1805Wehiu/aoMV/pD
	lkh2E3L12AZNnK8LhumSYkKR7YxMINnTL3NMpeFkziwMg2/QSgxF1rVTeTuo92Wo
	N05gMH/Mmcr1LyIdiJYd3EwDolLRwHEKF6l2TDTtvMLqmNxluxrVjrDSG/vbQg40
	4CZcXwyfUk0IJOOtLNVuqj/tUewfKYHyxSewsT9EBMq8buk1J8OTdy427bi8vvWd
	7AbnDBW8tGcKJ7OPsib39VCgWOv/0EI6JwJJQ/hMHJ3aLpsGBjs/5dg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gub6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 07:07:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 13:07:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 18 Jul 2023 13:07:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 672613563;
	Tue, 18 Jul 2023 12:07:05 +0000 (UTC)
Date: Tue, 18 Jul 2023 12:07:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?=
	<povik+lin@cutebit.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 00/48] ASoC: cirrus: Use the maple tree register cache
Message-ID: <20230718120705.GF103419@ediswmail.ad.cirrus.com>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: l3auyVJa9nGtNzmovPez2lrJFEm55LP7
X-Proofpoint-GUID: l3auyVJa9nGtNzmovPez2lrJFEm55LP7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HE76PXRCWO2LWL3KW6IFE7FDS5CFLIPV
X-Message-ID-Hash: HE76PXRCWO2LWL3KW6IFE7FDS5CFLIPV
X-MailFrom: prvs=2563600699=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE76PXRCWO2LWL3KW6IFE7FDS5CFLIPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 01:13:13AM +0100, Mark Brown wrote:
> The maple tree register register cache is now able to generate multi
> register writes which was the last big feature of the rbtree cache that
> it didn't support so let's update drivers to use the cache with the more
> modern data structure.
> 
> ---

Series looks good to me.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
