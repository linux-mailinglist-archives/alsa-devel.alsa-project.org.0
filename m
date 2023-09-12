Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0A79D834
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 19:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8F0950;
	Tue, 12 Sep 2023 19:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8F0950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694541576;
	bh=JEv/PdS67apPPBjdgQMt1j8LrthrJDQTeiNjt0wyv5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O3+vKnIC4P6p18kQS0tZzpom8sfiKji112OJzbyt/twys8yFEm1jV8/IFEzHfb9bR
	 jHk/WlYCGuBoHMljZesVELMmeHJz0CttcyZbE1hOP2WYXj5Yhnp7L12TET/laDIdfq
	 dg2vWWnYlr5nIQ9mjA8wZI8h+wUzKxPz4l568D9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD861F80246; Tue, 12 Sep 2023 19:58:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30982F80212;
	Tue, 12 Sep 2023 19:58:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58F9F80246; Tue, 12 Sep 2023 19:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67D18F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 19:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D18F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ithTbuEX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48931B81F65;
	Tue, 12 Sep 2023 17:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2528FC433C7;
	Tue, 12 Sep 2023 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694541516;
	bh=JEv/PdS67apPPBjdgQMt1j8LrthrJDQTeiNjt0wyv5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ithTbuEXHG9CuKyDzU3aAaCHAG1P5uJ5YZbd/qweVdrPAF5pV7q7RtR/HDfMyoDOP
	 H822WkrV5CX4Fq+iFeCsXJMz6BnLIRGwSZYcP9aLlnEZn+VGPTqWZwMDnA/4VTCMhL
	 RLWVZq784lcSovlKvyvzkikfqvqSPOGJ2kBqOc4ciFw49KfsGmoqipaSJf7O28ZeN6
	 Ec3DP2VTHfvStE6eYO90HFNMGgq5SSVEeaOppqUqVhAZP+STV1pZJ398noPJDUdqFX
	 fLqH+2Mch4T41Qw/5FTmWDbezjrCBXuiZlwAyQ23NO0J1w9sN0D4Ywp4Vq4VtwwhJR
	 pREO8HFu0mPfA==
Received: (nullmailer pid 998213 invoked by uid 1000);
	Tue, 12 Sep 2023 17:58:32 -0000
Date: Tue, 12 Sep 2023 12:58:32 -0500
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
 Simon Horman <hor
 ms@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 06/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Fix example property name
Message-ID: <20230912175832.GA995540-robh@kernel.org>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-7-herve.codina@bootlin.com>
Message-ID-Hash: RR7HSO2T5APBU264K7XAIKSC6N7YPU2F
X-Message-ID-Hash: RR7HSO2T5APBU264K7XAIKSC6N7YPU2F
X-MailFrom: SRS0=xM+6=E4=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RR7HSO2T5APBU264K7XAIKSC6N7YPU2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 10:14:57AM +0200, Herve Codina wrote:
> The given example mentions the 'fsl,mode' property whereas the
> correct property name, the one described, is 'fsl,operational-mode'.
> 
> Fix the example to use the correct property name.
> 
> Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I have this same fix in my tree, but you missed something. Please add 
additionalProperties or unevaluatedProperties to the child node schema 
so that this error is flagged.

> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> index ec888f48cac8..450a0354cb1d 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> @@ -137,7 +137,7 @@ examples:
>          channel@16 {
>              /* Ch16 : First 4 even TS from all routed from TSA */
>              reg = <16>;
> -            fsl,mode = "transparent";
> +            fsl,operational-mode = "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask = <0x00000000 0x000000aa>;
>              fsl,rx-ts-mask = <0x00000000 0x000000aa>;
> @@ -146,7 +146,7 @@ examples:
>          channel@17 {
>              /* Ch17 : First 4 odd TS from all routed from TSA */
>              reg = <17>;
> -            fsl,mode = "transparent";
> +            fsl,operational-mode = "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask = <0x00000000 0x00000055>;
>              fsl,rx-ts-mask = <0x00000000 0x00000055>;
> @@ -155,7 +155,7 @@ examples:
>          channel@19 {
>              /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
>              reg = <19>;
> -            fsl,mode = "hdlc";
> +            fsl,operational-mode = "hdlc";
>              fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
>          };
> -- 
> 2.41.0
> 
