Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115228D2011
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 17:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE84836;
	Tue, 28 May 2024 17:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE84836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716909391;
	bh=xpk0Yqw/VN8ddEnECwmM/UpM6KoNoPvI14IHu2eBrJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=neswnWBtlGwckRMXSzXVe6PTaedEVNPAzRvKE8KXFsWqmg+vm9VMa8kFxXT4QR4dU
	 c0ct0cx3nE0UOiUjiJboaWVwyUQuIVaXgFaNAmUS57rEnPnIdXLIQz9mxx4P6J+8lE
	 GRBLos/+J14rkpYhUDhZAsBhv3/PsMULiGNnKDQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D469F8059F; Tue, 28 May 2024 17:15:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDC7F804E5;
	Tue, 28 May 2024 17:15:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B072FF80149; Tue, 28 May 2024 17:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5FE6F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 17:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5FE6F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cUCcJuLj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B7ADCE1140;
	Tue, 28 May 2024 15:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942F9C3277B;
	Tue, 28 May 2024 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716909337;
	bh=xpk0Yqw/VN8ddEnECwmM/UpM6KoNoPvI14IHu2eBrJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUCcJuLjneqe7FsY8PDzBO8l6FMtnMWAfv87RASRNOn7ANCjpyTOCQZHUK1hT0ig2
	 6B8fVVMjnGid5Z1MERtu5+/uuCMrqzvGKzWVgyuK7/U7zOtQH5qc+wywSAG3cokDKX
	 yv20Iz5vrXsx1n19nf9LXAx1T/uoIJA9hWwBrHU19WulFHEsUnTLyUZ1CABB+XaZzC
	 2d/GYyyoaPLkTIkHMFf6WVDQ5y0ScYlfjJbkGlTNXzAJ1+ZnT2F0F+lj2jZ+BYIV8E
	 gBq03xNbxHelWp5K2URHJuTM6b/mG6uRgHfrEUhHnOlx2fS1p1a3sY/0AY5GiTNnjJ
	 wlbxl/nHstHPg==
Date: Tue, 28 May 2024 10:15:36 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible
 string for i.MX95
Message-ID: <20240528151536.GA275498-robh@kernel.org>
References: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
 <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: DIZ5NGXZBZSBYVAGXO3KQVHBOTUDGC4T
X-Message-ID-Hash: DIZ5NGXZBZSBYVAGXO3KQVHBOTUDGC4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIZ5NGXZBZSBYVAGXO3KQVHBOTUDGC4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 21, 2024 at 06:13:35PM +0800, Shengjiu Wang wrote:
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
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> clocks and clock-names properties.
> 
> On i.MX95, the 'interrupts' configuration has the same constraint
> as i.MX93.
> 
> Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
> there is no such hardware setting.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 37 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..d1dcc27655eb 100644
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
> @@ -49,6 +50,9 @@ properties:
>        - description: PHY clock
>        - description: SPBA clock
>        - description: PLL clock
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
>  
>    clock-names:
>      items:
> @@ -56,6 +60,9 @@ properties:
>        - const: phy
>        - const: spba
>        - const: pll_ipg
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 4
>  
>    dmas:
>      items:
> @@ -79,15 +86,24 @@ required:
>    - clock-names
>    - dmas
>    - dma-names
> -  - resets
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-xcvr
> +    then:
> +      required:
> +        - resets
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx93-xcvr
> +              - fsl,imx95-xcvr
>      then:
>        properties:
>          interrupts:
> @@ -98,6 +114,25 @@ allOf:
>          interrupts:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-xcvr
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          maxItems: 6

6 is already the max. Drop these and add a 'not' into the if schema (or 
list out the other compatibles).

> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
