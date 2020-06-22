Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EAA203861
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAEB16D0;
	Mon, 22 Jun 2020 15:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAEB16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592833418;
	bh=76HPA8Jkij2jZjdlFrIktZ6XRSDMq4kt1S8rTegc1Bk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PO6EliMI49dmZQhwGMtzUKy0eSlzE1Efuz9LlUqjCJ0Ymfmk6FAXOGUVTqI3CSndQ
	 B2HN7uFHZXyspb4x5R4zh26JKzKZ8O+fL02PxhsLRjcReShg7+aCls310iXLhSYgkY
	 OZgAFzppADVofFigNGVi5x4IfX701bFqomQq/h3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 506B3F80162;
	Mon, 22 Jun 2020 15:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2942AF8015B; Mon, 22 Jun 2020 15:41:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8DC9F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DC9F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B21oTPIk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CDA62074D;
 Mon, 22 Jun 2020 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592833307;
 bh=76HPA8Jkij2jZjdlFrIktZ6XRSDMq4kt1S8rTegc1Bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B21oTPIkWw7OBXxlK3V4+IxJeFImDbaXVpPpAU2gG+fIdJtM6deJyZw1VTWTDW6PM
 FXVyLdPn2rpawBpfjrCUhCR7BsoB9VZSPYJsJ26gumHDkEFPXbq5q4tfdIun86CO1b
 VLZ42OmyCzXhcYu5zNsCnOQWebv/CcBZxTHjTxxA=
Date: Mon, 22 Jun 2020 14:41:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Pantelis Antoniou <pantelis.antoniou@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622134145.GJ4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
 <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tKy6e3LXpfmanBFM"
Content-Disposition: inline
In-Reply-To: <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthew Porter <mporter@konsulko.com>, Shawn Guo <shawn.guo@linaro.org>
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


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 04:32:46PM +0300, Pantelis Antoniou wrote:
> > On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:

> > No, you're encoding use case decisions into the DT here - for example
> > your example will break use cases like ring tones and shutter sounds
> > which should play through both speaker and headphones.  It's also
> > setting volumes which may be inappropriate or may be not and interferes
> > with userspace using those same physical volume controls.

> It is completely optional whether you use this functionality or not.

It's optional for whoever writes the DT and flashes it, it is not
optional for whoever's doing the OS configuration - these may not be the
same people.

> In that case you don=E2=80=99t use the automatic routing you merely set i=
t to off
> and everything works as before. Or you merely use the route setup for
> the function from userspace.

Userspace shouldn't have to be fighting with the kernel for control of
the device.

> The device in question is not a mobile phone so there is no requirement
> to have speaker and headphone active at the same time. It is possible to
> create a function that would be headphone+speaker active at the same time
> for that case.

That may be true for your OS configuration but that doesn't mean that
some other user of the same hardware won't want to do something that
needs both simultaneously.

--tKy6e3LXpfmanBFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wtRgACgkQJNaLcl1U
h9DCVwf9FpSeXGVTR/Zcbu24YOawrtka4GsPPSyOzc72t16OmdGnrJ0hROsl8K6n
sDqhp3MUcOd12L4ljog/75Ewggs5KqUtRcAX+R2EmTDxMnErBwRd9U/JoKmV70y1
6WdDPh18iAXPGO6fyX3I8ZdJxA7NFTJCsANM44oUDJOv8XZmYyY5vkbDl0bqMAqh
Gewyh8N0uGlLbGAlWGaXruLxPqkAAugJQXnNQ5nhwZsSeHakCzl5J3ALXE3A8J7R
QhsxOcaU9gfqkK2Si89Dt03ifwcauVzvzG5YFBgzuj1pjFOLfgwT8c56t1b1ZkSa
miOXn6WI7XaQr2+ouRo174Dd/Dszkw==
=h2v/
-----END PGP SIGNATURE-----

--tKy6e3LXpfmanBFM--
