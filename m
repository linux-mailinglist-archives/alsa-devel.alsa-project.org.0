Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8E3401D0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE6016CB;
	Thu, 18 Mar 2021 10:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE6016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059229;
	bh=/wuFF0fhdkmmU++hDK+VnYgAMwL1UuBb2FgNXJnS/ts=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5RLDGTKEVycPzj7aGhdS7eLKkoMEAcEPagivzIjZAXl4y0Gs0+EB6IxTTgls9lnL
	 4CQHmtfXgTo+0V9kq6XHWTelB4HPA1mw2a/Op0xqJsVSykSmxX9Z7RFDh78iznCTmu
	 z3WiBUKWMEpWotXfS9+coSDAK+OgAaEcarW8hdBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9092CF804C1;
	Thu, 18 Mar 2021 10:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B192EF8021C; Wed, 17 Mar 2021 10:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFC5AF80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 10:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFC5AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="or4XyHJG"
Received: by mail-wr1-x432.google.com with SMTP id e18so962590wrt.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NVFDyKO2ygUhA+HtmUiSLptg/TxB303zHN8TrRH0yhE=;
 b=or4XyHJGYy7z/dShZG1PvqNQ3+mrCRPDpPdx3PI6+1HwU8DEjPF4JQ3oy1zyni9pND
 +3mwGjlcdWHO6loLexzfwiDwlYaMrZ+Mat11LPLoJzLks0dNZDeVznd3o9Bkh22yAdxx
 aMAShraWmd/P7VcYr5ttJ5A1V0dgI7FmJsZjcsPD91Y2lyaioIkw3downPUsGLClM5aE
 bJk5cIPKAKbr3oI/YbZMh43PxIIf55zSoYn7FR3tkQ1vit7fyCDDmv1xHjvuoIGVV3Ok
 ZI5iNHKZQCuIiM7FKPo1g+jlfDUQ3SzWXk5/fUba8z2cTLeASOVi8vFa11WHyj2w8TI/
 lV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NVFDyKO2ygUhA+HtmUiSLptg/TxB303zHN8TrRH0yhE=;
 b=oGHZednlRgl5y2N7Fqiqdt/txOVxtaVUagV10t9PsCcmwvQeEfQaNpPdxI/CvPYwNY
 GHKzC6MnVo+1XWgJW80dLJYeaaZU6dURxo6daL/7ZVdXL/iaY0uzXuJEvMQN590wgrq5
 uSNuMpLdFPKzzOfpBLuxVPdTAE09SJrou8S3Ui6MOo3c1EOFxwRSLJb2EAVFiRIVmnvI
 GUgzLnWabtK2ffLvoFJ6GZX3N2WkhQmEAXxpzdHYF7r7RLr0+dQBL6qncJSLNVwXy5Sx
 EPPog6OZv6Kod/Xmp5UN/VbyH096rbzIVi0HS8PFP1OcYlMKB7AcQrL2RYymxAim6eTY
 msRA==
X-Gm-Message-State: AOAM531dDkes7XssLlM9WHfXVMctOCnAUkoc/13M3eA6ORpP3P80cvKC
 TQZHu1PNfaFIM4ozrsvvBBy5hA==
X-Google-Smtp-Source: ABdhPJyFsp2Dg+7R5QEB0wMODNdEp2hrkl7dZYkRMuhX4iedkaQnZgEMAu9IeLIWguFwdF0mzGxzDQ==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr3221240wru.78.1615971601574; 
 Wed, 17 Mar 2021 02:00:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l4sm24505097wrt.60.2021.03.17.01.59.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:00:00 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210316194858.3527845-1-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <265c3486-2c85-5c63-e1b5-9b88eaddbb14@linaro.org>
Date: Wed, 17 Mar 2021 08:59:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Suman Anna <s-anna@ti.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Odelu Kukatla <okukatla@codeaurora.org>,
 linux-pm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Benson Leung <bleung@chromium.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 netdev@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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



On 16/03/2021 19:48, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.
> 
> A meta-schema update to catch these is pending.
> 
> Cc: Nicolas Saenz Julienne<nsaenzjulienne@suse.de>
> Cc: Maxime Ripard<mripard@kernel.org>
> Cc: Linus Walleij<linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski<bgolaszewski@baylibre.com>
> Cc: Bjorn Andersson<bjorn.andersson@linaro.org>
> Cc: Krzysztof Kozlowski<krzk@kernel.org>
> Cc: Marc Kleine-Budde<mkl@pengutronix.de>
> Cc: "David S. Miller"<davem@davemloft.net>
> Cc: Jakub Kicinski<kuba@kernel.org>
> Cc: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
> Cc: Ohad Ben-Cohen<ohad@wizery.com>
> Cc: Mark Brown<broonie@kernel.org>
> Cc: Cheng-Yi Chiang<cychiang@chromium.org>
> Cc: Benson Leung<bleung@chromium.org>
> Cc: Zhang Rui<rui.zhang@intel.com>
> Cc: Daniel Lezcano<daniel.lezcano@linaro.org>
> Cc: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
> Cc: Stefan Wahren<wahrenst@gmx.net>
> Cc: Masahiro Yamada<yamada.masahiro@socionext.com>
> Cc: Odelu Kukatla<okukatla@codeaurora.org>
> Cc: Alex Elder<elder@kernel.org>
> Cc: Suman Anna<s-anna@ti.com>
> Cc: Kuninori Morimoto<kuninori.morimoto.gx@renesas.com>
> Cc: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
> Cc:linux-gpio@vger.kernel.org
> Cc:linux-pm@vger.kernel.org
> Cc:linux-can@vger.kernel.org
> Cc:netdev@vger.kernel.org
> Cc:linux-remoteproc@vger.kernel.org
> Cc:alsa-devel@alsa-project.org
> Cc:linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---
>   .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 +----
>   Documentation/devicetree/bindings/arm/cpus.yaml              | 2 --
>   .../bindings/display/allwinner,sun4i-a10-tcon.yaml           | 1 -
>   .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 3 +--
>   .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 1 -
>   .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>   .../bindings/memory-controllers/nvidia,tegra210-emc.yaml     | 2 +-
>   Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml   | 1 -
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
>   Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 --

For nvmem parts,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
