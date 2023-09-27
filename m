Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC47B0499
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 14:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5335D8;
	Wed, 27 Sep 2023 14:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5335D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695818858;
	bh=TFtP+slZPMjWB233kpUUcEHI9Dte3zQ9j4tA/PWkX4Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apU6xLOqwE588AK8EehpyiH3FHnqV2i71JvZgPbwskl049ON82BH354GvhQbzKVUh
	 5ztJxiZcuUtTBPvxai+8IzsVrRwSWlujXPJ+JQfKIXTUsMQI3lnPQP8wfBwiVZ6DWT
	 8Z0XV2SXintXyBut9sXnYShHs3G29n8m3nIhZw90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 984F3F8016A; Wed, 27 Sep 2023 14:46:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F14F80166;
	Wed, 27 Sep 2023 14:46:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E38EF8016A; Wed, 27 Sep 2023 14:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 471D4F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 14:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471D4F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nh1FD70O
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38R79Y3L002836;
	Wed, 27 Sep 2023 07:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=nQ779awHgknzMWhlFfvoIYl03BuqDk3HaZgk2JIod4M=; b=
	nh1FD70OOPoFtAMxaKJobUwsN3B+tGsPLQyZDxv4zw9pkZHEVv6B0dTuvPZW7w+C
	kgMGyfOArbpHc3Qq5EHUZtStn+6/TEp6Mjz2OaGWb6UiMwSxcq94T1gCWcUGV2oC
	vGRzn7tcXYJJopQF6g2+baXpIxQRsepJ5Td16lo55Y/XFN2HSMJNG7IcFnMQ6EpQ
	yqRlUuTg2/tg5K61ofoUFpCeJYrYmPmOIWemEuTbagpCVBgdUcY9mGoX3cUbUdFl
	yCypQWZEQQYLnFGC/OmtKnB4dZxhscbSsaFPoWY6bEQhJ9nUXYj4CzcB9kattglu
	UoQJWthsxChNgu6JkcYUCA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t9wdxnv7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 07:46:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 27 Sep
 2023 13:46:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 27 Sep 2023 13:46:12 +0100
Received: from [198.61.65.112] (EDIN4L06LR3.ad.cirrus.com [198.61.65.112])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE7E911AB;
	Wed, 27 Sep 2023 12:46:11 +0000 (UTC)
Message-ID: <c8acbf4a-4c00-8bb0-e54c-9eebbd436ff4@opensource.cirrus.com>
Date: Wed, 27 Sep 2023 13:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ALSA: hda: cirrus_scodec: fix an error code
To: Dan Carpenter <dan.carpenter@linaro.org>,
        James Schulman
	<james.schulman@cirrus.com>
CC: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <kernel-janitors@vger.kernel.org>
References: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 00_LNlPyZLhzEYOCDgQQu_hWSMIgmWqM
X-Proofpoint-GUID: 00_LNlPyZLhzEYOCDgQQu_hWSMIgmWqM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3XXSJOT5SHCU4ZUNEX6IVAPXUU2YJ6YW
X-Message-ID-Hash: 3XXSJOT5SHCU4ZUNEX6IVAPXUU2YJ6YW
X-MailFrom: prvs=4634a7858c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XXSJOT5SHCU4ZUNEX6IVAPXUU2YJ6YW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/9/23 13:44, Dan Carpenter wrote:
> The "ret" variable is zero but we should return -EINVAL.
> 
> Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   sound/pci/hda/cirrus_scodec_test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
> index 5eb590cd4fe2..8ae373676bd1 100644
> --- a/sound/pci/hda/cirrus_scodec_test.c
> +++ b/sound/pci/hda/cirrus_scodec_test.c
> @@ -137,8 +137,8 @@ static int cirrus_scodec_test_create_gpio(struct kunit *test)
>   	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
>   	if (!priv->gpio_priv) {
>   		platform_device_put(priv->gpio_pdev);
> -		KUNIT_FAIL(test, "Failed to get gpio private data: %d\n", ret);
> -		return ret;
> +		KUNIT_FAIL(test, "Failed to get gpio private data\n");
> +		return -EINVAL;
>   	}
>   
>   	return 0;

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks.
