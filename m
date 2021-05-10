Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD7937A315
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE341782;
	Tue, 11 May 2021 11:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE341782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724283;
	bh=Ga4I0r8tVy2u+77ySaPHZRkDyjttK1GlRQ45qAXDDGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/DRpsFzqN9aQs+byIeFOMiytuoMcSkmN4iALhWkfJA83+0KQ5YSGYXskP3xL+AtX
	 k7L+hCitkBYhuJxt+U5+FloXtnAKiqmxGQFw+4FR3ICvSu6F8tzRQIepj17427xc5t
	 sEN0aAAe/pt/Wglsm6qNUZ6dq4y3PuWzat+ga+DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A576F80430;
	Tue, 11 May 2021 11:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A87BF80240; Tue, 11 May 2021 00:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 190E3F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 00:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190E3F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OBnLFf64"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E56C61040;
 Mon, 10 May 2021 22:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620684223;
 bh=Ga4I0r8tVy2u+77ySaPHZRkDyjttK1GlRQ45qAXDDGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OBnLFf64VUW275JQ0ZhIP22IwN/b0kZCT9quLN+tqcOdv4Ji0t/uBMC18p9FCSYYz
 AKMdtSxYC8D+0WX6S2kKBFWyOnmIyxJ1vaNflNJKpFlSwIBd9ebI/cwdyl9w5WU9Vu
 ZrD0pSaeuTuAqqSyUuFqCcyBYOwXOHul0hkVYa0H5lQypznYIHmVm1hFqtL4JmML5g
 UhFHIuz1ov6FNaSsMZBjsKDiUHoZR0EkLlHn2HVL+9YvK05EufxqC3jgZawGy7Qo2R
 yb+mswfRltVOc5vIAsglBnZNjFQOK4vhPQtfpsIquvpkZQ8ht4u86FCESEDM78DKOo
 a6/m57Hf/9SbA==
Date: Mon, 10 May 2021 23:03:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
Message-ID: <20210510220303.GE4496@sirena.org.uk>
References: <20210510204524.617390-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline
In-Reply-To: <20210510204524.617390-1-robh@kernel.org>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 11 May 2021 11:08:22 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, Orson Zhai <orsonzhai@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 Alex Elder <elder@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2021 at 03:45:24PM -0500, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. A few new ones slipped in and
> *-names was missed in the last clean-up pass. Drop all the unnecessary
> type references in the tree.

Acked-by: Mark Brown <broonie@kernel.org>

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCZrZYACgkQJNaLcl1U
h9BnKwf/Z134oVRMYcotQgN8s5J/xgwf2QImV1mvL+RIHKYjJlyARPtcQni65ppK
kBXjEC4LHxqFVlIrlrJfEST6iFTyPm1loKXZJcVvWY6vytNmswI2I4CdEJ1ni6Tc
EbsF3hoyBU3llDDoOwwj/RdeQPaoSR3x608OaWFPOaNUW+Z8IL38hmQCIQKzOAkh
qSD4lvREiasStstHcWZP4n1zy6VoNrRyGJ7Lk8lLY+VrgnBep/moN+3IbpomPjow
VqvyYkr15OhzegEJ0n88HvNWv1SHSy3+7O5GiABguaOYx2waWTD1FffrfxDcts8c
3ipGtVLahbT+uQ3Lo4HLskPQmk3abQ==
=0dIA
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
