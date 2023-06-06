Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA8724583
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C5184B;
	Tue,  6 Jun 2023 16:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C5184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686061005;
	bh=gMjHyvne6Agp54WGv+UFFXIKF10PxNqoZ0FJ4APZ9UI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TcpE4ckvtu8xI4G6efpzprhynL65gnfJoqumizAhmxPQZGbZC8tcIOTG04XvWcoG3
	 auy/I8t0GPpYbTBY7N3Wv1icuQcLZ36AB8YjrM60PlPpybQPt9mkYkA1a7AQt9M4FW
	 gEqtZViNwT1L/1NC0yydfIjO09TxLJubGt7tFczw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0605F80568; Tue,  6 Jun 2023 16:15:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFAFF80568;
	Tue,  6 Jun 2023 16:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951F3F80199; Tue,  6 Jun 2023 15:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0A62F800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A62F800C8
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 25F6D80B6;
	Tue,  6 Jun 2023 21:03:29 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 21:03:29 +0800
Received: from [192.168.125.124] (183.27.98.75) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 21:03:28 +0800
Message-ID: <c459ff05-7e7b-ffb9-d0ba-2daaeffcc0a6@starfivetech.com>
Date: Tue, 6 Jun 2023 21:03:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [bug report] ASoC: starfive: Add JH7110 TDM driver
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <alsa-devel@alsa-project.org>
References: <ZH7t6Nc+NTcGpq/3@moroto>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZH7t6Nc+NTcGpq/3@moroto>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.75]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FMVGJ2KZJDSNXLTNCLHZSNIRHT3G64QT
X-Message-ID-Hash: FMVGJ2KZJDSNXLTNCLHZSNIRHT3G64QT
X-Mailman-Approved-At: Tue, 06 Jun 2023 14:14:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMVGJ2KZJDSNXLTNCLHZSNIRHT3G64QT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/6 16:27, Dan Carpenter wrote:
> Hello Walker Chen,
> 
> The patch fd4762b6b5cf: "ASoC: starfive: Add JH7110 TDM driver" from
> May 26, 2023, leads to the following Smatch static checker warning:
> 
> 	sound/soc/starfive/jh7110_tdm.c:584 jh7110_tdm_clk_reset_get()
> 	warn: passing zero to 'PTR_ERR'
> 
> sound/soc/starfive/jh7110_tdm.c
>     564 static int jh7110_tdm_clk_reset_get(struct platform_device *pdev,
>     565                                     struct jh7110_tdm_dev *tdm)
>     566 {
>     567         int ret;
>     568 
>     569         tdm->clks[0].id = "mclk_inner";
>     570         tdm->clks[1].id = "tdm_ahb";
>     571         tdm->clks[2].id = "tdm_apb";
>     572         tdm->clks[3].id = "tdm_internal";
>     573         tdm->clks[4].id = "tdm_ext";
>     574         tdm->clks[5].id = "tdm";
>     575 
>     576         ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(tdm->clks), tdm->clks);
>     577         if (ret) {
>     578                 dev_err(&pdev->dev, "Failed to get tdm clocks\n");
>     579                 return ret;
>     580         }
>     581 
>     582         tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> 
> The devm_reset_control_array_get() function returns NULL if it's
> an optional request.  But this is not optional.
> 
>     583         if (IS_ERR_OR_NULL(tdm->resets)) {
> 
> So that means this should be an if (IS_ERR()) check.
> 
> --> 584                 ret = PTR_ERR(tdm->resets);
>     585                 dev_err(&pdev->dev, "Failed to get tdm resets");
> 
> Or if optional was intended then NULL should not be treated as an error
> case, but as a special kind of success case (no error message).  See
> my blog for a long form of this information:
> 
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
> 

Hi Dan,

Thanks for your testing.
Yes, should use IS_ERR() to check. I am preparing to submit a patch to fix this issue.

Best regards,
Walker
