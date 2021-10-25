Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5443941E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F141676;
	Mon, 25 Oct 2021 12:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F141676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159218;
	bh=Sc6M2aqA6X3s/ydL6GsxApFjLQRCTVBWSCiVS0siZK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbM6hgpdeCerNJwTvROo+g7oYuOnGAA8/DsfUrStnT2sij4mlfrRzMLmziqCiG7hr
	 2oO0lvJOVOyiX3GvXu/MpPPZ7tZJXovcbf1mJwwaPT5hdqNuhLISS2kqIDYuE9ZT2b
	 6z7Vvylm/vojKtl1NtToq0PeBjF4teRvLUM6ivek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82A6F8025E;
	Mon, 25 Oct 2021 12:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 329E2F8025A; Mon, 25 Oct 2021 12:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD216F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD216F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CMomWBUu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E05D60724;
 Mon, 25 Oct 2021 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635159126;
 bh=Sc6M2aqA6X3s/ydL6GsxApFjLQRCTVBWSCiVS0siZK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CMomWBUuCjdZrbFKtUs/sugS5NLMEb04PLOD1btwnzMmfhSb2Wj72xL6zfvbHvRJB
 P9zi3LRyYfE4XpVrQ7aaKfVMkmNmf1FMGWyoKyxG1HJtRxxGRtRJwmI+K3Jd+3e/u2
 Q2N9diJcn99vC3A5o9YGV0GLNf7zpX0DBjMVB1uSa7SJcbpe3UCe4Z666MbiOuxa9g
 FQw5qWSTCeYWpHU/jdJ3GVifHoLL3fPRMPVSvhek1R312XRbqiTgnTfsaXNVqcmtG+
 rp/IWzTs1K8kLebtEbcjvCR5GoH12JLh+6sZ6l2wVVdk/vk+8Jla4KwIZoogmI+FuG
 W7Mj3WLf1MF+A==
Date: Mon, 25 Oct 2021 11:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v1 1/4] ASoC: codecs: tfa989x: Add switch to allow
 disabling amplifier
Message-ID: <YXaMVHo9drCIuD3u@sirena.org.uk>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
 <20211024085840.1536438-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HqflovOPVo9Qve1y"
Content-Disposition: inline
In-Reply-To: <20211024085840.1536438-2-vincent.knecht@mailoo.org>
X-Cookie: From concentrate.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
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


--HqflovOPVo9Qve1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2021 at 10:58:37AM +0200, Vincent Knecht wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
>=20
> In some configurations it may be necessary to explicitly disable
> the amplifier with an ALSA mixer. An example for this is a stereo
> setup with two TFA989X. If only one of them should be used (e.g.
> to use it as an earpiece) the other one must be explicitly disabled.
>=20
> Add a virtual "Amp Switch" to implement that. There is no register
> for this (SND_SOC_NOPM) so it only prevents DAPM from activating
> the amplifier. Also it is inverted (=3D enabled by default) for
> compatibility with devices that do not need this functionality.

Why can you not use a standard pin switch on the speaker output for
this?

--HqflovOPVo9Qve1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF2jFMACgkQJNaLcl1U
h9DV5Af/YM0DR6tS9cXmo696/iMxLNQ3AM1Qu0F3mIN7qrGHHDl1W52M679FBZKv
O0PXBokgEXMTWx+1j9Rg8ECudLCP9LwxYjH8qz4lH70jT//QwHzzxPw7lz1bLJJl
baa+MHgLuQvhEaMybcGM/0rekTe8ax9SgvOfnMz9bMMXRU34hXKIw2kmjWMXMwxM
baJmemj3DlmuQKOPGTjU7OVOmFZtIHEpjA9prMDP/rcBJh3YycXHZ3pHrWXh/YiE
pNZIjdrrMnyK6GN4SHuONZ+7nger2TyCvHXWbsTPrmtbPtDWNZF+LFxVhWvd6QZ2
0sB1I7nN+UtVx0nrKA8zISMns81oSA==
=B6do
-----END PGP SIGNATURE-----

--HqflovOPVo9Qve1y--
