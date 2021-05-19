Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18AD3897A2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 22:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C46D167B;
	Wed, 19 May 2021 22:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C46D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621455086;
	bh=DxYkIdB3NoXfp/b7anhxq8gErDgzv0UGLQqtSRtpyY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MW5ndChMS0MLHp8tD3zj07Og/C5zqqODwMD4FfU4cCUU/G4gcwCcj+zl5H+C3pSkC
	 3N6/2j/oO366r4l625OHLIW+uwASGsx4iTGhWjaOpM7ghiyjU+ImTO3vT5QmBeRNDq
	 Xd+5h/uAqXZ1k+kRnxQ0GOVr69gaJ5qFHPxjpDUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE5DF80246;
	Wed, 19 May 2021 22:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79F26F8016E; Wed, 19 May 2021 22:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22530F80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 22:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22530F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D4KRXBPa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA4866135A;
 Wed, 19 May 2021 20:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621454988;
 bh=DxYkIdB3NoXfp/b7anhxq8gErDgzv0UGLQqtSRtpyY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4KRXBPap1zrtJwSFdZnqTNedw9xbrBfR8ibW5cTaxFVYcIND6gzzSVL1SFhSQLI7
 J7Pjxf3qeuzGHelHlVwbn3LdK2UrEFUiM/42Hmm7UhcP3Ep+0tIPaJmEGE2LWcYY00
 JMHNDx01zOu0dJdjUibtc9PYHUFja9fuFWy7Lb2An2weX40JPZt2grWnA+JZOz39im
 x9uQrJI8Psk/tJhhUYr8uKJ/u6t0JAa1xdxjaEb0RrRc0exUAPbdIsEDcDZa+kvs7S
 0qNjlgko7Az81mExs/bWaluUV0mIoyCS2x9AXTqpVxW8DBlEMPHExvSCz4sfRLjKmM
 xs9QoWmc1WuHg==
Date: Wed, 19 May 2021 21:09:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210519200902.GJ4224@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <b924f76a-56dd-5ca3-229d-293f7ff1e81a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline
In-Reply-To: <b924f76a-56dd-5ca3-229d-293f7ff1e81a@gmail.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Rowand <frowand.list@gmail.com>
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


--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:16:48PM +0300, Dmitry Osipenko wrote:
> 18.05.2021 21:34, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > It's generally the clocking configuration, things with fancy clock trees
> > don't play so nicely with generic systems where we want to configure
> > them at runtime, or things with complex routing in the CPU where we
> > only recently started getting bindings that were functional enough to
> > use.  Tegra is fairly complex internally.

> This is true, but still it's more optimal to use flags in a single
> common driver for the minor differences rather than to duplicate 90% of
> the code. In practice majority of tegra boards are derived from the same
> reference design, thus the h/w configurations are mostly the same.

If you can do it yes, though some of the CODECs can have sufficiently
interesting clocking to make it useful to do something different - not
sure if any of those are upstream though, WM8903 ought to with the right
board I think.

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmClcF4ACgkQJNaLcl1U
h9BMAgf+IBN65r2SkPO0SKO4VuwUiRBm9DNsLKDipdewyG5L+/rgOIOe8OIhjICd
b87aOjXfu/XWDF0dUuRp2d/WgkrakunNEbTO9SlNtGu5VWjfdbXZ4tEx8qHj7I+7
N5GSBVHeZ8NALnMOT+IoOUjSvHA7ZqGIj2Sd5vXjXOJJPsgeV3qKkJAgDfoY3Dv6
ZLVIyahTKvwnS4pV9n8NN7icxMvshmAo8jcMheNUfCabY9YM0YwYDORFPwIdKJHw
YLegZydKUAOuUcztxQw/GJbhYq0T7VBCFg7TH66dY8nleAvLVbVcQlCNaUPQ0+Lt
KZwwTHTaD3PbHYQXiOmw7y3h8LkXrg==
=JoYf
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
