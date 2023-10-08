Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D052C7BCD9A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Oct 2023 11:45:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23378826;
	Sun,  8 Oct 2023 11:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23378826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696758319;
	bh=O4MWJ0mw2mgd9FbBDhn8wCDUoGyLsJY69EdH3srTC2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8wePbngFgCxRtHuAr2AAgtAtyZkl8PEP+wK1DzK3++zbWP5WJ3CSKAKliM46mFrl
	 1wN3yr+kuXjoYHnjdtNZX6vUMHabzMi9luJQnSH2oRzfxDZi/7YeKvDZlkm7EtO9ew
	 59X7cjFgGPAvCbPeLrfNxjbqKlU5d3dVjfU9Dvzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67876F80130; Sun,  8 Oct 2023 11:43:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A2EF80552;
	Sun,  8 Oct 2023 11:43:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AC3F802BE; Sun,  8 Oct 2023 11:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2BF7F8019B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 11:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BF7F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NtrkjuVN
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-533c8f8f91dso6255505a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 08 Oct 2023 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696758173; x=1697362973;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP/7ULAM9+WQiUpJUWU4z8ftc3NIktylhbgnBvh3NrQ=;
        b=NtrkjuVNYCX1A77GUiOmz2kSE3bF1LBwT/7LKVnxqPNdjUB1j8H0D3Fd7VAxECbDrU
         ueXBIwr4THfajUe9M/X/hzOvyWZgf8ItuYCturs0MH0PTi34AG0CjmpDMAuUavQ05a2J
         37W2lrnWzKsX9Nw5rhkzyHy37+l3TF2vCZB57qN4TplKNOE2pAw+QzS5yHD3UQPVVTEr
         Ln9TdyUrPqjLjgb/iuPIdjHBtesFxZI7iYepVK2H5HiFuXjEbtvMaxpIVHm2yfXq1VLh
         b4V5VikfF+G1sbi/U1DUu4DvjEnb7khFP26Z3Hlpz7vB01aAT8yARpjLitTWaYksaOmw
         PBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696758173; x=1697362973;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lP/7ULAM9+WQiUpJUWU4z8ftc3NIktylhbgnBvh3NrQ=;
        b=wL5ql4uny0hzcrTJqf5gMVnwYn51iGyw8rZ07FYqyuaS0r0aSwA/eSOo6O3KPOxf/s
         eEvJ6frf6Ja2FEE2fxAqMdPulGKFKCPdN02kiuLql6a2OTMsmYZ9TSfg5EL7+ox8pxeW
         LL9pyp57qAn8M0iGnvsWavI/cBGeSeADTsPRinzttljXogxC7CurCfjM1ZzomlBlERC0
         b7Tqzd9jjQyUOv/7yQRKmG4V7p1DpZlCGc81O4hutL/2CHG/BJCRCMtRGN/Rpnclwkpe
         6TOPjAthmzO+uEau8drNG1C60SAgLlWNDevpEZqQ1PcUpytgLQ6Va3ktob+8C6itHZmB
         035A==
X-Gm-Message-State: AOJu0Yxqew7SZ4fjYToM5B84vmvTOme3gHDCOgAidNspxkPa0/HswaGg
	8WNcoqZ5lI+8iHhYDv4bfnw=
X-Google-Smtp-Source: 
 AGHT+IEe2fggWDSeVlV9pKWqnZBGnikPolHgDSe8Af4up5YpfSy3vb0xw1nNuPvKeglzxm0UKs91dA==
X-Received: by 2002:a17:907:762d:b0:9ad:99a8:7c53 with SMTP id
 jy13-20020a170907762d00b009ad99a87c53mr10757802ejc.60.1696758173361;
        Sun, 08 Oct 2023 02:42:53 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a17090628d000b009b654ba498csm5344816ejd.90.2023.10.08.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 02:42:52 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Fix cx81801_receive() argument types
