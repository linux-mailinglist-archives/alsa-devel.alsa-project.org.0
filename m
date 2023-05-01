Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FBB6F2E79
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 06:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BC71711;
	Mon,  1 May 2023 06:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BC71711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682915947;
	bh=3FJ838k1C5SRQ1QpV0bbphF5iaPyZZZtQhPRQozOF0E=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UUNhw+AH8zTtEuiPaiS1Gvj4pATrozLjS/Bfh6T7OggHc+xVP7qYsIpIUxqPNCP+A
	 Bkm5Y3Z/3L+77BPo/sgTTWauy2IcCxWxlFnj3qd7hbPv4q+p1xKkPY7elmJnJscSFi
	 ZnJ5EuQBjjGWVY38ikVpZG4Yg0v2Ma6UDTYkfdXs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCA4F80087;
	Mon,  1 May 2023 06:37:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9696EF8049E; Mon,  1 May 2023 06:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB585F80137
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 06:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB585F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=F4EB75vd
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b78b344d5so1456262b3a.1
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Apr 2023 21:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682915813; x=1685507813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FJ838k1C5SRQ1QpV0bbphF5iaPyZZZtQhPRQozOF0E=;
        b=F4EB75vdxlyBg6SiDCxwOFFk0jHoIqsKC2teM5GNnn++1DACxQXC7cXmCsLFgfZhTj
         KYPjg3DTWK86sw/T257HeoOj38YOWktSytjNIWrJdw6eIl6JWB2wFv24oXQ8gDRPUaB9
         JQfVdC169ZqjJmEq+UkDOjM1i4p+atA1L+loY9E+uGXjebBp9o0AbaYDWCd21K7rhV0m
         dxF83Gi+GeKA7Lo9nS6Qp8XWGQdxkbLXG0X0BnhWv6h0S1GhHiC+uzSzMiQpiC0jhqAQ
         hnjEbvPeiEq2QJNsrh20TB/7DgLChQhj8iv8jtrPciemzQJTABbXU5hKjHrlUbfG7fvK
         M5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682915813; x=1685507813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FJ838k1C5SRQ1QpV0bbphF5iaPyZZZtQhPRQozOF0E=;
        b=GgNJGe8YxxsgkrGvVf5+ZFW7Rxih12svZSyQyrtUHI+7K/3aVlqSWk6DsZ/EbX8CUJ
         sikRW6WP6lpUSqR7hza/dnGnatn5lUINBpXb7pTRtX/YVDkFKU96rTVr7bP/1VKJmCO6
         UiytwlUtd/PSFpp9ZQmovWOVVXsWFC0DcCXjHBFt0shiBN68kzpmFZluXVwyNws123FS
         Z7QIqjmjQD7zxjYuXI4iApfNAH4gO2j2RprhcbNCyH5xGQjsbOa7IMJm0J2FSu7BhUZm
         M+ffZ9cx/oAC6W0bdf0nkfIGgIW1bSCV8kHM7LqF/atQUWeOagtkAEz4kTVOC3HsG0er
         sLrg==
X-Gm-Message-State: AC+VfDz1crcqNUXUwBQzJ5NkSvnIfAMkbAeBVIw/iXFUyOvAl4rLl7tO
	8QIjzevfENaPQvB3MaazU8Yc8I49Djs=
X-Google-Smtp-Source: 
 ACHHUZ49A3xDD6h5SJXvoZmv6tt7PFayV/qkvPMH1okiMRZdcD5LOro7oWQinZDqAooNTW9iUU4ZzA==
X-Received: by 2002:a05:6a20:6a1e:b0:d7:3b62:3cf with SMTP id
 p30-20020a056a206a1e00b000d73b6203cfmr15224013pzk.54.1682915813043;
        Sun, 30 Apr 2023 21:36:53 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-46.three.co.id. [116.206.28.46])
        by smtp.gmail.com with ESMTPSA id
 k128-20020a632486000000b00502ecc282e2sm16723810pgk.5.2023.04.30.21.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 21:36:52 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 7E4CF10695F; Mon,  1 May 2023 11:36:49 +0700 (WIB)
Date: Mon, 1 May 2023 11:36:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Chua <jeff.chua.linux@gmail.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: linux-6.4 alsa sound broken
Message-ID: <ZE9B4avbDtIXOu4O@debian.me>
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LJ2qQOdS72n8ceav"
Content-Disposition: inline
In-Reply-To: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
Message-ID-Hash: MFPY4MWLPY33PVTMYJVWLSYQT5HB7SBE
X-Message-ID-Hash: MFPY4MWLPY33PVTMYJVWLSYQT5HB7SBE
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LJ2qQOdS72n8ceav
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> Latest git pull from Linus's tree ... playing a simple sound file will
> resulted in a lot of echo.
>=20
> Running on Lenovo X1 with ..
> 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> Definition Audio Controller (rev 01)
>=20
> I've bisected and reverted the following patch fixed the problem.
>=20
> commit 9f656705c5faa18afb26d922cfc64f9fd103c38d

Thanks for the regression report. However, where is your dmesg and/or ALSA =
log
when the regression occurs? What is the playback test file?

FYI, 9f656705c5faa1 ("ALSA: pcm: rewrite snd_pcm_playback_silence()") is
originated as [1/2] of patch series that pokes around the auto-silencer. The
other patch ([2/2]) got NAKed since autofilling buffer should have been don=
e in
alsa-lib (still to be discussed) [1].

Anyway, I'm adding this to regzbot:

#regzbot ^introduced 9f656705c5faa1
#regzbot title Much echoing when playing sound files on Intel Alder Lake PC=
H-P Audio Controller

Thanks.

[1]: https://lore.kernel.org/all/bb342e84-b468-8adc-6688-88da2c857da1@perex=
=2Ecz/

--=20
An old man doll... just what I always wanted! - Clara

--LJ2qQOdS72n8ceav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZE9B3QAKCRD2uYlJVVFO
oybmAP9qZl6m3BGfCju4IYA/iNDLxZpCPY+PPR5V6jt2I12r0gEAiduhNNevDzK/
ts24tNhoskNd+rPICIYUV6L02qtfBwI=
=IYeY
-----END PGP SIGNATURE-----

--LJ2qQOdS72n8ceav--
