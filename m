Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B27691DDA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F1B846;
	Fri, 10 Feb 2023 12:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F1B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676027625;
	bh=6n+xVI9mPH6LM9ndFzGBD2TAP2Nn4JtVy5J2EUKQ5lg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aeK/syfJQH90ls+8NvRPaluYjqN4KtGOBmNi91ATceWmJnjuzH5YHTG7z+aADYFjl
	 Vm9HHvoFzNQ1MvmN2scuznAFHfbbq55GyIywI+NuHQaCj+N8cqSkTzUntUvL8ON40u
	 adXqyN/Nt/8P8E7VNz4oFNpt+NzMiid5xtYjZ6oE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 268B9F800B8;
	Fri, 10 Feb 2023 12:12:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3094EF800E4; Fri, 10 Feb 2023 12:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60891F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60891F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vjl8AteQ
Received: by mail-wm1-x333.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so3784977wmb.5
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLMV0ncNMrg+f3xjJTtqNXJ3S4bBrDbONW259RzPBmM=;
        b=Vjl8AteQYrT0PDERakIkSf0gc3kzBhuX2I8XN/z+mrcuAIbJ6zRLHwvfAZUCRrXvBH
         B6gLztzfSuqg7VtfH0UHOeDNcKrVF0isBpXVuBwatsHz8E7BXF/vXPPKpcY4uVJmrccn
         jkubfOlYq+vrVatrsO+QsObw+KKKP9YirrjATORvNihyAeQOqwdoTcvWFsfPas0ODU8+
         VMdyWazMlLVm9Ow23YjgYaOJxAAiQHyYNRm2vVjCQu8MPZ9nagnz6tuIvRGJGOwe1F51
         7fp/mLYvgtk362jA8d68S+nn7NsrKGi1H5MAyR7G7N/6QnoHqCR7gPQ96fvUuEWV2eed
         zrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLMV0ncNMrg+f3xjJTtqNXJ3S4bBrDbONW259RzPBmM=;
        b=Kx4wv1xiCM2fMxHm4Ah0FxAopc2jQEfVn7mBs+OK4G06skPq0jB/MJbsbcn+QWhL0F
         FHRqtN2XFuvXJ2ZdW9SnBvXfQPOEeNQMBpOlxHZKfZIoU3fQnKGWbjHQywiZzHyUuNm0
         A3AhKsTISXJ3BL3sS/GFQLoyNCAqE5GP115yy1p57/EQgt+dNLgcd+7bGH72d3CQNOJo
         FMF2foExK/pzeayWUTnsaShvIkTCrJg5D1j5fCrYOlCsXRnFEKQmAZypLMIiiZJhzWLd
         h1l2tGAQL+z+6iUjnGf4WmUml4Yn+KUoJwwuLvcLIxZf8xx7LOskblAOYpZ7tpbCAyn6
         2yYA==
X-Gm-Message-State: AO0yUKUrpiPmZ0ksnbSJV03C7RE/18yGiY4mmkKSNBQwCdz6nAtrJ7vK
	SI7jWOmTzyBC/bCRrZlXlPjVsg==
X-Google-Smtp-Source: 
 AK7set+dZbv/MVOBEnEyByUWoFxBo0mZdtkh1BPQhH0fmQdg3RNpSeSLHcaf2uo8PzHzQC9CQsoEOA==
X-Received: by 2002:a05:600c:a292:b0:3df:ee44:e45a with SMTP id
 hu18-20020a05600ca29200b003dfee44e45amr12801996wmb.15.1676027539910;
        Fri, 10 Feb 2023 03:12:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c308900b003dc3f195abesm4544610wmn.39.2023.02.10.03.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:12:19 -0800 (PST)
Message-ID: <de4b7af2-8918-6c3a-5fb5-cad6c8980d45@linaro.org>
Date: Fri, 10 Feb 2023 12:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/8] arm64: dts: qcom: sc7280: Add LPASS PIL node
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org,
 quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-4-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-4-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7FW2LVD5CTCVTIUY4H5XG3YSM6RDUK7S
X-Message-ID-Hash: 7FW2LVD5CTCVTIUY4H5XG3YSM6RDUK7S
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FW2LVD5CTCVTIUY4H5XG3YSM6RDUK7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Add LPASS PIL node for sc7280 based audioreach platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  |  4 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 93 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 1810a36..5e99f49 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -107,3 +107,7 @@
>  		};
>  	};
>  };
> +
> +&remoteproc_adsp {

Are you sure this is ordered by name?

> +	status = "okay";
> +};

There is lpasscc@3000000 so aren't you now enabling two nodes for the
same address?

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 6908bca..27ab992 100644
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
> @@ -3439,6 +3441,97 @@
>  			status = "disabled";
>  		};
>  
> +		remoteproc_adsp: remoteproc@3000000 {
> +			compatible = "qcom,sc7280-adsp-pil";
> +			reg = <0 0x03000000 0 0x5000>, <0 0x0355b000 0 0x10>;
> +			reg-names = "qdsp6ss_base", "lpass_efuse";

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

You can test against specific schema with DT_SCHEMA_FILES

> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&adsp_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&adsp_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&adsp_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&adsp_smp2p_in 3 IRQ_TYPE_NONE>,
> +					      <&adsp_smp2p_in 7 IRQ_TYPE_NONE>;
> +
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack",
> +					  "shutdown-ack";
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_CFG_NOC_LPASS_CLK>;
> +
> +			clock-names = "xo", "gcc_cfg_noc_lpass";
> +
> +			iommus = <&apps_smmu 0x1800 0x0>;
> +
> +			power-domains =	<&rpmhpd SC7280_CX>;
> +			power-domain-names = "cx";

Here as well. Binding says it is LCX domain.

> +
> +			required-opps = <&rpmhpd_opp_nom>;

This should also fail... please send code for review only if there are
no warnings.

> +
> +			resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
> +				 <&aoss_reset AOSS_CC_LPASS_RESTART>;
> +
> +			reset-names =  "pdc_sync", "cc_lpass";
> +			qcom,halt-regs = <&tcsr_1 0x3000 0x5000 0x8000 0x13000>;
> +
> +			memory-region = <&adsp_mem>;
> +
> +			qcom,smem-states = <&adsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +						       IPCC_MPROC_SIGNAL_GLINK_QMP
> +						       IRQ_TYPE_EDGE_RISING>;
> +
> +				mboxes = <&ipcc IPCC_CLIENT_LPASS
> +					 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;

That's also wrong and test would point the issue.


Best regards,
Krzysztof

