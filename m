Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5106F8A75
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 22:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FEB32C1A;
	Fri,  5 May 2023 22:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FEB32C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683320221;
	bh=+9j7y+mrM50h2VcOOaIbK0MFi52MZLnpfPgvvLPE6Fk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TS7ANuPj6NE1aEp/Rt0yWQTiswWXj/J3/GkFGymzbvErmW9t1Z8Z9HCPT/gwaeMGh
	 MVP8s0gfKjn0HISU0mJPAPBKvAujE+HXQbkX66YZTn8upT2xqfyPzz3FxAx09h5Vti
	 hYBn3MF03XngXHmKxn6amzkjvU9aNQpbcO+lwl+8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1021F80529;
	Fri,  5 May 2023 22:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE57F8052D; Fri,  5 May 2023 22:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C74E1F80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 22:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C74E1F80087
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-54c723db469so761970eaf.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 13:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683320159; x=1685912159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN+kd2EhqqLwkd1HP1gj/tCZ2l7tn4n5+N9NH0LIdNk=;
        b=QewFE+hhDRxgnScP/ydoqTYpBhWwSAiAYOX1Ix0a2jKYt5EAUw7UbfOqQhlHQaLyII
         9cT1d95u2FvtlsU2ZKHeA7WrfADj7Rp9fQ59O6napp9cZEgTPEfr0a7aWvHvZjPcazyL
         SvJehd2Ms/Xmyc08gS+kRp/jlF18fTcFsRE6MfuOc7lDRC4TzWyQJUaRbjMU2klhvtC9
         sYwgUJo2IIPvtQI/hrrdGX03ASwnhQcAljzj+GdWiXb1rtRUHBgGxnXEBU/dgcrXuv1k
         Qcq2itDTbdf63mxQPQ7O6Gvj5acWbWYyhY4DQqfSehvoIytD36Dlj8UL6F/5YklSkCXB
         ayCA==
X-Gm-Message-State: AC+VfDzZJIu1rT8kzDjUCIhLbHxnvKa6pUJV7NTX3ZVgNX2iUMXOsURp
	z6bJTt8aI9nHuVCmrj38TQ==
X-Google-Smtp-Source: 
 ACHHUZ753eu5EI/LSk6iN0lvOVkNEoyddP53VCwh5WJqzbAvag6iNPXcKvC6W2TN9PHdEY3Uv6obYA==
X-Received: by 2002:a05:6820:290:b0:547:6105:e096 with SMTP id
 q16-20020a056820029000b005476105e096mr1349543ood.7.1683320159587;
        Fri, 05 May 2023 13:55:59 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a9d6405000000b006a632c6af05sm1298506otl.54.2023.05.05.13.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 13:55:58 -0700 (PDT)
Received: (nullmailer pid 3548062 invoked by uid 1000);
	Fri, 05 May 2023 20:55:58 -0000
Date: Fri, 5 May 2023 15:55:58 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Sharma <anupnewsmail@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8540: Convert to dtschema
Message-ID: <20230505205558.GA3544888-robh@kernel.org>
References: <ZE9rK6mktPByvRRz@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZE9rK6mktPByvRRz@yoga>
Message-ID-Hash: S6FUIFSY4HYGQA6K3IUCZ7JOOLQJY7W7
X-Message-ID-Hash: S6FUIFSY4HYGQA6K3IUCZ7JOOLQJY7W7
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, KCHSU0@nuvoton.com, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6FUIFSY4HYGQA6K3IUCZ7JOOLQJY7W7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 01, 2023 at 01:02:59PM +0530, Anup Sharma wrote:
> Convert the NAU8540 audio CODEC bindings to DT schema
> 
> Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
> ---
>  .../devicetree/bindings/sound/nau8540.txt     | 16 --------
>  .../bindings/sound/nuvoton,nau8540.yaml       | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8540.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nau8540.txt b/Documentation/devicetree/bindings/sound/nau8540.txt
> deleted file mode 100644
> index 307a76528320..000000000000
> --- a/Documentation/devicetree/bindings/sound/nau8540.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -NAU85L40 audio CODEC
> -
> -This device supports I2C only.
> -
> -Required properties:
> -
> -  - compatible : "nuvoton,nau8540"
> -
> -  - reg : the I2C address of the device.
> -
> -Example:
> -
> -codec: nau8540@1c {
> -       compatible = "nuvoton,nau8540";
> -       reg = <0x1c>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
> new file mode 100644
> index 000000000000..ac344e435a5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8540.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton Technology Corporation NAU85L40 Audio CODEC
> +
> +maintainers:
> +  - KCHSU0@nuvoton.com, broonie@kernel.org

Not the right format. It's one email per line/entry.

It needs a name too and drop Mark. It's who knows the h/w, not who 
applies patches.

> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,nau8540
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@1c {
> +            compatible = "nuvoton,nau8540";
> +            reg = <0x1c>;
> +        };
> +    };
> -- 
> 2.34.1
> 
