Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F041929AA51
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 12:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA8C1690;
	Tue, 27 Oct 2020 12:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA8C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603797025;
	bh=7FmAuLq/nnTL863hN4a10QN4Jn6BU11xtKRtBk5CMFo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhHt5OkhGJXRRFQQVq3NkTt0puvEdHXQM/oRFVkOXMz8Da/KIiUHTdIDQWip8pSdW
	 lhsTR/mUMZLhR5NSrcePdB1QTRvSQxGi4o0084Vx1F6O6OZMeVBrfKXPuZHEwA9r/h
	 c5s/JV/CpA4ITHuJyNT8UCBquDGhW1+RpQvXvus0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48D5F80217;
	Tue, 27 Oct 2020 12:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69792F8020D; Tue, 27 Oct 2020 12:08:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E59F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 12:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E59F80086
Received: by mail-ej1-f66.google.com with SMTP id dt13so1586780ejb.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 04:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vkB99++sVe3+tJ+75rrN7FpuFdKJPJ67yYVUAZtO1SM=;
 b=pAh4DKbViFP6/2Pqog8w1rJWcLq7LmYCGTm/ZIfPN9R+guceaMCRDamBm3hjDhJJWq
 49MFLXdmTLAry5LkQ3aAiB+K8v0fGLbn9s0E38qMt4TJ/9tzxkgrBixGTjKpxXMyDxAL
 mkEuHLo3L9+axDsjN3CVpv2CTKFwJ+vY5/bIa++udRQaVD35ROpZoykfgNHA2jSckU39
 TZ5/Ti2ns9lmRurA6AYJEaGKG0z/FGDtazb2SDYmrbNcRJKdMDuXVGLBAfAfjfS/t8k5
 3FAIaEVC8UiwIgw1UQPvbgg2JNOotJtkq0L636EmGUqlgIOmIvUI6i9KLwMcBhSPJpZ9
 KMsQ==
X-Gm-Message-State: AOAM532Eqv/qpct0Ez9N0usgA0i3ta1JmLkBmTHOhGB7sq6R5iKsU91w
 lrULkXblJREPt5j3YSo6QsA=
X-Google-Smtp-Source: ABdhPJytrKpdjS5v/Ce2FRPg9aihFnc0X6Ds/w6A+BnKzkrLi9eW/adZBK1qCEgBBJ9aE/G7Cactyg==
X-Received: by 2002:a17:906:3acd:: with SMTP id
 z13mr1900626ejd.118.1603796923984; 
 Tue, 27 Oct 2020 04:08:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id j22sm737816edp.77.2020.10.27.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:08:42 -0700 (PDT)
Date: Tue, 27 Oct 2020 12:08:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc for
 aud2htx module
Message-ID: <20201027110840.GA23076@kozik-lap>
References: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
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

On Mon, Oct 26, 2020 at 06:40:54PM +0800, Shengjiu Wang wrote:
> AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> IP module found on i.MX8MP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/sound/fsl,aud2htx.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> new file mode 100644
> index 000000000000..18548d0889a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,aud2htx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Audio Subsystem to HDMI RTX Subsystem Controller
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^aud2htx@.*"

aud2htx is not a generic class of a device so it should not be enforced.

> +
> +  compatible:
> +    const: fsl,imx8mp-aud2htx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +
> +  dmas:
> +    items:
> +      - description: DMA controller phandle and request line for TX
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    aud2htx: aud2htx@30cb0000 {
> +             compatible = "fsl,imx8mp-aud2htx";

Wrong indentation. Most of examples are indented with 4 spaces.

Best regards,
Krzysztof
