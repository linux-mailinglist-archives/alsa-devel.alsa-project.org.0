Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D0701BA8
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 07:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FD9E88;
	Sun, 14 May 2023 07:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FD9E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684043053;
	bh=IDGVt0VPDcGTdRBoTV540d8tlzGaz7p6PdWLogPPAyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/Nue+OYc+CHDX1HZVn48n5wC3y/GM+1k7q7h06sxndac27AZ7eMVSxhwTiKByJhP
	 UFH/ReSfFtj3oyDBPlFVwA+6XQvrOA8SJqwaFn4BtZJUzDOXRq2qDN8IPdv3dXqSuP
	 IRrLSuheu9D8wgnK7udKsf79yZKdjtlccRiuhlio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24BC1F80431; Sun, 14 May 2023 07:43:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE95F8025A;
	Sun, 14 May 2023 07:43:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCEDDF80272; Sun, 14 May 2023 07:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB913F80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 07:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB913F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=gFBsMNif
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaef97652fso79364775ad.0
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 22:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684042872; x=1686634872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDGVt0VPDcGTdRBoTV540d8tlzGaz7p6PdWLogPPAyo=;
        b=gFBsMNifmQp9JIa8Klq4CpGhCZYHz33bVpYypgMz+jyX/f6eO6dM9O3H3Ur3VacGcp
         dWYRLuNmHa36kZaf3UShvgMIbWsBLP818yXwPZ/f6xpjmOIeaNZ69G+5jNOO4z0WtX44
         i70bEgs1X2/XZzWbhbucKBBSZAkisGkxlwlJH8/Dtj1ovZRsL1UWjgWV+KEdOweAaEgS
         mR//WznLNMyKED41Vx9gtlW2xr6hkDXYIAZgt12rO5X+yQWBG6j2/kQX49UBQ6tE7zp9
         6acbnNfAeHVnsh+tW3jgkLQzEymALYUMIk2BW8khmsIANq1mMLJl1tgdZE1apU5rYu4c
         F+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684042872; x=1686634872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDGVt0VPDcGTdRBoTV540d8tlzGaz7p6PdWLogPPAyo=;
        b=NyhcDuFFxvTxyiuK+xnzkySSv1HJAHL2zLJqV5AH3EJ4/gUH3gFsS4UT9M01YyZTsQ
         tbKrUH3oMb0ldol0sL+U9VjsgbSFPg21uhIJU7BBHqpJRn1OMwl6TLBDojoghVvBYq0/
         z9UChIOYWjxooeNoYsGfVo6Isxnx4HVh4YB43orQdatm1oEv0tMiZaXLmW4+5DDGUeXT
         GyQV6qBEykz+abgtO2gQF3OR5wqevhBXB75YEFXCrQvX/oLBycEiQDcxa6/PgEYPnpf/
         63t7Isud/sTvvVLL/b5b/ZH3lRW0bZEVN9DD9cs07Rgco99f8LZl1kN6B8KkxS1B3LA9
         2YdA==
X-Gm-Message-State: AC+VfDyn/oTpF4yTMVexkjToq17oe+y1+ruCuZECooWH18kLqfqL49F8
	m2TLmtJa506MiUOnhPFqchngCXYPDDE=
X-Google-Smtp-Source: 
 ACHHUZ5CGCegi81Qify9CvlVpbTxzT8VAb2w5CvKNm/+u1sp7WkfS+0YAZwNxICkTliDGj1W78QhLQ==
X-Received: by 2002:a17:903:54a:b0:1a8:18ae:1b36 with SMTP id
 jo10-20020a170903054a00b001a818ae1b36mr27045464plb.18.1684042872000;
        Sat, 13 May 2023 22:41:12 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-71.three.co.id. [180.214.232.71])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902a40a00b001acae9734c0sm4706845plq.266.2023.05.13.22.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 22:41:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 483961068F3; Sun, 14 May 2023 12:41:06 +0700 (WIB)
Date: Sun, 14 May 2023 12:41:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Joseph C. Sible" <josephcsible@gmail.com>, regressions@lists.linux.dev
Cc: kailang@realtek.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Message-ID: <ZGB0cVVI7OgaJU6t@debian.me>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XX5bEJKjbAtICQ4"
Content-Disposition: inline
In-Reply-To: 
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Message-ID-Hash: N2IHG4CFYGRDZ4XMIJXLOEN7E3YN5WDZ
X-Message-ID-Hash: N2IHG4CFYGRDZ4XMIJXLOEN7E3YN5WDZ
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2IHG4CFYGRDZ4XMIJXLOEN7E3YN5WDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8XX5bEJKjbAtICQ4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 03:52:53PM -0400, Joseph C. Sible wrote:
> On an HP 15z-fc000 laptop that uses Realtek ALC236 for sound, once the sy=
stem
> is warm booted ("reboot" from within Linux), sound stops working complete=
ly and
> the device doesn't even show up anymore. Once this happens, the only way =
to get
> it to come back is to cold boot ("poweroff" from within Linux, wait for i=
t to
> turn completely off, and turn it back on with the physical power button).=
 In
> particular, once you boot from a "bad" kernel, no number of warm boots wi=
th
> "good" kernels will ever bring sound back.

Can you attach dmesg messages so that we can know what exactly the error
is?

>=20
> I bisected this to commit 5aec989, which first appeared in 5.15-rc6. In
> addition, I confirmed by doing a custom build of 6.3.2 with reverts of bo=
th
> f30741c (just to avoid a conflict) and 5aec989, which works correctly for=
 me.

Note: when you refer commits, write at least 12 first characters of the
commit's hash. You may want to set `core.abbrev=3D12` in your
`~/.gitconfig`. Also the canonical commit reference is
`--pretty=3Dformat:%h (\"%s\")`.

And remember: when replying, don't top-post; reply inline with
appropriate context instead.

Anyway, I'm fixing up the title:

#regzbot title: Realtek ALC236 unrecognized on reboot

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--8XX5bEJKjbAtICQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGB0bAAKCRD2uYlJVVFO
o1hEAQDXt2gGeCFUztxgePc09xdG10X7dIku2mCPwiSgw15SZAEAgMPt04I1v1c1
4gDr+jnM3a3nNlxhPoHiPrNH7KIcGwA=
=ACa/
-----END PGP SIGNATURE-----

--8XX5bEJKjbAtICQ4--
