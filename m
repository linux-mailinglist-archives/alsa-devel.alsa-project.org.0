Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301467E4FE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD394EC8;
	Fri, 27 Jan 2023 13:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD394EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674822059;
	bh=zubF5hxw2biY59REpSIQyi1MVq2TZX3yBWHzKJcHgsY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jW3GnG2iAUtitfPbVuP4GpuUHID++IQr4mNOwXGVdYGxNwpJeWmi0ASETDGq3C1GV
	 TW/RcS3uJjXR0Jf/0P6ke/V/Fhn/8nnm3L1nwoUWB8CgbmplLcQWep0Dk/4A21/Wo5
	 T46BjjklhWZqdw/X8Dp426PYXLTLdn0EfHORM3LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A88F8F80224;
	Fri, 27 Jan 2023 13:20:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4756BF80424; Fri, 27 Jan 2023 13:19:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C65FBF80154
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C65FBF80154
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CA4az619
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02927B82051;
 Fri, 27 Jan 2023 12:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428F0C433EF;
 Fri, 27 Jan 2023 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674821993;
 bh=zubF5hxw2biY59REpSIQyi1MVq2TZX3yBWHzKJcHgsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CA4az619VNsroI1+L26WMX2G37XeSavKkuoJzogafx38KlJ07A2APA7bH+hz+rJrL
 aZ017taa/gKy9u+SmYkhznbAESEvYUUhBrR8S5HC0RZFbekRluVn5LxzN9F8ZseVpP
 DczKpLZ/eSTwxjt66B9UnrCWftC2PZWaQgudNlwozg9Iq2LPx8uN7W+JbnWy2DwSh/
 /dS1h+Xx02psOZipb1AJf2yqZULODekGVE3YUthR7miXEKLu2gdXX6OtZwKvuqShSr
 57FgsvYi/3rz4b2Psz8KyRpMqtK1igzH6OCgwjD25rt+LF4dV7V9TlUiZif54iUC1Q
 meu2OU96+hktw==
Date: Fri, 27 Jan 2023 12:19:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH v3 2/3] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Message-ID: <Y9PBZjkW7Nrsg4j9@sirena.org.uk>
References: <20230123135913.2720991-1-astrid.rost@axis.com>
 <20230123135913.2720991-3-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fuFuiNw5hNV4x0Gr"
Content-Disposition: inline
In-Reply-To: <20230123135913.2720991-3-astrid.rost@axis.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--fuFuiNw5hNV4x0Gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 02:59:12PM +0100, Astrid Rost wrote:
> Add a generic way to create jack inputs for auxiliary jack detection
> drivers (e.g. via i2c, spi), which are not part of any real codec.
> The simple-card can be used as combining card driver to add the jacks,
> no new one is required.
>=20
> Create a jack (for input-events) for jack devices in the auxiliary
> device list (aux_devs). A device which returns a valid value on
> get_jack_type counts as jack device; set_jack is required
> to add the jack to the device.
>=20
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  include/sound/simple_card_utils.h     |  3 ++
>  sound/soc/generic/simple-card-utils.c | 49 +++++++++++++++++++++++++++
>  sound/soc/generic/simple-card.c       |  4 +++
>  3 files changed, 56 insertions(+)

Given that everyone is really supposed to be using the
audio-graph cards for new systems this should be hooked up there
too.

--fuFuiNw5hNV4x0Gr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPTwWUACgkQJNaLcl1U
h9D7mwf+Igj87QjF+3lzDf5KS/kImXkgHpOujb/L88hKqV2wmVR20+aOYXJ3l16/
o88NNDzo9WM7DCHi3x/RrJT5ezFuMsxufIO5zd+dwlnAailGOLBObwM6Mc1O7xPU
TWf+dfkS07QDZ4vs3+UWhRvQ4dcn1QskWFnjmnqNg7sDzmID3thA8ekDSsHtpSlF
OUgBaJpaRB8d7C/iT4cHmmJ9F0lhdivdk51D50PFwFD9JLfsphSygZA8eD3nA5BH
DaskyGe9RJM2bWvNk99dNjIf/QUKmtWChBaCZ5D8+6o1Iwr/ocQqeajo61vfO18d
1e3oqNMZ8X1w70OurF3732GlTToDHQ==
=2ZBv
-----END PGP SIGNATURE-----

--fuFuiNw5hNV4x0Gr--
