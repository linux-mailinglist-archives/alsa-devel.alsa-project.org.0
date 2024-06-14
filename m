Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FD90C936
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4898AE67;
	Tue, 18 Jun 2024 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4898AE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718709958;
	bh=FLuaLPSxdc133WnTVEOu+S2w+iO0qN6ohvmaKluToUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0Bd08U1KDw+d2A/gFe96+3kZ+mmTIIagJDyZyALt/p7UpjszGKoNGeoetTKyZeC6
	 REJ/bT0kJSQId63pdo57D3qYUeV7TCMtOjYak2KoM9qYWC/i2RMLE15RgYiCLuMR7T
	 7yFkksXxib4aq5E3fgw/HSA7n/GxrmeauhXGU0eI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7691EF805B0; Tue, 18 Jun 2024 13:25:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0469F805D9;
	Tue, 18 Jun 2024 13:25:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F50F80448; Fri, 14 Jun 2024 18:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35819F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35819F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JHBh0ddi
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7955f3d4516so307195285a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718383617;
 x=1718988417; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=JHBh0ddi+CPGC/PsRLdQ3QM7lTc902r59HdxZTGz3XvM+pp87wgh2O/FL98rKKfyrh
         yyJDPY9TPxXA+xZ1v1smar9RmODMl6SoNa44LR3i0e7TrXI8Yes8XU8JcifB5Sp2KGyd
         8idUL/qZ9W9e8jTOrcMCvbH3b13Vmv93G/vJGwMRZ51q5CgI0u23wZyAIAmg5/P++21W
         FuQDkdg994y3QFYeH4YsRLWcLpK49A8y7k2O1wu1ITAkUqxXEIh4UyVH4h7CCi4hzGbY
         HmRldcI7hJbApR4xSwOXAt+pEjQzOObtIW5WZnDP7hV1645zccyZOg7xIQuNqjeLb12F
         c5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718383617; x=1718988417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=eZIz3E2j9PZ61+VqiAuj8yc8EFGK1ZXFpni1k9SI8EefXE3ZOfsEOey6Zfg42VT4/3
         N73OLjU+oDPUoNhyBWzL1JTQaPLRb+MHqu/TmA2bZkd1fBaU/s1Zsv94PQVSYJIu3UVW
         tBzSL7IqpX0OZnj3t23wCarHp1vhkezDrGeFl/SkSCe8VWk6/sPJRRW7lj904b8B/Y9g
         u7fbcGRXYbli9Hb8lb59+2H+nmrDaKQXA7cWpzHnRSWNWKnm7PYf8eSIK+7XyzTueAle
         VkDmwW4grQvXUZrMzt9+YhF3clKxz+80lTtl4cE8BmX4BNRf2XK0VbA2G3Mu9O1MV2fu
         ccTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXozoelw+73vuC0UGiUaG6CGWTH3Wb99NgKlNVb2XwOLEew8CIndzZMWPmLVR9SrXSg63Aqf5iL1P+ym1mFnkr1HHIdGfjH5duCg/I=
X-Gm-Message-State: AOJu0YzEw1eu7PZpNOohlWX+JsgK20AKmF1rd7Fmlo2a3TrNCCBPecSZ
	qhd+WHdg3AjVPxg5M19jLmMox2sh11EwDKwjpRUFn+kg+VBTaQZzHoNt8zttHp1QX7Zw4u0DGtA
	p87b9/ALX4Ra/CW2fstp6vSYQNQNivXcekvDe/A==
X-Google-Smtp-Source: 
 AGHT+IG0IJ7dklCKXgFvzQnpQNQ7ndgkvwrYf/nZPEe1c+OWwBjZSeclPr61zSJ2azVgXqhXLF4vvSLpkv+cY1EpiAk=
X-Received: by 2002:a0c:c486:0:b0:6af:33ed:87de with SMTP id
 6a1803df08f44-6b2af2eef89mr48619646d6.20.1718383617492; Fri, 14 Jun 2024
 09:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
 <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
In-Reply-To: <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:46:46 +0200
Message-ID: 
 <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q6ODB4STNR4DU3LM6ZAQM4ZNFXCYOEPK
X-Message-ID-Hash: Q6ODB4STNR4DU3LM6ZAQM4ZNFXCYOEPK
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:25:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6ODB4STNR4DU3LM6ZAQM4ZNFXCYOEPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 14, 2024 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:
> > On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > On a quick scan I can't see any architecture dependency for build,
> > > please add an || COMPILE_TEST for improved coverage.  As for all the
> > > other things enabled in this Kconfig file there is no need to explici=
tly
> > > depend on SND_SOC.
>
> > Ok. Later I will add a sound card driver to phytec3250 board which uses
> > arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
> > won't be needed.
>
> Why would a defconfig affect the Kconfig?
I guess when lpc32xx_defconfig enables the SND_SOC_FSL_LPC3XXX then the
COMPILE_TEST won't be needed or does it?


--=20
Piotr Wojtaszczyk
Timesys
