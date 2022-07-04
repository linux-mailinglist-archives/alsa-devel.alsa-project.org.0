Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB7565C16
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 18:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F354C1726;
	Mon,  4 Jul 2022 18:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F354C1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656951944;
	bh=dDT6TcD454XFvSSPajF93+eR+cdOB5pLYEIieol3Tg0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzWzhcb7zuk7Unbz4SUXj7lNztNTYjSEyMtJUQy6n2O5JQ/zlnkF/DjNIHx0L8G0a
	 TP/N+05aFa5GDy/LSNejpFobMkET4953fFs5CwmeXpze57XuKos571sdi/cosKtuDv
	 rkyOi23/t7bP+YLhW2Vw9qKDxoipnfuq+5D7BpNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8B2F8012A;
	Mon,  4 Jul 2022 18:24:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5591F8014E; Mon,  4 Jul 2022 18:24:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 506FBF8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 18:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 506FBF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cllBcGmG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95BA760B4F;
 Mon,  4 Jul 2022 16:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B245FC341CB;
 Mon,  4 Jul 2022 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656951874;
 bh=dDT6TcD454XFvSSPajF93+eR+cdOB5pLYEIieol3Tg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cllBcGmGun0bGXF+xOhCyyQ3okyGPRag8ICHdOSd6H/WKjUcWh6ZJC0NbSS5d3nba
 Goh4o7nDdCZOypukCMs0bMuOIfhvcQuROptYbAPL6PkyKIck8pKM9Jk/4a3fno0gzi
 Z/r4qC6FbiI/mjav8WBG4S0h0jdvZT7cWe1N8kTque9/gnleTwaY+jl5j+ui6Zwv0N
 /aLvv0inknwwWMny2CtfQ5vFQpYKmmZO2ajyMMXQc6KILxobjxU/f1txMUlOkz1taM
 ovKtQvsn3owy/nyK77tW1QfPrGn60fMlQwxOl+sUuGoz3HBwOxAqtVr4kr4QkPPDg5
 TVxwDcSn3K5lA==
Date: Mon, 4 Jul 2022 17:24:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <YsMUPXoy4LrW1IHj@sirena.org.uk>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
 <YsG3kKwmoqF2MxU2@smile.fi.intel.com>
 <YsLCwQM0gbhFhSke@sirena.org.uk>
 <CAHp75VeCTEE4-O1LLYNunf_ZU164i8rnqeRf9dvp=R=_eEC=ig@mail.gmail.com>
 <YsMIzz6JkTLw7heY@sirena.org.uk>
 <CAHp75VfkOndCsu9S3M-ftKAtVntsPkRKUuaOo2xOa2w5c3xZkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CxxRMsZICbib0xwR"
Content-Disposition: inline
In-Reply-To: <CAHp75VfkOndCsu9S3M-ftKAtVntsPkRKUuaOo2xOa2w5c3xZkg@mail.gmail.com>
X-Cookie: MERYL STREEP is my obstetrician!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--CxxRMsZICbib0xwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 04, 2022 at 05:51:44PM +0200, Andy Shevchenko wrote:

> I found that there are files that are related to the sound/soc/* one
> way or another, but listed only in a certain record of MAINTAINERS
> without being listed as part of ASoC record. Does it mean I have to
> always remember to add ASoC maintainers to each patch that touches one
> of such files and doesn't provide them? OR do we need to fix
> MAINTAINERS for such files by listing them in the ASoC record?

Presumably one of those two will be required, yes.

--CxxRMsZICbib0xwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLDFDwACgkQJNaLcl1U
h9DSVAf/S3iXNGaYbDWtAqUgnKnomBWTIuS4NYgbEUukfyEBUlfmidchhYVk/2rV
iFqF9gtVHB3+f+hAZnQuQdo0AJJmv7Ww1ysdbuXJx7G54el199rLMOdQynjK9ylJ
XcYtDkZ/8tpK0zEwRdunGQxgBFIw7yUTOK8prA0wkw+dF0VolTZGlKoZIwtOZu3f
+3LgwhLrB9utQIo4xidl/hnaElC+v9xxL2qxmz5HAz1aemQRyCshhnJ1UCn+sH+S
BBS/KKHm8NUtex6i+LS/G+JL6h3BZvMld/qfD9bUjxtvb9Fybw/rcAf9sf+HyrRK
KP03PMHKUEIbjD8LyFFnAvQswssNXg==
=KWbX
-----END PGP SIGNATURE-----

--CxxRMsZICbib0xwR--
