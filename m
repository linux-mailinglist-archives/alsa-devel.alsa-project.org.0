Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627465BB276
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 20:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93F21ACE;
	Fri, 16 Sep 2022 20:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93F21ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663354317;
	bh=HVnTinXgAQeKmoqJuONZW3jdFcqGQ7P9PkquMN448U8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyRENqdw+tQYcAmqYxcST6KT53HNRDNEsa5tMd2SUyK9571UhdT2ACfQDLQKwUbVX
	 HVrFlkGWJsf95Ab4GmF4fTCcif4y/Mhdv8QzyWyhDQHn5JCKUVNASWxF56WnNYyLSG
	 cReFBPoQi2/N4gEv0HcCfhKHu8/6FWkCRUxMJQ84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C91F80496;
	Fri, 16 Sep 2022 20:51:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12098F802BE; Fri, 16 Sep 2022 20:50:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6694DF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 20:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6694DF8024C
Received: by mail-oi1-f178.google.com with SMTP id o204so7202980oia.12
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 11:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=3UB7ATwI4jkvN5dfzXoHTLYFFznwA2fYTP5Sp8m3D6A=;
 b=Grs3h4AlZV8fgYiwN587sCD2V3O7ZToQLJpQVRJr5SJ/23d/DdyMRhfz/CI+W/9x/+
 mWEpYNIHV2vn4Z7NCP9eOTfV5rbzFP+Q5zayN6VZGo4mZnmXb8fh3QbdPAm3A7XS3oXH
 Ca+OO/aZL2zQxKkx4KEQmAW1IFUGAFHmEzvaDUQtUP42Awbk5bqNRWpAFJOhpdod2JKP
 DtdL6/mUYSyt4XepAPyMvXfW1gvl5+cib+pI6CuFiyT0qIcUV8ITHVJ0U8BVRjv4h8vp
 jxOrrYiCIW5osQdyYAmsH1ZWY6qjkFEVJpDhsseZVNIp224PAgwFhUx+paa2BwadrRDs
 +acg==
X-Gm-Message-State: ACgBeo1iIehoBqnMQmiWx2YnQHKPm4foeGGV7CUXIaZbeBUo60wUwwXz
 fWtINpXJ968OJdCAr/P0fQ==
X-Google-Smtp-Source: AA6agR710WjH2qECtnOYp/b/ibt2BmM7PlV30E4FBE3nldt1uSx9BidvH6yyuvSYQNT0OEBJvdRZbw==
X-Received: by 2002:a05:6808:1148:b0:344:e58d:7449 with SMTP id
 u8-20020a056808114800b00344e58d7449mr7495734oiu.209.1663354249346; 
 Fri, 16 Sep 2022 11:50:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k26-20020a056808069a00b0033a11fcb23bsm9346668oig.27.2022.09.16.11.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:50:48 -0700 (PDT)
Received: (nullmailer pid 1065156 invoked by uid 1000);
 Fri, 16 Sep 2022 18:50:48 -0000
Date: Fri, 16 Sep 2022 13:50:48 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign the rpmsg channel
Message-ID: <20220916185048.GA1061412-robh@kernel.org>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914105145.2543646-2-chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, festevam@gmail.com,
 shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com
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

On Wed, Sep 14, 2022 at 06:51:39PM +0800, Chancel Liu wrote:
> Add a string property to assign the rpmsg channel this sound card sits
> on. It also represents the name of ASoC platform driver. This property
> can be omitted if there is only one sound card and it sits on
> "rpmsg-audio-channel".
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> index d370c98a62c7..3744ae794c00 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -11,8 +11,11 @@ maintainers:
>  
>  description: |
>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
> -  side is a device which provides audio service by rpmsg channel.
> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
> +  Linux side is a device which provides audio service by rpmsg channel.
> +  We can create different sound cards which access different hardwares
> +  such as SAI, MICFIL, .etc through building rpmsg channels between
> +  Cortex-A and Cortex-M.
>  
>  properties:
>    compatible:
> @@ -85,6 +88,17 @@ properties:
>        This is a boolean property. If present, the receiving function
>        will be enabled.
>  
> +  fsl,rpmsg-channel-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      A string property to assign rpmsg channel this sound card sits on.
> +      It also represents the name of ASoC platform driver. This property

That's a Linux detail which doesn't belong in DT.

> +      can be omitted if there is only one sound card and it sits on
> +      "rpmsg-audio-channel".
> +    enum:
> +      - rpmsg-audio-channel
> +      - rpmsg-micfil-channel
> +
>  required:
>    - compatible
>    - model
> @@ -107,3 +121,22 @@ examples:
>                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
>          clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +
> +    rpmsg_micfil: audio-controller {
> +        compatible = "fsl,imx8mm-rpmsg-audio";
> +        model = "micfil-audio";
> +        fsl,rpmsg-channel-name = "rpmsg-micfil-channel";
> +        fsl,enable-lpa;
> +        fsl,rpmsg-in;
> +        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
> +                 <&clk IMX8MM_CLK_PDM_ROOT>,
> +                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
> +                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
> +                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
> +        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
