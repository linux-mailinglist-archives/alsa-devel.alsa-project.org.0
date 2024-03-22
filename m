Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE65887307
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Mar 2024 19:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB8A231C;
	Fri, 22 Mar 2024 19:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB8A231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711131987;
	bh=RwHY4kKkuowcYOd73RCFF27l2zk9ErD/idcQSeCbsB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kYVHjq3fewznaAbyh59P/Fa4y9NcOLsIisa2ag9VwsJZ+lVwFEjSv4qPGco+3TWE5
	 KSZBh8oa/Sr68kMCrPXG7oe3PTAd7rUObiJA07U8JbeGJDi5fnHbg3CcEWsMOnMr74
	 vx34hCPSWFwZR5qBlRFNWBKuOXMUDxuAC2dqy07I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E6DF8057F; Fri, 22 Mar 2024 19:25:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13D64F80548;
	Fri, 22 Mar 2024 19:25:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1636AF804E7; Fri, 22 Mar 2024 19:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12199F80088
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 19:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12199F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=adGf2adv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8855461451;
	Fri, 22 Mar 2024 18:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1A7C433F1;
	Fri, 22 Mar 2024 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711131937;
	bh=RwHY4kKkuowcYOd73RCFF27l2zk9ErD/idcQSeCbsB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adGf2advdH7mtPAI6LWLrCF55jo55GHScWs1R00yToTEcNFzMKUKBNCsfjLzoPPu6
	 fsof38KyLXsR8Jc6nbXPIFO+zJ1gGxMSEKyd3N08hQXpugsmaEoAwWmDPFfhujcU6W
	 zqckAd3iRoFKWrCATZtfPhgaZOPf3nyya4tx809mn4H4b/ZgU5mdwP75S7cBh+iAUl
	 tdNg4PDkwViKc0NTI/8/XZkA6lKGuXYloYtH4XEeT80jvnXJO9J37/Co+wPWwUY6TT
	 OPSTGpVi5PK3LEJP7TUg5ULsbWgUnx84qh026xrR5QOo0zASYMAtu3zxRoLqjqNsD6
	 aKyouE/5PwYxg==
Date: Fri, 22 Mar 2024 13:25:34 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID: <20240322182534.GA1220647-robh@kernel.org>
References: <20240322025405.3340064-1-wtli@nuvoton.com>
 <20240322025405.3340064-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322025405.3340064-2-wtli@nuvoton.com>
Message-ID-Hash: GHNWWZXH4RPOJNJICKZRYPXNZRLSQNZV
X-Message-ID-Hash: GHNWWZXH4RPOJNJICKZRYPXNZRLSQNZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHNWWZXH4RPOJNJICKZRYPXNZRLSQNZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 22, 2024 at 10:54:04AM +0800, Seven Lee wrote:
> Add a DT schema for describing nau8325 audio amplifiers. The key features
> are as follows:
>   - Low SPK_VDD Quiescent Current
>   - Gain Setting with 2-wire interface
>   - Powerful Stereo Class-D Amplifier
>   - Low Output Noise
>   - Low Current Shutdown Mode
>   - Click-and Pop Suppression
> 
> More resources :
> https://www.nuvoton.com/products/smart-home-audio/audio-amplifiers/class-d-series/nau8325yg/
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> new file mode 100644
> index 000000000000..6ded94c0e644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAU8325 audio Amplifier
> +
> +maintainers:
> +  - Seven Lee <WTLI@nuvoton.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,nau8325
> +
> +  reg:
> +    maxItems: 1
> +
> +  nuvoton,vref-impedance:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The vref impedance to be used in kohms. Middle of voltage enables
> +      Tie-Off selection options. Due to the high impedance of the VREF
> +      pin, it is important to use a low-leakage capacitor. Possible
> +      values are 0, 1, 2, and 3 as per the below,
> +
> +      0 = Disable tie off resistance
> +      1 = 25 kohms
> +      2 = 125 kohms
> +      3 = 2.5 kohms
> +    enum: [ 0, 1, 2, 3 ]

Once again, use standard unit suffix on the property name: 

nuvoton,vref-impedance-ohms:
  enum: [0, 2500, 25000, 125000]

Rob
