Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D55B4779796
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 21:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43AA826;
	Fri, 11 Aug 2023 21:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43AA826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691781227;
	bh=jVzy3ed5zrK+W0/TGI4rspWx8gcOBVlaPTtRjlEuPAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4Vip3EtY6R2MlKx+4eKg02KSJYgEDEde17fYdwiaD+GbfQVz2NFBrk3pCZMb/tJn
	 D6eMQR9ff3NiV1MiJk6oQQN+xq3AxXuNnRDtVCrBLaCTvoZq8wRHJLM7KnUBmU7HAs
	 rnqdATpmwJrfVZxD6EQPmgTIlxdBfSh9rvekRBZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1922F80510; Fri, 11 Aug 2023 21:12:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0A5F80134;
	Fri, 11 Aug 2023 21:12:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27017F80166; Fri, 11 Aug 2023 21:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38BC8F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 21:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38BC8F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hDbN7N4O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2583663308;
	Fri, 11 Aug 2023 19:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96157C433C7;
	Fri, 11 Aug 2023 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691781158;
	bh=jVzy3ed5zrK+W0/TGI4rspWx8gcOBVlaPTtRjlEuPAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDbN7N4OKVJrt6ST0CDhlPncPZnZVq/afcmTZkC6fO4bxbZwpFP2ZTcNa//l5AKwI
	 a7FRNyb9axYwj2zLAvickZPG0pcaHKnBKY8LOBb1doUeRa/kPSHdrIG/CGDEuIAGZs
	 4zyPG6ynAMDSqVbwDUNEhL7+wD9U32aa5HNNBdXq6aSSCvnxAUi/zbBxM2Qgo7/pPO
	 KiGTEzD2/y1Zw5oGNhTyByRe/fp0pDH+HH2SnAudAfgfh5uwV3iRqI5gsLyliXTFkc
	 w5cC4ae3Wpe9tDpqynVfRQ4v3oYXZ4ndMWR/pZ/Xf/BKz2eDds1excCmpSZY+QD21N
	 vwg5p5bJ6DKbQ==
Received: (nullmailer pid 3960943 invoked by uid 1000);
	Fri, 11 Aug 2023 19:12:36 -0000
Date: Fri, 11 Aug 2023 13:12:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, spujar@nvidia.com, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 devicetree@vger.kernel.org, daniel.baluta@gmail.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: simple-card: Document new DAI
 flags playback-only/capture-only
Message-ID: <20230811191236.GA3937407-robh@kernel.org>
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
 <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
Message-ID-Hash: HQVC5YSW2MAAIWU7XLPY3BKV4GRG7W6A
X-Message-ID-Hash: HQVC5YSW2MAAIWU7XLPY3BKV4GRG7W6A
X-MailFrom: SRS0=B9gh=D4=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQVC5YSW2MAAIWU7XLPY3BKV4GRG7W6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 01, 2023 at 11:24:33AM +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Document new playback-only and capture-only flags which can be used when
> dai link can only support just one direction: playback or capture but
> not both.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 59ac2d1d1ccf..1bf331f095a4 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -27,6 +27,14 @@ definitions:
>      description: dai-link uses bit clock inversion
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  playback-only:
> +    description: dai-link is used only for playback
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  capture-only:
> +    description: dai-link is used only for capture
> +    $ref: /schemas/types.yaml#/definitions/flag

Wouldn't this be implicit based on limitations in the either the cpu or 
codec DAI?

Rob
