Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D09758844
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 00:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748C01DF;
	Wed, 19 Jul 2023 00:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748C01DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689718196;
	bh=BcSJ+APt15bxTEa2qIWY+dbSjXSa6zCDNvGS//Pq2Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYjKtnMii79R/Pg7AnEHrap48oA5HN4heQQohzwqAwSxgq9dlAGlY3cBySlxPPTx+
	 qjVdlLc2Ut/5R/hoxSVT2zCxQFWRoISHqpVRVt2JZMo22jw/feWRkLDGf4Rw1qYY5h
	 CGl02mVNkm8qrF2+w/iaO85ijSGoEaS8CntvXhNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E84F80520; Wed, 19 Jul 2023 00:09:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EE1F8032D;
	Wed, 19 Jul 2023 00:09:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 286F0F8047D; Wed, 19 Jul 2023 00:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7B6FF800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 00:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B6FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mrz2Gd2A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CFFF6123E;
	Tue, 18 Jul 2023 22:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CECC433C7;
	Tue, 18 Jul 2023 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689718126;
	bh=BcSJ+APt15bxTEa2qIWY+dbSjXSa6zCDNvGS//Pq2Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mrz2Gd2AHkJMrJ6fkA1itsrLXUW7EkYGZ0A0UFy/PU40f2AVA4OvFVWYJYmZrX1GL
	 fuDhQK+hM7XWG0gIqwYoWOQuvpKPWE3s2Cm2o8aBFO2sd2kZN5o9aqWuunbxoSS2ey
	 yXiooGgGiNovpynYnVnQ3ea1VDeh2tmZlSjnRHCNNqMWPQ6fRwN2N6J7b5bIzBlURK
	 wub6eymDeU1uRAyRbWXe2rzwv8gOJRt41q47jm90N77uC6309g2YfXf0LbVwjhgN2f
	 eSsaZZ/ni74+OpmzyDoB/S73mm7utxpptKLuw8qcYVxJN+lLLByWSlf8Xh1vxRnZ42
	 zib9oxJRH4Z0w==
Received: (nullmailer pid 1979772 invoked by uid 1000);
	Tue, 18 Jul 2023 22:08:43 -0000
Date: Tue, 18 Jul 2023 16:08:43 -0600
From: Rob Herring <robh@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Astrid Rost <astrid.rost@axis.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: add triggers
 properties
Message-ID: <20230718220843.GA1944897-robh@kernel.org>
References: <20230715083046.108674-1-fido_max@inbox.ru>
 <20230715083046.108674-3-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715083046.108674-3-fido_max@inbox.ru>
Message-ID-Hash: Z5RKGR56G6JXBILZWYNC6UI3QG5BBEZF
X-Message-ID-Hash: Z5RKGR56G6JXBILZWYNC6UI3QG5BBEZF
X-MailFrom: SRS0=7L2B=DE=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5RKGR56G6JXBILZWYNC6UI3QG5BBEZF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 15, 2023 at 11:30:43AM +0300, Maxim Kochetkov wrote:
> The trigger-start/stop properties allows to specify DAI link
> trigger ordering method.

Obviously. Why do you need these? What problem does it solve?

I don't think these belong in simple-card. What's next? What if you need 
delays between each step? This is the problem with 'simple' or 'generic' 
bindings. It's a never ending addition of properties which are not well 
thought out.

> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  .../bindings/sound/simple-card.yaml           | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 59ac2d1d1ccf..f1878d470d83 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -99,6 +99,28 @@ definitions:
>      description: the widget names for which pin switches must be created.
>      $ref: /schemas/types.yaml#/definitions/string-array
>  
> +  trigger-start:
> +    description: |-
> +      Start trigger ordering method:
> +      default: Link->Component->DAI
> +      ldc: Link->DAI->Component
> +    $ref: /schemas/types.yaml#/definitions/string
> +    items:
> +      enum:
> +        - default

Why do you need a value of 'default'? What's the default when the 
property is not present?

> +        - ldc
> +
> +  trigger-stop:
> +    description: |-
> +      Stop trigger ordering method:
> +      default: DAI->Component->Link
> +      ldc: Component->DAI->Link
> +    $ref: /schemas/types.yaml#/definitions/string
> +    items:
> +      enum:
> +        - default
> +        - ldc
> +
>    format:
>      description: audio format.
>      items:
> @@ -210,6 +232,10 @@ properties:
>      maxItems: 1
>    simple-audio-card,mic-det-gpio:
>      maxItems: 1
> +  simple-audio-card,trigger-start:
> +    $ref: "#/definitions/trigger-start"
> +  simple-audio-card,trigger-stop:
> +    $ref: "#/definitions/trigger-stop"

Don't continue this 'simple-audio-card,' prefix pattern. With it, no 
other binding can use these properties.

>  
>  patternProperties:
>    "^simple-audio-card,cpu(@[0-9a-f]+)?$":
> @@ -259,6 +285,11 @@ patternProperties:
>          maxItems: 1
>        mic-det-gpio:
>          maxItems: 1
> +      trigger-start:
> +        $ref: "#/definitions/trigger-start"
> +      trigger-stop:
> +        $ref: "#/definitions/trigger-stop"
> +
>  
>      patternProperties:
>        "^cpu(-[0-9]+)?$":
> -- 
> 2.40.1
> 
