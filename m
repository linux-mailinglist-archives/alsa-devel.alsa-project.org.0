Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB51691A41
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 09:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B06F0;
	Fri, 10 Feb 2023 09:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B06F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676018819;
	bh=/SJTErVl35q7SLqnHRNufECgY9s452uG20jh/vaexDQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I8YpUhY+zv2Yxmt/M0vv7WCKSESMYBtH1UQyI86s/OBT8GZ2YFmwnY8jPG60S1yJ1
	 8MTocwURhppI4LRLRHedEAD/NeMZ2ouvhqGUppfjNcTeXczSY7xDKmvlHQ7rMe4rDL
	 r01ekHTaaiBCZesNtXf2/haDcBB7o237zf8lZFRQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BACBCF800B8;
	Fri, 10 Feb 2023 09:46:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEBE8F800E4; Fri, 10 Feb 2023 09:46:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BAEAF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 09:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BAEAF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jgpNqU5W
Received: by mail-wm1-x32a.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so3536568wms.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qA3qvbnssW7q8kXQFDPaNXVdxo8ZJzAN4ti+xF1gQ5M=;
        b=jgpNqU5WlUekv99IWQquuXrNQLE/1uSEKexafpZM3OI/DHNAPIDTQuOv/cMKnEaO3s
         jWyJ4G94/heiFfv6ZPvieOdG0mnBTRijfe21S6sKCHLqc4fDLY2GwnJ07Oy5fNPvI5uz
         2zRaM8D20COYy7LTiWC6LkZC3hOaaCadiVE1CfJjTnCAgIsiI6PDOvcxfA2BkYHmHdoo
         ZevvEya0tneI+VNJQBWOmrpSU5WRObiF/pHuHISmHet5qNl1bCvPucYR1EjepIovc/fo
         HlI/mLpjQq5OpzLN5S2WKr7mN2ePcbN6SY5hDLHJpgxTGU9uH44pbt/9iMthDC3PPUVS
         aSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qA3qvbnssW7q8kXQFDPaNXVdxo8ZJzAN4ti+xF1gQ5M=;
        b=NsjSWAE/hwyIbecYrEaNily2SjWbr1ny8Wip3VQKrAagB/bLuXj+Jw7863itWcUObc
         CYKmRUpsJorGDGQ60vgjsF+RV26x5BTFE/7acqBFQ5cWRF8AvSfs9IDJrWYjWJ5O0tNw
         OFO2YuxRS2DjJthfHw6IvlMdiFHuUTjzE9NMRvLlg1noD7NgeTkJvUAjFqmoqAMjS24R
         TKsa/xD3p8ZFuQhBDOCp5el5moUrWI3piofESEYLBwcDuXNBwTlsaMo6rV0g9nEbLZHO
         CxXNk1nAy02h2x8IC7+yB3gANgkZF++dfwdlQcXNFVWek0HUYXPcDR915lm/W1P31H5j
         mv0g==
X-Gm-Message-State: AO0yUKWPAqOhmvvpc1ZfN+bVUXfn7zAYRHuNY5K5nn7DGsLFIAquvbHW
	4vR/I0xCn8rRict/i5BF8cwBiQ==
X-Google-Smtp-Source: 
 AK7set9x6sBH4Hw//pRNQ8QpNO2VKH3YQMChRW1yO4t8kC4SPlcv4uzYZTfstMMz6m3zHCQMBt8S8A==
X-Received: by 2002:a05:600c:35cd:b0:3df:eda1:439c with SMTP id
 r13-20020a05600c35cd00b003dfeda1439cmr8977658wmq.11.1676018752808;
        Fri, 10 Feb 2023 00:45:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c3b8d00b003dc434900e1sm4753511wms.34.2023.02.10.00.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:45:52 -0800 (PST)
Message-ID: <9570b0fb-1fe2-00fe-e224-229752f26a9a@linaro.org>
Date: Fri, 10 Feb 2023 09:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: tegra: Audio codec support on Jetson AGX Orin
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, oder_chiou@realtek.com, broonie@kernel.org
References: <1675953417-8686-1-git-send-email-spujar@nvidia.com>
 <1675953417-8686-3-git-send-email-spujar@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675953417-8686-3-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XIHEIUIZ4KAGPUMOU7OJJQMB3O45K3XU
X-Message-ID-Hash: XIHEIUIZ4KAGPUMOU7OJJQMB3O45K3XU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIHEIUIZ4KAGPUMOU7OJJQMB3O45K3XU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 15:36, Sameer Pujar wrote:
> Jetson AGX Orin has onboard RT5640 audio codec. This patch adds the
> codec device node and the bindings to I2S1 interface.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 47 +++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index 8a97478..5881fbf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/sound/rt5640.h>
>  
>  #include "tegra234-p3701-0000.dtsi"
>  #include "tegra234-p3737-0000.dtsi"
> @@ -49,7 +50,7 @@
>  
>  							i2s1_dap: endpoint {
>  								dai-format = "i2s";
> -								/* placeholder for external codec */
> +								remote-endpoint = <&rt5640_ep>;
>  							};
>  						};
>  					};
> @@ -2017,6 +2018,32 @@
>  			status = "okay";
>  		};
>  
> +		i2c@31e0000 {
> +			status = "okay";
> +
> +			audio-codec@1c {
> +				status = "okay";

Are you sure you need this?

Best regards,
Krzysztof

