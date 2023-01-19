Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0C673A3B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:30:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE25B7A1E;
	Thu, 19 Jan 2023 14:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE25B7A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674135046;
	bh=5Fh4hWtbvPNQVg8p4ik9HoMk2VYNI1ZWzd0seIHBzQM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RilSHTlZ1/Te6n0laxGFat5eIvztwbpftcR6maKUchTUAF6bwKLZT+lblfFHEzLk4
	 H+rChI7krKrfUqOnfBwbfB909HG3bmA9MBUulnNucwXkrUsiubN2ZzD7JQeuqwkg0E
	 l02+DjseLO8KvUfQ2zxVlegDprK0a3fjUM5kImC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A51EF8025D;
	Thu, 19 Jan 2023 14:29:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59915F8047B; Thu, 19 Jan 2023 14:29:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEEDDF800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEDDF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VNpjeXq3
Received: by mail-wm1-x32f.google.com with SMTP id q8so1516449wmo.5
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C3dW0pBIAKxEtxU2RORikWEFqQVlFjW5pcOn+Qp2gyM=;
 b=VNpjeXq3OZVrzKoFwoENfxprV0c/LHQ/ja2SbF6Ueo9L9iG5dfVKrDwgsBaGLiP0NX
 htavdbNyI3VCb3Fc4cJNZB9kOP9FUqb/WznH7/oRBN8dQktYvjC0gCRALkv4fm1j+42a
 SGzS53uwoHPZ0AzTPwdVXHvt5tCtoOx2OHlRkDCwsye+4WaGN0jkjXTA8T4q164+duOq
 xWDirg55Ok5y2QwhoSSYJJNU47Gmy/v9QSA+FAgshFd2qwKAz+g3xruyi3IBxqSkZy16
 AxZA6+bN6ZE/WjSPIMk9cd7VjTMYwX9AsZfLkk0KATIQz/qKlwpt3vLBRltnnuevNPFT
 fJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C3dW0pBIAKxEtxU2RORikWEFqQVlFjW5pcOn+Qp2gyM=;
 b=qsEkU+axPz1sWDUx+eWX1zmhXCTtjQlSleWkBvoW1kv7AuxriaZQArlwU/yjAKYSj6
 nhD+s9Zjb+95Qn+FrmlYq3w8N5FcGeMIT3nARVVtywnf6/ALlz0uVa99E4+PNWk89ASX
 kUYjRVzezYESFvc4mp2Uws8BBP5jJ9N0MHZNoxRDoOkwW40ChTuZCEAmzNScjbO7shTV
 BXvU45gfmTlkh7WCpbH7m1yoAmCVf8pg1mcdo40aPTMtmcOqVFy+QzedcY3fYxBZvdGH
 jDfl53EOnSEG8/qQpoEA4AlWOULUsybLZjOBSsL4oH4FYUD+5TxNNcEl0T7/92cVIYyz
 IJjg==
X-Gm-Message-State: AFqh2kpdCR4Pan4krBFiUUTTsVsoOlHB2xDQSCDiD4RBwqt1C4qMtFAa
 GOI8UJW/NUsSSyp4rIXbfMN9Yg==
X-Google-Smtp-Source: AMrXdXutMqkmGbFSaII+0b3BWhZKLvebXXTCpEBdUITKyeT6dH7yiekgvhHNEYUi/sJ6hmCQbPDkfg==
X-Received: by 2002:a05:600c:5114:b0:3db:254e:59a9 with SMTP id
 o20-20020a05600c511400b003db254e59a9mr1687123wms.15.1674134982119; 
 Thu, 19 Jan 2023 05:29:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1cf404000000b003da2932bde0sm5538891wma.23.2023.01.19.05.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:29:41 -0800 (PST)
Message-ID: <a3da518d-0247-e36c-1161-f82fddd76476@linaro.org>
Date: Thu, 19 Jan 2023 14:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: sc7280: Add LPASS PIL node
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-4-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-4-git-send-email-quic_srivasam@quicinc.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add LPASS PIL node for sc7280 based audioreach platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  |  4 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 95 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 7b3f7ee..81e0f3a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -107,3 +107,7 @@
>  		};
>  	};
>  };
> +
> +&remoteproc_adsp {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 6908bca..08142047 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7280.h>
> +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
>  #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
>  #include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -21,6 +22,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/thermal/thermal.h>
> @@ -3439,6 +3441,99 @@
>  			status = "disabled";
>  		};
>  
> +		remoteproc_adsp: remoteproc@3000000 {
> +			compatible = "qcom,sc7280-adsp-pil";
> +			reg = <0 0x03000000 0 0x5000>, <0 0x0355b000 0 0x10>;
> +			reg-names = "qdsp6ss_base", "lpass_efuse";
> +
> +			status = "disabled";

Status is always the last property.


Best regards,
Krzysztof

