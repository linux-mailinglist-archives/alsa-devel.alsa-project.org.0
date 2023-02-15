Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6732697A38
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 11:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B87832;
	Wed, 15 Feb 2023 11:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B87832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676458332;
	bh=Wt+ILbC+1rnqmJZZlkgacsd6C76buyaulMQ0eOhsJLY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HRVGrKWns+yAHkI/pgySo66h+rRij9UBks4XksDiehvlTgEOOMMBnLy+nRopAfLDj
	 cPk8Qrw2fQ4j9VAFyjOF9K4pWtfsn7uDU5wPWrI/XG31tphZtA4LtCv/mC8y1ar1iK
	 G1hTyj0vt4ehC9dum0CV1TPNv6HmUrQvV5wD8N+E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC63F801C0;
	Wed, 15 Feb 2023 11:51:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB60F8047C; Wed, 15 Feb 2023 11:51:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0571CF800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 11:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0571CF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WHTKj5Vp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31F7bm0B000769;
	Wed, 15 Feb 2023 04:51:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=1fJ7fDiw+kwjKFz5WaAgcT+dFb1U2KFb/MPMMwW/N8U=;
 b=WHTKj5VpZzU8lL9H2JOkvkFyTBIVcS1aSXVOR+Z78roNx0LD9KGnyv6obLtp9U1PQQnS
 Rx36lQyxUsgFsNbOIZSSx3bFZSuFmYfTsLXq+lkluld7VXWLr7fQjotY0ig07xNnQsyY
 3RQot1ajsO9EFWRMuuYYacLS7+fE9+yAbTxiooGkzgH889Ls/BE9+ljfVSiGXGGzwwHX
 2SGgzT1dCG8qmBdzHSeVj9ImVyStDgJuLoEJyK1twGmrjJaX5RWZVGN8IO4h6lCjtfJi
 zq0sF2UVBG56U75740yokOrklmFhEU7jD9CzTVnkwlZmt4R5YRGQR+Sf+fECoPzAfvS3 OQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nrm8wgkea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 04:51:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 15 Feb
 2023 04:51:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Wed, 15 Feb 2023 04:51:11 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7621111A8;
	Wed, 15 Feb 2023 10:51:11 +0000 (UTC)
Date: Wed, 15 Feb 2023 10:51:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs35l45: Remove separate tables module
Message-ID: <20230215105111.GI68926@ediswmail.ad.cirrus.com>
References: <20230215103705.3302716-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230215103705.3302716-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Fj_C7fMH6-_VlVRI5HpweHzEBbtDDE3c
X-Proofpoint-ORIG-GUID: Fj_C7fMH6-_VlVRI5HpweHzEBbtDDE3c
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: T6E6OXEHOADFPMN2ZBDTW643KB4P4YLB
X-Message-ID-Hash: T6E6OXEHOADFPMN2ZBDTW643KB4P4YLB
X-MailFrom: prvs=74104ead9d=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6E6OXEHOADFPMN2ZBDTW643KB4P4YLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 15, 2023 at 10:37:05AM +0000, Charles Keepax wrote:
> There is no reason to have a separate module for the tables file it just
> holds regmap callbacks and register patches used by the main part of the
> driver. Remove the separate module and merge it into the main driver
> module.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/codecs/Kconfig  | 5 -----
>  sound/soc/codecs/Makefile | 4 +---
>  2 files changed, 1 insertion(+), 8 deletions(-)

Apologies, just realised for neatness I should also remove the
MODULE_ macros at the bottom of cs35l45-tables.c, I will send a
new version shortly.

Thanks,
Charles
