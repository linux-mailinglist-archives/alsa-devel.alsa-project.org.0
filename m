Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B67BCDF4
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Oct 2023 13:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D99208;
	Sun,  8 Oct 2023 13:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D99208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696763141;
	bh=vCqlJo8FqMtcmRaF/pU4r/VoZYENK98niLfnThUcTz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pBUx6gW3sDi8PHP9fJ6VQRrYzCIQzvF38izoXubPtJ/idxztCUu2F0Ku6zwCzcjKt
	 taxY912LEs0Lj+/gmaLg7wzqhrNLW1HdTBE+8jjmaVQPThCY4ykYrZa4QfnNCrwuIS
	 dJDYS1xL+2/R1JdbIN+u+tu7zGLWsQbJbhNIOo1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E38DEF802BE; Sun,  8 Oct 2023 13:04:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF19F8027B;
	Sun,  8 Oct 2023 13:04:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4F4DF802BE; Sun,  8 Oct 2023 13:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED741F8019B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 13:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED741F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M6zLeg5l
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-534659061afso5975907a12.3
        for <alsa-devel@alsa-project.org>;
 Sun, 08 Oct 2023 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696762960; x=1697367760;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I2BwMPIdqGU2NqgXy5cot4/7RwrAa6qLkUv4kvr0lFI=;
        b=M6zLeg5lWQIldd5JZhkHRbqqxVLJzeu+/VrexrEf/R9C8quYBk8ACWYhzwPOXMsDf3
         wYJO9WK/11joQMLiEGrekPPGWPM5qPjUOK48Vsw4eVI8HC3jeIFuJlqdmv7Ya+YlOHYE
         xlttmSFVnBuXAzlMmHqlkYwYY5qR4wFlgToQrRndd8YYuB1Cgj/oHY2v5XSIA4AoxQNH
         WXLa3fsBcYkzT7RHmuJZlvdV+i3xAY255od1xGArlaSKRp3l4wDUdcxbdS7rLzhIYkJF
         smhdhlRY66DWD+xDAOHDfk7xgAqLppSFH65C/mCWAhmlDA4heWfAAZ11YGZXI3bv9lEP
         m2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696762960; x=1697367760;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2BwMPIdqGU2NqgXy5cot4/7RwrAa6qLkUv4kvr0lFI=;
        b=pYtpqLaQnEYlMbMdlj24TICmRf9uQjiPOii/DuHBoUTPElf8XKYAuIRz00YgqGE3Pu
         0PddlgbfFsqhKYB0UAAnS7SkYayMhVSVbR2OIKTCUIdzWn3wSyiYe/Jo+nQPRvvMhwt5
         IgSsjFEJKKOfra9miYwP3y925lXY3GlyTfb8fasdYC9uSKNWj8dKpVLDBAL9Vqp1V0FC
         KGZZkwLarMD2Tv/A68IdYzCow0YFJhfQm0UKAW4St/MHD406Sqy4czmNeR+6jUA+7OIS
         UDG22mIF7cB81g2N4LblDRHD6E+HvXKSA+gm31YnweM2gAQm4W3UkCap74KTkAjH0/0A
         EGTw==
X-Gm-Message-State: AOJu0Yx8pcaxMpYpvi+GH+66GYvz2Jk6UAnM4Q/gYYBEZLakDcDv1p8i
	+KDvybiz1cM2GKAgZI5Ljzk=
X-Google-Smtp-Source: 
 AGHT+IHy1m45sSABny17HsA0YPMhRhLbvYZX41pT4wKfbzc5vlhxyd/WQ3jpRgofkFJqcis5pkKN6A==
X-Received: by 2002:aa7:c393:0:b0:533:c55f:582a with SMTP id
 k19-20020aa7c393000000b00533c55f582amr11125186edq.27.1696762959595;
        Sun, 08 Oct 2023 04:02:39 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 r9-20020aa7d589000000b0052576969ef8sm4832770edq.14.2023.10.08.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:02:38 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Fix cx81801_receive() argument types
Date: Sun, 08 Oct 2023 13:02:36 +0200
Message-ID: <4229381.1IzOArtZ34@dell>
In-Reply-To: <8377873.NyiUUSuA9g@dell>
References: 
 <20231007213820.376360-1-jmkrzyszt@gmail.com>
 <2023100811-shakable-derby-0b91@gregkh> <8377873.NyiUUSuA9g@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2707487.BddDVKsqQX";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Message-ID-Hash: QCOSXHGMILWGWAG7ZCJPCSI4IOLUVDLK
