Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3350B799
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 14:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B280B1738;
	Fri, 22 Apr 2022 14:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B280B1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650631544;
	bh=ki0hTvuIJuDOgNjUVtZYJlOKFfmg1R+HALk0WgFLZEU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASxpAZperVXAvH5fdiVriQqXJsSA+DJZTmJ2j/Tdk/VcmeqWiCSr+TJ2dwOQPluT7
	 dhDEErpaciFYW46Ja1P/d1fxc5eQzat/s/ZXaKtObeshMUCdAILO9MI4KWJbU1J/LP
	 JYWfu51rLmeTwVivbijsZr4utmWr6n+8uR7da1Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF47F80249;
	Fri, 22 Apr 2022 14:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7239BF80245; Fri, 22 Apr 2022 14:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E895F80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 14:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E895F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fyGk2Kye"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32A33B82C98;
 Fri, 22 Apr 2022 12:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F28C385A4;
 Fri, 22 Apr 2022 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650631476;
 bh=ki0hTvuIJuDOgNjUVtZYJlOKFfmg1R+HALk0WgFLZEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fyGk2KyeZy2x5vXffR3TGv5cq1NK8+zSo4tmCE5iiXndE9vjI9+Pu0+s/6CxHKEWW
 TWUQcrX+95VluIByopjc9Q+yB2RC4cHbq0cIxmihcNLn+x7b5VK0wQ24/L6yxiiac9
 TlLmGQOT4LcY8Y3oFDjHpgWdTJzMQb7KPDcP45lbD4XRlvAlFz+Z0FpbL2lo3fK49+
 UG8+A0WR8SmOHRe+UfvNm2CriW3HrIbPGBU2/dc7N7OID0ZXOcnAC1D6OKv3YLOnKI
 PpDqDpHtrLxs6X+hHGUPsWnVxj+p1QrBFS7DmPJgHcA2sZqlKiQ1O/+p5K0+M//BHz
 4/FXX9H+IAgAA==
Date: Fri, 22 Apr 2022 13:44:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <YmKjL9bOtOmsFWTs@sirena.org.uk>
References: <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
 <YmKSgHrbb/7koM36@sirena.org.uk>
 <A1574F30-62D2-467D-A40B-8FD7C6B8BCFA@cutebit.org>
 <YmKeEKa0w2xLM9cL@sirena.org.uk>
 <6F6130F3-381C-4AB7-B618-CDC4C4A37C9B@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bYTaVvKVekkp0dWZ"
Content-Disposition: inline
In-Reply-To: <6F6130F3-381C-4AB7-B618-CDC4C4A37C9B@cutebit.org>
X-Cookie: Whoever dies with the most toys wins.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--bYTaVvKVekkp0dWZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 02:36:03PM +0200, Martin Povi=C5=A1er wrote:

> > Ah, I think the confusion here is that I'm using slot and channel
> > interchangably whereas you're saying that previously the driver would
> > allocate two channels to each speaker with duplicate data?

> I guess you could say that. Not that there=E2=80=99s duplicate data on th=
e I2S
> bus, but the speaker amp would previously be configured to look for the
> left and right channel in the same TDM slot (see e.g. set_tdm_slot of
> tas2770 [0]).  (Each speaker amp drives a single speaker, but it still
> has a notion of left and right channel.)

Oh, I see - the speaker actually allows configuration of the slots
independently.  Usually the left/right thing on mono devices only does
something for I2S where the bus clocking enforces that there be both
left and right channels.  Either configuration is fine by me TBH, if you
can do that then you could just keep them mapped to the same channel
then mark the control as disabled since it should have no effect.

--bYTaVvKVekkp0dWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJioy4ACgkQJNaLcl1U
h9Df+Af7BVfaaDh84vZFovAdNIOaGWSK6YJTe1gp55f0uHtkMsLtSZuiAujBSQ/w
Nno/WtvJKhmcmW+4PXZQHALD/lEFCeFewb610xzQwZ138ywneO+HwyJs6LpywmeP
sWrCS5aTOh7233H4pw36L5e6MQUwZ12NPZwoIDvsExmKxBf9IV5/SQGB4w3eotB3
XI0J0eUs4lt10VFnPpIsWEBdHZMrXE7mGA17k/BK+lTcyzKzgxNnEjvLjKeeXQ8D
m/v6feP2laYn4Ii1P//pjhlGJrjOasW1ufDOP85HhaJeREav2IqxrIg+3fr0n2+D
+J/U8+Gq0HAZBz2k2kyCOyDBpBCbuA==
=/wjL
-----END PGP SIGNATURE-----

--bYTaVvKVekkp0dWZ--
