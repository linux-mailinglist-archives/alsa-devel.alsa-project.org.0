Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52977450A53
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 17:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E73461699;
	Mon, 15 Nov 2021 17:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E73461699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636995433;
	bh=8ZJ3OMscvgJsPqmb+8k4Flv6H47O3kx7VGp4pJrkxVY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvQckbFQTGpGR+p0Pk/WLSymiumtiIGSnOVs+CxBNrRuj9AIE3IdXwSkQn1CH9N87
	 2/U5E/onAyoNhp5VTUa5Je1r4wdYR9LpFKzHUmvAT69KUNmDzcKciJz/A2ezQ5ztaw
	 0jxig3PvPf7WAWxkTWEcI8+I9ICqFH9eLktRuM2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7395FF80163;
	Mon, 15 Nov 2021 17:55:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B150F8027D; Mon, 15 Nov 2021 17:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B27E6F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 17:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B27E6F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ve1GfrtV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D777160174;
 Mon, 15 Nov 2021 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636995349;
 bh=8ZJ3OMscvgJsPqmb+8k4Flv6H47O3kx7VGp4pJrkxVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ve1GfrtV3I1uRgcXFM0uuMDsnfNEoyPBSToSYKLBnWo9m885G4eQwozu9oBDR3pe8
 BKebEmXzwHEnnchpT2JPffmYJ0rtFcJjxtQYI0PsCGzO2kS+O1cGfVhW67blRX+PS7
 SlLpYH67zcp4r7TcN9lx+qbJndA2YmQNTWqkVfKsaFbxwSGrJ06LD34GEd0+gcZuEd
 uTtyf1hSRchiAhhTFN4U2HH4LhC5kN/6v7SjMaE2cs4cJUUR+EpjXEbX1m5La3EGWn
 57X3W4oM87xkFmxoc6ubgP9HwRUYjd4rqUfAaamXNt0rgI2W5EJvSupwvpTeBVzXS3
 H9boqnHkdSQvQ==
Date: Mon, 15 Nov 2021 16:55:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
Message-ID: <YZKRDnaW0oiU5lyY@sirena.org.uk>
References: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3IhyrrE8cNkOJMZ6"
Content-Disposition: inline
In-Reply-To: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Custer committed Siouxicide.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, rohitkr@codeaurora.org, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--3IhyrrE8cNkOJMZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 12:41:28PM +0530, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
>=20
> Changes Since V1:
>     -- Fix typo errors.

As covered in submitting-patches.rst the inter-version changes should go
after the --- so they don't end up creating noise in the changelog.

--3IhyrrE8cNkOJMZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSkQ4ACgkQJNaLcl1U
h9AjmAf5AWg/8cTlkjzX/kG0qnUbOIwvENszTo1qC7RizlsYAkdJ7MDKlcuGE9RF
v+PGq+n3qMPeiWYX5cvrasGWDn4fronjgv7W+oGayutwraoQcd3ngIX2DTlPXtpb
ISRxm8L8h5lZmfsynxqXw91Wsd3o4a1eHCU30hIk2JewAmHzBWvtW+j53yVRrpz2
DO5K+iuSaRAn8fxPB0cbVn+GCNqUNo/wkmJNcCUt2pGopLgN5L4RF8FSZdzqRGTY
bGmGIcv4Doq9H0TPuLMD0RlMdjHTitqTFYJ03akCkXQ1U/o9OuZAId7GNjRYhXjO
ajRHt27uKkGAThFT5OUmgwq0b2TUcg==
=WZY7
-----END PGP SIGNATURE-----

--3IhyrrE8cNkOJMZ6--
