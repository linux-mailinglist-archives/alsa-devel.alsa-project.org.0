Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6087FE368
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 23:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A95846;
	Wed, 29 Nov 2023 23:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A95846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701297741;
	bh=DOLqmi7b50T9PkP3AmZzht9hiYWi7WRHf89m4vrUUkg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aLnfoia6pNwqOaNLYgHSvGODkqDy+9xYLOM1y9LVSWatGWuXEcd/B+Pxi2Wyu1h5E
	 FXOJ+SYT7vXjmj+hH2Bxsi49OPKReaMW15QvWwRzUzN73tzopEDAlCBSWV0D+JN6gH
	 wXmhQT94qH2KnGGyLveT1A+o8qsFYhWnQ+Wx8AgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70745F80579; Wed, 29 Nov 2023 23:41:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9634F80570;
	Wed, 29 Nov 2023 23:41:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D86F7F8016E; Wed, 29 Nov 2023 23:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73DDBF8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 23:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DDBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hq1k9GoW
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9fffa4c4f43so36657066b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 14:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297144; x=1701901944;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOLqmi7b50T9PkP3AmZzht9hiYWi7WRHf89m4vrUUkg=;
        b=Hq1k9GoWzrmV+7hvxXECVx3QmWAvDu83w3uwLLSHIfZhWvEfKnCmqTzGBSRI8u9R4M
         j/+1Sn4yHPSCAs368oOPNBOjwZjRcUvRQSYf2lOLqnrYt5OcEzO5ANCi89/CRpiL70es
         xxC+zyA6IVOuDdIHivb0Z20EsJWpTbMST6JBRH1HfXWptcpWoC/7DBuSAcxr+QTqXJKP
         lF/LUqDcD7Wy9iFy6o1NSspHU0RHvRob6w7CR9k/dCcuG6fXXQaxAd0NYbePtc87EeS+
         4fXClVvcA3fJMlNCL2NFVLJoOxgiXgTOtWEp/j9umn6AGWD6HImUWmeSY0w/hXk0WQqL
         JN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297144; x=1701901944;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOLqmi7b50T9PkP3AmZzht9hiYWi7WRHf89m4vrUUkg=;
        b=jduDWBRWf2ydHkb6QIEifkbZEsiBJhataVGFxc9/ZkRbRVkJx7IkaBBg1+HMnwB0V+
         JfunGDhxaEh6eyT1IwqGkS2Y/bjMj4t4a51uCH/5717aRmEO3TTtmIOFlvU/P1A5avx3
         w+LueMU2nvltEOQJoUWgeCulVilJ5FAbCdoUinkqsXKGWHQ2oos9YYqaPeTfG5msSy9i
         jA3gzN2FPJGMMKpcv1qnX+SGMPelsRngI58YVrF/eILN4J+Yn72bpJEVxeXeau8SkagW
         wf9u2m73XBanLe9SXSLw+G/e+xxMWhGykzMutif8a+F6d0zrDzuMyoEbYIPJEUNV41Xs
         XQtA==
X-Gm-Message-State: AOJu0YzDrSH4UqkkLH88ecqYfGUXcEvO6OlfqxGRvsHUodgnh+DGxL/D
	4irklV66c8qpOjAPmMaCvhc=
X-Google-Smtp-Source: 
 AGHT+IFyCzzmiNEl9u2pt+nptCpuv+o0WdKpbzFpF4OyVP9Z1zNN9Y7i8EakVpt69tVWsfMMW5D5xg==
X-Received: by 2002:a17:906:9597:b0:a18:a1f:3c2d with SMTP id
 r23-20020a170906959700b00a180a1f3c2dmr890906ejx.66.1701297143495;
        Wed, 29 Nov 2023 14:32:23 -0800 (PST)
Received: from giga-mm-2.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 n20-20020a170906119400b009fbdacf9363sm8282987eja.21.2023.11.29.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:32:22 -0800 (PST)
Message-ID: <68b3c0a5d1ad283e3a43b6a011e683a32732555c.camel@gmail.com>
Subject: Re: [PATCH 06/10] ASoC: cs4271: Convert to GPIO descriptors
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
Date: Wed, 29 Nov 2023 23:32:21 +0100
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-6-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
	 <20231129-descriptors-sound-cirrus-v1-6-31aa74425ff8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Message-ID-Hash: E3HHOC64KWOPKN7CEEPDFONGX6C3QZO6
X-Message-ID-Hash: E3HHOC64KWOPKN7CEEPDFONGX6C3QZO6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3HHOC64KWOPKN7CEEPDFONGX6C3QZO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Linus,

On Wed, 2023-11-29 at 22:28 +0100, Linus Walleij wrote:
> This converts the Cirrus CS4271 ASoC codec driver to use
> GPIO descriptors.
>=20
> It turns out that there are two in-kernel users of the platform
> data passing mechanism so these are switched over as well.
>=20
> One locally defined GPIO "gpio_disabled" is declared in the
> state struct but completely unused in the driver, so we delete
> it.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> NB: the affected platform EP93xx is being converted to device tree
> I don't know if that is happening in this merge window, but the
> colission should be manageable.
> ---
> =C2=A0arch/arm/mach-ep93xx/edb93xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 32 +++++++++++++++++++++++++----
> =C2=A0arch/arm/mach-ep93xx/vision_ep9307.c | 12 ++++++++++-

I'm not sure about this merge window, but you are right, the above files
will be removed.

> =C2=A0include/sound/cs4271.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0sound/soc/codecs/cs4271.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++------------------------

Codec driver is untouched by the mentioned DT-conversion series.

> =C2=A04 files changed, 52 insertions(+), 32 deletions(-)

--=20
Alexander Sverdlin.

