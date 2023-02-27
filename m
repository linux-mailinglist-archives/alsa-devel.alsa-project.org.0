Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 553646A43E7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D877E829;
	Mon, 27 Feb 2023 15:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D877E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677507188;
	bh=6AG7SceOELnCwREF/HAA2yOyakikt8NQE9ObYcefNKo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mlWmhuT9fbii1+NJOxlluqgY6h8Jvh5nbCchN8TVXzswSWyqeWrk0DWf+CFq8IFBA
	 4YoVTAgZpYMv4aGyMmQzEZhvhzDBKoMAD/OvzRhY8SMqEUC+0BJ0YvBNkllftOUCxk
	 +juUr9noFFfTK3K3/9gBn7ieeDxvPlgrloOJQo/c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2548CF802BE;
	Mon, 27 Feb 2023 15:12:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 929DDF8049C; Mon, 27 Feb 2023 15:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60F2AF800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 15:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F2AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qxn5Czsv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63745B80D38;
	Mon, 27 Feb 2023 14:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB1C433EF;
	Mon, 27 Feb 2023 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677507126;
	bh=6AG7SceOELnCwREF/HAA2yOyakikt8NQE9ObYcefNKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxn5CzsvFHeDdbXDE2G/zhqcVECnDGBw5Q1mylYpQHZe5sOORg5OdojkjbridiYVL
	 joL3+Rp+Fmz/W1yfW3ENC4vIy1uA/GCOTpy73zSTFEwRHFCPuUwcMKmgbLmPQ34O+l
	 ZpX8wh0bwwcXn/2EDUcdzxgokoitrK8kJqhBKtj4BX77OOF8DHkWOYYQVLUSAj6Zka
	 uUVbhTHrj5mwfrkp4YsgNYYvkPKkJ2y/IJhnUeO2s2FfR/dXhijZz3st7MvciqggLV
	 EgoMSHjo4T9/W260zsxzTmEmlvMQBr1rf8h1nOSVZxPvvx3lWO3JABw2K9ybemM+X3
	 S5qPvr6GhBOJw==
Date: Mon, 27 Feb 2023 14:12:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] Fix snprintf format warnings during 'alsa' kselftest
 compilation
Message-ID: <Y/y6MNh8yXcsQWWj@sirena.org.uk>
References: <20230223143214.16564-1-ivan.orlov0322@gmail.com>
 <Y/eAyrYs+wEu180d@sirena.org.uk>
 <1db3bfe5-0982-b445-9c94-784478279028@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjrc9TRZIcm10rXr"
Content-Disposition: inline
In-Reply-To: <1db3bfe5-0982-b445-9c94-784478279028@gmail.com>
X-Cookie: On the eighth day, God created FORTRAN.
Message-ID-Hash: 4ZINRO7KEQDTQPIQKOYICMAQRDJDYQDB
X-Message-ID-Hash: 4ZINRO7KEQDTQPIQKOYICMAQRDJDYQDB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, shuah@kernel.org, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZINRO7KEQDTQPIQKOYICMAQRDJDYQDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wjrc9TRZIcm10rXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 23, 2023 at 11:14:56PM +0300, Ivan Orlov wrote:

> I compiled the test via gcc 11.3.0 without any custom options, the arch is
> x86_64. There were five warnings during the test compilation, and all of
> them were caused by incorrect format in 'snprintf' function calls. As I
> know, using incorrect format in 'snprintf' creates an undefined behavior.
> Maybe there is a point to fix it?

The question is more where does the warning come from and is this a good
fix - a common pattern where generic types like size_t get used is that
the underlying type changes between platforms and warnings just get
moved about by changing the printf format around.

--wjrc9TRZIcm10rXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP8ujAACgkQJNaLcl1U
h9BwQwf+P5EOVKFjuPDJj1+sBltQmwV+lc9tBNVgCfUuyNl2YVOxr4M5gIgzZ8MV
4MKKEq2gK8Oiwb52v6zRXjwyswsgNiJI6l0RvbM8uW05kE4T71pvtSnt83eN9cLC
9HgHf1ErUxg8rauXvjRl6RZJNiZRs4k/MK7Jnb0aI4qP3wRrK8t49MJbZ95ukibz
F6WcumWdD58Jg7fspthrSvs7vn1q3TNqwMBYWWtuyZEwPRUqueIUH2SrcZ8It6ov
UW2gQaqCaOYw3YP2+EHsdFJPpJgsSa9tQ8VrVW+HEpZ7iP5r7ystzY1OoUE5MGwf
BXZ4rpvbBbA4jehWBVPhTv9QLwno/g==
=C6G+
-----END PGP SIGNATURE-----

--wjrc9TRZIcm10rXr--