X-Message-ID-Hash: QCOSXHGMILWGWAG7ZCJPCSI4IOLUVDLK
X-MailFrom: jmkrzyszt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCOSXHGMILWGWAG7ZCJPCSI4IOLUVDLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--nextPart2707487.BddDVKsqQX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 08 Oct 2023 13:02:36 +0200
Message-ID: <4229381.1IzOArtZ34@dell>
In-Reply-To: <8377873.NyiUUSuA9g@dell>
MIME-Version: 1.0

Dnia niedziela, 8 pa=C5=BAdziernika 2023 11:42:50 CEST Janusz Krzysztofik p=
isze:
> Dnia niedziela, 8 pa=C5=BAdziernika 2023 07:04:39 CEST Greg Kroah-Hartman=
 pisze:
> > On Sat, Oct 07, 2023 at 11:38:18PM +0200, Janusz Krzysztofik wrote:
> > > Since types of arguments accepted by tty_ldis_ops::receive_buf() have
> > > changed, the driver no longer builds.
> > >=20
> > > .../linux/sound/soc/ti/ams-delta.c:403:24: error: initialization of '=
void (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (=
*)(struct tty_struct *, const unsigned char *, const unsigned char *, unsig=
ned int)'} from incompatible pointer type 'void (*)(struct tty_struct *, co=
nst u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const uns=
igned char *, const char *, int)'} [-Werror=3Dincompatible-pointer-types]
> > >   403 |         .receive_buf =3D cx81801_receive,
> > >=20
> > > Fix it.
> > >=20
> > > Fixes: e8161447bb0c ("tty: make tty_ldisc_ops::*buf*() hooks operate =
on size_t")
> > > Fixes: 892bc209f250 ("tty: use u8 for flags")
> > > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > ---
> > >  sound/soc/ti/ams-delta.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > Odd no built-bots caught this, maybe no one normally builds this file?
>=20
> The driver depends on SND, SND_SOC and TTY, but can't be selected=20
> individually, only via its user. =20

Sorry, that was an ASoC board driver, not a CODEC driver, that required the=
=20
fix.

> Then, it usually builds when=20
> CONFIG_SND_SOC_OMAP_AMS_DELTA=3Dy, and that's probably uncommon due to=20
> specific dependencies. =20

In addition to SOUND, SND, SND_SOC and TTY, this ASoC board driver depends=
=20
on MACH_AMS_DELTA, then on ARM, MMU, ARCH_MULTI_V4T, !ARCH_MULTI_V6,=20
!ARCH_MULTI_V7, CPU_LITTLE_ENDIAN, ATAGS, ARCH_OMAP1 and ARCH_OMAP15XX. =20
Let me check if it builds without those machine dependencies, then we can=20
cover it by COMPILE_TEST.

Thanks,
Janusz

> However, cx20442 can also be selected and built=20
> with CONFIG_COMPILE_TEST=3Dy and CONFIG_SND_SOC_ALL_CODECS=3Dy.  Since si=
milar=20
> approach seems to apply to quite a number of ASoC CODECs, maybe build-bot=
s=20
> should pay special attention to select SND_SOC_ALL_CODECS more frequently=
,=20
> like they probably do with COMPILE_TEST.
>=20
> Thanks,
> Janusz
>=20
> > Anyway, I'll pick this up in my tty tree now, thanks!
> >=20
> > greg k-h
> >=20
>=20
>=20


--nextPart2707487.BddDVKsqQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmUijEwACgkQ2WqSnlts
jBqpygf/TZYnhnJ79SYUbtDpvKJvQn4573Q7v/l2znOGa1OJTKp7WpamhXlqXOct
rTHSJ4md10EXlw3e7OhmSWwP4fhrMIASzHYYPmlX7LYXZedRkSbaOFC+kOSDhKYW
ZHhJrEfTOpfd968L/0cLd2Sg913OJqYQzThlUXk40v3VQNnkSZMH9Ma/DqasAOWE
j8MmaxtqOEwuQwFNoOnwAHGcHz5fMO2xgijTrhpMrZLx8cWLoY/1DuFk1jUBy9B7
/27avelGo4+IhBSC6ysZa6QueVOrfUWGcFnsXwUG6SCE4AMh11z3mecoSlwO8jcB
hEoZ+9f8JJ3bRxtCUDvAm0mTkc0i0g==
=cxua
-----END PGP SIGNATURE-----

--nextPart2707487.BddDVKsqQX--



