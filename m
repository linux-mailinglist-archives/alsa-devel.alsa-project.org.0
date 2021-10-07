Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1074254E4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A43615E0;
	Thu,  7 Oct 2021 15:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A43615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633615111;
	bh=eomZvTUJ8GaozJDXvWx0AL7Kf1/QV3su5vcsts3PKNQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HK1Tw9nh9Tgd37Xb0VW1kj681dBRFwi6H+o1YT2l2dQiB2IPx3BuWodrAw7Hy8G2C
	 RcM1IU9sPZI6s/nCiXYk9prx7U0UM5mphLBn+zXJ03YgLJl0qgM0BgdAKnWxPemhvc
	 WorwnX+kI174M5ijkn0p7AK9G9OjEJhw0o//6WHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 071D9F8028B;
	Thu,  7 Oct 2021 15:57:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B36F8027D; Thu,  7 Oct 2021 15:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322B1F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322B1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HWsW/9Oc"
Received: by mail-wr1-x42b.google.com with SMTP id m22so19505908wrb.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kQq0xCGqotFLmmvs4jPCrD6mVz7A9gMb8nAtNV0dxeM=;
 b=HWsW/9OcJDxgqkkiBU5+qjxZoCSIB1shHRB+Sb9HVtqJ4XUIq8IHStPoon98fq5AlA
 tQL18prYExD5HuJ/q51xDAIxa73iSTqP+caEJgVhotTekYDxw3GzzTrUzl3xD1kbIbte
 GSGrDPY7amQU1ZtLPxS+v7aoyzRwH1/x6XGBgrCsOa3k7ygT5YXUoMCJwPORlfJD/VBe
 RPd70qF/boWR6xWNPKzUrZgvA8SpqW6YnEjut8ZWGpwDtiNsIFb6eyEGdv9/BkgESm1W
 X1+I/n7PQewysIaWhfp3QoAzDTOdUG/O0FGplrFvZS0GnO5/VSvVehqEaWvq5eBLjzj9
 o6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQq0xCGqotFLmmvs4jPCrD6mVz7A9gMb8nAtNV0dxeM=;
 b=dPeADSCDpz092JsR6rYvQtJvmqMzc1Ao7BLt0tWNvsMAdMoG+EPYKWU+KJYoK2E6os
 p3ytWnaF3ARj8WRRf75k7hLK9AL29TdwipToJ/NnfX3y+DnDOYHUth4uCdBPDm7e+jvI
 u3cCTE2hW2ngfozIeKLDPYpj5l5hw6g5P2tCvEBruPiS0aGKigUEw5YeYMr1ehulUBSk
 4hjfq8eFO4zF1eOgGz4EUDARtclDYKDEMe2dRTE7NP6P+ddry9wjUMMgqLF5v8C3b6+F
 gc9lv8/eFG+H64YnSq2KB/83SwVkBHptbeNa+p3FXxrpBO7230P2czfpntobFTt7TKGt
 kkTA==
X-Gm-Message-State: AOAM532+jXEoVtbznAqh6vphkgMEyq/c8k6HM0feMQ+La8jfGKC6XAg+
 qZKq+yOEMQHp/f8TxRqnicRY0A==
X-Google-Smtp-Source: ABdhPJxHCzaN93g3HhmQUt/+mxJ7EZDf5b2xG9w94uqi//2O64Y6WdJ6bv5skd3oTFllx0TjKqLm7A==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr5478970wrg.154.1633615020393; 
 Thu, 07 Oct 2021 06:57:00 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q18sm8800003wmc.7.2021.10.07.06.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:56:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codec: wcd938x: Add irq config support
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <217797a8-b37d-9084-f2de-b9162e21718f@linaro.org>
Date: Thu, 7 Oct 2021 14:56:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 07/10/2021 14:51, Srinivasa Rao Mandadapu wrote:
> This patch fixes compilation error in wcd98x codec driver.
> 
> Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/codecs/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 82ee233..216cea0 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1583,6 +1583,7 @@ config SND_SOC_WCD938X_SDW
>   	tristate "WCD9380/WCD9385 Codec - SDW"
>   	select SND_SOC_WCD938X
>   	select SND_SOC_WCD_MBHC
> +	select REGMAP_IRQ
>   	depends on SOUNDWIRE
>   	select REGMAP_SOUNDWIRE
>   	help
> 
