Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B132264509
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 13:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C3A1696;
	Thu, 10 Sep 2020 13:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C3A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599735921;
	bh=dmrwyQMyeJMFMQp1EmqKFdckpq9rAe0lbenAUyImoHI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRi53VptmhCeI1oatlzVK6+mXRiBg4pKLQqVl9mGqVXSXRAoyW46IVA9dDjgGGSkf
	 Hr8Q8o2X9lVDsSQYqyf9IaFlujOqDdcSqlABwB2EeH4qxv70HsxDjcGrfHGMBrt9C9
	 zx6pj8yuz6E0YURbyYiMK6/Zvv+m0zvBkm0i0KOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13942F800D0;
	Thu, 10 Sep 2020 13:03:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B030F80264; Thu, 10 Sep 2020 13:03:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42D90F800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 13:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D90F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="18mUZhE8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2DFF20720;
 Thu, 10 Sep 2020 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599735807;
 bh=dmrwyQMyeJMFMQp1EmqKFdckpq9rAe0lbenAUyImoHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=18mUZhE89SuUR9AkRIvaLcq0CV19oM50ifpHaALiIug/IWYJwyy6/yKbEXGWUq0e2
 ySMgHwdgAHR53xxhtsjqglHPRZ6z18CuVQ19qtjnOwsiniC5WkrCRFiC2Lm3RUg9ox
 sGG3YwHzjYvnF+tl2rakOguBKLp+KG5CEGtVhy5w=
Date: Thu, 10 Sep 2020 12:02:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200910110241.GA4898@sirena.org.uk>
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
 <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
X-Cookie: I disagree with unanimity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Cheng-yi Chiang <cychiang@chromium.org>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 11:49:22AM -0600, Rob Herring wrote:

> I would assume a codec to be similar. The codec node (the alc5682
> node) should have any jack related properties (or possibly implicitly
> support it by default).

This isn't always clear - some jack detection is implemented entirely by
integrating simple components like GPIOs and ADCs or by integrating
limited support in one device with some external components to get more
features (like bolting an ADC on the side for button detect).  I would
not expect to ever see a device with jack detection support that could
just be unconditionally enabled, it will always require some board level
wiring up to provide the connections required to function.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9aB9EACgkQJNaLcl1U
h9AQugf/fpoDHSobmOyj7a1nUYga227O6hgeON+vz+LB7a1JnX599O2oELAe1IGT
xOV8DGUJpwdKUP1XWMHb/vMrtaS71E8m6Qsulc3s+Hdt6F38ObT5+z7zu0grr0rm
wN1qRoyWHkPhFczDkvF95J2xO+lbs+5DbmfT/YVL+npWCtyYRVgKDwhmwWvqk/Sv
5H7dVBlF1ivTTc4mAbG0FGGVlSL9hsg87i9b30jChkitX7BDRyvj41eVOdQs0Dpz
ghIR+b6ZFI4iihIbFj8kBDL6y6cekl0Cs9YUA5YLsDxSjSJUidnCiuX1UK3NNOW2
HiD76k32T+eskJVotOs6/DwV7UQS4A==
=knP8
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
