Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A405212658
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED86516DD;
	Thu,  2 Jul 2020 16:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED86516DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593700417;
	bh=yoiiIk8yV7aQeMBE6eGjgWhzrgZn5o4MtsX81urPOGs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aSxYQkZveqxal6qSZXZd1CPY+AaZRNHEeOD4LOAMyJj5e0ZlSyxchpkXGExo0QKLD
	 5Fvvzakt+rOT1L64x6s5d0cV1p4j9xIDCpJrVdz5oog0zenNefzC1Uy8Zt2bO8LmW1
	 xhtxBVlIaRbPDRdaLoLGYMh0eecKMq9AYZiogh78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22202F8022B;
	Thu,  2 Jul 2020 16:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC67F8022B; Thu,  2 Jul 2020 16:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A3AF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A3AF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rh0X/EYu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1424320890;
 Thu,  2 Jul 2020 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593700307;
 bh=yoiiIk8yV7aQeMBE6eGjgWhzrgZn5o4MtsX81urPOGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rh0X/EYuSOXjJd7IZLHAt5PjkHiHVaHXBUckRAW9ESHhInCw6Awe+B4EfTXfWCHVB
 7EktAmVfcIb68os9+HU0zTIMMK2vVgmbUxpjkhl/15jB1bAUYaB/mh6tZxA+Kca9Kt
 8pgI/1MrVOnWgvLgGpKz3zSZFCNbIk1mawQLAFq0=
Date: Thu, 2 Jul 2020 15:31:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: fsl-asoc-card: add new
 compatible for I2S slave
Message-ID: <20200702143145.GG4483@sirena.org.uk>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
 <20200702141114.232688-2-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <20200702141114.232688-2-arnaud.ferraris@collabora.com>
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


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 04:11:14PM +0200, Arnaud Ferraris wrote:
> fsl-asoc-card currently doesn't support generic codecs with the SoC
> acting as I2S slave.
>=20
> This commit adds a new `fsl,imx-audio-i2s-slave` for this use-case, as
> well as the following mandatory properties:

Why require that the CODEC be clock master here - why not make this
configurable, reusing the properties from the generic and audio graph
cards?

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7979AACgkQJNaLcl1U
h9AxkAf/ayvMQ6Irjwi6oOAqWBxCV2VEySnpQQvROq2t4wDxz2MOOXIE0fZfwg0F
I7UlRDnm9ZyWwq8Dol9pigToIxzfz/G0rxJ0F3jTr5qo/1lt+hFMmdlghcl0T37v
4OP2CPBwJtmavd2mM06870/eXQKtmd3jwRXJ2HKljt9ZSuHVcyOk0t+ZaR0zYD+V
1AvChO6mvUipSO7A82pchm57qOKdBv7SpIGtHf4wsc+MFuEFJYaOtjfCwTrFvB1B
kPACxzQBG4l4xgQtN803PNAZbjbZCBGusst8v4Kpygbpq5OjuhFMJ4xHUVcxHPVk
y4i45+Yv7ceu+GohmwdxDGKnszmETw==
=uElK
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
