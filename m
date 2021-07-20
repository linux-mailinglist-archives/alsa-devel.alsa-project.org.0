Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06ED3D4676
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 10:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377641773;
	Sat, 24 Jul 2021 10:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377641773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627116997;
	bh=eAL8QwelZEjqkrY6xpSxtA3PODMbnmYsssC4KoVZiOc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4ydZQpbuTRDkNtiJsgEf4MB2kQE3DGVV0JU0zC4FFgJ1aecRyheXb3xsu8nY+bW0
	 cfko8vS8eVSS9JvBeNw8+0+OWzRC35mwSzlvwg8tR3CQ+RI8rJK0bJG59dd+woPmk/
	 hmeV1AQDrUIvlk4tqv3KUqqeeUqZZx+gNXareNAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B54F804F1;
	Sat, 24 Jul 2021 10:53:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 263FBF80218; Tue, 20 Jul 2021 22:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CFFF800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 22:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CFFF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JJpAfKhn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA00A60FF2;
 Tue, 20 Jul 2021 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626813196;
 bh=eAL8QwelZEjqkrY6xpSxtA3PODMbnmYsssC4KoVZiOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJpAfKhnABUmpxOg9U/fYhIdK676lUC7zxdZO4Ov+XkzsTN1uNQpBFvYrirDfIakZ
 byh9JWGpUaePwdP9P8a5i5BEvhoOUPFLDQF/TDfF6Dt16A3BeRLHI/9/G2uzjph8jw
 MevIZGtIuySKTu1ntOZrkKNQFaWrdWeYOaJyeJpxUnq3KG8ahCOJyb+BlK+zntCxgx
 Ed4I0eXobO8J3Ubp6zPV5nmDpkVivVrUweH+mzg1CoHXf/MLoxDBrQyTc2c5HwIyLh
 QY1nFaI0Gwrfw7HTmsQ+TalbuwunzUd9K0sOoGUuoML7Km3jvcukKSLHc3yF+IDiUt
 vtHRTxUbK9qGQ==
Date: Tue, 20 Jul 2021 21:33:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
Message-ID: <20210720203312.GG5042@sirena.org.uk>
References: <20210720172025.363238-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
X-Cookie: Revenge is a meal best served cold.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:53:22 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-rtc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
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


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 11:20:25AM -0600, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).

Acked-by: Mark Brown <broonie@kernel.org>

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD3MwcACgkQJNaLcl1U
h9Bjsgf8DIiqqQ26ZTa4jvNqa3wI4t/EHPC0PLaGmxZWA2e7eTEGVrmipVIkUz2m
dX2Rrsl6xOoU39mzMuCNQwVu9iqiJUoxt6xQsFG13raVCQhBTxxgkkVV2qU6BWh0
TEuDrDM4Uh5EIU/PxpwbywfyPELaMCBkFvkd9D8O/0ek7OPcVuw5Au7es/ZG+NS/
nQBA4oFRFdrIVSQmZ+Tn3/VjiivJhZ4H8MZ3oSKcFrMpQjG6ppG31dZGHpKtJNwE
bUqasYXWrqKz1seky+xKbpbMnSjok627Byj0cGtNir3l8MpB2bV+Ae2OE/tc3nyZ
aRZ/bNwgS/oYZ+vrKSOeJcgAasfyYw==
=3Ukn
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
