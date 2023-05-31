Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACA717B53
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 11:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014726C0;
	Wed, 31 May 2023 11:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014726C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685524210;
	bh=GQ/VJcarSHovY/ujid2ITkfjTPNyiMNOre1H2BQDjl0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gbbFF56gAm0dMj+WkKFXXS/tbsIKxvIYZp4W0hH+dgdsRNsnkdsZ3AXyPOjff97Sg
	 YcNVeXKGvM0pjg3iti2q4s+5wLLfwrTSpy+nisRZQi3e+uYDKuyalJVugula79oPKK
	 X/ESg10+vcK7g6zaiK9fG451hEIgiolYggz9ZHwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D3CF80542; Wed, 31 May 2023 11:09:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09DA2F8026A;
	Wed, 31 May 2023 11:09:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7CE9F8042F; Wed, 31 May 2023 11:09:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30870F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 11:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30870F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FjeZPEVH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V6NtW0031925;
	Wed, 31 May 2023 04:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zveEV9JuSBFs9WdDnNH2gJhjslm13ItkavaeTEwiuV4=;
 b=FjeZPEVHau0oSJWYBUHUIv9HmdXGOLeuQiCyS+eIUZuyOoGrwCwAOVR/zDGnQCgmrF8F
 pCqAA6KDVEpQoQhx3Nv1P143QUxexuipPRAFrOfveE1k0exsEm+2KmC+KjKntQ70ILI/
 0YFOcUPRwS5aRbEf+tXB73GyULr+lHpSVnC8Z1pE9fBwEv1VdddopgZCITwffZcvvtZu
 5D3/5ff+cZYp1Ea3R9EbSm25bQUghGA3+QApTaNNxXfotn/IQKwglQuNBy3qkmv32DDZ
 1XjPj5TmaBAinOpO4nrSMPEHN29g6xb44SQkNhdbhFn+v5YR7Dj2LKC+J01n8Lg0LGts Tg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mvgsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 04:08:38 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 31 May
 2023 10:08:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 10:08:36 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7FDA711C6;
	Wed, 31 May 2023 09:08:36 +0000 (UTC)
Date: Wed, 31 May 2023 09:08:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lizhe <sensor1010@163.com>
CC: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dirvers/gpio: remove redundant reset gpio suffix
Message-ID: <20230531090836.GI68926@ediswmail.ad.cirrus.com>
References: <20230530163210.4324-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230530163210.4324-1-sensor1010@163.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: wwW61hLRNjV4K2LKGqteHli3JUbDQg54
X-Proofpoint-ORIG-GUID: wwW61hLRNjV4K2LKGqteHli3JUbDQg54
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2AUYUELCYAFHUC2GRT5IW5U5BNWYRBFM
X-Message-ID-Hash: 2AUYUELCYAFHUC2GRT5IW5U5BNWYRBFM
X-MailFrom: prvs=151547ecba=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AUYUELCYAFHUC2GRT5IW5U5BNWYRBFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 31, 2023 at 12:32:10AM +0800, Lizhe wrote:
> no need to add the suffix "gpio" or "gpios" after "reset", as they will
> be automatically added, see of_find_gpio().
> 

Patch itself looks fine, but the subject line should really be
ASoC: cs35l34: ... rather than gpio.

Thanks,
Charles
