Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ED72226D1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33FA165E;
	Thu, 16 Jul 2020 17:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33FA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594912959;
	bh=xvlq/EaQKoFxYAnh0dqPU7TeGNOs1bhBceWfFWYVEy0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUHyvLzjn0GrJFGV1LfMdyfM4nUlL5TxgUjAgkiYP1PI8FecSKiofwvoS29WV2F6m
	 lsO+OXg1KLYtXAHWrFG2L9wXlVVYgiC6WxkIqiTE/XB3gIKfRrt6s1N4+9efPHbgHx
	 ssXEj2lrzVO3kU3KmiY/PXtsfamU41lnjajX45Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECBEF8014C;
	Thu, 16 Jul 2020 17:20:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85412F8014C; Thu, 16 Jul 2020 17:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68149F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 17:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68149F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k176Fucu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 902232063A;
 Thu, 16 Jul 2020 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594912844;
 bh=xvlq/EaQKoFxYAnh0dqPU7TeGNOs1bhBceWfFWYVEy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k176FucuYLZhP1LQhCHxFiJ+Kkkp02ggQMcyF7eSyNlaKZMI3w6yNmsuov3eRxKWi
 +rxQJ0D7CM3kZl235alazbw7hfG4EzQKooPOsi2yT47wJtgc6txWfFtR6GrchOujN2
 O8koDtq8bIDb1ykHRjyyI9YqyyhSlkrfE5Tn4dRw=
Date: Thu, 16 Jul 2020 16:20:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas, fsi: use patternProperties
 for FSI-A/B
Message-ID: <20200716152034.GC5105@sirena.org.uk>
References: <87zh802tif.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <87zh802tif.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This login session: $13.99
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>
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


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 09:29:10AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> FSI has FSI-A and FSI-B, and has fsia-xxx/fsib-xxx properties.
> This patch uses patternProperties, and reduce verbose settings.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/87o8osxlow.wl-kuninori.morimoto.gx@renesa=
s.com
> Link: https://lore.kernel.org/r/87pn9v39eo.wl-kuninori.morimoto.gx@renesa=
s.com
> ---
> v2 -> v3
>    - add Reviewd-by
>    - add Link

Please don't resend patches for just acks and reviews, if I'm waiting
for reviews it causes confusion since I'll queue the reviewed version
then have to unqueue it when I see the resend.  I use tooling which
picks up reviews from the list.

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8QcEEACgkQJNaLcl1U
h9Cg8Qf8D7go8ENKfRGkqhGGLmyFp6v3nBVv9B8mc3+xLFGBPNTLwnfV4D7iRAd3
qe/LoipG/kht34+hk6vFz86WYJiY8hTz5vS0WN+djz4BcSaD010Fj48qQTaJhty5
o9HBv4m2IRA2cShAg8/V2OIKJy+IuIWDWw3t828If5DyMMs26AtfxBtItRR66GuE
OjXShfrW/JbX5rkzDVAbssNdsO64dtU3Z2FHYEcdPpzkuT02sAt7gkAoQPlpqdC6
UWUwWKu5byZAqPvutksobcuddHfFBZTH7oUQUlgwJYR8Jbx0RgS/1+bRS/HqjHvj
mim0pKC+93A2wzDB10hO9i0rOgVQQw==
=VdGZ
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
