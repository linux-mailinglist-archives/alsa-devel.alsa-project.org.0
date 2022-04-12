Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E14FE44A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 17:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4330A18B8;
	Tue, 12 Apr 2022 17:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4330A18B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649775737;
	bh=makjnG246G3e9hn7HA9S30zgnNabrwvQfJwonsz13bc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhQL29wmPFN3tW72TZGH+v0Icr9VC9wtrRZeXqS6U8Yxfpe0mWeGKgnNNUBF3/EU1
	 wlij1OIu6gKfH7Dv0IpC5Dhi30ZM2Yuo63U+GxC1HuLB39YDBDZvRXQkHl3hZkinKN
	 prd5qj6BDt8OUDQ+Rw5NpXJAKOZ4GXhlMVjv80pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B740F80245;
	Tue, 12 Apr 2022 17:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 248A8F80154; Tue, 12 Apr 2022 17:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4330F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 17:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4330F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z2uChZtZ"
Received: by mail-wm1-x32a.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1792379wml.5
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7js1UH2M/H4XFdT/VYX4By9FNV4HBtwbQGAItNp0olE=;
 b=Z2uChZtZEb6EjRK0LBefZZB3/73zZjLJyUy8NLxgtpVI8sZBEOsYczIsK4qz/vKXJ7
 aIVS5OagmaNmz88LDX3kaGrIHNEFQIzGWFrXQGANXHDw4f+tpS1ZaMQODYuPNa4ydUvY
 9sJgUVa+aiKi1IJRtNeUo/6XnEXk8MbKk4UBCqlppIa6VCzsUJ1whX2kDlya7CKYbWSJ
 gLEMs2t5ZjVtEYCNI4r192x3vgHR4I0f+LaLnjL37RV6SsqR2ubRQfQvhRoeoD+gSqYA
 AjZflTeIBr/wXKUKDnQGKNo4p57EA/cb2Wo55A7mbjr7WDk2yhtAlX/gKPqiMd8Kdela
 RDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7js1UH2M/H4XFdT/VYX4By9FNV4HBtwbQGAItNp0olE=;
 b=xkS/bYVmBEy0AogxbKEBWowVugPoyY8YuoLy4Vod44zDr/8Kds0q8vnG+PEdWt3XBv
 5PB0cC9IYNtlJmg1adu78q5v337nuQx6lp7kTTVLtx/KVL2f92P0KuiqKySkmt6x2Ujv
 ajQp0QyjG1HdGKYZDlAIe3Ndjf5OAY+U/O4bQ7jeRFOBhUGcwIgsR3emwiyE7H0snH4M
 ixSQsYxv5WxLqksY9AkPNANhXr5o7ReKNwEo+cWTmOkFCCrxOY33qSyMaf+S96901QqL
 tcF5zPfpWBFFjkO/Ve+aNeS3ATx/u4ACpBaCNp/JV+NXTVhr1ralZYvv04cvnkIq4gKJ
 r52A==
X-Gm-Message-State: AOAM533hTDSp/av1DPD61EQ+ZWVINuVNeOP6I0t8BsxgmeMR0TdSAM6f
 R809MYwj7dFv/F7XHe6OZpKdtQ==
X-Google-Smtp-Source: ABdhPJzTSHSfyrwau3xW+AehkcTP+X4MnzJII/oAmUKEdfBGnGP6TA25S/PTwJfKeSYbm/uhBORLsw==
X-Received: by 2002:a1c:44c5:0:b0:38e:abd1:d894 with SMTP id
 r188-20020a1c44c5000000b0038eabd1d894mr4561539wma.40.1649775667018; 
 Tue, 12 Apr 2022 08:01:07 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm3026900wms.30.2022.04.12.08.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 08:01:06 -0700 (PDT)
Message-ID: <149e3140-1b9d-b864-c14c-4d2cb098ec9a@linaro.org>
Date: Tue, 12 Apr 2022 16:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] slimbus: qcom: fix error check return value of
 platform_get_irq()
Content-Language: en-US
To: cgel.zte@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org
References: <20220412090259.2533316-1-lv.ruyi@zte.com.cn>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220412090259.2533316-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 sdharia@codeaurora.org
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



On 12/04/2022 10:02, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> platform_get_irq() return negative value on failure, so null check of
> ctrl->irq is incorrect. Fix it by comparing whether it is less than zero.
> 
> Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>


There was already a patch posted to fix this

 
https://git.kernel.org/pub/scm/linux/kernel/git/srini/slimbus.git/commit/?h=for-next&id=54bf672111eef18819fa6e562f68b2d6c449b05d

--srini
> ---
>   drivers/slimbus/qcom-ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index f04b961b96cd..b2f01e155d77 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -510,7 +510,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	}
>   
>   	ctrl->irq = platform_get_irq(pdev, 0);
> -	if (!ctrl->irq) {
> +	if (ctrl->irq < 0) {
>   		dev_err(&pdev->dev, "no slimbus IRQ\n");
>   		return -ENODEV;
>   	}
