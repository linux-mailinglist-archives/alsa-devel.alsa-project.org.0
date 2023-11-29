Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED907FE36B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 23:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B99DEC;
	Wed, 29 Nov 2023 23:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B99DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701297762;
	bh=hRE/ZeKeoYNX6Vf/61W7vqKcLPREr2ot/tRo97pnCMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EMwWOojOhakmuMCOmPsPcn26u6Dv9EmdWC6jjKPrh8f/3gu+Gwmqtl2U3atF1xh2r
	 6s6U6c//uDrsIzIBK/2pBW21cEKdoFCFWSb/tFvG27qLBXVl1IGuYQvRVlFgZ3SL+o
	 CicYlpN/3QxsuI7CAJs1Ajn6Aq5ohqF0v6MXrMkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 636B9F805AD; Wed, 29 Nov 2023 23:41:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FAAF805BA;
	Wed, 29 Nov 2023 23:41:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BAD3F8016E; Wed, 29 Nov 2023 23:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A64FF8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 23:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A64FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FNeTxJ9z
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bc4fe8158so537419e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 14:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297325; x=1701902125;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRE/ZeKeoYNX6Vf/61W7vqKcLPREr2ot/tRo97pnCMA=;
        b=FNeTxJ9z4OtMe7kd0NRgEBGaK0rE8vaVqvrhiLd9niTkRDBvkrnMjk2W5v59wPvZBA
         yK4YSTNaHzdJKpo5ShLPwQc4UlB20W8CdnOhOufjFaBz3/rzMgZIr8Evw3GGK+bVVv81
         +QiyYZJbImYmBVZFlBZp5dr8alIykRFoRBRBbvxriqnfjGE8b4f55TClzFXJMZuc/Pu5
         WOOglUdykdX8Ev54PpDeWA/EyDxEdnj7gmPqFFqIuI4DZatg3pJnf5/yJFT5p5W+9RTx
         OQdwM2m+vVJiSHsBmXnnbZ3I+ii0n9xvufZ/9i2sQfB5isZScfw8uyUCTfxXLWmV9gGb
         MO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297325; x=1701902125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRE/ZeKeoYNX6Vf/61W7vqKcLPREr2ot/tRo97pnCMA=;
        b=Lqs35d7Z+pc7JBTiHBuU6IPCiMPTHyGOqy1Aua0heOT+71JMVDpl/uo7hQh4xhmSvO
         q7HTs5N4eKwd/6V28AP80tMli0eFuw1DrZ9M0/hNkBJ2UWMy7R+oLXQhvbiH77SK8CDt
         1pwL66/fYhoHD4zESYZjYcum9pDWNFLl55VDbxIMlkhlI0OuyKoy+29scOm7ZTDOOtfr
         8CIMp3DptbO3yS6Ujlo2L2MvGpOXNh2MpGtOke+hsF/z9yfNPenqDJA6XiZaAqCXW9Na
         HhEbCuJA7su4e/Uyb3N1pLx4pIBPamycenAgrzLxpDUWnHIn2gWLpD2yLVN00sEMr71x
         RZHQ==
X-Gm-Message-State: AOJu0Yxe4hP6jobKO6+2B/ngU48bqOt9eQxHaIapLDtufZUNlq8RKsDi
	9aMklKqY3X2KST6ovmxPiFs=
X-Google-Smtp-Source: 
 AGHT+IHMTtewj1OpKKrv9w8dlqrbUmKXuKo1rZmXlkmDpu59ZY+dRugABrqRKS87dzEHJMDpaTHD+g==
X-Received: by 2002:a2e:8691:0:b0:2c9:bc5b:4694 with SMTP id
 l17-20020a2e8691000000b002c9bc5b4694mr2604639lji.1.1701297325288;
        Wed, 29 Nov 2023 14:35:25 -0800 (PST)
Received: from giga-mm-2.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a1709062a0800b00a0185ccedcasm8372160eje.223.2023.11.29.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:35:25 -0800 (PST)
Message-ID: <8d6a9317cd45f2841020e091000344f5683c11a4.camel@gmail.com>
Subject: Re: [PATCH 07/10] ASoC: cirrus: edb93xx: Drop legacy include
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Paul Handrigan
 <Paul.Handrigan@cirrus.com>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Nikita
 Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 29 Nov 2023 23:35:24 +0100
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
	 <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Message-ID-Hash: TYWC5EUHHMR7EFF6E44NSS6FYNOXSCGP
X-Message-ID-Hash: TYWC5EUHHMR7EFF6E44NSS6FYNOXSCGP
X-MailFrom: alexander.sverdlin@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYWC5EUHHMR7EFF6E44NSS6FYNOXSCGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Linus,

On Wed, 2023-11-29 at 22:28 +0100, Linus Walleij wrote:
> This driver includes the legacy GPIO API <linux/gpio.h> but
> does not use any symbols from it.
>=20
> Drop the include.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

This file is going away as well at some point,
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20231122-ep93xx=
-v5-38-d59a76d5df29@maquefel.me/

> ---
> =C2=A0sound/soc/cirrus/edb93xx.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
> index 6b6817256331..8bb67d7d2b4b 100644
> --- a/sound/soc/cirrus/edb93xx.c
> +++ b/sound/soc/cirrus/edb93xx.c
> @@ -11,7 +11,6 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/platform_device.h>
> -#include <linux/gpio.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/soc/cirrus/ep93xx.h>
> =C2=A0#include <sound/core.h>

--=20
Alexander Sverdlin.

