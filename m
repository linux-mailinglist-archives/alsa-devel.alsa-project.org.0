Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E964E6616CA
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 17:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F1D5E24;
	Sun,  8 Jan 2023 17:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F1D5E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673196110;
	bh=aA24KW0CBCoKdfFSHhDN+b7jvcb3N662Ydhk0rTFNIM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MDLELLy5h9ZRnB+2RayhaqaTDy7k/8NLLQdxow3wTxxAhxB+C/S8+efug3L6ADHYn
	 Nv4JFmF9Yi7m/A7v3FUsA17CWWsGEnyjVo5qDxFhZGIUxjBSqcnaHdgv/RNPlZUWck
	 pz+Y8vB0hFbXo5aGvJEy3uEb+4vzVzNuzKJHxhfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F9DF80236;
	Sun,  8 Jan 2023 17:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68AADF804C1; Sun,  8 Jan 2023 17:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A4F4F80236
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 17:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A4F4F80236
Received: by mail-io1-f50.google.com with SMTP id p9so3374019iod.13
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 08:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMq5mdx2/8Hut7F0lg9JoCdClaBGqd57bfF0gzLs3yI=;
 b=RErVi28eqY7Qi2NNAPYx01Jqs4M2PwXXNxnQ/gnXXV1TKn4tM5hE1Ia83UQ2y8RV2A
 oC1+v7MdLPdqxTHscWuZ7Pp7n6tTPalxnuO6wN2yXdC5TSvjQNKAD7q9gDLUM1jMjjkR
 RxuOU289tg9O1VGOWhPLI7qnJXebVA2Fl4YUysTcBebo+iVVDyxWTxr+YKqR8NuOkdDY
 G+GBCr/cb1SuQ2XcfAc+nxktDhIWNdm6qoR2mUDiKPJ6Ara2UcLSEYbh9tM1o3pl22c/
 zmYGU3VfE0oE3Lo65BKWe0yndCV0z1zLrRgiyuhgPTYVfGmSkq82Zb2+xB7WS7JwG4KX
 0g8Q==
X-Gm-Message-State: AFqh2kqYrYsladdPmngLhqc1rTuR9E3sLT5J2xUjLQWBq1aEXXNfmPIA
 X7w4UU2j8URFCfQv3nv1Lg==
X-Google-Smtp-Source: AMrXdXuo7awWg54JHoOGJwYFs1h+7TeEUm5MOri76QszWjSsTaOmcA1T6oeiQ6FYnodqWwD2Z2i/Dg==
X-Received: by 2002:a6b:d210:0:b0:6de:3e2c:d791 with SMTP id
 q16-20020a6bd210000000b006de3e2cd791mr38939062iob.1.1673196045155; 
 Sun, 08 Jan 2023 08:40:45 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05663800d400b00375783003fcsm2025633jao.136.2023.01.08.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:40:44 -0800 (PST)
Received: (nullmailer pid 36866 invoked by uid 1000);
 Sun, 08 Jan 2023 16:37:41 -0000
Date: Sun, 8 Jan 2023 10:37:41 -0600
From: Rob Herring <robh@kernel.org>
To: Faiz Abbas <faiz.abbas@arm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Message-ID: <20230108163741.GA30997-robh@kernel.org>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105160346.29018-1-faiz.abbas@arm.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Deepak.Pandey@arm.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 05, 2023 at 09:33:46PM +0530, Faiz Abbas wrote:
> The simple card driver has support for adding cpu, codec and platform
> nodes with the simple-audio-card prefix. Add documentation for the plat
> binding.

Another node, is it still 'simple card'?

> 
> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index ed19899bc94b..fa67c76d4dbb 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -205,6 +205,8 @@ patternProperties:
>      $ref: "#/definitions/dai"
>    "^simple-audio-card,codec(@[0-9a-f]+)?$":
>      $ref: "#/definitions/dai"
> +  "^simple-audio-card,plat(@[0-9a-f]+)?$":

What does 'plat' mean?

Don't continue the 'simple-audio-card,' prefix.

> +    $ref: "#/definitions/dai"
>  
>    "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
>      description: |
> @@ -285,6 +287,27 @@ examples:
>          };
>      };
>  
> +#-------------------------------
> +# single DAI link with platform
> +#-------------------------------

Really need another example for 1 simple node?

> + - |
> +   sound {
> +        compatible = "simple-audio-card";
> +        simple-audio-card,format = "i2s";
> +        simple-audio-card,mclk-fs = <384>;
> +        simple-audio-card,cpu {
> +                sound-dai = <&iofpga_i2s>;
> +        };
> +
> +        simple-audio-card,codec {
> +                sound-dai = <&hdmi_tx>;
> +        };
> +
> +        simple-audio-card,plat {
> +                sound-dai = <&audio_formatter>;
> +        };
> +};
> +
>  #--------------------
>  # Multi DAI links
>  #--------------------
> -- 
> 2.25.1
> 
> 
