Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650E212841
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96ADC16D9;
	Thu,  2 Jul 2020 17:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96ADC16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593704639;
	bh=3KFnK04vEi7SoR61rRMArD9b+BR7w1+k2R0YFZiePIs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qHWa2HlmpuaJG1b1Q1A3WbYFwWO72Gc7I5X3T1baz5qNYZXPp/4Y6sTXrh9BEOTuq
	 808KaKqdwDrYJORvJEldmPJb8LOCbUK1ZIRdTFWQofr5Hh4YHLsxk/pnNSDFdTrexY
	 7RNi/vonyf7L0JUV2Jh9ByX+zrngVn7otH0xRVCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A99B7F800C1;
	Thu,  2 Jul 2020 17:42:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9B0F8022D; Thu,  2 Jul 2020 17:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A47F8F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A47F8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uXPoXcMN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A6AB208B8;
 Thu,  2 Jul 2020 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704530;
 bh=3KFnK04vEi7SoR61rRMArD9b+BR7w1+k2R0YFZiePIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXPoXcMNttT4jMn3+4BYmyeU01d4W2Mwcu1xJ7hI/S7P7RDqiNSek7TOZGa01uyLt
 URHmF5er8VNTpSNU52TEL/qkdUTT7kai/UGGQpku5+C/5aqPwntmUilLbQXqKC7Lbx
 PYdK7osKLzpwAWRFGK8g2ISveoUzKfhXMwmkJV8I=
Date: Thu, 2 Jul 2020 16:42:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: fsl-asoc-card: add new
 compatible for I2S slave
Message-ID: <20200702154207.GK4483@sirena.org.uk>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
 <20200702141114.232688-2-arnaud.ferraris@collabora.com>
 <20200702143145.GG4483@sirena.org.uk>
 <5de5ea5b-0716-8ed1-28b0-9ad3da7a2d47@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline
In-Reply-To: <5de5ea5b-0716-8ed1-28b0-9ad3da7a2d47@collabora.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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


--2feizKym29CxAecD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 05:28:03PM +0200, Arnaud Ferraris wrote:
> Le 02/07/2020 =E0 16:31, Mark Brown a =E9crit=A0:

> > Why require that the CODEC be clock master here - why not make this
> > configurable, reusing the properties from the generic and audio graph
> > cards?

> This is partly because I'm not sure how to do it (yet), but mostly
> because I don't have the hardware to test this (the 2 CODECs present on
> my only i.MX6 board are both clock master)

Take a look at what the generic cards are doing, it's a library function=20
asoc_simple_parse_daifmt().  It's not the end of the world if you can't
test it properly - if it turns out it's buggy somehow someone can always
fix the code later but an ABI is an ABI so we can't change it.

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7+AE4ACgkQJNaLcl1U
h9BYwQf+LRu606rmfYnqmbLMDcS82XnfLlMQpCccSxt5qRFkxPvsZqA1zoQUrt0n
o8061rU3fHuwt17/Mp4D0SbC4g9EGRIon64yUii1nqoPIHEgYWVQ+F7sOPTKVKD5
Z3LD+zP06AyjJxRDJ4+4pHRWpzQL2jxziBsxgQdp4W5mfU6fV3x5BvqdN1chcOPa
TmgXdbKXfoR1Q/HIaU0CH2PVjh94BZqRRMPs5++X7xDcCUCsYUY6GW+GS1tEXQPj
IdJ2Rgmt3M0273RzUlFQX8+akH03BBTlIJ8eCUYIp4H8dedN5w/2eXqjIOUIMnsT
zv1pY4Ufcdm6Uzc6A47isxUHlg565Q==
=K6iJ
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--
