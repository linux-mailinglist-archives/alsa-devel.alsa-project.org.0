Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FD1C7AF9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F9917A7;
	Wed,  6 May 2020 22:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F9917A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588795952;
	bh=KoHL0QMrNi4SeTbZjTo/wlcbRErKVLsokjGXsQ/8N1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvcArlnqhQEtFTPw94hU1lVkRbR4CA56NFGZvANfj8oSq2BrqFpHunnH7Ka+XB/pT
	 z2Iw7tyXX9Wsrr3o3GqVXre2tWXj5wjFLvtFKfxL6JeO1JJxcvm4ZBxfeIaATo4H9e
	 Iw/9oZjqYooVW0EyYlTF9kdAOV11g19SPPBHetpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3855F80249;
	Wed,  6 May 2020 22:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF18F80249; Wed,  6 May 2020 22:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0BFF800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0BFF800DE
Received: by mail-oi1-f196.google.com with SMTP id b18so2939769oic.6
 for <alsa-devel@alsa-project.org>; Wed, 06 May 2020 13:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kr9G0io6GcOAL+vMLpiHMdNZyvsp/S0aghS63cxQZpo=;
 b=koM6ZvcgKtqjGXuIVYdjtLXfd8gauZkQVQYolwBbCsbYkULoD0E0+K9pvR72PBXa4c
 9CP+ByYeRgs0MKQdzphC2qf9OGeqQ0T0T5oMGvD3a7FGR3DS8LwtOpWf5so/CpYGMw11
 2wvHf/++27nEFte0ZUW0Krf/1lfV/BgG6p1Bn3I7oNJFBfvueSyPIjFxK3XtSe4wqUiH
 NSHvFokST72qMpr/+8WnohWoGhTG5m0tAdrh73ikg2lou9bA3n9ZJ1KtQYDcvIFJwAzy
 9bul1BsgqYdXqWbhqIZVvn1ieOR6gdqvIxXkbcmY3+r6lBjjVtUkFI0uMjl7ILl5zUqz
 zt6g==
X-Gm-Message-State: AGi0Pubvzz8nNRWtQQInyNRActzgs0QOgtEuEL+q9tnebrJM3ayS6dpy
 u1EeknVhVoKBrrliHYjnBw==
X-Google-Smtp-Source: APiQypKRKlHn1JxPJ2QPh/ADqVMmgsz/+XWbdIoDk44iIftBLeGvnMfd1duy/J0Dd6xx5aDLGDr57A==
X-Received: by 2002:aca:4982:: with SMTP id w124mr1394719oia.167.1588795831480; 
 Wed, 06 May 2020 13:10:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d61sm754458otb.58.2020.05.06.13.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 13:10:30 -0700 (PDT)
Received: (nullmailer pid 6640 invoked by uid 1000);
 Wed, 06 May 2020 20:10:30 -0000
Date: Wed, 6 May 2020 15:10:30 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: ak4642: switch to yaml base
 Documentation
Message-ID: <20200506201030.GA2041@bogus>
References: <87h7xdv2m6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7xdv2m6.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Tue, Apr 21, 2020 at 02:17:53PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/ak4642.txt      | 37 ------------
>  .../devicetree/bindings/sound/ak4642.yaml     | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4642.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4642.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ak4642.txt b/Documentation/devicetree/bindings/sound/ak4642.txt
> deleted file mode 100644
> index 58e48ee97175..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak4642.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -AK4642 I2C transmitter
> -
> -This device supports I2C mode only.
> -
> -Required properties:
> -
> -  - compatible : "asahi-kasei,ak4642" or "asahi-kasei,ak4643" or "asahi-kasei,ak4648"
> -  - reg : The chip select number on the I2C bus
> -
> -Optional properties:
> -
> -  - #clock-cells :		common clock binding; shall be set to 0
> -  - clocks :			common clock binding; MCKI clock
> -  - clock-frequency :		common clock binding; frequency of MCKO
> -  - clock-output-names :	common clock binding; MCKO clock name
> -
> -Example 1:
> -
> -&i2c {
> -	ak4648: ak4648@12 {
> -		compatible = "asahi-kasei,ak4642";
> -		reg = <0x12>;
> -	};
> -};
> -
> -Example 2:
> -
> -&i2c {
> -	ak4643: codec@12 {
> -		compatible = "asahi-kasei,ak4643";
> -		reg = <0x12>;
> -		#clock-cells = <0>;
> -		clocks = <&audio_clock>;
> -		clock-frequency = <12288000>;
> -		clock-output-names = "ak4643_mcko";
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/ak4642.yaml
> new file mode 100644
> index 000000000000..6cd213be2266
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ak4642.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ak4642.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK4642 I2C transmitter Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asahi-kasei,ak4642
> +      - asahi-kasei,ak4643
> +      - asahi-kasei,ak4648
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0

Need a blank line here.

> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: common clock binding; frequency of MCKO
> +    $ref: /schemas/types.yaml#/definitions/uint32

Already has a type. Is there some range of frequencies?

> +
> +  clock-output-names:
> +    description: common clock name
> +    $ref: /schemas/types.yaml#/definitions/string

Already has a type. Just 'maxItems: 1'.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ak4643: codec@12 {
> +            compatible = "asahi-kasei,ak4643";
> +            #sound-dai-cells = <0>;
> +            reg = <0x12>;
> +            #clock-cells = <0>;
> +            clocks = <&audio_clock>;
> +            clock-frequency = <12288000>;
> +            clock-output-names = "ak4643_mcko";
> +        };
> +    };
> -- 
> 2.17.1
> 
