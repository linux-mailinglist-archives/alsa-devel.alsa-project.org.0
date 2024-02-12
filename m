Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA603851B5D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 18:27:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FA7CBC0;
	Mon, 12 Feb 2024 18:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FA7CBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707758840;
	bh=zBRQ2L3YSqKZCX6QoGtUVNjjBN/0fESkwN55NmvyBrc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFlGKGhn7x546ZW1jGgQwPwTjrxHWkE9B2wtj+uFiMdq8wWv/buOa075p8NE5tB9n
	 0H13P6UPzVx9D0FfceoND3r5FoJ0fC05nm2QKu3ChwTaOcy+iqcV1+cbdcLJoF+buA
	 yz5Oiml3cyFb6cNTbYVW1/r6bkSP4yL4qhcBzH5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7F99F80579; Mon, 12 Feb 2024 18:26:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1339F8057B;
	Mon, 12 Feb 2024 18:26:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F868F80238; Mon, 12 Feb 2024 18:26:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7B97F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 18:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B97F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KvrBYxd3
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4116650a345so5067945e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707758786; x=1708363586;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qTYop8QJp36+jtIGblbi7k/WDzukfUFb0T7VOK2lcU=;
        b=KvrBYxd3dDpP2kJhgutMex/uapfidDJcMwrdPXsI6lxqa1EhDxfjg699VU9apkziDG
         1WW2HeRJinq2xJ6GmhMxTAESbYkwHCWZnK6TOAoVQxhKj8HcfS421zMx9dzUyQ+7Uxyl
         hoWcrtWtgoiy6cgv/UjpDxOKv7jNXSBHddMavg9ctyz2+mYPLJ2C7Xtbdoh5wzIKatlN
         2iZTND3nJZhQsn+901A6co2VAjfxpS3c+Xz8g/lI4E+jO2S+xxtgBGDGByUEo+gg7XXh
         7H+LpkQgH3MM3+hpViHp4/1eJ3/N9+FOTFRXnpeZm+//lIjpzhjbvt9wdf5zm0F3GnhA
         olDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758786; x=1708363586;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5qTYop8QJp36+jtIGblbi7k/WDzukfUFb0T7VOK2lcU=;
        b=ItTt1fpa6M6cwiQ0fesIPumOobTRmfKy43K6vV3piu5csQ7LRBvAbCktjhrVwBLyx9
         uRxWMyCUP31OdOu/C1lkuxC7YN/TsG3lRYFUIsQeel0e0xVFCDUVIKadQkaO4bO5uh8r
         O62tmEPUrsHjr/0TKkA3ZYsluMxH/QUp/wmet4t2FHFewpYofRVnBdHij9IvYuDsFSLJ
         PntHIw/+E2GS0QZky8zU1ryxbfUVLErWDklvlmhmw8dp8+T22uHzfd5CmxSfsCCXFQkv
         SDlWFXvH3lpdZ7JOoekuuOydXBvMylxBCIf3hQR3fWaHCBa/OdPbcrH059xs/W6pTeJo
         4cKA==
X-Gm-Message-State: AOJu0YyZB1uHzx78FAMlxYbLXAcUESBI2h5aCid89RQj+Y/MfEKjc8sc
	2jgfGVNBYhUrORFre/IBj2H264XpGClkVKkXvviQoj4mxRdiK0viS7yVMbLZlK0=
X-Google-Smtp-Source: 
 AGHT+IFg0NVPNFM5l0rC92f6lBNwnb2GJ+wbCi1upTvwnBA2YxnXHVtsK9iZZAP6HRMoOFnFFV1yyw==
