Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528D824113
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED806E99;
	Thu,  4 Jan 2024 12:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED806E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704369429;
	bh=oEcqZE2yPd8FnHGLM1ipw3hGySg+5s7Ni0IpK3d6rPI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yj4MmP4gwVW1XliqbEDzA2ZLO39144ysseZ+SUVxcdlOlxQcrnJJDQtHWmzblPWYs
	 XNLzGTbqHQPwPbnwImirswhPVu0ZvcDEVtiLjNLor8eQ9w99UAIOfIsbCgmGzwrEI/
	 70IrglyZXM+em6K64NGwRa4N40HK8rUo6LP/7xp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC733F8057C; Thu,  4 Jan 2024 12:56:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C825F8057F;
	Thu,  4 Jan 2024 12:56:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B4B5F804B0; Thu,  4 Jan 2024 12:56:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 08D3FF80238
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 12:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08D3FF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cU2qkYa7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404BTAnq000975;
	Thu, 4 Jan 2024 05:56:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=/NqDoBBjx0wFqGQbw4rIaY5FhG1vCYbHJvQ4OeObe4A=; b=
	cU2qkYa76fAOJ1m4xYPyhycw5KoYgm7aazN87eC+FwvdG+Q0draagWiPGf8zpApk
	jI5cvMcL6yWMmgH/L0Kt59hCOy1dCIreFpjkiL008O5H4PNCWuZvtmgyEoIfsyMP
	k9lyDqyVyo8XzzuUDWMjXsK848jfmtUvLMplNDvyqPDvfRQl9Doe5CQs4IdZm4Dt
	Gquxe6wgTIZbsFr5Y89GYcX4KhXxcqvHkchOg2chf0bmlugX6Vam/Z+AddcaG5Gt
	DH6JBC8P37GR7V+H8D5JOE65xw848hnRJWHHpDhlrKJvQwJNYUu0XSLN3ppV9uKO
	aE7tm0X1+ovNgQQX2homXQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vaggqek4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 05:56:13 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 4 Jan
 2024 11:56:11 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 4 Jan 2024 11:56:11 +0000
Received: from [198.61.65.138] (EDIN4L06LR3.ad.cirrus.com [198.61.65.138])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 96C8B46C;
	Thu,  4 Jan 2024 11:56:11 +0000 (UTC)
Message-ID: <d6ffe1ae-6561-43a2-a1bc-55c44a6731bd@opensource.cirrus.com>
Date: Thu, 4 Jan 2024 11:56:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] irqchip/madera: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        "Thomas Gleixner" <tglx@linutronix.de>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@pengutronix.de>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
 <64c2f79760c53f29651e7126418c407ff699317d.1703284359.git.u.kleine-koenig@pengutronix.de>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: 
 <64c2f79760c53f29651e7126418c407ff699317d.1703284359.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 77nqBSXgZ0baqHtBCgqqenVw1bjzlpLd
X-Proofpoint-ORIG-GUID: 77nqBSXgZ0baqHtBCgqqenVw1bjzlpLd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: V4IKLEMTFTNTUQYD727K33DRPFRYGFZT
X-Message-ID-Hash: V4IKLEMTFTNTUQYD727K33DRPFRYGFZT
X-MailFrom: prvs=8733a9cd6e=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4IKLEMTFTNTUQYD727K33DRPFRYGFZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/12/23 22:50, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/irqchip/irq-madera.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
> index 3eb1f8cdf674..b424c0a327f7 100644
> --- a/drivers/irqchip/irq-madera.c
> +++ b/drivers/irqchip/irq-madera.c
> @@ -222,7 +222,7 @@ static int madera_irq_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int madera_irq_remove(struct platform_device *pdev)
> +static void madera_irq_remove(struct platform_device *pdev)
>   {
>   	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
>   
> @@ -232,13 +232,11 @@ static int madera_irq_remove(struct platform_device *pdev)
>   	 */
>   	madera->irq_dev = NULL;
>   	regmap_del_irq_chip(madera->irq, madera->irq_data);
> -
> -	return 0;
>   }
>   
>   static struct platform_driver madera_irq_driver = {
>   	.probe	= &madera_irq_probe,
> -	.remove = &madera_irq_remove,
> +	.remove_new = madera_irq_remove,
>   	.driver = {
>   		.name	= "madera-irq",
>   		.pm	= &madera_irq_pm_ops,

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
