Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334466466E2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 03:23:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872E017E5;
	Thu,  8 Dec 2022 03:22:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872E017E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670466179;
	bh=rC6L+qzH2/frOIl6mi7KHJMHkYKfjkoBGjE1/wMk1vA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N9bDmNuKGep46aAVWwY+OYFamRnR7wu2BBEj3R/kVJseys0O/bPLOmquqDMrWmu/x
	 qnfBu9fZVQfF6C4dkcQaHiJ6bVRjfziIlTVQm2uSxMz8mPU83UmHcEb4c7RCs/Jzss
	 3mn8B0C6QbJMf1P526C0zly9Cz5930Z4tW0mrfdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F6CF8024C;
	Thu,  8 Dec 2022 03:22:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 196D9F8024C; Thu,  8 Dec 2022 03:22:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB776F80089
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 03:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB776F80089
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-1443a16b71cso318714fac.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Dec 2022 18:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRhgF+aNHQAv3pBudTKbGcOoWL7qh+7LUtMMYYLdo9U=;
 b=nAvoNrrRvnzuuhQVwNeNKEUONYvTuApX8z2iEqT4CTwulN6c19M0psgXACOfS8age8
 1Amm0zWdgkKgukOFXQudlarzBdc8eCVdk1wqSKH/KlQDWmMvgiVuhwKQrwJV26ZUuvPL
 54YnEOpu/7dvP2DLvjE1Xzf9Xf33PXnO41hCbyKpoR2Q+m+BK6uBfkVVg3H6XwtHhmQS
 fHv//+tEuhzkSkMuUPBZ8qaqS2W35VFbDNYIfFKi186jV0ho3PsOt/tQJyoiBO2QAD5k
 iweRQjj1UuWdCnVyYIapeHJTJCRGXzrvWCU/in7I/LHeDbwY5v9+XU147d2RZugiWk/p
 DTDw==
X-Gm-Message-State: ANoB5pmkPegs13d4VYiQ/zOLvYCYR6fchENKDvIRpPkjqG11/AAioS/k
 Uer080Zjm9EMcy+Gy+UWZw==
X-Google-Smtp-Source: AA0mqf4qLVEv/uIgAdKfulPn3IlGdIwU29FknjSZQW+WVXxTQUTjXv+1FG9kIxXnX4MmDeYncdmsrA==
X-Received: by 2002:a05:6870:6088:b0:136:3535:cf38 with SMTP id
 t8-20020a056870608800b001363535cf38mr42970274oae.73.1670466113057; 
 Wed, 07 Dec 2022 18:21:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s10-20020acadb0a000000b0035b439a4b81sm10193378oig.31.2022.12.07.18.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 18:21:52 -0800 (PST)
Received: (nullmailer pid 3386875 invoked by uid 1000);
 Thu, 08 Dec 2022 02:21:51 -0000
Date: Wed, 7 Dec 2022 20:21:51 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d
 compatible strings
Message-ID: <20221208022151.GA3383136-robh@kernel.org>
References: <20221104160315.213836-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160315.213836-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

On Fri, Nov 04, 2022 at 05:03:13PM +0100, Marek Vasut wrote:
> Describe existing used combinations of compatible strings on MX6UL
> and MX7D, which are backward compatible with MX6SX. Add the missing
> imx7d-sai compatible string which is used on i.MX7 .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> To: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index 11aab891288d2..05bad828cc353 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -18,15 +18,12 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - fsl,vf610-sai
> -          - fsl,imx6sx-sai
> -          - fsl,imx6ul-sai
> -          - fsl,imx7ulp-sai
> -          - fsl,imx8mq-sai
> -          - fsl,imx8qm-sai
> -          - fsl,imx8ulp-sai
> -          - fsl,imx93-sai

fsl,imx93-sai got lost in this patch.

(found checking for new undocumented compatibles in next with 
scripts/dtc/dt-extract-compatibles)

> +      - items:
> +          - enum:
> +              - fsl,imx6ul-sai
> +              - fsl,imx7d-sai
> +          - const: fsl,imx6sx-sai
> +
>        - items:
>            - enum:
>                - fsl,imx8mm-sai
> @@ -34,6 +31,15 @@ properties:
>                - fsl,imx8mp-sai
>            - const: fsl,imx8mq-sai
>  
> +      - items:
> +          - enum:
> +              - fsl,imx6sx-sai
> +              - fsl,imx7ulp-sai
> +              - fsl,imx8mq-sai
> +              - fsl,imx8qm-sai
> +              - fsl,imx8ulp-sai
> +              - fsl,vf610-sai
> +
>    reg:
>      maxItems: 1
>  
> -- 
> 2.35.1
> 
> 