X-Received: by 2002:adf:f709:0:b0:33b:640c:a7d2 with SMTP id
 r9-20020adff709000000b0033b640ca7d2mr5390324wrp.24.1707758786633;
        Mon, 12 Feb 2024 09:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvbjdJf7EnWY5OfIXA6faJ7b6TknrkFAmcqH3a7ILu+FC3dnOIKbNffShVRrSxo8p0tugA49APOWnKdJ/7kBIkftUwKsdYD7+LsGYVwgkE/ook6qdruSBqCLj1NuccDmWDxfAWMHycjuYDHy9+saDE3rkq5Z1xywcvXr0hbJqnqe/yPhTgrIGz/BhG8guIp5q14zoAAstrUiTE86b01ZxOKheJGdFn/aGzWZmvB/P/zQQchFi1Tppl/FE+Hg4oyTWNb9usojjxcHl0aMbtJJbR3c+quFStM2LGX511kwhKIk9IGyXQsq/gyhv62POQJmfd/nZjLNNLWVgwmfp9q3U9NLaneyNxFLFYpLCQhy/u2wY7g2MdxPY3iTMlMa5IGKSqaPVjP5nFHZhlVCfYpA/5XXaan/Hqpj/G1Kn+0d0xCMb96mrc0AY8gRTVsEipnawPS9mhnU/moFved7XtHZincYEZHw4OFmibBljFK/8IjJdN4PZoSNTlIYXqGHeoHpJjvvn9F7SSSW3cy0KsKa/z+K6L+lVlUpF6RWDvikyTTqzTwUHEPIovkBjZVT7rSdH5/bNFeVfA/j3OvuVGVC8xZUq74iZw/koEyH+Rlx6SfNLbHQe/LVfhVqwcFzG3Wf0C5wrQULE6hzgflcICX+YPheKN/HHcdGlXIQdWW1EqSXMMKdccdBlI5dkKcwPxnpPhDndstWTqgffNL27Kjz9yPEYrL1blUOOkYHQAcpFSYtEd02ZPmWTXQWE8evboKOZ3EgLPufzr9eoO2K0c2bds0Jfhsk4NuH75n1YHpg9BYvRt3j72DZFjAA==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id
 k14-20020a056000004e00b0033afc81fc00sm7266685wrx.41.2024.02.12.09.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:26:26 -0800 (PST)
Message-ID: <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
Date: Mon, 12 Feb 2024 18:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add SM8550 Xperia 1 V
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-7-fda0db38e29b@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240210-topic-1v-v1-7-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LBIS2VLJYESZ3U5L2N7NCFNNS4SDDHO3
X-Message-ID-Hash: LBIS2VLJYESZ3U5L2N7NCFNNS4SDDHO3
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: neil.armstrong@linaro.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBIS2VLJYESZ3U5L2N7NCFNNS4SDDHO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> Add support for Sony Xperia 1 V, a.k.a PDX234. This device is a part
> of the SoMC SM8550 Yodo platform.
> 
> This commit brings support for:
> * Remoteprocs (sans modem for now)
> * Flash LED (the notification LED is gone :((((()
> * SD Card
> * USB (*including SuperSpeed*) + PMIC_GLINK (it's funky, requires a replug
>    with an cable flip sometimes..)
> * Most regulators
> * Part of I2C-connected peripherals (notably no touch due to a
> driver bug)
> * PCIe0 (PCIe1 is unused)
> 
> Do note display via simplefb is not supported, as the display is blanked
> upon exiting XBL.
> 
> To create a working boot image, you need to run:
> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8550-sony-xperia-\
> yodo-pdx234.dtb > .Image.gz-dtb
> 
> mkbootimg \
> --kernel .Image.gz-dtb \
> --ramdisk some_initrd.img \
> --pagesize 4096 \
> --base 0x0 \
> --kernel_offset 0x8000 \
> --ramdisk_offset 0x1000000 \
> --tags_offset 0x100 \
> --cmdline "SOME_CMDLINE" \
> --dtb_offset 0x1f00000 \
> --header_version 2 \
> -o boot.img-sony-xperia-pdx234
> 
> Then, you need to flash it on the device and get rid of all the
> vendor_boot/dtbo mess:
> 
> // You have to either pull vbmeta{"","_system"} from
> // /dev/block/bootdevice/by-name/ or build one as a part of AOSP build process
> fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
> fastboot --disable-verity --disable-verification flash vbmeta_system \
> vbmeta_system.img
> 
> fastboot flash boot boot.img-sony-xperia-pdx234
> fastboot erase vendor_boot
> fastboot erase recovery
> fastboot flash dtbo emptydtbo.img
> fastboot erase init_boot // ? I don't remember if it's necessary, sorry
> fastboot continue
> 
> Where emptydtbo.img is a tiny file that consists of 2 bytes (all zeroes), doing
> a "fastboot erase" won't cut it, the bootloader will go crazy and things will
> fall apart when it tries to overlay random bytes from an empty partition onto a
> perfectly good appended DTB.


DTBc check reports:
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie-1-phy-aux-clk: 'clock-frequency' is a required property
        from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#

So you'll probably need:
&pcie_1_phy_aux_clk {
	status = "disabled";
};

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>   .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    | 779 +++++++++++++++++++++
>   2 files changed, 780 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f7c5662213e4..9bbea531660d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -237,6 +237,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> new file mode 100644
> index 000000000000..85e0d3d66e16
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/cs35l45.h>
> +#include "sm8550.dtsi"
> +#include "pm8010.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +/* TODO: Only one SID of PMR735D seems accessible? */


What's reported by the cpuinfo pmic array  ?

<snip>

With the pcie thing fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
