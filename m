Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4B57E64F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 20:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A939186B;
	Fri, 22 Jul 2022 20:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A939186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658513513;
	bh=1B9gzofVr5kc0GvOXtcg8hf0EYtymLH8ssqS2QQFHl4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCAMVIjaKsiU3cP97uabzdoqg1hIWft5XcGevbKQM35ijbS3ntN0b0s7gvSDrCbI/
	 OYG/56pMPqIgfI7ambqTsUm28N5E96nRHhf//KTJO9H+3IGr7Z1NQCIBjEdh2TnHzV
	 ElNvnNd+G9f0cea8pBULckwj4C/JVo8Pb/OXzX98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B906FF80166;
	Fri, 22 Jul 2022 20:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D07FFF8016D; Fri, 22 Jul 2022 20:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B00CF8016D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 20:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B00CF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wXaQaOec"
Received: by mail-lj1-x22c.google.com with SMTP id q7so6291556lji.12
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VAU6tgd7nCtwghNmO7f0d3fFyhG1h4AEauJuDoEQdi8=;
 b=wXaQaOec609oVa4eWdHw2f4aaPyceXdJIl2j6WNYR+OCc2863eVHQgVQyqZktje32H
 wPEKJOMgHGK+nT/ixbc9WhBs4EKDKsgAfZgHbHBcsxmBkOQDmdJsnZEZU6qlAKlFxRjA
 5QcpMttI072K3lZmMrpmb93zAOd+h8pn9rTVHLG19QsN0bLH56CgBGP5n/7oNWEVMwel
 96cC5DYd6kn9Op+529gzO/2py153w2NjuS4hTeFdkFP6E1WWro0yZQBKO5QziCCN8PLu
 nhDUQlqW0wqkLN3tc5jVxe64I89F7om+4F+NgpWX1QksNxTZBxUJ1rz3yuS2iIkT3Psx
 ME9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VAU6tgd7nCtwghNmO7f0d3fFyhG1h4AEauJuDoEQdi8=;
 b=VIp3IQLbzERNq4DzNyi/BdaJSvJIoq3cL4YC5AOchuY+j/Dw5RqcQPl4AG166mWDGS
 uDLHnzqrxgjsRekSRy+D1PZltqiEnnTTysMkuVmJx0yHzjoxqI7cdawBivL6hQZuZ8Lo
 bfjTUjXAP3pbpnTfcw+JrhOzdesMLtM9hqyl8PLvfA3vq2B5B54S9chvhWCt2HMm11tm
 oLRaKQ1uT6KbVgiIQ3hAtrXkTxExzEfe+tS+biiaJmiAiVrWnhOtQTv19rzP7tKkaYLJ
 3CHzCL5blr2CwuKG2YwfmkOAo1nAdyUFjIuz72N/BkYWS/9DA3alXzyLuqzI0qW0JVXT
 ge+Q==
X-Gm-Message-State: AJIora8dJjtvy2CZfSEv6sfUDRyMSmVIzIbcTgbAy3fpGKti7x3+zCU/
 yXDxEYk0WgRYuqHNvwi2neEDHg==
X-Google-Smtp-Source: AGRyM1tib2blqsuZkhwaPPSkLkmTgx7QUcFJmRPVCx1EMFcG2dQ0dbMNuMywjaLtY/YDAYsIIwPJpA==
X-Received: by 2002:a2e:a162:0:b0:25d:9c00:2834 with SMTP id
 u2-20020a2ea162000000b0025d9c002834mr414805ljl.437.1658513440500; 
 Fri, 22 Jul 2022 11:10:40 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net.
 [81.167.86.93]) by smtp.gmail.com with ESMTPSA id
 t8-20020a192d48000000b0047f8132d10bsm1168989lft.281.2022.07.22.11.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 11:10:40 -0700 (PDT)
Message-ID: <36b3b0f0-b4fd-c3fe-f16d-0c23778e3c35@linaro.org>
Date: Fri, 22 Jul 2022 20:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 22/07/2022 17:29, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel i2s devicetree binding to json-schema.
> Change file name to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> Note: running dtbs_check will fail unless updated with this patch,
> https://lore.kernel.org/linux-arm-kernel/20220707215812.193008-1-Ryan.Wanner@microchip.com/
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
