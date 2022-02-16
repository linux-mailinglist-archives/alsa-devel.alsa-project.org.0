Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387734B8B50
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A431941;
	Wed, 16 Feb 2022 15:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A431941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645021339;
	bh=OV/pF5nY682FvFfzRdju6ZTgsI/e2hhMVbl5Ra0DPNs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RIzPzjZTQpVouQyd6W8/V+vjISpBp/VtMFFEBFKROIaw8OW3vS8yufWLeylttaf4S
	 748se194UmbDZIYu2CQjoaorZe/C1OWzZfGUJ1lg3xo6VWzaTFI1NMyZ+Z6/EZcjg/
	 gDMuMbwriwbV0++FvJZG0xk01eaOmRefiZdWbZUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60D41F8051C;
	Wed, 16 Feb 2022 15:20:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D526F8051B; Wed, 16 Feb 2022 15:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EED0F80516
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EED0F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="S657ZCmw"
Received: by mail-wr1-x434.google.com with SMTP id e3so3822266wra.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fJttqD83JtcJ4lbDggnFlbM6cstaH6DYAd/AKXx3eLo=;
 b=S657ZCmwQ0Q6bSYlkDVeZ6mhrjpjDuakfGtu2AwZSz1wQ1biP8aSnn3FfncID+4RgR
 lOQzP6MJgXdZeuZVDlWh8IrFOXGas68VPXmwNWjQz4WZ1IkRU2svHateZ/1MsEIDycOt
 AfxKO+Ik0JxTT51Jaludyg4qTB3uV6Oi7bwagq9XO+CL//b2korJMnkdEQZwI7RG7gGG
 DpS9a03ijmmikXKp/nyr2O5lP0IuJ2N8bXv3rX6gpFCFBkAJgCL4vCcd/k+ns2vtb6GF
 /JIwNZmJwY7X5UA4OCuM9iaXltZPMMuOBtXd4UfWUcKWC+qXxwepAaRLUfmR078Vn5fu
 PH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fJttqD83JtcJ4lbDggnFlbM6cstaH6DYAd/AKXx3eLo=;
 b=Fk9AQ55F+UXtRYHP0L1lkUMJxG63mh0m1Ex8CWH4Wb/yk27wyUTLG7MQrDOLYceUsB
 IEgAYbNZ3HEF8F3rJshKf2dHkoTXj5S3Pq/f4gte1oA0mioaI2OSm/UKDVk2vpZ/WZNl
 w4u9C1IO/oo4+TkGQOQ0V07qRxvJa8fRFo2tjpqyOu03hceVRAH+X2QLp/9ujQ+wc7JH
 ljcCpzWOIhS7/WpSoYB4+5E0JQNiwCr2NXTqeUZl4m/GeEibQzu6zTOcY7582pZLGVRK
 Nx+JofawH6WzuHuWdC8L7MyLnbeBbqLpJdxssNBzdT/bSX+pLYw/GL1zmx9YhWvuPXXD
 Pr4g==
X-Gm-Message-State: AOAM53327finH4xXTjPlQCpvIfV8piswozt9oOPFXPpVjpOBIeH35D5D
 HtGxU1PpkLPwTcUJEHMr7B090g==
X-Google-Smtp-Source: ABdhPJxm23Yuzt/CVqGgMXoOxwEXECgdCw4FnfkCJOiYKoi9WKeYemIFFyT21qzVKpv1dm1S/D9Ykg==
X-Received: by 2002:adf:d1cb:0:b0:1e8:57d1:8f50 with SMTP id
 b11-20020adfd1cb000000b001e857d18f50mr1656042wrd.21.1645021249045; 
 Wed, 16 Feb 2022 06:20:49 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id e8sm20591211wru.37.2022.02.16.06.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:20:48 -0800 (PST)
Message-ID: <ba8a3cef-6df4-e482-8042-b9249143e284@linaro.org>
Date: Wed, 16 Feb 2022 14:20:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> Extract the chip specific SM8250 data from the LPASS LPI pinctrl driver
> to allow reusing the common code in the addition of subsequent
> platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>   drivers/pinctrl/qcom/Kconfig                    |   8 +
>   drivers/pinctrl/qcom/Makefile                   |   1 +
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 233 +-----------------------
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  86 +++++++++
>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 166 +++++++++++++++++
>   5 files changed, 266 insertions(+), 228 deletions(-)
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index ca6f68a..8871451 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -357,4 +357,12 @@ config PINCTRL_LPASS_LPI
>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>   	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>   
> +config PINCTRL_SM8250_LPASS_LPI
> +	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
> +	depends on PINCTRL_LPASS_LPI

shouldn't this be select instead of depends.


> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +	  (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
> +
>   endif

