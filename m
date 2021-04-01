Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48835208A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 22:22:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E7B16A8;
	Thu,  1 Apr 2021 22:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E7B16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617308557;
	bh=2WEVytHBeGnmiWK9b6XY/YcqeVsTiVKjFxAJsfyUDyM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTOOCAEcu/xmfpfMAmPFgUaOOtygyjNBguBohFwnwka2x1aoCXV3jaW2KqNtaZQ7T
	 0Ztjzm51ReNsZd3WzEhJoDn0yYeUoBSDl3jcNBTul7DAyStq4eOCg6fy2AVuXR45CX
	 vmY5LQtHvzmsiCSh6L2HuIKt5z4ilRfPPJWuTVjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED9AF8026F;
	Thu,  1 Apr 2021 22:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC8B6F8026B; Thu,  1 Apr 2021 22:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B10F8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 22:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B10F8013F
Received: by mail-oi1-f180.google.com with SMTP id k25so2996632oic.4
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 13:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wcspT1L4njOmUk3kNinDGLJJyQmYO9IfUXHMGjOmchc=;
 b=lk8xdKALt15SkAFWdrJORBXgLq7GdEt5IBsua0Nfpsw8UwspUOTHeO02VguziGEl81
 DvddhV9SVwgJcK4iYYIhtdKGS0gLzp1GaQA2SxoE37etHU0THSkVfXgcNQCGG+K9Zw+g
 8j5MH2BsRqEuHuPVxbtbt0kg7WoHTForGhBa6SkKfGMBDkOKBjzECxd2W+9fIKfmIKv0
 JvDjGwmwRMfpROytcWPkDhTmSS8T6P2HaASZIamuyjR1fVD6T6xUaT6PKB2mUWFginjO
 yUtFKUx4D1ah5nsvsplpBG7hpphIbqY7wY+jwobEUz3v7zHvg65CXr7SxYqEVA3VTEa/
 t+Ww==
X-Gm-Message-State: AOAM533KB5NqmILbXuvvxXevj82y+DbhVU/bPTuYreGDZSL6n+H3CGxn
 0xZIogPnvV66vQWaR9B5ig==
X-Google-Smtp-Source: ABdhPJxSgHbdxE/ixaJPEKHjh0MqUdSxB7PgHMrhXuDd6DeB4sLEIkUcP/euJUM8nA8IUQBBb058zA==
X-Received: by 2002:a54:4806:: with SMTP id j6mr7649267oij.15.1617308458832;
 Thu, 01 Apr 2021 13:20:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w23sm1306812oow.25.2021.04.01.13.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 13:20:58 -0700 (PDT)
Received: (nullmailer pid 955677 invoked by uid 1000);
 Thu, 01 Apr 2021 20:20:56 -0000
Date: Thu, 1 Apr 2021 15:20:56 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'ports' does not match any of the regexes
Message-ID: <20210401202056.GA947212@robh.at.kernel.org>
References: <20210331091616.2306-1-thunder.leizhen@huawei.com>
 <20210331091616.2306-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331091616.2306-3-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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

On Wed, Mar 31, 2021 at 05:16:16PM +0800, Zhen Lei wrote:
> Currently, if there are more than two ports, or if there is only one port
> but other properties(such as "#address-cells") is required, these ports
> are placed under the "ports" node. So add the schema of property "ports".

A given binding should just use 'ports' or 'port' depending on it's 
need. Supporting both forms is needless complexity.

> Otherwise, warnings similar to the following will be reported:
> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: \
> sound@ec500000: 'ports' does not match any of the regexes: \
> '^rcar_sound,ctu$', '^rcar_sound,dai$', '^rcar_sound,dvc$', ...
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 384191ee497f534..a42992fa687d3f3 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -115,6 +115,11 @@ properties:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
>  
> +  ports:

       $ref: /schemas/graph.yaml#/properties/ports

> +    patternProperties:
> +      '^port@[0-9]':
> +        $ref: "#/properties/port"

Then this should be: $ref: audio-graph-port.yaml#

Also, what each port is should be defined, but that's a separate 
problem.

> +
>  # use patternProperties to avoid naming "xxx,yyy" issue
>  patternProperties:
>    "^rcar_sound,dvc$":
> -- 
> 1.8.3
> 
> 
