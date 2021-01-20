Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2E2FD7B1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 19:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26FE182B;
	Wed, 20 Jan 2021 19:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26FE182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611165862;
	bh=80QPQ1tUnCI+MW0jTeGbyt3BfzbMKu1EZPYFQ/8znYo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4eXjkjofFTTQLUrmYHjKMcyYG28LsNLfmRB/0OeGFFYY3eypkI3Z5UfI6OaFsyt+
	 tXZfLFbky3fjrAbsbaGaPPl6QlrWQVlmioEjOQqtxNH/nr9fqTB6pSEYtJWICg5i1h
	 dJDkH04Oov8jVtOted3MTCzqTuMH9FZ3zMOWvHZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B885F804C2;
	Wed, 20 Jan 2021 19:02:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16286F804E0; Wed, 20 Jan 2021 19:02:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE8DF804C2
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 19:01:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE8DF804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iguP1zsY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0A73223E0;
 Wed, 20 Jan 2021 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611165714;
 bh=80QPQ1tUnCI+MW0jTeGbyt3BfzbMKu1EZPYFQ/8znYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iguP1zsYz+guPEqch2wN+Veq3R2y5uH+8bvPG3YSyGndMBy08wFATTnEuFfaZDYpw
 n0jSHz15FPbAxGxQeUS6f1vkoD7IuDlT/DuvuFjdoytNA70lJCohEV3ISAOYR8uFDy
 oRsNi2DZd3r2NiCecmRbSyYYaHWLpdNe45fRX/wyjH3RIawFAI3oirpayXq0foZ/GL
 OKKdIvUMR2eAQ28Wr3S7oJouj9gxlMFIH65ExIfYIzw/L0KTJgOFVlE7xdg/eMH7Kr
 Af2QAzZLeOX0W8xBR2M+81k6rZD+Pk+KAln+bkn90Q2g7cvu3o+QnqweKR0jn4fwRk
 chC/A/NkbuejQ==
Date: Wed, 20 Jan 2021 18:01:16 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Subject: Re: [PATCH 2/2] ASoC: rt5682: add device property to control LDO2
 power
Message-ID: <20210120180116.GG6794@sirena.org.uk>
References: <20210120091218.10837-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <20210120091218.10837-1-shumingf@realtek.com>
X-Cookie: Beware of Bigfoot!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 derek.fang@realtek.com, flove@realtek.com
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


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 05:12:18PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The application circuit shall provide MICVDD power.
> In default, the codec driver doesn't need to enable LDO2 power.
> In case, the customers use VBAT for micbias, it should enable the device =
property "realtek,ldo2-pow-en".

Given that this is just adding a DAPM route I think we can just skip the
property and instead simply leave the LDO registered but not connected
in the DAPM graph, if a board wants to use it then it can just add a
route from the LDO to the relevant input like is currently hard coded in
the board file.

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAIb+sACgkQJNaLcl1U
h9B9Kgf+O9gfjwVDh1s8alMiUDUiAG5F5IIeNjXvHrENnJtRRFsRgSU52eaLm2AL
9vK61g/F3eSK+1YLPhBwihX7q6Yuv59AHtWMxxUhvzt1FPYLFYKk8IwznllsXZCd
hNS5c6QJ5al+LfMLyGkozbmcTlk4t3kmubXovWAEHCQ1aKc1xAAUK3iLdR8Bpj0f
b4JynBWRVejTK/NfxfRpl7wpKq9oHSZ8qoEHIb4jIW/e6Vf9TH2LnVXu7pKSKfJj
YlgLAmHIsCPSfqMj9qaVkpwZ0mGcuyK0dPHI/OA9ixByoA2Kf2RkfLdDm6IXM6P1
gO+rTK7jQr7K4XYS79TLUh7RxF1TSA==
=+Q2S
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
