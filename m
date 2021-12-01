Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73984659FF
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 00:50:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2995D2632;
	Thu,  2 Dec 2021 00:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2995D2632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638402617;
	bh=WXficBsL3R8p9bQBI/HNUk8t2ml3NEEwtJR6/vxMJLY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTwwDJRS23WtvskAUni5rmJcM+E3q4ASdizdpa+Q8VmSIA5vtA3eEzguaYFIppP/r
	 qsWBZd6aQW9tZysNoBrGBF/XOBOBRBaBLDLau74C/JPaXNArBlMbOVudcez791Cok8
	 dev85p+hpgrNpXWMIcoKop2xuc8CYU7XAXYv2PBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 799D8F80249;
	Thu,  2 Dec 2021 00:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8685BF80246; Thu,  2 Dec 2021 00:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61A5BF80121
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 00:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A5BF80121
Received: by mail-ot1-f48.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so37530353otv.9
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 15:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyGAOeBxtb/YjCFPCWVtQ1oMycSzDCqhNkiAf3lW5sQ=;
 b=i0uFItOYxrK3BBY4tniO3DaOTj3NnugAT1xI3//aohlu8S3NGxvaJ7ZoQ99jaqRfYN
 GVD50VVgJrKeNXz3y8AIrNhIR9YsZz5vGVLKTcTSqxuvFnDdtFGbtZNcdNCSMXwK5Sgd
 VU9TZfIlUM2U6x8xWVcRuMGk3SCLZPi/0hphnuM+VS00o6YfGny5Lo+9mSHxcNKOyHEY
 JbvL52fE0/c1ckxh36Y7vjwuqdBP32IVGjgT31oVf/X6qrub51W9B6JlfTAXoZmW989N
 JWa93VTNfICqnhzkeWajTTriog9DN6otuaJlmmdufxEKVWZx2ix0hN/3ss6KU+nR/W8X
 /11w==
X-Gm-Message-State: AOAM532aQl1ldt7uD4sZV2/LpEsFSGBNmw0uSPUZw8fR1O5kIzf2zBds
 DyTIgeMhweQBUCQm5Shwzw==
X-Google-Smtp-Source: ABdhPJwBi/tdif29xfYoe8iVx4zcgBRkwLZVbOdrMx5Fmu2uZy2Kzg0shDNa0g5juvB2yC9OFPvevA==
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr8637036ots.7.1638402528023; 
 Wed, 01 Dec 2021 15:48:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm506737otv.30.2021.12.01.15.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:48:47 -0800 (PST)
Received: (nullmailer pid 3239358 invoked by uid 1000);
 Wed, 01 Dec 2021 23:48:46 -0000
Date: Wed, 1 Dec 2021 17:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Message-ID: <YagJ3rKTmE3xSGg4@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-2-digetx@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

On Fri, Nov 26, 2021 at 07:17:48PM +0300, Dmitry Osipenko wrote:
> Add device-tree binding for Tegra20 S/PDIF controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> new file mode 100644
> index 000000000000..00240205817d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra20-spdif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 S/PDIF Controller
> +
> +description: |
> +  The S/PDIF controller supports both input and output in serial audio
> +  digital interface format. The input controller can digitally recover
> +  a clock from the received stream. The S/PDIF controller is also used
> +  to generate the embedded audio for HDMI output channel.
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-spdif
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: spdif_out
> +      - const: spdif_in

'spdif_' is redundant.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
