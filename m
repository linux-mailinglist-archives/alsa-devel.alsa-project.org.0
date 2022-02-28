Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994644C9FD6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473761F3A;
	Wed,  2 Mar 2022 09:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473761F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211056;
	bh=C3m4pnnTAF+o+8Z+tsT22TMwOAoIvmDl7rQIHuiLdMA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wx/ihKBxxwhb+eWKNMa7+VOzulo/nuUaaRXaCdEQ79VVYTYOumddLsDR0NqOKzdn9
	 R0ec6RGZNW/EmeBWeM6LMV46Ls7zyZPEI/gq86hSEtIKIJkzeG5F7IlARlM/EAbNpB
	 oPdh4dDruZyEMO1kUPhZAS7ZjdGPjkIqi/k8zLBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D603F8068A;
	Wed,  2 Mar 2022 09:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC87F8013C; Mon, 28 Feb 2022 23:09:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC22F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 23:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC22F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BdRbVBZN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F5AEB8169A;
 Mon, 28 Feb 2022 22:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10FC340EE;
 Mon, 28 Feb 2022 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646086180;
 bh=C3m4pnnTAF+o+8Z+tsT22TMwOAoIvmDl7rQIHuiLdMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdRbVBZNF8SyrlpXKAsHjo1A6k3f944Uzsh5hy2UmK5ywn8cPtoiWatoTWpomjQzc
 x44Jv7/Wzxo8T+fSgsmyLRYgbKXOQkqEy86p/ln+HE5A679Zvs+XoyM7aJWc8wSHt6
 ACqagutJzp7I7JrJGyMxpDRREGY/HUyTANKgF4FJ/99jkm+o2X+/pda0xDuvY8MbdY
 Sv4Zfi/zQD1hFPf6GsOnP6lA5hiuplekt76UNCcR1YonNLI47HOJfCmRDkLAT1NcBE
 yuQHyRRcOkNLJGUq9zBF6RREf+bF8FScygNYfOz5OBENPb041Vfalb0bt696k7uf4U
 g+dDDXgOJFcHA==
Date: Mon, 28 Feb 2022 22:09:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh1IG9daOUOB52rf@sirena.org.uk>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xC2AwCckB4yHmCdp"
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-Cookie: Killing turkeys causes winter.
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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


--xC2AwCckB4yHmCdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 03:38:02PM -0600, Rob Herring wrote:
> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
>=20
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.

Acked-by: Mark Brown <broonie@kernel.org>

--xC2AwCckB4yHmCdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIdSBoACgkQJNaLcl1U
h9Brnwf9Gb7P9H3jku9OngoretGUxGN4DtDmr+0Bvk7ZZFkSIVQYVBROL0mmUfer
wPLiKHS48VJM6irhxRMqHLa1CrIeAmJHZpkg0R1JH1Iw36fWPZiBTfrDG8qubOti
l/cEx7Jmxoj2EtB8xcTpbYGqwOqSZtDkAz1smUIh3coKzArwCPjkAYE59GjQ28SS
F+P6ze1awYqRh/vkZC5ge03hrBhxOKU1iVyqv4iRfWtwCXRxYM3aPTs4aLB/T0NW
svINogVRgGsGVmY7gRufv1wI7bJle7+MP7byPwsqzx2AXthe0fYt3x457mV59wjc
Ej2pLNgE/IiOKyZ8gmWU8kkWHOh2hQ==
=Hxgn
-----END PGP SIGNATURE-----

--xC2AwCckB4yHmCdp--
