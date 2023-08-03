Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E2C76DCD1
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 02:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0075C7F4;
	Thu,  3 Aug 2023 02:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0075C7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691023443;
	bh=sMyYGYV+daQEXu9U9KfwcmU+VhaGsKxq6qGTUSsc7zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQqL+q7FZABHln2EJ+S//6wB/h4j4K8JIOQCMIjhgWOOWHrthILQwSAZf/dbKjAmA
	 jG0FQqVdzk6HeB0tZVulQm8Za7verwo02Ao4tmpHZvxl9G+cd9nIshzqCbE89HP4Z6
	 4t2Zg/5/ZoIfYINNFBtKWcPT5puimxv+A6fARwfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE1D3F80425; Thu,  3 Aug 2023 02:43:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B0A4F80087;
	Thu,  3 Aug 2023 02:43:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B7FF8025A; Thu,  3 Aug 2023 02:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C931AF80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 02:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C931AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LwZ1fEjU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ECBE561A17;
	Thu,  3 Aug 2023 00:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34502C433C7;
	Thu,  3 Aug 2023 00:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691023382;
	bh=sMyYGYV+daQEXu9U9KfwcmU+VhaGsKxq6qGTUSsc7zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwZ1fEjUSF7n8qH0OoGZ45G5krqCTBLcBT/ZlJjYQ3FUQ8kOkXXqFRApZzPxnEKNw
	 oSHphqh4MxgJ/g0LZYDhvTo1EPwjAhp4mxbThhMBU0kldTAuUfaw8UEASJrgKfOElz
	 6aK+3SX6CxDu9AKt97NoLq/Brr1GnyPgW88jyrkPLQNd1DloZxFL+zREjqheUcL6v1
	 odBrjHOLdu5jNqcMdlZ97KzHxiM8bYQ43DLho6dCs6buh8OgtOM0q5oQZ7yR0+jwlb
	 BOfbk64j7YuyGWwD4uIR0Z7caVQdt93ng74Q8rRjNh5621MX76STDEb20XifLJnKi5
	 cxDiGF1P78n5Q==
Received: (nullmailer pid 1600519 invoked by uid 1000);
	Thu, 03 Aug 2023 00:42:59 -0000
Date: Wed, 2 Aug 2023 18:42:59 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 27/28] dt-bindings: net: fsl,qmc-hdlc: Add framer
 support
Message-ID: <20230803004259.GA1598510-robh@kernel.org>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-28-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-28-herve.codina@bootlin.com>
Message-ID-Hash: SMOYHYH73SHMIXZKWQDJKUGPLHJJIR3Z
X-Message-ID-Hash: SMOYHYH73SHMIXZKWQDJKUGPLHJJIR3Z
X-MailFrom: SRS0=IuJv=DU=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMOYHYH73SHMIXZKWQDJKUGPLHJJIR3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 26, 2023 at 05:02:23PM +0200, Herve Codina wrote:
> A framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM used by the QMC
> HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the line and
> configure the line.
> 
> Add an optional framer property to reference the framer itself.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> index 8bb6f34602d9..bf29863ab419 100644
> --- a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> @@ -27,6 +27,11 @@ properties:
>        Should be a phandle/number pair. The phandle to QMC node and the QMC
>        channel to use.
>  
> +  framer:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Now you've defined this property twice. Please avoid doing that.

> +    description:
> +      phandle to the framer node
> +
>  required:
>    - compatible
>    - fsl,qmc-chan
> -- 
> 2.41.0
> 
