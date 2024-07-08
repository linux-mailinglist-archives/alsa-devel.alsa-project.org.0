Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54092A594
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 17:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE55A1F8;
	Mon,  8 Jul 2024 17:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE55A1F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720452281;
	bh=pS3mpbaNBw30xlRpnmp6WAVvSlm7ajqz1TOyUWOrhJE=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S5LkAZZ6TZg/u3lQMRJPwCIH7Qb9850bfcxtUqtLMQ/z4o1fowjLDoN6LLOyMPTSL
	 yj767xI4wlje8L6I14W7FBtNRqB7oNtwpZVkfW1q9M+ZTXe2fBo9B6PL2W/xY43Xbb
	 79ot3KlPYiZ49lJFK6ce8NBYftrS+/Uom7Jh+xbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981FFF80568; Mon,  8 Jul 2024 17:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA687F805AE;
	Mon,  8 Jul 2024 17:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 558E7F801F5; Mon,  8 Jul 2024 17:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9295F800FA
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 17:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9295F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HZWfvlOS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46870Jlo022463;
	Mon, 8 Jul 2024 10:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gXyh6SBCSHWmEVsSuVqEsfwuVcZ5xlXoDBlCEAuKm0k=; b=
	HZWfvlOS8fiZYO5iyTUkvO4pzCb24yxS4BWxtgeglchz7st58Vy4gzqY6IKOMRop
	9OH1FJKROfyfvs+/XnAnVvg5cobH8inekwoiF2C6jn98Dl60xOAhDbb0Hm28SFOh
	dJNyjseAv77Ek4wTZfJpYMn3y6R4V2gt30g/yFKwgU/pIp2TvuK2qLXbfy1hlpZw
	kFFQQ4O7qSnkTf92WE+KcA/a3mFKniAaUFsvDoRkHm3tN4PpOlalBFt/ARs9mH36
	f+nGHHD9M4dgLljAoG50+ZqGSlaViLTPxc/wUA9TWlGqJICO20wA84pt0rA7ripu
	XdGwXzEJ6IRiOX8h7z8MfQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axsnej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 10:24:01 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:23:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Jul 2024 16:23:59 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A16F1820244;
	Mon,  8 Jul 2024 15:23:59 +0000 (UTC)
Message-ID: <eeb6ab14-6f8d-4f89-909c-f4a843576078@opensource.cirrus.com>
Date: Mon, 8 Jul 2024 16:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: cs_dsp: Use strnlen() on name fields in V1
 wmfw files
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240708152052.390594-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20240708152052.390594-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5crc1PMYt0RFI2-CVrlkanzM1T8hdD39
X-Proofpoint-GUID: 5crc1PMYt0RFI2-CVrlkanzM1T8hdD39
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AQPCZU7F3PPMBTNAL4DANE3J62OZZU7J
X-Message-ID-Hash: AQPCZU7F3PPMBTNAL4DANE3J62OZZU7J
X-MailFrom: prvs=4919130c1b=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQPCZU7F3PPMBTNAL4DANE3J62OZZU7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/07/2024 16:20, Richard Fitzgerald wrote:
> Use strnlen() instead of strlen() on the algorithm and coefficient name
> string arrays in V1 wmfw files.
> 
> In V1 wmfw files the name is a NUL-terminated string in a fixed-size
> array. cs_dsp should protect against overrunning the array if the NUL
> terminator is missing.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
> ---
>   drivers/firmware/cirrus/cs_dsp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 16484ab9b09d..8a347b938406 100644
> --- a/drivers/firmware/cirrus/cs_dsp.c
> +++ b/drivers/firmware/cirrus/cs_dsp.c
> @@ -1183,4 +1183,4 @@ static int cs_dsp_coeff_parse_alg(struct cs_dsp *dsp,
>   		blk->id = le32_to_cpu(raw->id);
>   		blk->name = raw->name;
> -		blk->name_len = strlen(raw->name);
> +		blk->name_len = strnlen(raw->name, ARRAY_SIZE(raw->name));
>   		blk->ncoeff = le32_to_cpu(raw->ncoeff);
> @@ -1260,4 +1260,4 @@ static int cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp,
>   		blk->name = raw->name;
> -		blk->name_len = strlen(raw->name);
> +		blk->name_len = strnlen(raw->name, ARRAY_SIZE(raw->name));
>   		blk->ctl_type = le16_to_cpu(raw->ctl_type);
>   		blk->flags = le16_to_cpu(raw->flags);

This is the same patch as V1 but with a couple of conflicting
lines dropped from the context. You can ignore this V2 if you've got
V1 to apply cleanly.

Sorry for the confusion.
