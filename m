Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9A2B07AC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 15:40:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA6117E9;
	Thu, 12 Nov 2020 15:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA6117E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605192038;
	bh=9a9O029dAgdqEJKT/whzATKeJbDlFS006XmJmSGdqRM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpHv7Q7s+ojcKcL778UTZzuxYb7+VPLKCkgNbnumwd8gNHQFkd4yrpmGazRfLxHHg
	 9isICqIFZluzE2G3p7+GRGT13S7MDwqXP/IC2CHJSW5Gl9/YsfF3rta9xECwoxUZxq
	 O5vzAWugLTjE3JMEMzby+RL2OeZqDwWi1Angy6ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F88F80161;
	Thu, 12 Nov 2020 15:39:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87AA5F801D5; Thu, 12 Nov 2020 15:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93FEEF800D1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 15:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FEEF800D1
Received: by mail-oi1-f193.google.com with SMTP id m143so6606099oig.7
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 06:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g2feB/PWURbtrnJtItFz1VQ5PPwL6e/I9KTZ0Uw/R1A=;
 b=iOPJKk0rHdloDNAwIAl+ZYvZ7Wrlumg2y/JIXUz0J6fch9Q26zZFR79+LO2LuGSZpS
 M91qxflThXmk0VN6y0t7Qj590qo2OoSoJT8/kf79SoizkjASQNXZFsKHsE5g3433rXTx
 cWp/QPkLe5QPpwOKIUlq57cC8SdLqDWfV0rTMaNR+AS/xIIGDDTOUnQoqNjdGIG9sm/+
 CXvUNrb4pG7elmz0f4Eomde4chjWpqqfjGmazemBlCjG4uKSikJWMzdb2zpWTaE+u/Q8
 9EcV8fuPZ2ofMEoxS/iWAvLvmyvZFiec5lKj2TX7QJNrD+ruR9MZ9zRnZdKzBQ4vEi3/
 l+YQ==
X-Gm-Message-State: AOAM5318/xGayDszuLddG3QUSz03pusF4o7N5wkQkX3szug7zJJbAuS4
 y67B4ajGleqnDQT535tCsQ==
X-Google-Smtp-Source: ABdhPJzb4C6749pnyPFAAzZjnZI0T9oOb7W++bv3cxZb4oci7pI8qdSdXH9njzY5O/62MMrjZaaLCA==
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr5908800oih.56.1605191937418; 
 Thu, 12 Nov 2020 06:38:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p128sm1292890ooa.14.2020.11.12.06.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:38:56 -0800 (PST)
Received: (nullmailer pid 3562944 invoked by uid 1000);
 Thu, 12 Nov 2020 14:38:55 -0000
Date: Thu, 12 Nov 2020 08:38:55 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v5 1/6] ASoC: dt-bindings: tegra: Add graph bindings
Message-ID: <20201112143855.GA3553055@bogus>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605119676-32273-2-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On Thu, Nov 12, 2020 at 12:04:31AM +0530, Sameer Pujar wrote:
> Add device tree binding properties of generic graph to ASoC component
> devices. This allows to define audio ports out of these components or
> DAIs and audio graph based sound card can be realised with this.

This is all dependent on graph.yaml being applied which hasn't happened 
yet. I guess I'll need to provide a branch as there's multiple 
subsystems needing it.

> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 13 +++++++++++--
>  .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      |  6 ++++++
>  5 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index ed2fb32..3c9364d 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -55,6 +55,12 @@ properties:
>        The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>        available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

If you have 'ports', then that means you have multiple ports and you 
have to enumerate what each port is.

> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port

If you only have 1 port then, you can use 'port'.


So listing both is an error.

> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> index c028b25..162823d 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -37,6 +37,12 @@ properties:
>  
>    dma-names: true
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  if:
>    properties:
>      compatible:
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index d772197..59cd1f1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -56,6 +56,16 @@ properties:
>  
>    ranges: true
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -67,8 +77,7 @@ required:
>    - "#size-cells"
>    - ranges
>  
> -additionalProperties:
> -  type: object
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> index 2a3207b..b16bf5e 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> @@ -56,6 +56,12 @@ properties:
>        The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
>        on the maximum available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> index dfc1bf7..598f763 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> @@ -74,6 +74,12 @@ properties:
>        The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
>        on the maximum available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.7.4
> 
