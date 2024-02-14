Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8E85450C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 10:23:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BCD852;
	Wed, 14 Feb 2024 10:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BCD852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707902612;
	bh=WCHyzEMYsmkXeKhRjOyGsH4SWHf2Zvhc93CpPJCsZ70=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pp0eOQNr4XijA5MArShqzAr31vO2kH3tTzbgKHH6KkHSscPv/85xHcuY3Jhxd4Onn
	 xVQ5qh4OyL3o1uQUbaoYinpb1wfkt6Hp2o5lyfDo45zH02eTOK4NPJHGsxH/jzfNFW
	 5bisW3rJ65IDIr2jZ1k9plyciEP+ige+TuEsdLX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C0EF805A1; Wed, 14 Feb 2024 10:23:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B11CF8057B;
	Wed, 14 Feb 2024 10:23:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D86EF80238; Wed, 14 Feb 2024 10:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9766FF80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 10:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9766FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sXREtOAL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C46A6173D;
	Wed, 14 Feb 2024 09:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94F1C433C7;
	Wed, 14 Feb 2024 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707902575;
	bh=WCHyzEMYsmkXeKhRjOyGsH4SWHf2Zvhc93CpPJCsZ70=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sXREtOALLSk9HLU/IAkBc01Hi9HoDS6Or5Sv/JMYpiKFgjkf4xdspqPQGqomiYxx5
	 sxP35EhvKauE8uaveXi5cS95yAP+lYX9o6/0qZTE+6tJO9q/t+yDkCi/VAluBT2zWV
	 cCrcJ2ODMKPizw3HZ2OhChXVBvhxP3PpQor4m1akf9gHQ68SftBeCa/1txMmLcx4Uc
	 FsxTu5hCf/edc1IXOClP9fmCJgRiiCzRhjpvoTgjeuuIShtxgS3/j7nX/nbN1CorHs
	 VldjhSBRZRuJVzQhmponH0NXjJ8r3p0Km2t4aDMLZ0QigKFVT2JEj4DcpiFLaS6vuG
	 yR1WPHXGFGKJg==
Date: Wed, 14 Feb 2024 03:22:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, alsa-devel@alsa-project.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-sound@vger.kernel.org
In-Reply-To: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
References: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
Message-Id: <170790257251.233964.609546720299928474.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sound:atmel-at91sam9g20ek: convert
 bindings to json-schema
Message-ID-Hash: NPVDG26NQFQBZM6YXIBBJPL4NNXV6LZO
X-Message-ID-Hash: NPVDG26NQFQBZM6YXIBBJPL4NNXV6LZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPVDG26NQFQBZM6YXIBBJPL4NNXV6LZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 14 Feb 2024 12:10:06 +0530, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 60 ++++++++++++++++++++++
>  .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 ----------
>  2 files changed, 60 insertions(+), 26 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml:26:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml:27:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

