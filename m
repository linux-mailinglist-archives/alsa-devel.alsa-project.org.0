Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC222809DA
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF34F1AC2;
	Fri,  2 Oct 2020 00:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF34F1AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601589898;
	bh=BIUxZbuh6/Nx7Ja4CQE09N0R6zvPEuvxs3i0T8eaODE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJfKKbBsnxvE9yy726JF34ReGK9ndB8tVjvrJ0G9qKyMFdnJ3vpwIfNzzy7mVM/gB
	 KWYgOPowx5AH7R5G3wJuYThnRqREtfA17p/HCWnIlCTwjRHE69kv4eIi81R/2E44KN
	 4MIZ6JaNJ+tJjDIXLbZMSTu6dxxBTxmNXHgHKF2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0023F801DB;
	Fri,  2 Oct 2020 00:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 291A3F801F5; Fri,  2 Oct 2020 00:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E06F80105
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E06F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xqg/nawE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27A28206DB;
 Thu,  1 Oct 2020 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601589780;
 bh=BIUxZbuh6/Nx7Ja4CQE09N0R6zvPEuvxs3i0T8eaODE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xqg/nawEYcXRY3S8VfuQ2UAlDelDQKWLEwp+n/Ecx3CRtqT99SosgV0PZ8u2xMmYz
 dhnF4smhPx5due/DXNDv7Px8gVAEhwSoC9CU2Dx5oxdsr9MHsq6yHKsZ3WO1LXOZcL
 s+YlgFOdMRWC8z0n597iRTPOmriIrEoQTQ7Lets4=
Date: Thu, 1 Oct 2020 23:02:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()
Message-ID: <20201001220201.GA6715@sirena.org.uk>
References: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
 <20201001151214.GA4939@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hW3Q5Oh0pcvvyJMS"
Content-Disposition: inline
In-Reply-To: <20201001151214.GA4939@sirena.org.uk>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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


--hW3Q5Oh0pcvvyJMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 04:12:14PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 02:07:41PM +0900, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >=20
> > commit 140a4532cdb8c ("ASoC: soc-pcm: add soc_pcm_clean() and call it
> > from soc_pcm_open/close()") switched to use soc_pcm_clean() at
> > soc_pcm_open().
>=20
> This doesn't apply against current code, please check and resend (does
> it depend on your latest series you posted yesterday)?

Ah, looks like it was the other standalone fix you sent today - it
applies now with that added.

--hW3Q5Oh0pcvvyJMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92UdgACgkQJNaLcl1U
h9DnAQf/TpxKP5ZymVgCGLlYBVLKphpyRRTCVzcCBOUy6Pn7gInzS6kFg68Wr2Ka
mqSZISEI3Um507AFfvVvQlvCl3hVZP7JAafUL96kqUiIUx5ppQIVrsh6cZdw2wvg
RqUM5hLGVRdcU+MdfMyq3ZEskmfe00QF1QFhaf0S96/QSKnYbLarMR4JGiQm01P6
ToKB+nZHJt6gGkerzqowv6IU+CgnstGGOrBAx7+pH9A9zHmgo+8KnidY94XBj50n
PFaGHMOQWbv9QvyhZsOXTyikrqR+wVtt8VEZqyY45AGzYVTI9TlxN99DjtzN2xAl
HmjmSu5pzRtsVhVA+Hh3udC6gRVFNQ==
=nl2E
-----END PGP SIGNATURE-----

--hW3Q5Oh0pcvvyJMS--
