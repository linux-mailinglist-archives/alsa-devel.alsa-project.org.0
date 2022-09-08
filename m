Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB155B14E6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 08:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5ABD82A;
	Thu,  8 Sep 2022 08:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5ABD82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662619511;
	bh=kYfgZBMl+vQcLb4cjXGirmq2GL/ql+8wEdbYed8BjvU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7Jn29w1xEiKfxRTTRLdle/9xvM37BUPC+38kJpIf5oEVW0Vc89ge35cJaPgLa4HQ
	 WQciFrNyqDmbF/iz80ER/Kw92ZuiUxs4z6+7BHuntWPEDtoqxtunzzsQzIxIdNz8um
	 EcRkXMrJv6In1A5DFE2CtTpjif8i4jQAbq3LmYxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E67FF8023B;
	Thu,  8 Sep 2022 08:44:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC802F8016D; Thu,  8 Sep 2022 08:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C04CF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 08:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C04CF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jeKC50xi"
Received: by mail-wr1-x42a.google.com with SMTP id b5so24342762wrr.5
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=b1chxNIA9RagmiiPQ3s0ZgKMM+t+BegCoFA6aXi2sCQ=;
 b=jeKC50xikkVr+XUBcWVw7YZKtH76yHzg6jBpUlm2TN2zSwcymPnD85WGsIDmQw/Bsf
 RBeosEnMZJr4LV/hmfDDMEzkAJwkg1UgmAnzNZBSGKDhXaj+KExW+G0BxqAWNWzupZZb
 /imLfb3UJzBFk4qm5eGD+CcvrXqPRwa7FubEsU6ATiS12x5ryfeuG1MxmJb6RmlY9Fpt
 U8JmDuCFaNRzxqSMxqtAVgZoVSgWs147QP0C1uvlR+oua8f63fB3CcM6pqIEYo7dT8kI
 0TIQOdE3XDeSb+97TyIvDtlqRAUrDsKIKWhPy5UjYW1EJ5l4Q7SibZdFCjz+iAR82bDN
 FfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=b1chxNIA9RagmiiPQ3s0ZgKMM+t+BegCoFA6aXi2sCQ=;
 b=uYd1FnFsLqFfX0Czg9Wt9rPZ+IAp3QgSVJDo2W6DzuRpWYuifj/+Izy5PoVOhfKYWB
 ZMuaVrgblrqpvqVzRg4qG8oNmeoF4l6MmHM6IbLHyehWsOvCOliwlW+YhEDUWj7EB587
 CryEUr56QHJlilbx0WjDyE+IASIN7UJSJr9MOYO4nDKfM1c9WTzUGXDPtjj2FvOoduUz
 K35jmgBqg/OaQhSFHfyRYNf2tnwQa9oVMESX3kHi/x6k2WDBTMd1CWbfQ74J6HpOjQNb
 xsPzccHRGSOpki6Qe5JE7WXdSd4N37rKN6BT+TdBamqJWb4Vbie3iA3nLlbjeZRZChFv
 ZV6g==
X-Gm-Message-State: ACgBeo0W4vbzTxBCNVqmOcFTkJ3ci3iD2WOxr0bIvz1z0f+DrahQwB6W
 yXu2fGliobGzTIxWTULaIAKa8Q==
X-Google-Smtp-Source: AA6agR7Cp81jZgWnP23GY49qR/Z2d7YmFLYivEyV79iG3OySTF/7KPstfBIxLMAITgWkKhp/wsdIKg==
X-Received: by 2002:a5d:4d0a:0:b0:228:d9c0:5abe with SMTP id
 z10-20020a5d4d0a000000b00228d9c05abemr4213510wrt.693.1662619441727; 
 Wed, 07 Sep 2022 23:44:01 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 v16-20020a5d5910000000b00228a6ce17b4sm13414688wrd.37.2022.09.07.23.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 23:44:01 -0700 (PDT)
Message-ID: <1f0f036d-2e8c-d95b-5cfb-81a1b538642a@linaro.org>
Date: Thu, 8 Sep 2022 07:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: allow compile testing without
 QCOM_RPROC_COMMON
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220826093711.1059319-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220826093711.1059319-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 26/08/2022 10:37, Krzysztof Kozlowski wrote:
> The Qualcomm common remote-proc code (CONFIG_QCOM_RPROC_COMMON) has
> necessary stubs, so it is not needed for compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied thanks,

--srini
> ---
>   drivers/slimbus/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
> index 1235b7dc8496..2ed821f75816 100644
> --- a/drivers/slimbus/Kconfig
> +++ b/drivers/slimbus/Kconfig
> @@ -22,7 +22,8 @@ config SLIM_QCOM_CTRL
>   
>   config SLIM_QCOM_NGD_CTRL
>   	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
> -	depends on HAS_IOMEM && DMA_ENGINE && NET && QCOM_RPROC_COMMON
> +	depends on HAS_IOMEM && DMA_ENGINE && NET
> +	depends on QCOM_RPROC_COMMON || COMPILE_TEST
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	select QCOM_QMI_HELPERS
>   	select QCOM_PDR_HELPERS
