Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DE559DFB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 18:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7628D1779;
	Fri, 24 Jun 2022 18:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7628D1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656086569;
	bh=4nqGNpOB/Eed+ncDSVvb5MgkmB4zJKNofRNoXxJ860A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IfCsrm+HfJO1ADebgoaTIJGsPjUx+JurEVF2V9zNBPXWYbJWYKMubRsKiBI/E0XyR
	 cAzedYd0cCnnQhUacJeaPg9SMOdeCUi0k5I456R6URlHzn41CFwMt3CE4+8YZkGo7N
	 ZUZjbGqSsaf6/FV+vXP/f2gPzigtI1SUoeaUvhrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4BDAF80137;
	Fri, 24 Jun 2022 18:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED9E6F80139; Fri, 24 Jun 2022 18:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99B0AF80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 18:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B0AF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kgIGHkC9"
Received: by mail-wr1-x433.google.com with SMTP id s1so3698678wra.9
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ffiO6A2PsfBMr7NqXQDGe4LlsBtZjortKK8FGiE8TGs=;
 b=kgIGHkC9AmqJrRisa88gEb2JSgScN9bTHPrFYutqUu3j4EstnyWyH4Vt4PYgnr9wM7
 g1Jv7MXUI3WAB6EsQuB5VZz7SP0td1kZM8aHXB3334K4ewpr7f3MXm8FbbdOznRGguvS
 9npxt9kXyuL8dePxN4eNBJih2eAKLJYfnropKFhsxtJFb5vn9xZLZDaeLxxdOT+uhgu7
 3g9Tgk1Q4KU08dTsHPkDehTnAWTp6s9QGlC+C82CA4Ykt8mHcGCE9bINdYKZj0AXVxyb
 K3pJ1DpOKkUR6dPZXOp4lH/wfDAGpvVFshjIujmrGNIAff8cayGDyBrUKkUCR6/UtDUa
 54lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ffiO6A2PsfBMr7NqXQDGe4LlsBtZjortKK8FGiE8TGs=;
 b=IHu3yTwWsZcFJ6DrNFNfk7gh/YoAHT5xdj0pso/eHVBA2l2+XBVDrxAuoqugPdV0kZ
 QNI8KjyODAgiHyE7fpCKRZvvzK1sYeVOjrdfF9I0SWlfQfP4hb9WiEa6nUwynYjmUAKz
 KyqiI9MGC/Sn97+yej7fdsR5lgRpG13ppHlu7jE08bzOL0I6xzmPpwLdooUqmElxM2cA
 aP0ikscYfZgAwFhLI4UKWx46oDQo6rW0LbYiumsjVbyhkT0lxzHP3FOUxDrC6rZqpt++
 khfw1DGzDFK+basXgwq6kjGGwCdmluboBnD6KjLl6ElJODiAEi26S5f4rzyMhYyaHmcS
 1I1w==
X-Gm-Message-State: AJIora8Z0uO1pTvoN7DIH7680VsIjtWj6PPaecFNaCA5csEHu4sqn9zS
 Yxy5Vi2Fiq8NoQeu3Yz5LvldBw==
X-Google-Smtp-Source: AGRyM1vKGC5ccFr+1PSGrjWJ2Vn9gJPfJi5n/uVuZ8+6JKiJ9SiV5LkmBEgKYLw1Q+Ux8lewMHEdMg==
X-Received: by 2002:a05:6000:381:b0:21b:9a20:7edb with SMTP id
 u1-20020a056000038100b0021b9a207edbmr13997766wrf.71.1656086499812; 
 Fri, 24 Jun 2022 09:01:39 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b0021b932de5d6sm2720639wrv.39.2022.06.24.09.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 09:01:39 -0700 (PDT)
Message-ID: <ac726845-01ec-4f35-7197-4c52fc483644@linaro.org>
Date: Fri, 24 Jun 2022 18:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,micfil: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1655980125-24141-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1655980125-24141-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 23/06/2022 12:28, Shengjiu Wang wrote:
> Convert the NXP MICFIL binding to DT schema format using json-schema.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,micfil.txt  | 33 ---------
>  .../devicetree/bindings/sound/fsl,micfil.yaml | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.txt b/Documentation/devicetree/bindings/sound/fsl,micfil.txt
> deleted file mode 100644
> index 1ea05d4996c7..000000000000
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -NXP MICFIL Digital Audio Interface (MICFIL).
> -
> -The MICFIL digital interface provides a 16-bit audio signal from a PDM
> -microphone bitstream in a configurable output sampling rate.
> -
> -Required properties:
> -
> -  - compatible		: Compatible list, contains "fsl,imx8mm-micfil"
> -			  or "fsl,imx8mp-micfil"
> -
> -  - reg			: Offset and length of the register set for the device.
> -
> -  - interrupts		: Contains the micfil interrupts.
> -
> -  - clocks		: Must contain an entry for each entry in clock-names.
> -
> -  - clock-names		: Must include the "ipg_clk" for register access and
> -			  "ipg_clk_app" for internal micfil clock.
> -
> -  - dmas		: Generic dma devicetree binding as described in
> -			  Documentation/devicetree/bindings/dma/dma.txt.
> -
> -Example:
> -micfil: micfil@30080000 {
> -	compatible = "fsl,imx8mm-micfil";
> -	reg = <0x0 0x30080000 0x0 0x10000>;
> -	interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -		     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&clk IMX8MM_CLK_PDM_IPG>,
> -		 <&clk IMX8MM_CLK_PDM_ROOT>;
> -	clock-names = "ipg_clk", "ipg_clk_app";
> -	dmas = <&sdma2 24 26 0x80000000>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> new file mode 100644
> index 000000000000..74c77f4cf7a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MICFIL Digital Audio Interface (MICFIL)
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  The MICFIL digital interface provides a 16-bit or 24-bit audio signal
> +  from a PDM microphone bitstream in a configurable output sampling rate.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mm-micfil
> +      - fsl,imx8mp-micfil
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 4

You should describe the interrupts/items. Similarly to clocks.

Best regards,
Krzysztof
