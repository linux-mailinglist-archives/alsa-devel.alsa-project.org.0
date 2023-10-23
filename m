Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18A7D2CDF
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 10:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6B284D;
	Mon, 23 Oct 2023 10:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6B284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698050297;
	bh=+1TD6gIKvizzWgduE6srJb75VOzxPoaqmssCxccZD3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l87fgyiRHfFruA9DWe4kkuFb+hwYgmh97ZhE3pkKt0diUBPfHGORptrJ/OKNxB+d3
	 gZv3ik8v25VVOXKX90lBaEqbQ39oPvx0TVcXmt2XRSIfN+WVz58s5miw9RfofOSEsh
	 EPMZM1dJRO6U9q5RSDqdWpGkHW9bichIZJ3mk5gE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC4F0F80552; Mon, 23 Oct 2023 10:37:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA97F80027;
	Mon, 23 Oct 2023 10:37:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA60F804F3; Mon, 23 Oct 2023 10:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 213A9F80027
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 10:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213A9F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xBXRN7zt
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so44599131fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698050235; x=1698655035;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=me2MC4nn/CV3tpkA7KZB34ZTwycbNAKshOBYMr2X+Pk=;
        b=xBXRN7zt4wWA3fkN0ztvwPTP83MHu/3rDqZASAir5Q4vAFU2M7SGv8fRWaK43F4JuG
         OaaQwcBVovxfQjJgg09r2EOmsmFIUmluTz28ZkWxEGJn7sFZWTndcvD1cF6pFEqGycjq
         HEKhJsN+xHcuDrtsl1XejzVX5Oz3UmiI0Kxy6tvMH5dNsLrgCZ1TiVxxJrnyNj0MNM7u
         jwybQeSn4mojzyqnqFZmwNTCqvzfQsJIkkUHPmch+bfShcb5O+Sc3SsReq0W48qeOgMN
         /iknBZxXK3N4uTs0Wckf/6lEbQ66H0FhurDWzfDdyRAQFMoVr02/kxZtJN05XlTaMFpy
         SQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698050235; x=1698655035;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=me2MC4nn/CV3tpkA7KZB34ZTwycbNAKshOBYMr2X+Pk=;
        b=XQ+5AJZjIwdp+fdPeHXoQEt0wUx38iY0bq/AgXaQn6632Gs8j6eGlkFgWm5CYW4EWN
         Bb+0gw/B9zUrvRqn/ISGkN5JFkw1QYRePzuJbLuv0uDfrTqXccT/r0BXr5lQBd6KjzCh
         n3yzpR76aiUYi1BkwwX8W5ROc0DhXOzE+zC7j/V0dHDKXufCVXvomkddMlq/783gTA86
         ky9duGfWAxH+0M+2PDDPxQv/wbfBPLiEjzhn4shopVByZ7oLzFioJcqK299UMZqU2OPO
         0b2XOOoBztoFx9Gh8HTdZMxFPLlqBFnzGlcm2DrJubptjY6QN9d1Tiu81lI+ME5JxixK
         Yd+A==
X-Gm-Message-State: AOJu0Yz7PAN3xwVbOxsHdiHP3eLTQw7M4NSU0RzshFkisvPwVXgihYoD
	XnsvKW0KHNuIaDCjUhZ4qutcPA==
X-Google-Smtp-Source: 
 AGHT+IHlKoNRRLj9D+bLl/GMYZXBlYtqehKTnbdPLVHoetbAT9+UytWeVgCL/DfTleBsee6/yAUHYQ==
X-Received: by 2002:a2e:a589:0:b0:2c5:1a8e:e4c9 with SMTP id
 m9-20020a2ea589000000b002c51a8ee4c9mr6107923ljp.31.1698050234775;
        Mon, 23 Oct 2023 01:37:14 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 az20-20020a05600c601400b004054dcbf92asm8758062wmb.20.2023.10.23.01.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 01:37:14 -0700 (PDT)
Message-ID: <06a2c115-278a-47e0-b5ba-74639b6b23aa@linaro.org>
Date: Mon, 23 Oct 2023 09:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add WSA2
 audio ports IDs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JNHKEL6CNMSHVJOF6OEU5HLQRSCBDPVO
X-Message-ID-Hash: JNHKEL6CNMSHVJOF6OEU5HLQRSCBDPVO
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNHKEL6CNMSHVJOF6OEU5HLQRSCBDPVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On 19/10/2023 16:35, Krzysztof Kozlowski wrote:
> Add defines for audio ports used on Qualcomm WSA2 LPASS (Low Power
> Audio SubSystem).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 39f203256c4f..c5ea35abf129 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -139,6 +139,11 @@
>   #define DISPLAY_PORT_RX_5	133
>   #define DISPLAY_PORT_RX_6	134
>   #define DISPLAY_PORT_RX_7	135
> +#define WSA2_CODEC_DMA_RX_0	136
> +#define WSA2_CODEC_DMA_TX_0	137
> +#define WSA2_CODEC_DMA_RX_1	138
> +#define WSA2_CODEC_DMA_TX_1	139
> +#define WSA2_CODEC_DMA_TX_2	140
>   

Patches looks fine as it is, but do you realize that this s a dead code 
w.r.t upstream.
WSA2 is used only with 4 speaker setup and in such cases we use WSA 
codec dma to drive 4 channels.

So WSA2 will not be used by itself.
I would prefer support for this to be added when we are really able to 
test WSA2 by itself.

thanks,
Srini

>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
