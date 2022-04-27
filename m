Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C8511BF0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7644C16FB;
	Wed, 27 Apr 2022 17:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7644C16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651073879;
	bh=aFL2D9S6TNyMN59BIGxxXq7oqqxw61XP8Y8c5BFS/lo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXco3eKiMXpWtq5BXgiJhZyo0OkSNufZpnaB2+1Y7Yaqd308kIYwNAZKS+8FojIwq
	 Aa7YQZkpnRkM7xS4pP696KGgDvujFU6gaCobSxyM+jOC1kpjAhUcDv5c6P0Ea8l5BA
	 F8uu3qhlIaKFoW89ZM4ZqzrXDdTMv28EwGZFt3a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D13F800AE;
	Wed, 27 Apr 2022 17:37:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F39F8016E; Wed, 27 Apr 2022 17:37:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6673F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6673F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i8cJcTDB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AE4BB82539;
 Wed, 27 Apr 2022 15:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C07FC385A7;
 Wed, 27 Apr 2022 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651073815;
 bh=aFL2D9S6TNyMN59BIGxxXq7oqqxw61XP8Y8c5BFS/lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8cJcTDB3YKiztI3+QUpKP53J9ITpDZKSe40fyHDqeTzqyT8DTgR28Qb6gwF20iES
 PiKL/89GkRHS3S59YXo+mqImgaAdD38GxiCbEuegJVgS9tUMVN2f9UYUuwt1OKukzy
 RuraTLn/YCHthNUrb0rrFR31vNzszSUzJMdb3w34FOXazgNid9ChkBOziKMMuh5Ogq
 qq/wxWGDIqso0ufFuGxWsjd99+AdqQvVt/ankmeCNFK0fpXXOtwYOTa6nGb+pEyidK
 7PIHLggF7ep7tT87wxJAqKKGbL+hFp0AhdSWc7iNKC8FPR/QIEYgDm2UDCt0Ov6ZgC
 Q8pfY0sYjYbeg==
Date: Wed, 27 Apr 2022 16:36:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 00/26] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <YmljEm6jUr3Odsv9@sirena.org.uk>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X7yUBoxLMeMMXIgb"
Content-Disposition: inline
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
X-Cookie: Buckle up!
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--X7yUBoxLMeMMXIgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 04:06:54PM +0100, Vitaly Rodionov wrote:
> The CS35L41 Amplifier contains a DSP, capable of running firmware.
> The firmware can run algorithms such as Speaker Protection, to ensure
> that playback at high gains do not harm the speakers.
> Adding support for CS35L41 firmware into the CS35L41 HDA driver also
> allows us to support several extra features, such as hiberation=20
> and interrupts.

There's a bunch of changes for this driver in the ASoC tree, it looks
like the bits that touch ASoC will need basing off those.

--X7yUBoxLMeMMXIgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpYxIACgkQJNaLcl1U
h9DKKwf+MeaWWgSaxNDHpr0/70ctpJeHHvJ3M21phiaLehf1qZxLzgiOITexBvhW
6F33LKztXhX6FYu1Y/zPPHWEfMdTamU4BK+9253iPAXmJ+5rYmzsq4ycpUzuI0T+
42Ja5EZx4wA0RdJd92gMkp0XRI1mYdRQGB3G2gBaD53qKtlB+t3cIhze6n+IiDI1
6/hQPZxj5CfCIJcqbtqmV+fWaNcjTRAqs39syqGeF8+htGekq4kAWca/8fdpb4WP
vnq7CcSsaLnHrnAQhjXWliK7p5QhBWi9dvnHZNVSW9c4c2CjjcK2g2xd9hAkTsvj
DgzgksWda4GEreArh/Hswz7GIoLZDA==
=Io8o
-----END PGP SIGNATURE-----

--X7yUBoxLMeMMXIgb--
