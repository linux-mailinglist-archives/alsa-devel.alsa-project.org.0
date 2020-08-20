Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF224AD80
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 05:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D9F167C;
	Thu, 20 Aug 2020 05:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D9F167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597895896;
	bh=0YIJMyAp06P3/P6/l2dRXBOLWPwUTla83iKmHZODahM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asc1JclCyqPu0YjOQF0saIYSgWwusyIA3EwZzDclYZmqWFnZr0uTf4u7ofigmWqSJ
	 QGKo6iGkRFiiwavPRm1mVLY+kzFqoJyWzO4+H5tXkQAVDk/EA+uecdEFpTqtXJsGc3
	 vhS5oU16Pez6U/fKGoJ+/2rVXBgavxo5EwW4Gmrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8075EF80228;
	Thu, 20 Aug 2020 05:56:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18715F80228; Thu, 20 Aug 2020 05:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DE7EF800D3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 05:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DE7EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="LM/PgMo8"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597895784; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0Ene2rVOMV4n1dEpM6kT25mhCOM8ZBLpeIVDWoHFH6U=;
 b=LM/PgMo86+YCBSIIFRl4Cyd/H8dZlYS5CuPIRrWbZNi15hmWj6P60pJuZSEq1acwM+29tHGD
 wvNLDuBu230Tx6Ug/4R83mr+JjukA26YXNYkAv3f70OQlOjRsIg7NgwTYfjfJOSTh50fFvLU
 C8au5J6IEuvlV1u6FPWfgzO3deg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f3df45af729de107885d818 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 03:56:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11D2FC433CB; Thu, 20 Aug 2020 03:56:10 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3759EC433CA;
 Thu, 20 Aug 2020 03:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3759EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH][next] ASoC: qcom: add missing out of memory check on
 drvdata->clks allocation
To: Colin King <colin.king@canonical.com>, Patrick Lai <plai@codeaurora.org>, 
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ajit Pandey <ajitp@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200819160103.164893-1-colin.king@canonical.com>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <82bb39d1-c3a9-a8d1-9d96-f4d6d6b0f042@codeaurora.org>
Date: Thu, 20 Aug 2020 09:25:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819160103.164893-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 8/19/2020 9:31 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently drvdata->clks is not being checked for an allocation failure,
> leading to potential null pointer dereferencing. Fix this by adding a
> check and returning -ENOMEM if an error occurred.
>
> Addresses-Coverity: ("Dereference null return value")
> Fixes: 1220f6a76e77 ("ASoC: qcom: Add common array to initialize soc based core clocks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks for the fix.

Reviewed-by: Rohit kumar <rohitkr@codeaurora.org>

>   sound/soc/qcom/lpass-apq8016.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index dd9e3dd014f6..5c8ae225cd5d 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -168,6 +168,8 @@ static int apq8016_lpass_init(struct platform_device *pdev)
>   
>   	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
>   				     sizeof(*drvdata->clks), GFP_KERNEL);
> +	if (!drvdata->clks)
> +		return -ENOMEM;
>   	drvdata->num_clks = variant->num_clks;
>   
>   	for (i = 0; i < drvdata->num_clks; i++)

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

