Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC325C945
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 21:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881431935;
	Thu,  3 Sep 2020 21:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881431935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599160532;
	bh=ieMpRIR6pWoOu4w8pRpaOou18ysCy/LkGmskOztkzAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+zDQWWI6tyet2bMNKfnjYVeksCYMaHGvwBV1ufq5stpaHwXWlyEf+BycQRaoA5lK
	 Vkq0mWtbXPs0XYncvBAe4YHYuCPPm62nSnA84sW8eeuNx8nRaSec0jKy4LDSU/sarJ
	 +Tt41yO1vSYCykJl2hq1hRWIpGoK5dtWIESLhcWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9929F800F0;
	Thu,  3 Sep 2020 21:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A81AF80217; Thu,  3 Sep 2020 21:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 015DEF801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 015DEF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iuN1RwT3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B189208CA;
 Thu,  3 Sep 2020 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599160413;
 bh=ieMpRIR6pWoOu4w8pRpaOou18ysCy/LkGmskOztkzAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iuN1RwT3WszF1ZmfxbChiM7DROdOiwGq+YjoKQ/Kry5aYjdAVaPZ3pvBlajIqNSU3
 CE5cola9kBD7agmSRBO+jJYSxJzvF4QPwZahdzDTsvfhPA+2jUOw1Mn11Gf+jnhLap
 yuFQJ294zJddWZKbC8Ha/EI5OPWthypO8uuBhFIQ=
Date: Thu, 3 Sep 2020 20:12:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-ID: <20200903191252.GE4771@sirena.org.uk>
References: <20200830112633.6732-1-krzk@kernel.org>
 <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
 <20200903164738.GA2929052@bogus>
 <20200903172645.GC4771@sirena.org.uk>
 <CAL_JsqL+_5Lc5vwtqnCZd6Tz9eB1m_oy2r3gtv0cbwBwKTU=dw@mail.gmail.com>
 <CAJKOXPe2XpciJtGAFq8c7E=7wrrzK0XUrquDCaNQK+u-2yLByQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline
In-Reply-To: <CAJKOXPe2XpciJtGAFq8c7E=7wrrzK0XUrquDCaNQK+u-2yLByQ@mail.gmail.com>
X-Cookie: Murphy was an optimist.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 08:08:51PM +0200, Krzysztof Kozlowski wrote:
> On Thu, 3 Sep 2020 at 19:49, Rob Herring <robh@kernel.org> wrote:

> > Just 1 other you picked up. See "ASoC: samsung-i2s: Use
> > unevaluatedProperties". Patches adding the missing properties (and
> > restoring 'additionalProperties' on these 2 if not reverted) is the
> > correct change.

> > I've gone thru and NAKed all of the others so more don't get picked up.

> Ah, my bad... Mark, I can send a follow up which restores the
> additionalProperties (so kind of revert of the second patch) and fixes
> the warning. Other way is that you just drop it and I will send a
> correct fix later.

Sure, that sounds great - I'm just finishing up for today anyway so I'll
look out for something tomorrow.

--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9RQDMACgkQJNaLcl1U
h9ASeQf+PmSYAK9ZIthpegCdJtDuSz+BrehOdRUQ0tfVbcxq+q4LbOhvj2ctLk1o
l0HNN4x7H2UN7WSHcmB+8SeU5LnQ3Ru0DVVa4WO1FlV9ddw59+XSA60OlPDud34D
oulKn2YOwZZvHHhuq03PELn8Mt3ziI4IW3I7olw+sUWqjRMdxWkgWDmZ9FUhtfBm
w1lkgD4O5uzFml8NgnrGZrcXJa7hvFQ7pPZQ5EWCTaz2G4wsIMKyC/li6B1xDji1
9Cg52p2xTfU1zEoeODp0mY1KTk/33rPs+n81jvfwZ5+8ZUll12oq5xg+DwRqUPbN
Qzl2uW3vsc3+m9C1WENdcJtMsWHEkg==
=r9OV
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--
