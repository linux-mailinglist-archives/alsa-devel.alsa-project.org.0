Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD898CD3A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 08:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CACB86E;
	Wed,  2 Oct 2024 08:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CACB86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727850929;
	bh=kZactbzkGLvIf55iTrfvDZUTnZYhhrM6fam3OYt5M60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SKc+yrA6hb7VLG8Nr6xcqN0WY/tI7nC1Nb+oaavf8dhHhLA0PAxuvAiBv05xPlcN3
	 NA42lxIyhCN6WokW68iZh1V/kukZvOl8zzEZPqKxR365hC88Kgt6YRkXCKNhJE7w4A
	 T4ozHeTymbrA0CC1MKF/8ENwNLw6YExI3f2W2Gqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC32AF805B1; Wed,  2 Oct 2024 08:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B8EF805B0;
	Wed,  2 Oct 2024 08:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A79FF80517; Wed,  2 Oct 2024 08:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AA28F80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 08:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AA28F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BGhF7yqn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75D945C4C52;
	Wed,  2 Oct 2024 06:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DF4C4CEC5;
	Wed,  2 Oct 2024 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727850888;
	bh=kZactbzkGLvIf55iTrfvDZUTnZYhhrM6fam3OYt5M60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGhF7yqnJ4N9URaNogLV1xTP6Ja1d18GsaE0NpThtLb8t9SFOuHx36Dch+NIbarDP
	 EVLW1+APOzu3H6q1BoSxDpYHTV1IwhNYWielXKWvEdML3iJx7WpxVRfeqaMAqKgRiK
	 Pejze5Jh9FGCkyWBpLRM1+7VtNH6zwD7YgjCxWpXKI5euN06grBQ7M+PRSB2lhhb9s
	 bV6wbY02W9yMe5jgAUTfyrUbfDxT1x/8Zr9slkTP0RAZdahmcvvKEHev44I73W2rzR
	 a4YNunCY9i4botDsNVMtKjNyk8LA0kcOTHYbMjibXYeQXsgjyA/9DS7WwmlLhQU0oM
	 SORzAASIKqJxg==
Date: Wed, 2 Oct 2024 08:34:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
Message-ID: <7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Message-ID-Hash: ZU72C2FFU2TC53Z5CUBD5YQFHEZMWAL7
X-Message-ID-Hash: ZU72C2FFU2TC53Z5CUBD5YQFHEZMWAL7
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZU72C2FFU2TC53Z5CUBD5YQFHEZMWAL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 01, 2024 at 10:47:49PM +0200, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.
> 
> Looking at the interrupt-names definition (which uses oneOf instead of
> anyOf), it makes indeed little sense to use anyOf in the interrupts
> definition. I believe this is just a mistake, hence let's fix it.
> 
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> ---
>  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> index 7735e08d35ba..ab3206ffa4af 100644
> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -102,7 +102,7 @@ properties:
>      default: 2
>  
>    interrupts:
> -    anyOf:
> +    oneOf:


You need to change interrupt-names as well.

Best regards,
Krzysztof

