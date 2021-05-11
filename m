Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263237D418
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 22:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBF11816;
	Wed, 12 May 2021 22:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBF11816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620850095;
	bh=xmjlM+hgThcqmTF7JxqFaoB4laH1PTtOBjX9ttx7rjA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVhOXUuBPosx5/LVPNV8lbb4L/xeDqyAe6MTLtCi03S4AcPYkmMmMvrhdQBpX9cse
	 1IkqzhdM6c+7Kf7fdrJrSLR0VSnDzpcQFB8FKMMrd7Txga4f4bO6yTheaqQH8Cxzx9
	 UiJHSsOl2Wsgqmb2pGDf+tl8+af8cnO6k27sS0zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 104F9F8012E;
	Wed, 12 May 2021 22:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECF4F8026B; Wed, 12 May 2021 22:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DATE_IN_PAST_24_48,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9236F8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 22:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9236F8012E
Received: by mail-oi1-f171.google.com with SMTP id k25so23420211oic.4
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 13:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QZOu937T06FGYysrX40DfRIEifPnkgP2wpT5ChbrOLM=;
 b=YaD19N5+5RURxctt97FBCPBcGc19zsTEJ1NujbyhvZ0rQoaDOBtp1xZWwmS1G5LWDj
 7htpxTOUHiwCt5G2onzK69ZCxyIqW+8u1lufKbxXQ5701bzR6pqmtTpfaMLbmkwlFDxO
 xOERWaY0xDQaSRL9WGlrcMCG7gqX/X0Hw/9OHtL9LQEYpqIN7/aO4O3opSnWlFQsYwoH
 uPTcPcJ+SJF0PtmYolA4R3fsnTTF/7fDGhkp2FIGgwmJ1B51cu41njayqQVGh2v4PaFR
 zTe51pJZTTVeIBc6P3jSRhbUIU4snqTrx49RLEOv0eDUeA+an6RhRbyQK5eF147Xi1kE
 istA==
X-Gm-Message-State: AOAM530oVVMGyv32GjX8I2NCBt1VBc5merQZhfVZ9UTVgas64I/fdu7E
 1bThTLH3+PrkqHAirJABNw==
X-Google-Smtp-Source: ABdhPJyFestwfEyHgdtvQESLKDKYdJEwVqw5rAmNlfsvq9xl609Ay/5t03I4TO2cGO9CWGnLqGNXZg==
X-Received: by 2002:a05:6808:561:: with SMTP id j1mr189039oig.24.1620849994987; 
 Wed, 12 May 2021 13:06:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d19sm172127oti.57.2021.05.12.13.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:06:34 -0700 (PDT)
Received: (nullmailer pid 2429755 invoked by uid 1000);
 Tue, 11 May 2021 19:00:57 -0000
Date: Tue, 11 May 2021 14:00:57 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc
 for akcodec machine driver
Message-ID: <20210511190057.GA2416585@robh.at.kernel.org>
References: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
 <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, May 10, 2021 at 03:07:21PM +0800, Shengjiu Wang wrote:
> Imx-akcodec is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - update doc accoring to Rob's comment, use the common porperties.
> 
>  .../bindings/sound/imx-audio-akcodec.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> new file mode 100644
> index 000000000000..0812c4779b59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-audio-akcodec
> +      - fsl,imx-audio-akcodec

We gone from individual codecs to a family of codecs. Is there something 
specific for the machine driver about this set of codecs? Why can't it 
be *any* codec?

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source. Valid names could be power supplies,
> +      MicBias of codec and the jacks on the board.
> +
> +patternProperties:
> +  ".*-dai-link$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      format:
> +        description: audio format.
> +        items:
> +          enum:
> +            - i2s
> +            - dsp_b
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +    required:
> +      - link-name
> +      - cpu
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound-ak4458 {
> +        compatible = "fsl,imx-audio-akcodec";
> +        model = "ak4458-audio";
> +        pri-dai-link {
> +            link-name = "akcodec";
> +            format = "i2s";
> +            cpu {
> +                 sound-dai = <&sai1>;
> +            };
> +            codec {
> +                 sound-dai = <&ak4458_1>, <&ak4458_2>;
> +            };
> +        };
> +        fe-dai-link {
> +            link-name = "HiFi-ASRC-FE";
> +            format = "i2s";
> +            cpu {
> +                sound-dai = <&easrc>;
> +            };
> +        };
> +        be-dai-link {
> +            link-name = "HiFi-ASRC-BE";
> +            format = "dsp_b";
> +            cpu {
> +                sound-dai = <&sai1>;
> +            };
> +            codec {
> +                sound-dai = <&ak4458_1>, <&ak4458_2>;
> +            };
> +        };
> +    };
> -- 
> 2.27.0
> 
