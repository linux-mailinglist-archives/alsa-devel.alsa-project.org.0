Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A180502B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 11:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E29C11C;
	Tue,  5 Dec 2023 11:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E29C11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701771966;
	bh=tlgIxvisXpOx0gBPe22oUDgW9paVjITouGogFY+7cBA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DnWqnEDL7Z6M6F/vkZ4ArxqabrnRqTxyEXWVbSfi/FraklAZeWRhRbCBZkUY8E8qP
	 7ZfcD/G5QsTppddbJ+ELqpfp0WMPpM2U3mjqcqgoTzoaA0e3ucxwyHHTI+N3bcRJDn
	 /llaXNiKzBXdbNxQMBqbVxLZvc1eSLFHilzxnMCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E20AF8028D; Tue,  5 Dec 2023 11:25:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D63F802BE;
	Tue,  5 Dec 2023 11:25:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E72C7F8024E; Tue,  5 Dec 2023 11:24:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 102CBF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 11:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 102CBF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NtQ/msW4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B56Q8A4003885;
	Tue, 5 Dec 2023 04:23:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GFILbflMqb4o+t6
	fxZdUwYUJfrO+r/2ojDqV/+kX+pk=; b=NtQ/msW4X7zJIyjFJ2vcdi/LlwPn/97
	A6YStkWhrsvRAxXiYD0rEX0xZGzpcLdZTsRlpdtlfVYSRN2yrbCIrcQnz0yg4OD0
	ChW3rcqIOADCQsCrFXn/COAfc7kdnApSLzE0VCGUB3fGHnPW5u4JQ5JjAEC0RvDR
	dA9yhpgvG3pj9QDQMO9gozPkPVxy+a1qwGmFOVrSXWwXptGiycBKiuy2W04BuqPr
	atlDNBzQr2zAZs63J5IqutK6ob9tZpGhFuiN0Ew9B+bjkjDMV1kr5IMRdaDfY2lb
	pmyUYC7FqIPJyr0Qd45OBmMRe3xeL4YZBU+40im+Vn6W7VUgVyXROHw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnk3qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 04:23:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 10:23:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 10:23:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 723B0474;
	Tue,  5 Dec 2023 10:23:53 +0000 (UTC)
Date: Tue, 5 Dec 2023 10:23:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] ASoC: cs4271: Fix spelling mistake "retrieveing"
 -> "retrieving"
Message-ID: <20231205102353.GD14858@ediswmail.ad.cirrus.com>
References: <20231205101740.2820813-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205101740.2820813-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: dNRqLVlZD_1P4znVHVYUKVZ9k8TfL-gn
X-Proofpoint-ORIG-GUID: dNRqLVlZD_1P4znVHVYUKVZ9k8TfL-gn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OMCW42UH4HT6ETBMHFJEDFJZAB2IHXLQ
X-Message-ID-Hash: OMCW42UH4HT6ETBMHFJEDFJZAB2IHXLQ
X-MailFrom: prvs=7703bda8c8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMCW42UH4HT6ETBMHFJEDFJZAB2IHXLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 05, 2023 at 10:17:40AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