Date: Sun, 08 Oct 2023 11:42:50 +0200
Message-ID: <8377873.NyiUUSuA9g@dell>
In-Reply-To: <2023100811-shakable-derby-0b91@gregkh>
References: 
 <20231007213820.376360-1-jmkrzyszt@gmail.com>
 <2023100811-shakable-derby-0b91@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2022001.usQuhbGJ8B";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Message-ID-Hash: TWSL67NJGM6BA4RVVEILD3L7ZKQULJBO
X-Message-ID-Hash: TWSL67NJGM6BA4RVVEILD3L7ZKQULJBO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWSL67NJGM6BA4RVVEILD3L7ZKQULJBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--nextPart2022001.usQuhbGJ8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 08 Oct 2023 11:42:50 +0200
Message-ID: <8377873.NyiUUSuA9g@dell>
In-Reply-To: <2023100811-shakable-derby-0b91@gregkh>
MIME-Version: 1.0

Dnia niedziela, 8 pa=C5=BAdziernika 2023 07:04:39 CEST Greg Kroah-Hartman p=
isze:
> On Sat, Oct 07, 2023 at 11:38:18PM +0200, Janusz Krzysztofik wrote:
> > Since types of arguments accepted by tty_ldis_ops::receive_buf() have
> > changed, the driver no longer builds.
> >=20
> > .../linux/sound/soc/ti/ams-delta.c:403:24: error: initialization of 'vo=
id (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)=
(struct tty_struct *, const unsigned char *, const unsigned char *, unsigne=
d int)'} from incompatible pointer type 'void (*)(struct tty_struct *, cons=
t u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsig=
ned char *, const char *, int)'} [-Werror=3Dincompatible-pointer-types]
> >   403 |         .receive_buf =3D cx81801_receive,
> >=20
> > Fix it.
> >=20
> > Fixes: e8161447bb0c ("tty: make tty_ldisc_ops::*buf*() hooks operate on=
 size_t")
> > Fixes: 892bc209f250 ("tty: use u8 for flags")
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  sound/soc/ti/ams-delta.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Odd no built-bots caught this, maybe no one normally builds this file?

The driver depends on SND, SND_SOC and TTY, but can't be selected=20
individually, only via its user.  Then, it usually builds when=20
CONFIG_SND_SOC_OMAP_AMS_DELTA=3Dy, and that's probably uncommon due to=20
specific dependencies.  However, cx20442 can also be selected and built=20
with CONFIG_COMPILE_TEST=3Dy and CONFIG_SND_SOC_ALL_CODECS=3Dy.  Since simi=
lar=20
approach seems to apply to quite a number of ASoC CODECs, maybe build-bots=
=20
should pay special attention to select SND_SOC_ALL_CODECS more frequently,=
=20
like they probably do with COMPILE_TEST.

Thanks,
Janusz

> Anyway, I'll pick this up in my tty tree now, thanks!
>=20
> greg k-h
>=20


--nextPart2022001.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmUieZoACgkQ2WqSnlts
jBob6wgAl3S4Ml9Wnt+xOL4qHEP1vxoT24Jwx7U1lkOXtuc2CLAj2fn+kNsywAKq
YC2lcIjbRJQU9sK7NYKMry/UfLjxGiIFCRh88aui1P67uN+1DrmNESYrZEXWwIVr
BF5X7jrx/kF+3XKNk1lg9q1vis/xMV/32U3heVpAo0G4j4WXcHHVED6FZytRIo/y
m+UMfxMxW7GSWY+RnRV8aD182r42+o+alewScrEMdBhaJdze5eM6rP+1Wqrx535f
+xPNfd+nlgoqexzG6T/OUOKQ9h34f3tjXmpCqQt4E2HJfeNDNudUbbRlSj72dHEq
zPdob4yMG6yCsuo8WTgp1CMkPoQ4PQ==
=XqZT
-----END PGP SIGNATURE-----

--nextPart2022001.usQuhbGJ8B--



