Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE98CA097
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 18:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BEF6C0;
	Mon, 20 May 2024 18:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BEF6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716221809;
	bh=UOi1n2UYMr/FQbVKWQcyqklCKnrURV8Jm+y0d+1xmXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=frI02raEHDIH39B7DK6eqDqdWB/fT0nCa+74VCFCYk8J8XwIj1i/pDY4bO5vVejmm
	 ULHzYDUrp9TNp+gk5dlyEIOUEKvb65iJXjgYqXlnudZPx306+0QYhM6HZdbJVlPkYq
	 RvZN/oZHU0uXaVXzbIoq45zaQ2WXPVDyw9stc7Lw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80114F805AE; Mon, 20 May 2024 18:16:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F750F805A0;
	Mon, 20 May 2024 18:16:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92330F8026A; Mon, 20 May 2024 18:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1411F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1411F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZVIH+1ZK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AC13CE0B1C;
	Mon, 20 May 2024 16:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BCFC2BD10;
	Mon, 20 May 2024 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716221763;
	bh=UOi1n2UYMr/FQbVKWQcyqklCKnrURV8Jm+y0d+1xmXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVIH+1ZKPc7nCIgzITvynSYYWTuhtNjvapabvfzI39kdCUv/cP4aImgHpSanyEI85
	 fc0TB8ke+DtxyB2CtlKbVnrDZ+ddR8fPUrDgiu1uANtDlzM7XYr/LabR/5B7Owbk9B
	 4hWwZd/6EdR6d5bT8cObim94znIZbhwjsgTCCHrNHbap8pX+INKZ4MMCPgO7PIan7o
	 hDxrSRyQfKhn+fdEOfUX72EyR2VWY0B4ikj9one8DIBkv4VQ6jLc7h/YSffPOXtIrt
	 0+kuwP0OcIO4tSATpnsSyiEcc58emRDd1LfmGCTInzD7GPHZ57rqhnUe52uXrVT0eP
	 VBwc46NopDv5A==
Date: Mon, 20 May 2024 11:16:02 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible
 string for i.MX95
Message-ID: <20240520161602.GA733483-robh@kernel.org>
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
 <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: XDUHEG3KJHQDTAJM5DHKN77QOJGLAZFV
X-Message-ID-Hash: XDUHEG3KJHQDTAJM5DHKN77QOJGLAZFV
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDUHEG3KJHQDTAJM5DHKN77QOJGLAZFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 14, 2024 at 11:12:08AM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
> 
> The difference between each platform is in below table.
> 
> +---------+--------+----------+--------+
> |  SOC	  |  PHY   | eARC/ARC | SPDIF  |
> +---------+--------+----------+--------+
> | i.MX8MP |  V1    |  Yes     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX93  |  N/A   |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> | i.MX95  |  V2    |  N/A     |  Yes   |
> +---------+--------+----------+--------+
> 
> On i.MX95, there are two PLL clock sources, they are the parent
> clocks of the XCVR root clock. one is for 8kHz series rates, named
> as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
> They are optional clocks, if there are such clocks, then the driver
> can switch between them to support more accurate sample rates.
> 
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
> for clocks and clock-names properties.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..70bcde33e986 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -22,6 +22,7 @@ properties:
>      enum:
>        - fsl,imx8mp-xcvr
>        - fsl,imx93-xcvr
> +      - fsl,imx95-xcvr
>  
>    reg:
>      items:
> @@ -44,18 +45,12 @@ properties:
>      minItems: 1
>  
>    clocks:
> -    items:
> -      - description: Peripheral clock
> -      - description: PHY clock
> -      - description: SPBA clock
> -      - description: PLL clock

Leave these here and add pll8k and pll11k.

> +    minItems: 4

Keep this.

> +    maxItems: 6
>  
>    clock-names:
> -    items:
> -      - const: ipg
> -      - const: phy
> -      - const: spba
> -      - const: pll_ipg
> +    minItems: 4
> +    maxItems: 6

Same here.

>  
>    dmas:
>      items:
> @@ -97,6 +92,46 @@ allOf:
>        properties:
>          interrupts:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-xcvr
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Peripheral clock
> +            - description: PHY clock
> +            - description: SPBA clock
> +            - description: PLL clock
> +            - description: PLL clock source for 8kHz series
> +            - description: PLL clock source for 11kHz series
> +          minItems: 4
> +        clock-names:
> +          items:
> +            - const: ipg
> +            - const: phy
> +            - const: spba
> +            - const: pll_ipg
> +            - const: pll8k
> +            - const: pll11k
> +          minItems: 4

Drop all this.

> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Peripheral clock
> +            - description: PHY clock
> +            - description: SPBA clock
> +            - description: PLL clock
> +        clock-names:
> +          items:
> +            - const: ipg
> +            - const: phy
> +            - const: spba
> +            - const: pll_ipg

And for this case, you just need 'maxItems: 4'.

Rob
