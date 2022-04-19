Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947D506723
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 10:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC74216DE;
	Tue, 19 Apr 2022 10:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC74216DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650358129;
	bh=1tXO7yuJYsP6FS2Dr89x6WVNDZZGD55Dvox3rD0g/UE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tn5MMuasKyuXZ+hEp+9o88q7rvmIdffn+fNhueaBOpMFyQiFliAUXAnVWoTy1+bRn
	 3EeD6Ac3tPQ79qX5bc6ti37ktAdPa8DoZJtTMMUGdEnv/eXrihehGT+OFEEJPONrdP
	 ydWurbBAAk5NGv31otKMbWkL/jQxJc9Bv82w5aJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26872F80121;
	Tue, 19 Apr 2022 10:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E27BF8025D; Tue, 19 Apr 2022 10:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 581B4F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 10:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 581B4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QMuKTTF4"
Received: by mail-wr1-x42d.google.com with SMTP id m14so21439162wrb.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3zfxgfhhkGrdZQPttYFIyDKGOpAjycnaX8YYYe3nvMs=;
 b=QMuKTTF4XAeRFnDlBJHu27U50iu6XBNoG05MeKFeLU7LsVVjUcV3ejaRRo+hmzy4HE
 8RGR84YLIk71QD5AQiyRP+u8oMQokSNGjOV2GeZzTXIeNHMYrl62RYagKfoW7/4BX+KF
 C9hVR3VkHU0ESauWkgoubLwV7f0N8V8CxKFQOSGTKkkgEfNubRFW8kfT801AsfBDEl8X
 broAjmmh0Unod0xRCJh7b138tc2H80Cnl9U7AdllLIwQddcei+hpFnZERUtovQtlRIg6
 YAxxTykq5evBHh9fJaw2Sx8sp2Rao0lkkWMBCyOUCVh/qrBePzCPZAAaTK7uhf4Xw479
 BJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3zfxgfhhkGrdZQPttYFIyDKGOpAjycnaX8YYYe3nvMs=;
 b=2Bay0E4qPe8/viwys/sP7+gK9o10PPAici1/KfBTt/CxDkh1C7SAVMyriMYRiIycx2
 BwdgADvhuwmEKdftHqHjA2dYC0zPbjld0Px+PrwtG54XUYnXvl/lL4E8ZxcQkfp6fiU7
 PqkGk1q3PRB60QKvTtX4W7IQVQvsXoMnYnqJk4wa3ZT+yrvphxvyu/0Lbof2VBljBb9h
 lzAKIyJ9Px5yDmoylSYrDch77T9aVxfEUWZcfGxD+LX5R1cWui8/oDZXRsD5Q64Lfae8
 //HxvJoJOTFVOVGqdv527QCr0G/GEdbTXhg09pv4tSZlkbn2jJ5CFNKBoI1K0/YeORJy
 tnLg==
X-Gm-Message-State: AOAM5329zWhI4VmFtEYgnJ1OzRfzOlOgwNZlvt4px1ZFixrkRlSeOKfI
 mITdrOYUj2fb0hwAAgi/frnUMUOFDkqt0A==
X-Google-Smtp-Source: ABdhPJyGYvopwBZKM+g01h8Kn+VxX+cUxfwLusUKA6MiYSG6VWvCuPXWxSd3hPj8JfuBmWdc2LElng==
X-Received: by 2002:adf:dd8a:0:b0:207:9e5f:fd0a with SMTP id
 x10-20020adfdd8a000000b002079e5ffd0amr10553750wrl.94.1650358064065; 
 Tue, 19 Apr 2022 01:47:44 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm14168011wrq.81.2022.04.19.01.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 01:47:43 -0700 (PDT)
Message-ID: <e48a9b3a-4a9f-3fa7-2bd2-edac34328c37@linaro.org>
Date: Tue, 19 Apr 2022 09:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] slimbus: qcom: Remove unnecessary print function
 dev_err()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, agross@kernel.org
References: <20220414014430.19051-1-yang.lee@linux.alibaba.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220414014430.19051-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org
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



On 14/04/2022 02:44, Yang Li wrote:
> The print function dev_err() is redundant because
> platform_get_irq_byname() already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./drivers/slimbus/qcom-ctrl.c:514:2-9: line 514 is redundant because
> platform_get_irq() already prints an error
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


Applied thanks,

--srini
> ---
>   drivers/slimbus/qcom-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index ec58091fc948..c0c4f895d76e 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -510,10 +510,8 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	}
>   
>   	ctrl->irq = platform_get_irq(pdev, 0);
> -	if (ctrl->irq < 0) {
> -		dev_err(&pdev->dev, "no slimbus IRQ\n");
> +	if (ctrl->irq < 0)
>   		return ctrl->irq;
> -	}
>   
>   	sctrl = &ctrl->ctrl;
>   	sctrl->dev = &pdev->dev;
