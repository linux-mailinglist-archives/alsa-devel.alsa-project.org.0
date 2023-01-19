Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B6673A4B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8E17A1E;
	Thu, 19 Jan 2023 14:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8E17A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674135186;
	bh=9EA2aBKQ+5yeanjaJZaSgoJvRhsjfSA+NgRo5A82KqA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2otEsopd2SofhQschtyLkkcPK7rmR1+WQm7WaMpFWJpErZgKBoOHDoBJYJMV3yci
	 fkjl9mMRLeVBCOFHeOhjtNVLhZwOpmGS6qNCbkOm+d+TtmTvCwIKdWYwtpV8E3TOt2
	 xgIEhLf3TrCMkXwVz47XwpVNTWsP0FFcpLwQQqLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0984F80083;
	Thu, 19 Jan 2023 14:32:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00915F8047B; Thu, 19 Jan 2023 14:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1044F80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1044F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NWQl8S/z
Received: by mail-wm1-x329.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so1292904wmq.0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8EOpVZnjKrO7Yh5EsqJUZSLEPLkGrMAnumjuBQ+xGD8=;
 b=NWQl8S/zxWQpym0QTAJs8bV0RBtPthkFvu+DJtU+JtZJXhezEyO3AdJSpA01ocqB2R
 QTgKsnUbtkEDt9JMbstPSlMTHIWHr2kbEiyqo9piVzn32z8odIHrBM3FkIRa8Jc1eMMW
 p6bABsONEnWhlmH9tLc4gqI2f0Td2NLxBE4caLFMKYgzHy9poG+Zl/RsXjGOsCVaa8cq
 XXrvET532RdoT6a10n0vm8epB/RKuMwq9Ti+nsZZi4jKWiW22/f/MWlx0YygEac7Fp8s
 lsTK+N8hzDEz6rhvjzka8Ncb8VSHtovgyMZ8f4DfE8DPRHq6riPiIMCoSLw8s0ClRcH6
 l1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EOpVZnjKrO7Yh5EsqJUZSLEPLkGrMAnumjuBQ+xGD8=;
 b=ecIRkgTV4Lck/pjkWUSXYFSxseoJIXpp+sCZ6ccMT1dBT98aimGp2svwe519Cd3KiT
 BWRlkunEy6Q4R4GQMb0RM6yrXzyHu1hF4MHMHsIdGvBAGTN1YLh1ekrqh5QuRZE8sTfJ
 HxUD4fRCuRqABMMgys7PWleOpyGUoU0EIJjvUhJrVCSL5nhrCTFM+ETBn90AeFtNRNff
 SwAgbMujWoBwgki4F8SqPfid3n/whPNi/AveSNgJVgIDeA1hbsNXDf5M7OkGt2bRHXeA
 iMHjXNTfKsdr/y6psKLGWN4W8rv3q6ICLb+Tgpiw9qo2L8RZ8dMSWgSGQeRTTWQNjRFb
 AvDg==
X-Gm-Message-State: AFqh2kqpO1nQ5UnElliUWrlAeNWT85WNPVSB6gk9T7MuUA60tzCmZywu
 bJGNpyBom5KY1gOclMK0s4Witg==
X-Google-Smtp-Source: AMrXdXt/GzDdw4HU7OC2tsFKY7iQ/IaxIdtDr0iP7gx5odSJTGcJgQlhP1BNyv7JUpM4mUu9ISlTFA==
X-Received: by 2002:a05:600c:524a:b0:3da:fa71:a333 with SMTP id
 fc10-20020a05600c524a00b003dafa71a333mr10827273wmb.12.1674135120045; 
 Thu, 19 Jan 2023 05:32:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ay22-20020a05600c1e1600b003dafbd859a6sm4975286wmb.43.2023.01.19.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:31:59 -0800 (PST)
Message-ID: <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
Date: Thu, 19 Jan 2023 14:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
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
 <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
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
> Update VA, RX and TX macro and lpass_tlmm clock properties and
> enable them.

Everything is an update and this does not explain what exactly you are
updating in the nodes and why.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 81e0f3a..674b01a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -8,8 +8,67 @@
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  
> +/delete-node/ &lpass_rx_macro;

Why?

> +/delete-node/ &lpass_tx_macro;
> +/delete-node/ &lpass_va_macro;
> +
>  /{
>  	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	lpass_rx_macro: codec@3200000 {
> +		compatible = "qcom,sc7280-lpass-rx-macro";
> +		reg = <0 0x03200000 0 0x1000>;

Why? They are the same.

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;

Still the same...

> +
> +		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&lpass_va_macro>;
> +
> +		clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";

This is different...

> +
> +		#clock-cells = <0>;
> +		#sound-dai-cells = <1>;

But this not.


Best regards,
Krzysztof

