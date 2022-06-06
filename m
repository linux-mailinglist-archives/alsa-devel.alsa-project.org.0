Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1953EF6C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5B51B3D;
	Mon,  6 Jun 2022 22:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5B51B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654546732;
	bh=/B/PloBld3O4RZgCV+lWXc3i8yVuTLMMkjx9VYvCuws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbNKSlWBun74/dVrtzlWnXjEu9T768a3Gn9rqAVg6eOGuzMsNnE0otFHOy8SKvLmw
	 jfPsQDOCmqFWryj0mdq4EA2AiU58fG79Ea7PGfDvo/stLEf74FU5EspXUlBpL5o0l5
	 146U0zJ9/4T7WY2udrY52xqQYowEecOTZmi34O3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA8CF80310;
	Mon,  6 Jun 2022 22:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C3B4F80109; Mon,  6 Jun 2022 22:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D1CF80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D1CF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aoKo2oMj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3657DB81B40;
 Mon,  6 Jun 2022 20:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCE5C385A9;
 Mon,  6 Jun 2022 20:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654546665;
 bh=/B/PloBld3O4RZgCV+lWXc3i8yVuTLMMkjx9VYvCuws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoKo2oMj/3Zm29onm9GITm4MOVqXfu7+oV0bWECk3Z8pxRMmbBzPeRLkQJ7bc/eMZ
 k0fbcvuo7hEgg+OIva5vuVm112PdpnSHmWtKZkcm3z2ryt0g2UST/yudrgzTG47qCS
 8pdQTb7WDLJ+c43lGsbgXGidsXNQtW3z14NJEje+1u8lCONjFVNgIrvIeYPeYnyzrz
 7BOaEGuqn0FtB5WNp1bye/dOhP9Mnp1ApvtcC3nV0lQ9fH6qhMJ8XO653U1hTrqkpU
 wOa3b2pit7AO9MKP19/cFJFVkN23xKJEEzeNGvfAJaILVx/n4KV/Lp7HJKu72MG2rg
 fp1Rzb6VMDC0Q==
Date: Mon, 6 Jun 2022 21:17:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 3/5] ASoC: apple: Add MCA platform driver for
 Apple SoCs
Message-ID: <Yp5g43IxFQsUoS/y@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-4-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="elKz+L5SmKmXJeQI"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-4-povik+lin@cutebit.org>
X-Cookie: Have an adequate day.
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


--elKz+L5SmKmXJeQI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:08PM +0200, Martin Povi=C5=A1er wrote:

> +++ b/sound/soc/apple/mca.c
> @@ -0,0 +1,1122 @@
> +/*
> + * Apple SoCs MCA driver

Please add SPDX headers to all your files.

> +		mca_modify(cl, serdes_conf,
> +			SERDES_CONF_SOME_RST, SERDES_CONF_SOME_RST);
> +		(void) readl_relaxed(cl->base + serdes_conf);

Please drop the cast, casts to/from void are generally a warning sign as
they're unneeded in C.  If you want to document the barrier use a
comment or wrapper function.

> +	/*
> +	 * Codecs require clocks at time of umute with the 'mute_stream' op.
> +	 * We need to enable them here at the latest (frontend prepare would
> +	 * be too late).
> +	 */
> +	if (!mca_fe_clocks_in_use(fe_cl)) {
> +		ret =3D mca_fe_enable_clocks(fe_cl);
> +		if (ret < 0)
> +			return ret;
> +	}

This requirement is CODEC specific.  It's fine to bodge around to
satisfy it though, especially given the restricted set of platforms this
can be used with.

> +	fe_cl =3D &mca->clusters[cl->port_driver];
> +	if (!mca_fe_clocks_in_use(fe_cl))
> +		return 0; /* Nothing to do */
> +
> +	cl->clocks_in_use[substream->stream] =3D false;
> +
> +	if (!mca_fe_clocks_in_use(fe_cl))
> +		mca_fe_disable_clocks(fe_cl);

Are you sure this doesn't need locking?

--elKz+L5SmKmXJeQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeYOIACgkQJNaLcl1U
h9BVlQf9Hhza64pdhAryt0leuNmoItrjQI4ru3oVzIPzjS1FTHojgISfLilo8RjN
xsVACb5GG0HKM5P/KUmFuH3+niL6W1zxmfO67gzGz0gr5zGpQLvy7XaNc52rVqM5
u5A9NH0Mqv4/OBbjCi8UzbhG8wZfkAIr2B6FENy3KsSbzdUq2crOrOhiS+TwEK8P
gQ0yfnnAAm7oueBiZ0ByCfMHOeBtG6dR3o5Yz+UhnZDmg783E0xvz4okjXcbuo2m
eHMDeulABPHv86DHGZ3KlvUHIK3n8398P1iZxs/0NuJqvNkT4JFcL06Y1TFYeywz
/0ogXX5hoScevm8+OW4gzuc99bGDBA==
=ItfL
-----END PGP SIGNATURE-----

--elKz+L5SmKmXJeQI--
