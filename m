Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D522B0984
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B4417D9;
	Thu, 12 Nov 2020 17:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B4417D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605197297;
	bh=IMwUW0djZoVef01hGkuZyp4IKHHgRj0wq8vI0Rx4oTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZK2AWRkoe4/Y+Yn+brIroJjHz/QJ+0vH06ysE4W7VGdJ4lEmxbJY8P6tgk/ZARTC
	 QIiDLCSfdp+iS0O6dogKKx96wLtqsWegrrkjXLZ5Zn1Cc3GXN2SMBpkskCaCWsYN1H
	 +j5ZUEVRdI7eVrClw+OZGxst9ZvsByDx1/ET4wZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F8F1F801EB;
	Thu, 12 Nov 2020 17:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C386F801D5; Thu, 12 Nov 2020 17:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B227FF800D1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B227FF800D1
Received: by mail-ot1-f66.google.com with SMTP id 79so6048757otc.7
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 08:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3ufV/nE7yMD/9nE/SuqLhfnK8fps7nR0yXh6Zbp0Nms=;
 b=fplIWj5cqzs40yUcXs7WBTQg4acJH4JzwOLQXhCARALPOBiAWBv5ikuH6O6v9HOJXk
 JBQfFWTnQ8buqm/v5acqLCbRX4rsLG2nKpT+AGK/RK7BJy7V5tMlR+p9Bl95r9XcjtbY
 LVAuzOKwJqDBS+mFtIzSG8Tlqqsq6t1mYui5xgGAhww4fI4ZBr3viGTN+XXL7TmPY0uy
 aIWCZ67HctHATJt2FneE90ZEuKUyOkwcDzYSOw5nWO0XTaB/qYRpMqttf7JaZQA1zWt3
 4CGfibWKbnuf+HjIW2TExZvnsmUAiY9TpJ95TrgiRz2n81YG/U9PC6ZYmCUDUTMszCtZ
 oMfg==
X-Gm-Message-State: AOAM530EuilM6l1V7QUNFV19jqnyh9C+Cemp6y1D86mn2DQ4duYoK7qq
 hO8X5cZ2CZ91CEQx05ZBYw==
X-Google-Smtp-Source: ABdhPJyS6c0yPbEFXN9wyW73xxOhuVjIDcn90D3c+lrlsn8DYEzLaQDA01QgYclNrf9Xxptu3wJfZA==
X-Received: by 2002:a9d:6311:: with SMTP id q17mr21446605otk.284.1605197192475; 
 Thu, 12 Nov 2020 08:06:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s185sm1251840oia.18.2020.11.12.08.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 08:06:31 -0800 (PST)
Received: (nullmailer pid 3681332 invoked by uid 1000);
 Thu, 12 Nov 2020 16:06:31 -0000
Date: Thu, 12 Nov 2020 10:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/2] ASoC: audio-graph-card: Refactor schema
Message-ID: <20201112160631.GA3671282@bogus>
References: <1605097613-25301-1-git-send-email-spujar@nvidia.com>
 <1605097613-25301-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605097613-25301-2-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
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

On Wed, Nov 11, 2020 at 05:56:52PM +0530, Sameer Pujar wrote:
> There can be customized sound cards which are based on generic audio
> graph. In such cases most of the stuff is reused from generic audio
> graph. To facilitate this, refactor audio graph schema into multiple
> files and the base schema can be reused for specific sound cards.

