Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6B545076
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC261A26;
	Thu,  9 Jun 2022 17:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC261A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654787854;
	bh=g7Oqc6okGrgAx2RptXrZI6uH5NS5zvIuypnAIqUna2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F139hKFBf9KFWfsTsJ+Mtl0kH99MuQp5ZptViszVtOLSkghKDBRMABAbtiFpz3t1u
	 jbSNUeawtgUreqG6yxhbtVkXdPb2aZkdUTtuECIuE30YX5lXG2eNF6u6P4GJgoxZF8
	 k5ya/oHCWAyBWUMpmGxsOYBqwnqWpdn/QzbGwkDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 499F2F801F5;
	Thu,  9 Jun 2022 17:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E26DF8019D; Thu,  9 Jun 2022 17:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BEB5F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BEB5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o7w8oySa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2332DB82E25;
 Thu,  9 Jun 2022 15:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249F5C34114;
 Thu,  9 Jun 2022 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654787784;
 bh=g7Oqc6okGrgAx2RptXrZI6uH5NS5zvIuypnAIqUna2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7w8oySaar1T/ReMIGIxfKrU0DzfO2Vm6KkavvWw68VYTbKQ1ZTYGtcFEqJy1u5o/
 GTndLqfts78bw5+P8JvEV8SJqki4yEd7oTtqg5X3HZ0EhaifDeGI4Ee1nIkNHKxy3b
 8GfMr58B7Jv3PM+T6NHEUILQDVLXZq8s8YyT5ZY1nrLtoWkeng381ucXf0Rfwoe0MQ
 blAWV9JWKwfBpKZDEBOJ/Eg8ZkATZOfs8BaYklyL+cD09UvC9HBE9MuLsiLXW+QpIv
 JcQp5yWwOBzvU6CWafl5Vm3g8O4Z8aQXFzISLQThLRjtRxx+sFJ5mTTB4PYk+0IRe4
 5OltI75EVahNA==
Date: Thu, 9 Jun 2022 16:16:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Message-ID: <YqIOwrRN8rPUF7Y8@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqH2uCgaedf0HQPE@sirena.org.uk>
 <8961DDD2-93FF-4A18-BCA2-90FCE298F517@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9pewpbWOkjDXgIrF"
Content-Disposition: inline
In-Reply-To: <8961DDD2-93FF-4A18-BCA2-90FCE298F517@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--9pewpbWOkjDXgIrF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 04:09:57PM +0200, Martin Povi=C5=A1er wrote:
> > On 9. 6. 2022, at 15:33, Mark Brown <broonie@kernel.org> wrote:

> >> +		/*
> >> +		 * Primary FE
> >> +		 *
> >> +		 * The mclk/fs ratio at 64 for the primary frontend is important
> >> +		 * to ensure that the headphones codec's idea of left and right
> >> +		 * in a stereo stream over I2S fits in nicely with everyone else's.
> >> +		 * (This is until the headphones codec's driver supports
> >> +		 * set_tdm_slot.)
> >> +		 *
> >> +		 * The low mclk/fs ratio precludes transmitting more than two
> >> +		 * channels over I2S, but that's okay since there is the secondary
> >> +		 * FE for speaker arrays anyway.
> >> +		 */
> >> +		.mclk_fs =3D 64,
> >> +	},

> > This seems weird - it looks like it's confusing MCLK and the bit clock
> > for the audio bus.  These are two different clocks.  Note that it's very
> > common for devices to require a higher MCLK/fs ratio to deliver the best
> > audio performance, 256fs is standard.

> On these machines we are not producing any other clock for the codecs
> besides the bit clock, so I am using MCLK interchangeably for it. (It is
> what the sample rate is derived from after all.)

Please don't do this, you're just making everything needlessly hard to
understand by using standard terminology inappropriately and there's a
risk of breakage further down the line with drivers implementing the
standard ops.

> One of the codec drivers this is to be used with (cs42l42) expects to be
> given the I2S bit clock with

>   snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);

That's very, very non-standard...

> I can rename mclk to bclk in all of the code to make it clearer maybe.
> Also the platform driver can take the bit clock value from set_bclk_ratio,
> instead of set_sysclk from where it takes it now. The cs42l42 driver I can
> patch too to accept set_bclk_ratio.

=2E..indeed, set_bclk_ratio() is a better interface for setting the bclk
ratio - the CODEC driver should really be doing that as well.

> > This shouldn't be open coded in a driver, please factor it out into the
> > core so we've got an API for "set limit X on control Y" then call that.

> There=E2=80=99s already snd_soc_limit_volume, but it takes a fixed contro=
l name.
> Can I extend it to understand patterns beginning with a wildcard, like
> '* Amp Gain Volume=E2=80=99?

Or add a new call that does that.

--9pewpbWOkjDXgIrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiDsIACgkQJNaLcl1U
h9ACKwf/YZJS4IidB8PLrqJutJ24+zfwh5XjdeWxTJU/6eLmP1HKeb+L0Bb3/m8h
rTeql1h4u1skdZS5n4Qquu2Ef/LZi37igpwS7gWLqbEpFwYu5sckQaPlQMRa/u1L
702Jia4X+J7Hys5jxUfPNZ2jNQz8aOFa7dbGO3wQhXiYq8nAQX6++sKtSNY+U7sM
CoGh6qDYAdXQcDWa5difnmNeuBgE9svs2O32c9GGvr1Qbe/E96SxCBt/O34IDWDR
sOA9p0dtg6OV4NNlRdZTwX0FQI5nKKIdkLmJEfnf0L0c4N0Ie6zPKGa+Ql4JsI0h
NXw7Jz689++9HHCccTxbkhpNyQJkNg==
=WVsI
-----END PGP SIGNATURE-----

--9pewpbWOkjDXgIrF--
