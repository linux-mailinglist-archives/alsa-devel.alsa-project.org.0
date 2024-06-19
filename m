Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C590E73E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 11:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052C6DE5;
	Wed, 19 Jun 2024 11:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052C6DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718790348;
	bh=8qnvawOIxf4Du3tOQGAjAvXzq4tbas8FMaYY0qf1JOc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgkjmzXU6ZRPEtrjGbylkQMCBH9H34KbKza+tUKQMnK0jd7FjqOfr04PKRIHC6yB0
	 nuM6Pt0MBIcZPK9kcOeX7Ub5d9BRA/92f3gY6WoXvwB4CcKJSVA2AyjKyrCQTNzdFz
	 1fI7IDnseZbXP53R95FJmmDAAQlAxs8bVg9VYtVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BFCF805AC; Wed, 19 Jun 2024 11:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 960B2F805AF;
	Wed, 19 Jun 2024 11:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F28CF8023A; Wed, 19 Jun 2024 11:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC940F800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 11:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC940F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gBmti9bE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45J6sYf7029887;
	Wed, 19 Jun 2024 04:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vR82SfQk2QLaKL6yomuL0hZ8ERucSrJ1SZnbJDBbC78=; b=
	gBmti9bEM4S0UfCvRilWxIiDADWKg1qVakOTdHQW4/Na4yNhTiKgasm8x0Ul0ocs
	tnL+CJ7jw2NeeugYH4xwTnEKSHaJKbjN3m9BmpL1PmPnVmba8TQWwM7eTFUYYYWp
	geTx5/UI99ZwWa3J0EKBqe8eCgZdqF3hqXfuiovXXqhfSlJC0ZEhVu/xWWbk13gi
	5XbATysX4dE4LujTvMKa6i7SfkANImkXn33ZEQLU2Pi2k4EG/fvRPA+Onheozh/t
	x6b3909LIpGqEXqr+mLsX1cCNWDVUd8clrFrwsYmaNRbjCqD/EfuW/+jAt60QzaC
	iKNDveOhZ8HBPEC4+zWFRQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yuj8m0f21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 04:44:49 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 10:44:47 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 19 Jun 2024 10:44:47 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 63807820248;
	Wed, 19 Jun 2024 09:44:47 +0000 (UTC)
Message-ID: <fe9dd613-8909-4c7d-a7d7-9094b75fe8fb@opensource.cirrus.com>
Date: Wed, 19 Jun 2024 10:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
To: Simon Trimmer <simont@opensource.cirrus.com>, <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240617135338.82006-1-simont@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MFDlYEKTMAYpEuUNyXh1jdRo7OAMWHpm
X-Proofpoint-ORIG-GUID: MFDlYEKTMAYpEuUNyXh1jdRo7OAMWHpm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QUEA3QGHQGST4MZLQTCFMPPLHNMU2GXW
X-Message-ID-Hash: QUEA3QGHQGST4MZLQTCFMPPLHNMU2GXW
X-MailFrom: prvs=3900c876c3=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUEA3QGHQGST4MZLQTCFMPPLHNMU2GXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/06/2024 14:53, Simon Trimmer wrote:
> IRQ lookup functions such as those in ACPI can return error values when
> an IRQ is not defined. The i2c core driver converts the error codes to a
> value of 0 and the SPI bus driver passes them unaltered to client device
> drivers.
> 
> The cs35l56 driver should only accept positive non-zero values as IRQ
> numbers.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Fixes: 8a731fd37f8b ("ASoC: cs35l56: Move utility functions to shared file")
> ---
>   sound/soc/codecs/cs35l56-shared.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index 27869e14e9c8..880228f89baf 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -397,7 +397,7 @@ int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
>   {
>   	int ret;
>   
> -	if (!irq)
> +	if (irq < 1)
>   		return 0;
>   
>   	ret = devm_request_threaded_irq(cs35l56_base->dev, irq, NULL, cs35l56_irq,

Mark, I don't understand what your objection is.
What is it you want us to do to get this bugfix accepted?