I did ack it, but it's not great that this was just applied and now it's 
being changed. If the submitter doesn't have time to work on it more 
then the maintainers shouldn't really have time to apply it.

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/audio-graph-card.yaml           | 102 +-------------------
>  .../devicetree/bindings/sound/audio-graph.yaml     | 107 +++++++++++++++++++++
>  2 files changed, 110 insertions(+), 99 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> index 2329aeb..e047d7d 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> @@ -9,113 +9,17 @@ title: Audio Graph Card Driver Device Tree Bindings
>  maintainers:
>    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>  
> +allOf:
> +  - $ref: /schemas/sound/audio-graph.yaml#
> +
>  properties:
>    compatible:
>      enum:
>        - audio-graph-card
>        - audio-graph-scu-card
>  
> -  dais:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -  label:
> -    maxItems: 1
> -  prefix:
> -    description: "device name prefix"
> -    $ref: /schemas/types.yaml#/definitions/string
> -  routing:
> -    description: |
> -      A list of the connections between audio components.
> -      Each entry is a pair of strings, the first being the
> -      connection's sink, the second being the connection's source.
> -    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> -  widgets:
> -    description: User specified audio sound widgets.
> -    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> -  convert-rate:
> -    description: CPU to Codec rate convert.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -  convert-channels:
> -    description: CPU to Codec rate channels.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -  pa-gpios:
> -    maxItems: 1
> -  hp-det-gpio:
> -    maxItems: 1
> -  mic-det-gpio:
> -    maxItems: 1
> -
> -  port:
> -    description: single OF-Graph subnode
> -    type: object
> -    properties:
> -      reg:
> -        maxItems: 1
> -      prefix:
> -        description: "device name prefix"
> -        $ref: /schemas/types.yaml#/definitions/string
> -      convert-rate:
> -        description: CPU to Codec rate convert.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -      convert-channels:
> -        description: CPU to Codec rate channels.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -    patternProperties:
> -      "^endpoint(@[0-9a-f]+)?":
> -        type: object
> -        properties:
> -          remote-endpoint:
> -            maxItems: 1
> -          mclk-fs:
> -            description: |
> -              Multiplication factor between stream rate and codec mclk.
> -              When defined, mclk-fs property defined in dai-link sub nodes are ignored.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -          frame-inversion:
> -            description: dai-link uses frame clock inversion
> -            $ref: /schemas/types.yaml#/definitions/flag
> -          bitclock-inversion:
> -            description: dai-link uses bit clock inversion
> -            $ref: /schemas/types.yaml#/definitions/flag
> -          frame-master:
> -            description: Indicates dai-link frame master.
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -            maxItems: 1
> -          bitclock-master:
> -            description: Indicates dai-link bit clock master
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -            maxItems: 1
> -          dai-format:
> -            description: audio format.
> -            items:
> -              enum:
> -                - i2s
> -                - right_j
> -                - left_j
> -                - dsp_a
> -                - dsp_b
> -                - ac97
> -                - pdm
> -                - msb
> -                - lsb
> -          convert-rate:
> -            description: CPU to Codec rate convert.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -          convert-channels:
> -            description: CPU to Codec rate channels.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -        required:
> -          - remote-endpoint
> -
> -  ports:
> -    description: multi OF-Graph subnode
> -    type: object
> -    patternProperties:
> -      "^port(@[0-9a-f]+)?":
> -        $ref: "#/properties/port"
> -
>  required:
>    - compatible
> -  - dais
>  
>  additionalProperties: false

This is not going to work with all the properties moved. 
'additionalProperties' can't 'see' into the reference. This needs to be 
unevaluatedProperties instead which solves that problem.

>  
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> new file mode 100644
> index 0000000..1e338d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +allOf:
> +  - $ref: /schemas/graph.yaml#
> +
> +select: false
> +
> +properties:
> +  dais:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  label:
> +    maxItems: 1
> +  prefix:
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +  routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  widgets:
> +    description: User specified audio sound widgets.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  convert-rate:
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  convert-channels:
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  pa-gpios:
> +    maxItems: 1
> +  hp-det-gpio:
> +    maxItems: 1
> +  mic-det-gpio:
> +    maxItems: 1
> +
> +  port:
> +    description: single OF-Graph subnode
> +    type: object
> +    properties:
> +      prefix:
> +        description: "device name prefix"
> +        $ref: /schemas/types.yaml#/definitions/string
> +      convert-rate:
> +        description: CPU to Codec rate convert.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      convert-channels:
> +        description: CPU to Codec rate channels.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?":
> +        type: object
> +        properties:
> +          mclk-fs:
> +            description: |
> +              Multiplication factor between stream rate and codec mclk.
> +              When defined, mclk-fs property defined in dai-link sub nodes are
> +              ignored.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          frame-inversion:
> +            description: dai-link uses frame clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          bitclock-inversion:
> +            description: dai-link uses bit clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          frame-master:
> +            description: Indicates dai-link frame master.
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            maxItems: 1
> +          bitclock-master:
> +            description: Indicates dai-link bit clock master
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            maxItems: 1
> +          dai-format:
> +            description: audio format.
> +            items:
> +              enum:
> +                - i2s
> +                - right_j
> +                - left_j
> +                - dsp_a
> +                - dsp_b
> +                - ac97
> +                - pdm
> +                - msb
> +                - lsb
> +          convert-rate:
> +            description: CPU to Codec rate convert.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          convert-channels:
> +            description: CPU to Codec rate channels.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - dais
> +
> +additionalProperties: true
> -- 
> 2.7.4
> 
