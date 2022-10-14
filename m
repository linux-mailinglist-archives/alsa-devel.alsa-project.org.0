Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9855FEDCA
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 14:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18E26654;
	Fri, 14 Oct 2022 14:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18E26654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665749011;
	bh=kVy31r3/h21vCG8QHqLh13ALXicMXU3nisOAYti+Q5k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8ddGQs3vzEcUaYOKK6zl/NupcMhlfQaQoKeXvMS9OSiCJokltFQ6GfQmRHEThrc6
	 g8rzg+DFFbTehk6dlawQHtE+fkpS5t+YtLC7IaeLGq+TA6qCp9krpo8E+FpPbAzNir
	 0YtbMPmELFLmiki1GTvzQQGSP2bJPGOVf9nxMCxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6832FF80240;
	Fri, 14 Oct 2022 14:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B331F80224; Fri, 14 Oct 2022 14:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0157BF80115
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 14:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0157BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OSs8wt76"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B342EB822AD;
 Fri, 14 Oct 2022 12:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673B3C433D7;
 Fri, 14 Oct 2022 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665748949;
 bh=kVy31r3/h21vCG8QHqLh13ALXicMXU3nisOAYti+Q5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OSs8wt76NzBNkq27S7FBfulQrBeTLcmu6r1j6QUFhDoEqWgg5gF6iOlPlRy6Ca89D
 gk2jDUIN+ygSCA3HfY4mLsG3HKbhwSeywdB2FFsn0AAoExAkyl1adgOynbqiOk/17O
 6sLobr1OU2h9vmaP9XWtmazxiUSX1SuVYbY6nUGBDbWeYmeXb286S8ObQMuRvpuD5s
 jEOeTTuJJLvVsWsbLY0lrpWptf2LiK91Ts1WbEUVMeqjitKu9fxZXS73cUHhQnaYc7
 oWB0cZYHTqnOhyIkUlszA65A1QvCeCC8LEKBt8HbzPcMPAqcpqZL2Cv2hkZpvI3qbd
 lOPAvB/k++TYQ==
Date: Fri, 14 Oct 2022 13:02:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: i2s: configure PSR from sound card
Message-ID: <Y0lPz91gbovAub9D@sirena.org.uk>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104857epcas5p2a275a1d606ca066227228d13bcf5b120@epcas5p2.samsung.com>
 <20221014102151.108539-3-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9qwgKi0P7NmZJOz"
Content-Disposition: inline
In-Reply-To: <20221014102151.108539-3-p.rajanbabu@samsung.com>
X-Cookie: There's only one everything.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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


--/9qwgKi0P7NmZJOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2022 at 03:51:47PM +0530, Padmanabhan Rajanbabu wrote:
> Currently the prescaler value in samsung I2S dai is calculated by
> dividing the peripheral input clock frequency with frame clock
> frequency and root clock frequency divider. This prescaler value is
> used to divide the input clock to generate root clock (RCLK) from which
> frame clock is generated for I2S communication.
>=20
> However for the platforms which does not have a dedicated audio PLL as
> an input clock source, the prescaler divider will not generate accurate
> root clock frequency, which inturn affects sampling frequency also.
>=20
> To overcome this scenario, support has been added to let the sound card
> identify right prescaler divider value and configure the prescaler (PSR)
> divider directly the from the sound card to achieve near accurate sample
> frequencies

It's not clear to me why the solution here is to move the configuration
to the sound card rather than to improve the I2S driver to be able to
cope with whatever the restrictions are on the PSR in these systems - it
seems more cumbersome for system integrators, especially since you've
not documented the issues or how to configure it.  Could you expand on
what the constraints are here and why it's not possible for the driver
to figure things out (given some quirk information)?

--/9qwgKi0P7NmZJOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNJT84ACgkQJNaLcl1U
h9DRTwf+J9Be15r7sAl4i8Dde8zTmse0pnZWcotDM9pbxNNsJ1iutdxRsMnVlQuJ
9HavNjMp/3R7o6I3cIMB8ssa+EEaSLYDp8NzgDFhog/37cUV0whEBD6J7CRq1NRm
pmN7pQkbvhvgK1M7y87LDhliNEYfVeRIkZR1Rk71ncNurfT5MLwYZNwuUcvmXpwG
hkvgjy15llDZwcMT6Phj7VPmubu1MKGKhkLXQJLNKJFYD36NoSWI8qK6ID17RrQl
JGMpowz32/S0oIjmLkWgPpf1upirFZC/nL4YO/mbYoDF5jUYsFPxAXD2MmRv8Bue
7y5v0drOp0Cq70TJFJ3xkEb8CWA4ng==
=sCvP
-----END PGP SIGNATURE-----

--/9qwgKi0P7NmZJOz--
