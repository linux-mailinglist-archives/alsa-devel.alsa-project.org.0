Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0953649F1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 20:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D3A1684;
	Mon, 19 Apr 2021 20:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D3A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618857579;
	bh=vSRQNn8cOg2kwuF2tezQFfjW+2HmjCrCo5AjRByb4nw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaeQYQ2w2O/8vZ7GCIjUL581Ez9f/FOz6zuZmXGpAiddJfkbzo7my6ellFcFztvpj
	 9Tg+6hyMxgq5tDKPqzmmAAJWU0oyjgAHGkUNtdPkKOeAKXKtoagSosXlWvZW12E5Q+
	 xkxN3NfS5yZF26SPWo7OeTq6u/P7iv0dEXxWow20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5168F8014D;
	Mon, 19 Apr 2021 20:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C600F80164; Mon, 19 Apr 2021 20:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EB20F80164
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 20:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB20F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b0NwK4xL"
Received: by mail-ed1-x529.google.com with SMTP id k17so2457329edr.7
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jrs+XBm6ggvtJYv1/c5X0qFwYhKg9w9qG3XK2lChT6Q=;
 b=b0NwK4xLCTp2I4QI7ahsuHGRcGm/SVXCLrAbkmSB6F84muMtpFMtGDl6ttK8FagNsR
 Ipy5GlyFjEo0z44+b372t2vEQC8/tYBMpbuGg7pAEA9ESCdqThDH5bm8EbeD12YHq1Aa
 8Fw8X5ZtSx9r6rS9epPF4QlnfKp5qiSNUJJt+BkQiRVmCr6J2+SEVid/THQslkL8zQwD
 Mgr+c8uXTIXZAJXWlekOw22OSXuwY2AmXiyyerd20Uo+YF5x75JDP3sPNVsWXCjlc0a6
 4PK8OyIOEa5X7vD0nk9Vn3xwWlEiyVT59TpU/u/FS8OKkJEQWhCMmuejzLOP/AsOo+Cm
 2bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jrs+XBm6ggvtJYv1/c5X0qFwYhKg9w9qG3XK2lChT6Q=;
 b=tIzxlJaQFpIFmYs6Dtbywhii9caXvDowzDb6BcCV+XzZPDZilLcDWZGnsTPNL7AeBI
 kOLrYPkcjiRC+6WEdw3rASjmLsjAx4l8b+amFFcLmonqAcxT8mRFIceI90MLOMAFcP2l
 jUNtUjhlQWpBOCsbCcKGobBjZGlrKlpQ3fketBcoTh0e52XjrmYeFHRROPS/BeTlBnnS
 hPy5R2P9KuaU9ZiOe/+z3Dr3qsmLQyahA8LKJ8/ewT+pawC3+cgdRVmYJGC1dIkHV7N9
 +dQ0zNyPFp2aAxw1v8tB4OV8xzV4bEiypd8lb3aWeXUesfkcdlT0j4Ca17C0m9xpXN8k
 oixA==
X-Gm-Message-State: AOAM530OXW72q7NMXgVXmAE7LPG5s8w202kUPYHAjHS0JlNhEattXb2+
 BL0wdtmJSCBVqX+RjEKrsUM=
X-Google-Smtp-Source: ABdhPJxegTgbTkCeYJYJ5bYMyVBkLvV3cvuTH8TQ2bDbAkBKMQEDJfOeiLYdm/o2SyuqCssTvOmXWQ==
X-Received: by 2002:aa7:da15:: with SMTP id r21mr26937828eds.253.1618857480677; 
 Mon, 19 Apr 2021 11:38:00 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 bw26sm8704212ejb.119.2021.04.19.11.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 11:38:00 -0700 (PDT)
Subject: Re: [v6 3/3] dt-bindings: Add Rockchip rk817 audio CODEC support
To: Chris Morgan <macromorgan@hotmail.com>, alsa-devel@alsa-project.org
References: <20210419155718.17348-1-macromorgan@hotmail.com>
 <SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <5cad7e70-89ca-6e4c-47cc-1248250108c7@gmail.com>
Date: Mon, 19 Apr 2021 20:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, heiko@sntech.de, lee.jones@linaro.org,
 broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com
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

Hi Chris,

Never use hotmail.com for sending patches.
They corrupt Message-ID, so use for example Gmail.

X-Microsoft-Original-Message-ID:
 <20210419155718.17348-3-macromorgan@hotmail.com>

Message-ID:
<SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>

====

If you like rk817.txt should be converted to YAML, which is beyond your
serie, so move these changes to rk817.txt instead for now if rob+dt
agrees. ;)

====

Include the dts patch back in, so we can compare it with the
documentation changes.

On 4/19/21 5:57 PM, Chris Morgan wrote:
> Create dt-binding documentation to document rk817 codec.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
> Changes in v6:
>  - Included additional project maintainers for correct subsystems.
>  - Removed unneeded compatible from DT documentation.
>  - Removed binding update for Odroid Go Advance (will do in seperate series).
> Changes in v5:
>  - Move register definitions from rk817_codec.h to main rk808.h register
>    definitions.
>  - Add volatile register for codec bits.
>  - Add default values for codec bits.
>  - Removed of_compatible from mtd driver (not necessary).
>  - Switched to using parent regmap instead of private regmap for codec.
> Changes in v4:
>  - Created set_pll() call.
>  - Created user visible gain control in mic.
>  - Check for return value of clk_prepare_enable().
>  - Removed duplicate clk_prepare_enable().
>  - Split DT documentation to separate commit.
> Changes in v3:
>  - Use DAPM macros to set audio path.
>  - Updated devicetree binding (as every rk817 has this codec chip).
>  - Changed documentation to yaml format.
>  - Split MFD changes to separate commit.
> Changes in v2:
>  - Fixed audio path registers to solve some bugs.
> 
>  .../bindings/sound/rockchip,rk817-codec.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> new file mode 100644
> index 000000000000..0059ef54d6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip-rk817.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip rk817 audio codec
> +
> +description:
> +  The rk817 codec is an I2C codec integrated with every Rockchip
> +  rk817 PMIC MFD.

If you want to convert rk817.txt to rockchip,rk817.yaml then add

maintainers:
  - Heiko Stuebner <heiko@sntech.de>

> +
> +properties:
> +

> +  "#sound-dai-cells":
> +    const: 1

Move things with "#" below as much as possible.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: "mclk"
> +

> +  mic-in-differential:
> +    description: the microphone is in differential mode.
> +    $ref: /schemas/types.yaml#/definitions/flag

This is part of a sub node now.

> +
> +required:

> +  - compatible

Add compatible "rockchip,rk817" to properties

> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +rk817: pmic@20 {

> +	compatible = "rockchip,rk817";

Without rockchip,rk817.yaml this example will generate notifications.

> +	reg = <0x20>;
> +	interrupt-parent = <&gpio0>;

> +	interrupts = <7 IRQ_TYPE_LEVEL_LOW>;

add include for IRQ_TYPE_LEVEL_LOW

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pmic_int>, <&i2s_8ch_mclk>;

> +	#sound-dai-cells = <0>;

Move things with "#" down below the list in possible.

> +	clocks = <&cru SCLK_I2S_8CH_OUT>;

add include for SCLK_I2S_8CH_OUT

> +	clock-names = "mclk";

----
Heiko's sort rules:

compatible
reg
interrupts
[alphabetical]
status [if needed]

----


> +

> +	........

remove

> +

> +	rk817_codec: codec {


Move to rk817.txt example.

> +			mic-in-differential;

> +			status = "okay";

Never use status in examples.

> +	};
> +

> +	........

remove

> +
> +};
> 

