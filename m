Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD22FD92B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 20:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC81617D1;
	Wed, 20 Jan 2021 20:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC81617D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611169821;
	bh=sW5RNn/vxYe616bHgr/kMto5kD8XsGEEZrTami18UCA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMf61f3UQFBmgu5uqNR/90dTS2dO/V9hQzz6uiDFELnavCihzS1lf+GoVWC55/lzI
	 vAlg2YFQQVLw5ALmfsR69p0of0O8I1uz5wbQHESiOQiUC81e48Ow+yaQnk9OFpUE4D
	 gi5ZBSXrRKleiRJNMb4gpiX2xavuTp/q5nHldo8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23481F8019B;
	Wed, 20 Jan 2021 20:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2566DF8016E; Wed, 20 Jan 2021 20:08:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 724D6F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 20:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724D6F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uK5MdF5M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18A3C233EB;
 Wed, 20 Jan 2021 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611169717;
 bh=sW5RNn/vxYe616bHgr/kMto5kD8XsGEEZrTami18UCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uK5MdF5MRad+DsIwqzy+3TzH8VKGOXQp192CMWb/tfMzK2/NybyKT12oBOjK914AJ
 w/MX9Nn3aokK8csPPBKYuOrc6dU+WVZKNPJX9otb1bRhoGIlD9udCQU7DRV548uIeq
 DkY5OgriNfvxt3Cx13Su3Ov3L136zVBSByYBAnOSt3/+4+0yX8oLZiFchMEpmIF3d3
 FGn0lXA3S0aS6fjHX+j/qRXjQ722Q+32jX73Qk7JkPujE0SY/5jEunkNGji3bimrLf
 tm1xk+OMJnM24EjIWdUepCqzGWiiMzvPoCzpYB8QUJbpaKsS8iArz88MteVbcl5Jt7
 JoOQV8So55lng==
Date: Wed, 20 Jan 2021 19:07:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Subject: Re: ASoC: simple-card, fsl-sai, ak4458, imx-ak4458
Message-ID: <20210120190759.GH6794@sirena.org.uk>
References: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline
In-Reply-To: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
X-Cookie: Beware of Bigfoot!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 kuninori.morimoto.gx@renesas.com, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Delio Brignoli <dbrignoli@audioscience.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, daniel.baluta@nxp.com,
 Linus Walleij <linus.walleij@linaro.org>
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


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 12:41:18PM +1300, Eliot Blennerhassett wrote:

It would be a bit easier to have one discussion per mail rather than
mixing several different topics in a single mail, you should also CC the
maintainers for the relevant drivers so they can comment on any issues
in their drivers.  I've copied in a bunch of people for the Freescale
drivers and gpiolib.

> 1) Reset polarity of ak4458.
>=20
> When imx-ak4458 is used, the platform driver handles the codec reset
> specified in DT
> 	compatible =3D "fsl,imx-audio-ak4458";
> 	ak4458,pdn-gpio =3D <&gpio4 20 GPIO_ACTIVE_LOW>;
>=20
> Used here. Afaics gpio_set_value sets the raw value given, ignoring the
> polarity specified by the DT?

This is supposed to be handled by gpiolib I thought, I don't know off
the top of my head if you need to convert the driver to use descriptors
rather than numbers for that to happen.  It's obviously not ideal if we
force all drivers to implement custom inversion logic.

> 2) Clock rate setting with simple-card
>=20
> When simple-card is used and DT specifies mclk fs:
> 	simple-audio-card,mclk-fs =3D <256>;
>=20
> asoc_simple_hw_params() calls snd_soc_dai_set_sysclk(..., clk_id=3D0, ...)
>=20
> The hard-coded clk_id=3D0 doesn't work with fsl-sai, which requires clk_i=
d=3D=3D1.
>=20
> For my testing purposes I changed the hard-coded value, but I think the
> proper solution could be to add a DT property to specify the clk_id
> (default=3D0) ?

That would make the clock an ABI.  If it's getting to the point of
needing to specify multiple clocks then we really should be looking at
using the clock bindings to specify which one to use, that's a bit
involved though.

> ------------------------------------------------------------------------
> 3) Memory mapped stream access by aplay does not work.
> This precludes use of alsa plugins e.g. dmix
>=20
> I have found no reason or solution for this so far

In what way does it not work - what errors or other problems do you see?

> ------------------------------------------------------------------------
> 4) Unable to get multiple source clocks working with fsl-sai
>=20
> With a single assigned-clock, switching between 48k and 44k1 clock rate
> families is accomplished by reparenting the root clock to the
> appropriate audio pll clock.
>=20
> &sai2 {
> 	assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>;
> 	assigned-clocks        =3D <&clk IMX8MM_CLK_SAI2>;
> 	assigned-clock-rates   =3D <12288000>;
> 	...
> };
>=20
>=20
>=20
> However if two of the sai mclks could be set to 48k and 44k1 derived
> rates respectively, the clock reparenting would not be required, and
> fsl_sai_set_bclk() would search the mclks and choose the appropriate
> mclk for the requested rate.
>=20
> DT would be something like this:
>=20
> &sai2 {
> 	assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>, <&clk
> IMX8MM_AUDIO_PLL2_OUT>;
> 	assigned-clocks        =3D <&clk IMX8MM_CLK_SAI2>,       <&clk
> IMX8MM_CLK_SAI1>;
> 	assigned-clock-rates   =3D <12288000>,                   <11289600>;
> };
>=20
> This setup doesn't work as I hoped it would, don't know why not.
>=20
> regards
>=20
> --=20
> Eliot Blennerhassett
>=20

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAIf44ACgkQJNaLcl1U
h9AeMQf/QDSutrkL3Mgs3knadM3IpplO0cZxGke+6Gc7JfpHotwdJBorqRnP3P2q
Dh5Mg/e9ddHwzBIu4LwIRb6fptB86+YcaVCk2VvsRcdWXBLtF7jhYDVgRNnkLkce
3oeZ/1ToJqir2A2gV/MCYwQxQ1eIEHjPmrpZuutqODamgmUWrye99OjmhWC7CGGI
FOHY8X/mhjMM4KPGldxIsLQESi0vIB4c3BmF5PKdipKbL8h6bXaqnseHCtHAGWTs
Nvm++OQ3ehZHCedV7o8yYKapYMaGyMAfn31V4rnuoAape34waeGh+i8xmNHT5oSF
AeAVvV9e/WiL4pvlgZdX+ju/6u+oTA==
=sia5
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
