Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319579216C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 11:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E29EA4B;
	Tue,  5 Sep 2023 11:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E29EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693905912;
	bh=8qlsnwjVwyFuspVl6vbdA3EMkQ3uz7QG6rB/7FUdbRU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EJ8ZKHWcco7TXHUaCGqkHPpdaZxiVtB1v7ToJb55ohrsq0aBi4iO8lXReK+YGNnjT
	 TkZ8yexF2jJ55JykkECb7KdjXkhbDbCueT3ADLrA2HwSFT1cIOI9zSNAOPu3c7qwoM
	 uamyzY5ww8johd+HM0BK7PS4CcpdL4yA0RkuelQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F91FF80567; Tue,  5 Sep 2023 11:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3D2F80563;
	Tue,  5 Sep 2023 11:23:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5F7F80567; Tue,  5 Sep 2023 11:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66ED0F80552
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 11:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66ED0F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=elWFA3OW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3856L0e1015029;
	Tue, 5 Sep 2023 04:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=vdsUNreevwY+i4D
	gEt+A9zcUEHYn0SDAckVKt5b8MJM=; b=elWFA3OWgACE2KM9VnrDySKUuwbhgsm
	XSYyasVImJ2QdnOEVDKYVjevZAle6Jv+MNFsUePph2748SBDxftGGKTKdDCHkQGF
	QE1nkiwFLCu/ddTc4fSVX4ZbtUnVwVHN6UsDHSmFwUB8DCJvBxs7r3nXNEA3JvBL
	MK+vhiQ9rPepzpjs0K6ipS5ZQYscx7zUZSCiRHXx7zKVszEFQA8Xds9Nikpe7jez
	o7SHbSPjnOSnfjQvmfxl6kD5Ia7P7OnDtrhIsGQmOhEiaqCKKByAewLFgpJ/4e+Q
	bNmZ6GBYetmlC4/r4ps+3ifzpiMFHcYT9MwRvlFLYTk47Y6E4qSfY7g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex3b9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 04:23:43 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 10:23:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 5 Sep 2023 10:23:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6810311AA;
	Tue,  5 Sep 2023 09:23:41 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:23:41 +0000
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
Subject: Re: [PATCH 3/9] ASoC: cs35l41: Initialize completion object before
 requesting IRQ
Message-ID: <20230905092341.GF103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230902210621.1184693-4-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: _NcjRbu42VDmK1efiPjQfRVK7kxcYYxX
X-Proofpoint-GUID: _NcjRbu42VDmK1efiPjQfRVK7kxcYYxX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GLTIPM6ADEY6SQYG4I7BTQIEIPSQIJT6
X-Message-ID-Hash: GLTIPM6ADEY6SQYG4I7BTQIEIPSQIJT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLTIPM6ADEY6SQYG4I7BTQIEIPSQIJT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 12:06:15AM +0300, Cristian Ciocaltea wrote:
> Technically, an interrupt handler can be called before probe() finishes
> its execution, hence ensure the pll_lock completion object is always
> initialized before being accessed in cs35l41_irq().
> 
> Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
