Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40376227574
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 04:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8FF1615;
	Tue, 21 Jul 2020 04:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8FF1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595297650;
	bh=Wd+RJDtjybh53jqcmXzlsw+Ln4yJuFKK9ho7SBzI5Ys=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jjs9j/wnWeWrzXx6vLeB8EggABGVuof4+8qy8bmH/RmWp12PLqZ4USegAMyCPP343
	 7NG+m9rWw90qdhAFiAFt6YEH0h7Z3CyCgq383L8k5gsgG1HvPqJ//mVjsM0Ud3H8yz
	 INDvqkz10dBMWTq8zC4oetOQSgrUqZi9ROS2Km44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA822F80268;
	Tue, 21 Jul 2020 04:12:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB01F8024A; Tue, 21 Jul 2020 04:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C0DF800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 04:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C0DF800CE
Received: by mail-il1-f193.google.com with SMTP id s21so15058960ilk.5
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 19:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NQUTeffJMHXMiqbsPX2xwEkXM3c5RyktUmybjJ1stHs=;
 b=FMyvaC2a0TJz5qGdLbF4dFwwhsnF2jlPskO7VLdDB4Mfvx2adgCRH4hB9GctDVsTN5
 OmvLOJvdS14TSxjh4m+750Hj5NJzM/FbYgdDkg/pZCam4iLdwaPaATf7fBxFg7iY1Byc
 FFp5TyM4PXq35obAolbx46Jb6q3hV86KlilY0Bg5+PPRFiZiexrdk1VMUo81gIRqYUav
 mD8KIMQ8O5xWMfi5Lz436qENFLjQjuEJoXPmvd0UkBF6ABB1EIgAn7PNOMITHr0obua8
 UCMRvtrFXf4q2JdCHTLPsXn/R0SLy2CH+FJHnUFdrb0Jdlw1NxpIOKNnpoEwWaatI790
 iBMQ==
X-Gm-Message-State: AOAM533mi3UCtQLv/Uc42Mqd1nMaUn/P26OP5Ew/P83WRwkbu9I+FHHk
 fCdHJ9J7HFaMS9R8Mg5jSA==
X-Google-Smtp-Source: ABdhPJzJnKhYPFFl4Fz41JdJz6qoRM9fJhj/Uf8pUDziQOo+75dmr6QMoYBHE/FV+bE8f94gH1De6g==
X-Received: by 2002:a92:a312:: with SMTP id a18mr18402751ili.308.1595297532855; 
 Mon, 20 Jul 2020 19:12:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s5sm4527756ioo.29.2020.07.20.19.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:12:12 -0700 (PDT)
Received: (nullmailer pid 3389433 invoked by uid 1000);
 Tue, 21 Jul 2020 02:12:11 -0000
Date: Mon, 20 Jul 2020 20:12:11 -0600
From: Rob Herring <robh@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: Re: [PATCH] dt-bindings: sound: convert ROHM BD28623 amplifier
 binding to yaml
Message-ID: <20200721021211.GA3388250@bogus>
References: <20200714081000.177914-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714081000.177914-1-katsuhiro@katsuster.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Jul 14, 2020 at 05:09:59PM +0900, Katsuhiro Suzuki wrote:
> This patch converts ROHM BD28623UMV class D speaker amplifier binding
> to DT schema.
> 
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> ---
>  .../bindings/sound/rohm,bd28623.txt           | 29 ---------
>  .../bindings/sound/rohm,bd28623.yaml          | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt b/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
> deleted file mode 100644
> index d84557c2686e..000000000000
> --- a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -ROHM BD28623MUV Class D speaker amplifier for digital input
> -
> -This codec does not have any control buses such as I2C, it detect format and
> -rate of I2S signal automatically. It has two signals that can be connected
> -to GPIOs: reset and mute.
> -
> -Required properties:
> -- compatible      : should be "rohm,bd28623"
> -- #sound-dai-cells: should be 0.
> -- VCCA-supply     : regulator phandle for the VCCA supply
> -- VCCP1-supply    : regulator phandle for the VCCP1 supply
> -- VCCP2-supply    : regulator phandle for the VCCP2 supply
> -
> -Optional properties:
> -- reset-gpios     : GPIO specifier for the active low reset line
> -- mute-gpios      : GPIO specifier for the active low mute line
> -
> -Example:
> -
> -	codec {
> -		compatible = "rohm,bd28623";
> -		#sound-dai-cells = <0>;
> -
> -		VCCA-supply = <&vcc_reg>;
> -		VCCP1-supply = <&vcc_reg>;
> -		VCCP2-supply = <&vcc_reg>;
> -		reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
> -		mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
> new file mode 100644
> index 000000000000..acd8609252b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rohm,bd28623.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD28623MUV Class D speaker amplifier for digital input
> +
> +description:
> +  This codec does not have any control buses such as I2C, it detect
> +  format and rate of I2S signal automatically. It has two signals
> +  that can be connected to GPIOs reset and mute.
> +
> +maintainers:
> +  - Katsuhiro Suzuki <katsuhiro@katsuster.net>
> +
> +properties:
> +  compatible:
> +    const: rohm,bd28623
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  VCCA-supply:
> +    description:
> +      regulator phandle for the VCCA (for analog) power supply
> +
> +  VCCP1-supply:
> +    description:
> +      regulator phandle for the VCCP1 (for ch1) power supply
> +
> +  VCCP2-supply:
> +    description:
> +      regulator phandle for the VCCP2 (for ch2) power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specifier for the active low reset line
> +
> +  mute-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specifier for the active low mute line
> +
> +required:
> +  - compatible
> +  - VCCA-supply
> +  - VCCP1-supply
> +  - VCCP2-supply
> +  - "#sound-dai-cells"

Needs an:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    codec {
> +      compatible = "rohm,bd28623";
> +      #sound-dai-cells = <0>;
> +
> +      VCCA-supply = <&vcc_reg>;
> +      VCCP1-supply = <&vcc_reg>;
> +      VCCP2-supply = <&vcc_reg>;
> +      reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
> +      mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> +    };
> -- 
> 2.27.0
> 
