Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F739F6E4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 14:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1425E16D8;
	Tue,  8 Jun 2021 14:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1425E16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623155804;
	bh=ksgCOSj09XyVmszVdhSU7xO+Xrsy8JreHgRZDMEdRBo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y08440Rg3LdXVSjRbSEuHUTYOrF4rHnoFfD90GmTq/kEtUJCDOdt/wrTXIxjZt3Am
	 64+QJSKRd8FAoIXakKohhvbBX/czVMV1ExhBjvaHG677dVFxu1rbqxDrb/R/MxExVm
	 tQr0sYEk5T5TpgpTvWS3cKiw7jsMcd9seqGJS7m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7B9F801EC;
	Tue,  8 Jun 2021 14:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C8D2F80218; Tue,  8 Jun 2021 14:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E66C6F8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E66C6F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KNppJYGl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF5BD6135A;
 Tue,  8 Jun 2021 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623155708;
 bh=ksgCOSj09XyVmszVdhSU7xO+Xrsy8JreHgRZDMEdRBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNppJYGlkWXDdfe66k7Rd90SRB2YRXGKYieIAru7ks+USnxNJqkFB7b0Il9FSZ4xO
 9i7kATiATFbaCdQiL3AwaZ2GmU9A/eWSn3bYV8A5SAcySANn80BdPJLzuWA5LGUWfq
 Kkvv2foQboZY3dG/9cpUd+xSI0rnf7m8Go2YovWX/G7ZnGlImZyMiHUTFX8ddNkolo
 eOgqG+L5j+AZw7luRIMjjraNGxMRR0q5yOTRFYx82XsNZKmjKOGIzyuKmspG0HBjGs
 MakojXG/ejiYIRLNhIZmAiebx/DltBlNrAg2dCBc4izxNojx4p6dnvvN/bRvVw2N1r
 9lhHSx8iBXaUw==
Date: Tue, 8 Jun 2021 13:34:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 6/9] ASoC: fsl: switch to use
 snd_soc_daifmt_parse_format/clock_provider()
Message-ID: <20210608123453.GC4200@sirena.org.uk>
References: <875yypdxlm.wl-kuninori.morimoto.gx@renesas.com>
 <87wnr5ciyz.wl-kuninori.morimoto.gx@renesas.com>
 <1jo8cgre03.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <1jo8cgre03.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Auction:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Timur Tabi <timur@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Fabio Estevam <festevam@gmail.com>
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


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 09:50:52AM +0200, Jerome Brunet wrote:

> I understand you are trying to fold some code but I'm not sure about this
> snd_soc_daifmt_clock_provider_pickup().

> Instead of repeating the if clause around DAIFMT (which is a bit verbose
> but fairly easy to understand and maintain) there is now the calculation
> of a made up constant (which is rather opaque as it is), which later
> translate to the same type of test around DAIFMT.=20

> I'd be in favor of dropping the snd_soc_daifmt_clock_provider_pickup()
> part for the sake or readability. This apply to the rest of the series,
> not just fsl.

Yeah, I'm also just finding the _pickup() name unclear and can't really
immediately think how to make it clearer - I think the bit being
factored out needs to be at least as complex/unclear as the interface
being introduced to do so.

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC/Y+0ACgkQJNaLcl1U
h9CZ2Af/dniFicYKlMwVzTiV1Nih7T1j+RxhLh1Xn46YJYlPgo623fb3uN6b6JZa
rI8wmwAHK6ieHadimu6BN9xyHoqHLiXWEdSik0mgOApKdHs02iID8B+5RwDjIrW3
e84hTeuqPQnocgaIs097SRLqZ00hFc69INX4QOZp9X9CudmuoPG/88vyiMKJp97e
EIt+wNF4W1pxe8OG5Pdr/M1xy7eIWbM6fbkDzt6KR6CCJxJrHvuiDowKmeOnMHyN
etDqhvEtQRbb3ZKv/113PjTT/MKyJlVPnwZMXHtAm4zLyh9l5XI4mYwdWPRCVokT
EUnvKTA2wAqyYFWuvf8ZfV/RjKoZZw==
=3F7H
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
