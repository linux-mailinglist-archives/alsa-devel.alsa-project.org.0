Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC222E98E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6C81699;
	Mon, 27 Jul 2020 11:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6C81699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843633;
	bh=oS8bQ5/yzoBh0egrAXWk6yuatSYKgRFTY3yMUMk9BwE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2dTTFXndYFlhwEZF3THMx9ezHzCKRZkAnr4ol2TTeob8sWx/Av/oJyhAUnTLdcAK
	 r864VezcQ7hOYiFYe3DyqyQa7jTGnpx9arrCd3jwu6HAHRqm2TI4ju3IDySpfV1fBV
	 0YB+bHzOpBOHIsdz2wb05AedNq4T3iubriNVtywE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37383F801D9;
	Mon, 27 Jul 2020 11:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB80F80171; Mon, 27 Jul 2020 11:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91AB4F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AB4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yc6ZgWRJ"
Received: by mail-wr1-x441.google.com with SMTP id z18so10640596wrm.12
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Ivb7WRSFvNF43LLMwjK3O6NfSzTie0Usw8vsOB8K/4=;
 b=yc6ZgWRJ/53Yo92nHnUPBVnW4enDw7a6skJxpmxscMSJzPJNlbhe7b1lhbmOSQTww0
 bx84EEiszpuMK+73taVdH8TbPYjfVOlgjQ/7Lej+9MWigX7MJDHPHfXSkXJ2rFk65ZQI
 1qVpwis22BlfJQlMOC3QFwMc4DEQtlmdHLAxnKQdo5H9EGt6tw6A+HtipFcxEEIjt3Ab
 kKzB5sHGBcz2wlKy53TVdKm/+aCesfo6+U0BIN1FHEzaOECzQv7QsVe2eKrXp4/ohRfZ
 dwJbkViS4BM1PUJyG8WIuu08PfbFfF80I9tBON9rF6LKthiEGKALCiYEgPIfN4LA5vOY
 181Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Ivb7WRSFvNF43LLMwjK3O6NfSzTie0Usw8vsOB8K/4=;
 b=cJsL1x+gsNAyLBgt6eCNbhYKhMp5PyXOO4UBzIJKHvCxfYiw2jZTJxVw2OAEga6zEH
 UURQvZLysu2BYAGPGhHDUpW1qQ/zVxzP2lle2gUyh+kM3Z8fjWRkQ/Zk23bowb2wfT4S
 owz7Wz6Z6LpsEk4QjIZXOsKPcw8agpMW/ianfU7uuGyaF3ci6HVlFrm9sWe+H3ac3Zcn
 BGGWGuJY0Gks3iqhx0yveuumpj31MjuJw99kG8h/BWlwx4bA+xTM9uVxbsXhQF7KHago
 dxY87wYZcDbMkz/T+ZZF56U4YNF1WSbWtMsxXBACaOERhvbYehWpndDc7Vq/evFyMfd6
 WEzQ==
X-Gm-Message-State: AOAM530PFFfVtiWMvBNYDVAx34ZlvfEGIr4CxwZCzvy/eVsTyFlo05E9
 r/Qdc29tFoWWD3j157t8svwxSg==
X-Google-Smtp-Source: ABdhPJwhPIZQCTIJ+3loH/6xoZ01cRZGkhu4qj//nMV7LcEL1bSw0YMqFBIIjUqluK4a+7ikv9P90g==
X-Received: by 2002:adf:94a1:: with SMTP id 30mr18721409wrr.37.1595843519166; 
 Mon, 27 Jul 2020 02:51:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 88sm12413747wrk.43.2020.07.27.02.51.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jul 2020 02:51:58 -0700 (PDT)
Subject: Re: [PATCH] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX,TX,RX}
 defines
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200727082502.2341-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <880a0748-b347-acff-2393-2e864ace5b72@linaro.org>
Date: Mon, 27 Jul 2020 10:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200727082502.2341-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
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



On 27/07/2020 09:25, Stephan Gerhold wrote:
> Right now the direction of a DAI has to be specified as a literal
> number in the device tree, e.g.:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <2>;
> 	};
> 
> but this does not make it immediately clear that this is a
> playback/RX-only DAI.
> 
> Actually, q6asm-dai.c has useful defines for this. Move them to the
> dt-bindings header to allow using them in the dts(i) files.
> The example above then becomes:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <Q6ASM_DAI_RX>;
> 	};
> 
> which is immediately recognizable as playback/RX-only DAI.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks Stephan,

Looks good to me,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> ---
>   Documentation/devicetree/bindings/sound/qcom,q6asm.txt | 9 +++++----
>   include/dt-bindings/sound/qcom,q6asm.h                 | 4 ++++
>   sound/soc/qcom/qdsp6/q6asm-dai.c                       | 3 ---
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> index 6b9a88d0ea3f..8c4883becae9 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> @@ -39,9 +39,9 @@ configuration of each dai. Must contain the following properties.
>   	Usage: Required for Compress offload dais
>   	Value type: <u32>
>   	Definition: Specifies the direction of the dai stream
> -			0 for both tx and rx
> -			1 for only tx (Capture/Encode)
> -			2 for only rx (Playback/Decode)
> +			Q6ASM_DAI_TX_RX (0) for both tx and rx
> +			Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
> +			Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
>   
>   - is-compress-dai:
>   	Usage: Required for Compress offload dais
> @@ -50,6 +50,7 @@ configuration of each dai. Must contain the following properties.
>   
>   
>   = EXAMPLE
> +#include <dt-bindings/sound/qcom,q6asm.h>
>   
>   apr-service@7 {
>   	compatible = "qcom,q6asm";
> @@ -62,7 +63,7 @@ apr-service@7 {
>   
>   		dai@0 {
>   			reg = <0>;
> -			direction = <2>;
> +			direction = <Q6ASM_DAI_RX>;
>   			is-compress-dai;
>   		};
>   	};
> diff --git a/include/dt-bindings/sound/qcom,q6asm.h b/include/dt-bindings/sound/qcom,q6asm.h
> index 1eb77d87c2e8..f59d74f14395 100644
> --- a/include/dt-bindings/sound/qcom,q6asm.h
> +++ b/include/dt-bindings/sound/qcom,q6asm.h
> @@ -19,4 +19,8 @@
>   #define	MSM_FRONTEND_DAI_MULTIMEDIA15	14
>   #define	MSM_FRONTEND_DAI_MULTIMEDIA16	15
>   
> +#define Q6ASM_DAI_TX_RX	0
> +#define Q6ASM_DAI_TX	1
> +#define Q6ASM_DAI_RX	2
> +
>   #endif /* __DT_BINDINGS_Q6_ASM_H__ */
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index a2acb7564eb8..9b7b218f2a20 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -37,9 +37,6 @@
>   #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
>   #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
>   #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
> -#define Q6ASM_DAI_TX_RX	0
> -#define Q6ASM_DAI_TX	1
> -#define Q6ASM_DAI_RX	2
>   
>   #define ALAC_CH_LAYOUT_MONO   ((101 << 16) | 1)
>   #define ALAC_CH_LAYOUT_STEREO ((101 << 16) | 2)
> 
