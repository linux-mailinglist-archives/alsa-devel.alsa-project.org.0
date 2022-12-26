Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F301165628E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 13:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB736043;
	Mon, 26 Dec 2022 13:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB736043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672057708;
	bh=VD3xegORHsJkFHPOWctjaNel4Q3080OdA7ng6upOhFs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hWjSmlmve49DQf87TYOlkS2dvsLgq5HYQjyk6OtCn1QDE2Z4n5CqWGEwjqTzP3tPU
	 oenw4rZCBvQ/LEesA1/MRiaFPz788TDT72eV2PjdTdglzR+yvIKO5boJsi2HYAdTx0
	 6MgWgs2sDX4yyB3zknAYAMsANmviFB04khewIsvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67174F800F0;
	Mon, 26 Dec 2022 13:27:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81CCF802A0; Mon, 26 Dec 2022 13:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C54DEF80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 13:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C54DEF80134
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oJVd9QbW
Received: by mail-lf1-x136.google.com with SMTP id g13so15764799lfv.7
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 04:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WRgHMYxNzvXV/Rkf0QUcRNHp4+EIuQ1yrJzCHQL2OU8=;
 b=oJVd9QbWMUr51an5T7995QYHfbMBDEX9eDI8F9Gi4NIozAx86uVZZS2uaQWe4UNuuO
 +3hLA7cbDspp3W6oN8RL5/mAzsX/96JgPbhdb9i/BZGAKwwyDA4BdyAp+26PnnTTiwyZ
 g63fEemgt+mJuUDyd5KzEgYwkjY+MJRgOCChr7iSCx6OW+qbJWLfYWDGlkE2wBEuI1OX
 slN00obwhnXmJMQWD3a8G15hzrkEkYfDVLd6rqfkCyOm8PtSoAUEzBxEM0GZlzg+5Wa7
 Vbmw9xgEONBBgk4vrUJCDrOT+gB5+xYh8trSHUIcLnKWCdICxuhesBfpxk6Mnc0tdbv3
 ejpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WRgHMYxNzvXV/Rkf0QUcRNHp4+EIuQ1yrJzCHQL2OU8=;
 b=xcEFk2fqoCj8v7oxSuPjIKL0hqPS27fFLjeSMT1hsRTML/K/oybenBfm/2ChEzYozl
 oveYntRq83SQMaRiMYH8VZZ/rspEvpj0oGhJyUy1jmK32zfeK4OWpYnijg2RstTvSneC
 hqzoDnKBrrZzdF368DIZL7TsyraeovhFcH6pO8a29fsrogIayxJ0Dd/xrsmpUiVf3PNr
 +KjfOyJeElSY1dpmcvFEkO7U/pW24R0mqifz3ZCw06cOBlymCtS4akQQlowlywOlbGAn
 Ms6GTxaoFNBXxAyGn3jYI6LY+8maZye7h6d8gG5TYhiWZZAZfZJiSKKYeNXWBtSxXPlI
 XpyA==
X-Gm-Message-State: AFqh2koVHjO1XmoAKHF3K5WDQAyHlkQsGGAkgJzD7qpPnFn2/8Oak4wT
 sP2wP24FfMSWzvHXdf8C7KW7ZA==
X-Google-Smtp-Source: AMrXdXtnApTf3ReVqgja7dPTOH6W0gQmo/vvCsRj0yba+pfy0FAolACLLh1auSSoksIsIg3CRphVwA==
X-Received: by 2002:a05:6512:2828:b0:4b9:f5e5:8fbc with SMTP id
 cf40-20020a056512282800b004b9f5e58fbcmr6759486lfb.30.1672057643267; 
 Mon, 26 Dec 2022 04:27:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05651236c200b004b55f60c65asm1806452lfs.284.2022.12.26.04.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 04:27:22 -0800 (PST)
Message-ID: <f57d8d44-651e-b51d-dd72-bdf15801958f@linaro.org>
Date: Mon, 26 Dec 2022 13:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 14/14] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-15-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24/12/2022 00:32, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 70080d04ddc9..60cd84e6727a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -216,6 +216,19 @@ examples:
>                  sound-dai = <&vamacro 0>;
>              };
>          };
> +
> +        usb-dai-link {
> +            link-name = "USB Playback";
> +            cpu {
> +                sound-dai = <&q6afedai USB_RX>;

Hmm, that makes me wonder if you really tested the bindings before
sending? If yes, where is the USB_RX defined?

Best regards,
Krzysztof

