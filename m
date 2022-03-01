Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D674CA019
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:57:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A05201A;
	Wed,  2 Mar 2022 09:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A05201A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211466;
	bh=P7E7V2j6XF48nR1c44ChhcUP9k+6FRTrXulntRgFm9M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W06yDstc41aErrFkB6P1PwvIy2ACgF7Cy2XSPu7uMlu6QbpApwfk6INJy68LGg5LW
	 shsW0krT+tc0INR/SagU9r3M0Ha+OHO2miMRb41LPhQkhYx9ewjAeJoM7Dhyt2zFdd
	 CO+SfyYqc3JZGKg9QYyGWbrnNMYS4kl2ATK+DTuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F35F807FC;
	Wed,  2 Mar 2022 09:34:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B15BF80227; Tue,  1 Mar 2022 18:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA362F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 18:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA362F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ifR445Pt"
Received: by mail-wm1-x331.google.com with SMTP id c192so7919140wma.4
 for <alsa-devel@alsa-project.org>; Tue, 01 Mar 2022 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y86hBfPWj9E4aTo+XMBrAu6Y5p4SQMawkPD4Q/SuKPY=;
 b=ifR445Ptk0kZIwyK/iR5LauUeexT4h+Xm5fWIS9UfHsJTwIXI+TBUH0b1B1nklV58Q
 e3posB9tDmWAuXNqOByYa8OEIeuEgFpyIkDoWKkxe1RAiCnFE6ZEzQVCpMvS62fGzNFV
 nWcw5JV2lmoD9jxvmDMFuNVsgy/NwYWUQ6a0I1zB2e5jSr3/JFEIp9xW/NRIDhtT+/y6
 uvAB7/5ZICC2qcmaHb2EAlpVYU+L8My5syB7aELi6iajmzjea09g2vNncJq3GY6hv/nP
 g2d17hu4ZYUIRYCXpyuRUhAY/Kr9r3k7MyrtDEVfLOZZZFWPJ239r6w7DpTzLNolCHHw
 A62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y86hBfPWj9E4aTo+XMBrAu6Y5p4SQMawkPD4Q/SuKPY=;
 b=IbUadRMwaGgwt+6aAepMZOBiHMUhzll1AY5Ke2puqX4ja8L9mF2HLg6m4T4eBr0PjO
 uONPbNzfPQEvoSMiITi9NxpajcFKxqQ54bevTELpvj6SMw8/Onl6UGZp0fNgHfnM8IA8
 RwjvublMb0xVDQWeR5WyEzUR1ArORHPj1iV0uZ+rqOG6zms9kK3y3BCrbBj2YNC5yq46
 5YrNmyEieveoZ73BtWgt04a5S9bfFBRerFcuPmEPqxBwljcnK8Z/vNKHT5h6+VroaZXr
 fDiyJ2xfBm3mpf2FZL/kf/wHEbw77hVhcvTAbNZ2xfGGzV5So+1drdN9YsVVpksIcrH/
 iTTg==
X-Gm-Message-State: AOAM5328sf2hOhC22cT7GlWVbNkzYLG+8Lpw4ZNZq6T7NaCJHjqJTYXP
 8ivDKEp/yJEp0T9Lt4Ng+lWLTA==
X-Google-Smtp-Source: ABdhPJyP4zzjkBPeDrhk1IU4HHA4Z4mVRSeyWw7DiZ4BmjKx+FbF6/CkwhxttMvqrC0XO+mqNoqKvQ==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr18173339wmq.139.1646155705687; 
 Tue, 01 Mar 2022 09:28:25 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 c4-20020adfed84000000b001e5b8d5b8dasm20457807wro.36.2022.03.01.09.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 09:28:24 -0800 (PST)
Message-ID: <5f481315-021c-39d6-8c6c-91918851ab13@linaro.org>
Date: Tue, 1 Mar 2022 17:28:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 10/11] slimbus: qcom-ngd: Fix kfree() of static memory
 on setting driver_override
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
 <20220227135329.145862-4-krzysztof.kozlowski@canonical.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220227135329.145862-4-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:33 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org
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



On 27/02/2022 13:53, Krzysztof Kozlowski wrote:
> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 7040293c2ee8..e5d9fdb81eb0 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1434,6 +1434,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>   	const struct of_device_id *match;
>   	struct device_node *node;
>   	u32 id;
> +	int ret;
>   
>   	match = of_match_node(qcom_slim_ngd_dt_match, parent->of_node);
>   	data = match->data;
> @@ -1455,7 +1456,17 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>   		}
>   		ngd->id = id;
>   		ngd->pdev->dev.parent = parent;
> -		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
> +
> +		ret = driver_set_override(&ngd->pdev->dev,
> +					  &ngd->pdev->driver_override,
> +					  QCOM_SLIM_NGD_DRV_NAME,
> +					  strlen(QCOM_SLIM_NGD_DRV_NAME));
> +		if (ret) {
> +			platform_device_put(ngd->pdev);
> +			kfree(ngd);
> +			of_node_put(node);
> +			return ret;
> +		}
>   		ngd->pdev->dev.of_node = node;
>   		ctrl->ngd = ngd;
>   
