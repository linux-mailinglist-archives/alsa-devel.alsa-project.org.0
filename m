Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59374DB3B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 18:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 019BA206;
	Mon, 10 Jul 2023 18:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 019BA206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689007061;
	bh=AD97xExNl4d84kadkKD325pdkAS93Gnf4sgXQoaxnZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F7ksDgcx5tC4i4ZCHnFKJgNZFE8D4UOeg3ez3lac10ltaiF0BHgjIhgkS1Q4Mr1oq
	 9auUSG44ckIOGBsXzrjq/ZnXCZmcgL/kt7OL/F9UQvrtoOkbTjO5Xxg6CbucYfRvOA
	 LqdEtFKN4NV0acZZl0Vm9t/lB9BY+Fu3QRsh8dg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57DE7F80544; Mon, 10 Jul 2023 18:36:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA186F80153;
	Mon, 10 Jul 2023 18:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14881F80249; Mon, 10 Jul 2023 18:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0058F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 18:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0058F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EmTrTk5j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 778CD61118;
	Mon, 10 Jul 2023 16:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D151C433C7;
	Mon, 10 Jul 2023 16:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689006993;
	bh=AD97xExNl4d84kadkKD325pdkAS93Gnf4sgXQoaxnZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmTrTk5j+Te/PpiLnGRf7RXv23Ll6SmZ3onfIrQDWSlcXzdLzeJiNp34vp0Lvzcx3
	 1VeiAo0BBxDKz9aBiiMJbwiz/uENORqMQ0DGn1RtFQ7oy4sU06ere2B5gvFfyQ4T/K
	 qRSScN9VA3Yfsq+GoD1/PHIxjXCPyS71pSAFmJcpTnIep9ZGLFVU2MRwv1C3uyDzzQ
	 PNQjjtkCwxFUAwzYHyIdskA1P1KGDwYGRJUvAKpqcSBEGJEF2xpWwuPWvLsQsxxAWM
	 GQ5K6DHT5Smi+Qfrzfn/nGxgQ8R/aDV6/zONQUtJCczf5/z4McP1y76BrNhxZ6JdmO
	 100S1CgHQ9MaA==
Date: Mon, 10 Jul 2023 17:36:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: tlv320aic3x: use BCLK instead of MCLK if not
 in master mode
Message-ID: <6144f294-939b-4fb7-a4c1-ca5a6dabd86b@sirena.org.uk>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-3-andreas@kemnade.info>
 <15d3fc6e-d294-4968-bc7d-66307efc92db@sirena.org.uk>
 <20230705215611.5f96584e@aktux>
 <eeba3297-acdb-45ca-a80d-40d8b3a90231@sirena.org.uk>
 <20230708150319.202789c1@aktux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vHDl3oKRCXKY7VQ0"
Content-Disposition: inline
In-Reply-To: <20230708150319.202789c1@aktux>
X-Cookie: Do you have lysdexia?
Message-ID-Hash: QP4IXR7XHZIWOOVWVK5N6GKNSXFEZKI3
X-Message-ID-Hash: QP4IXR7XHZIWOOVWVK5N6GKNSXFEZKI3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QP4IXR7XHZIWOOVWVK5N6GKNSXFEZKI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vHDl3oKRCXKY7VQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 08, 2023 at 03:03:19PM +0200, Andreas Kemnade wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Since we already have clock bindings we should use those to configure
> > the clocks, there's several drivers that have added this support already
> > - look for clock providers.

> ok, looking around:
> Just to make sure I am not running in a bad direction: Do you think
> tlv320aic32x4{,-clk}.c is a good example? It is ignoring clk_id.=20
> I was mentally bound to have to use clk_id there, so I did not found a go=
od
> solution.

Yes, that looks like a good example - the whole thing here is to move
away from using clk_id and to using the clock API to specify clocks.

> So I guess I have to configure the chip as a master and using mclk and co=
mpare
> register dumps with the state we have now and the state after the changes,
> additionally to check bclk functionality directly.

You can probably get away with less but it's goot to be thorough.

--vHDl3oKRCXKY7VQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsM4oACgkQJNaLcl1U
h9DKTQf+KSiGFfJgn0+yCS95t/1zJ49EUaL2ZJUBjVK2dx2CDyvCcTr2/gdfUkK2
klgsCubpCO1sj6X2Ogxw5b/el/L7wIIbWiR7pN/4GdCj3Dr6citfHmo4MPKlS0Z7
CfdIVt781Xt2SfMNTxOkb6bE8+i80trmm4UTux5+llCVCw5s4fHI6lMngoIHypvA
i5ngOyDYS0Op3tLf8/CEN+jYu7v1dltfwuEHfkghswSTT4OZF5Q3RfdVFrCBih7Z
G6diu0etMQqdgoPp1gHkzxiYUw7/WJoWcrFVg0fAVgvPztaXR5J8FYBTZsnZhOmN
V6V8i6RhYKQ/ESgvfjQUA8RojVXotA==
=IDaC
-----END PGP SIGNATURE-----

--vHDl3oKRCXKY7VQ0--
