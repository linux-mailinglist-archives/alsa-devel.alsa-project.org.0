Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE133D50B9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 02:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F1816F5;
	Mon, 26 Jul 2021 02:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F1816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627258737;
	bh=nuURIrrezXFPM6ZSc0I3TibIrupYjPPlqH5eGbL7XQU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QNA3gh1u6HuigK6j6ItxX7mb3MmFnoztqEzRab2rBdlM0qmBYkEaU4y6jOkhx/Gdz
	 pBMp2BKDHhOGnYyK4ChGdlQ56OGLE13OC9yC/+7dUYvaYwq0Z/yV+E94cbYNUWXyu3
	 6hbdeoAIVI3+LORfxqKivWoBOwjgtc5MjdA0nOuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2076F80276;
	Mon, 26 Jul 2021 02:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60535F8026C; Mon, 26 Jul 2021 02:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E4ACF80132
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 02:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E4ACF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="caJKxGWP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A52AB60F11;
 Mon, 26 Jul 2021 00:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627258642;
 bh=nuURIrrezXFPM6ZSc0I3TibIrupYjPPlqH5eGbL7XQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caJKxGWP2kSWnqX21ntc8iJuble5qLLTGd0lYT6xDhSyRMFN1OGHdBJ7WsHUTaDPr
 LTYBB7O6iswNV2873+ay6bcP+iHXbAGWVo9j1UuT4PtdshX7GRr3ZJ44Cv017RumN9
 fmAPAXcjoqsCQUgsm8tCfooduPpjJdTNVp055Gb+SKeaw+bN+KDWSCMBFgYn6P7NZP
 oYHaIoiVgI+zvqMMeYAH4QBzoWTFRkyyWODQN0/VmCkEzBKWUQxLdRWrzXGgJslYpi
 vjYIAeZXTkMXOqNa8NEENB5RR6o2mVWfLTAa/PEvi1hwFFtHvEoW6j6HO+shHswweH
 07ottcW2XJtfQ==
Date: Mon, 26 Jul 2021 01:17:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/54] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210726001713.GA8831@sirena.org.uk>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-2-maxime@cerno.tech>
 <20210723213251.GA2622319@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20210723213251.GA2622319@robh.at.kernel.org>
X-Cookie: Enjoy yourself while you're still old.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sunxi@googlegroups.com, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 03:32:51PM -0600, Rob Herring wrote:
> On Wed, Jul 21, 2021 at 04:03:31PM +0200, Maxime Ripard wrote:

> > Even though we had the wm8978 driver for some time and a number of
> > boards using it already, we never had a binding for it. Let's add it
> > based on what the driver expects and the boards are providing.

> > +maintainers:
> > +  - Mark Brown <broonie@kernel.org>

> No one from Wolfson cares about this device?

> Otherwise,

> Reviewed-by: Rob Herring <robh@kernel.org>

Well, Wolfson no longer exists since it was bought by Cirrus but copying
in the Cirrus people to see if they want to be listed there.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD9/wkACgkQJNaLcl1U
h9Caiwf/aInaYRb7gyQiNQnhHD5hUTgMD05NxJI5RgvAQZIhlavXuM9IubnFfiiS
pvPE7cNm9l8ghN6OD7gdNUj2E0jR1eOYosuXylG/FWAFVXZoxGaDuWLpVARb1lv6
d1nfKUEbCR83f5Hz9hAzUY463RUlLKQZnWHyjbpuT2bwPOXfILtjQCv47xnfWLAc
80v0thB9MbqCxHlu7Mju6+bPYzJURC1bmkEwUgFeDn7pHPvC1kv8LdOp9/WmHi/Q
lNk4u/BKXbc/UWPj4dK7uM5rElavIZ1267UVK711yPAfrKCLJf3CdQcbINqDWnEz
th/mQt0rCGsU9bhjYDfB+blmedPBqA==
=pdOV
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
