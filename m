Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE2649C14
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 11:27:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 451BF18F5;
	Mon, 12 Dec 2022 11:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 451BF18F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670840836;
	bh=5Q6DUYz1klHTu7kxYRYH4934iHi1cMRZbgXJtwSpues=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NuCwHVbEyTzVZUCXvDSSDMSuIWZJqQXJX7pFr/fzpoBNLOZulFjxvtDn94AXjiFE2
	 MPMN/eg7V+AwTxuBcyApiXG7g0gCRsCWfeibaHVa677JOknfD6+4eePAtGXGQTvfQ6
	 ZUPRMQknYqB8IlYcSda+hEioujwXJ6YETkXPN4gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E2CF800F8;
	Mon, 12 Dec 2022 11:26:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FBCF804B4; Mon, 12 Dec 2022 11:26:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3641FF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 11:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3641FF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yW2MyZal
Received: by mail-wr1-x435.google.com with SMTP id u12so11542008wrr.11
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 02:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l879BTu/5FIA2goMiwpSyg0RiCbHZeU5mD7R/xhw8bw=;
 b=yW2MyZalUc/SpObXMNTqeAocoV8ESWARha0NEbcxQn0kvvy7O4NPpGf3YBJ9qad1s0
 VDK9Deol0Go5qBJtuxblNnbrAINeo9Bx/bAuTxZ5HJFBuFa5iPfYzvNInlDVQHN4r7h3
 S4yec+JLVfWEPOd6Lda4XJPvVZdSS2g2FXmY98HxEl7+G2LA7d0/TP+yo1/Gw9/gFse8
 8vQBwhzD8/BYh4v+V1KHJ0TvdQMDp3NTYXSMAtnTFqJh7nzV74IN/xupxMaq7vVrDLHX
 7iVEK19lEI1iT6uCNAF1aV01ddWtDZdomACZ7gRmtt6/f4RjrCxsPWSSOIMcdycDaoUt
 NXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l879BTu/5FIA2goMiwpSyg0RiCbHZeU5mD7R/xhw8bw=;
 b=VkbLe1dP41vJeE5nQ/YPcu4iY2TVqjA+pOi0Rts20ZCgWgW1XpX3YUoBPUfc8mBSa2
 fDyl6Y9qjw9gTDDumEtOQTEURMSAv+OOEDxGPlzgOscZWUoclAjm1pBNhb32jYgI6TKP
 N8qcMGUPgFSZOf/wsV0uPryfl5ukSFSbg4d47miwzaY2rX0uBMAA/QnCHolM7o4PURXX
 U9VS5JC3aEOaSA4SmcA5vfzMhYC/mw/uFjigYR+doCEsUNpwjP1Xs9SzQxiJIWxQSZKK
 sZz0HSisrt9/8s4d6YLXFokpuxAJFV9cX9j+ElBfmDBg9uqhqSECq4FOSK6GBu5LYMhx
 d98g==
X-Gm-Message-State: ANoB5pmYMIM9ntViJX+/E6pzZ3DXVcaFw0Bt/RjowaPOtGkOBuh/krRZ
 xyOMFoKeH82iIAoWg+0Sg+EalQ==
X-Google-Smtp-Source: AA0mqf5KrtnfirbxeovkqOmIygQa6AoENqfsXGTkQpDsvRN/QXqRL9nx2Ve64S6iGXcP+QimZftwZw==
X-Received: by 2002:a5d:5d0b:0:b0:23a:5a31:29f5 with SMTP id
 ch11-20020a5d5d0b000000b0023a5a3129f5mr11257752wrb.23.1670840773405; 
 Mon, 12 Dec 2022 02:26:13 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 y7-20020a5d6147000000b00226dba960b4sm8493877wrt.3.2022.12.12.02.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:26:12 -0800 (PST)
Message-ID: <0b5ca79c-5d8c-5720-cd14-cfa4697b628d@linaro.org>
Date: Mon, 12 Dec 2022 10:26:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] slimbus: qcom-ngd: Add check for platform_driver_register
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, agross@kernel.org,
 konrad.dybcio@somainline.org
References: <20221212094950.23050-1-jiasheng@iscas.ac.cn>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221212094950.23050-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/12/2022 09:49, Jiasheng Jiang wrote:
> Add the check for the return value of platform_driver_register
> in order to catch the exception.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Applied thanks,

--srini
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 76c5e446d243..c16fc9e6d1c6 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1590,7 +1590,10 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   		goto err_pdr_lookup;
>   	}
>   
> -	platform_driver_register(&qcom_slim_ngd_driver);
> +	ret = platform_driver_register(&qcom_slim_ngd_driver);
> +	if (ret < 0)
> +		goto err_pdr_lookup; > +
>   	return of_qcom_slim_ngd_register(dev, ctrl);
>   
>   err_pdr_alloc:
