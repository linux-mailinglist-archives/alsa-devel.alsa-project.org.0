Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA543BB15
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952F116C1;
	Tue, 26 Oct 2021 21:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952F116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635277184;
	bh=Bec2bqSA+vK9Lp3idTB4fIoLCigGM7noem3AM1DlFJc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzjKJTNWFg86b8qrudX3H39GCYpfQb52lcnM2ad+lZsS5vW4mVeinIu313rd3pS21
	 3+JCjxUSGfpZzJ/SyPGbYoNqsVlNIGX5i0OMml8IU/X3DQmTjFGw2+V7C93YVa+j5I
	 wy2dPgtuWBIfJegVGpnr7Kg6PshhqINGurqmdsVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F14EEF802E7;
	Tue, 26 Oct 2021 21:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D280F802C8; Tue, 26 Oct 2021 21:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A90F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A90F8010A
Received: by mail-ot1-f54.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so177818otl.11
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7anbp20VhpEFISp7BgAsV6EJPG6+J1HMLEmCYOo/hT0=;
 b=Z766d75FE42xmo71w5Xjp9c9fX7WdfkV5eqkEL+oVgs1Gw5MB6q8nAI+Yq8xPoSxnj
 LPVK94x1rFIgxZVMqEcsVANry1a9o6hyBcxYiHsPAUweUipH6og4HWnZDmLdSJ9MR+YL
 rri9jycVlSvN2wpHO0W/wzmDDCDKwcqbKeFXwDeqc950seUyo0U45xA1D+H02Lnx5iqg
 0a7UwEeXDASE1KaibzO3GDoyaH58NGi8nmZFGp4Gd9Jmd8VjDcHp+AdCCDq5u5mqGBJy
 nncLkQCacleywRjOAZ+pT+8rSclPmZz6WL5rFUQhie6QZhstg1dA/CiZ4BPzKEFJSBXu
 0wnw==
X-Gm-Message-State: AOAM531JjO9HvxXgLvXoxCPqouO27oKnsKd+ORINC1wRa2CCoAdO8Vji
 N7juPhxKPojocWVmqX6eig==
X-Google-Smtp-Source: ABdhPJwTt1pkFtye7CZvJrO0zF7kPvPNQfmV3RlknuymPSTwxN9abcq5ilMolzT2PWa7uM55vMhopw==
X-Received: by 2002:a9d:4b94:: with SMTP id k20mr21059144otf.203.1635277096250; 
 Tue, 26 Oct 2021 12:38:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 16sm4962498oty.20.2021.10.26.12.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:38:15 -0700 (PDT)
Received: (nullmailer pid 3102541 invoked by uid 1000);
 Tue, 26 Oct 2021 19:38:14 -0000
Date: Tue, 26 Oct 2021 14:38:14 -0500
From: Rob Herring <robh@kernel.org>
To: George Song <georgesong0119@gmail.com>
Subject: Re: [PATCH 1/2] ALSA SoC MAX98520 dt-bindings : Added device tree
 binding for max98520 Signed-off-by: George Song
 <george.song@maximintegrated.com>
Message-ID: <YXhZJiXmT/duNu/M@robh.at.kernel.org>
References: <20211013060441.18177-1-georgesong0119@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013060441.18177-1-georgesong0119@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 george.song@maximintegrated.com, "george.song" <george.song@analog.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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

On Wed, Oct 13, 2021 at 03:04:41PM +0900, George Song wrote:
> From: "george.song" <george.song@analog.com>

Patches must have an author name, commit message, and a Signed-off-by. 
Please use checkpatch.pl which will point out some of this.

> 
> ---
>  .../bindings/sound/maxim,max98520.yaml        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98520.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/maxim,max98520.yaml b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
> new file mode 100644
> index 000000000000..02481428e2ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/maxim,max98520.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/maxim,max98520.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX98520 Speaker Amplifier Driver
> +
> +maintainers:
> +  - Goerge Song <George.song@maximintegrated.com>
> +
> +properties:
> +  compatible:
> +    const: maxim,max98520
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
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
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      max98520: amplifier@38 {
> +        compatible = "maxim,max98520";
> +        reg = <0x38>;
> +      };
> +    };
> -- 
> 2.25.1
> 
> 
