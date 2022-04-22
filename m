Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D701950B7E6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E116AEA;
	Fri, 22 Apr 2022 15:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E116AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650632870;
	bh=hDIXGys28YU1AgFgBUhJKgfBRTj9j4CvWUnRGcwIekE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/EzOD4SJvbnx8vuK7rIP7BRzTNqRtofeAXIq+DkzHKOsYnL/gCkoxg61JuZjhzDQ
	 vsKaK5u2WEWIY59O54XJlimNZQmpkoKxQqTrQgk9mx2fQ/nWxy11SCT53DXpMt/Lt1
	 h5lYP9uO3MnMzyWTzqt56f1gDWGs32NuyO476ZjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF0AEF80249;
	Fri, 22 Apr 2022 15:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F260F80245; Fri, 22 Apr 2022 15:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8516F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8516F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GDVYCD4S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4BEC62068;
 Fri, 22 Apr 2022 13:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B50C385A4;
 Fri, 22 Apr 2022 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650632803;
 bh=hDIXGys28YU1AgFgBUhJKgfBRTj9j4CvWUnRGcwIekE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDVYCD4SK6NLWfa+RGm24cWgtClaJixuJEYfnuky3gUNwzOfdD0CGXZO8Eu/sY+j1
 ZVC92Jrn8r2HESDlKi3bCxMxW5eKidgN/pXmpI2z2xOz1dU5cRx55slt3VyedgM2/A
 M+AL4OFN4MsUVYb53/Hp55PLCflOuaV4AylLzVKmgZQfWe58+xa8KNcHAGmegzsIOP
 +IWFHNFUMKBg79uVOZOznzEwT1+8z/vDxqgSAVLq6pAqw561qXm9LJd6gXsB/bFQLr
 LoZ8cI+qF5MpFp1om5KR9PnEJlffpw1x/NCG43Xz5qsd2L2vEw8IsPmnEDUhWb0pU+
 LZb3bg00ZPS4w==
Date: Fri, 22 Apr 2022 14:06:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <YmKoXbh04ZEs3dSZ@sirena.org.uk>
References: <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
 <YmKSgHrbb/7koM36@sirena.org.uk>
 <A1574F30-62D2-467D-A40B-8FD7C6B8BCFA@cutebit.org>
 <YmKeEKa0w2xLM9cL@sirena.org.uk>
 <6F6130F3-381C-4AB7-B618-CDC4C4A37C9B@cutebit.org>
 <YmKjL9bOtOmsFWTs@sirena.org.uk>
 <3CD969AD-7316-4D83-AD92-CC85ED817125@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h//nqm2TleJK+t0c"
Content-Disposition: inline
In-Reply-To: <3CD969AD-7316-4D83-AD92-CC85ED817125@cutebit.org>
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


--h//nqm2TleJK+t0c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 02:53:54PM +0200, Martin Povi=C5=A1er wrote:

> > Oh, I see - the speaker actually allows configuration of the slots
> > independently.  Usually the left/right thing on mono devices only does
> > something for I2S where the bus clocking enforces that there be both
> > left and right channels.  Either configuration is fine by me TBH, if you
> > can do that then you could just keep them mapped to the same channel
> > then mark the control as disabled since it should have no effect.

> Well but is there some established way to mark a control as disabled?

snd_ctl_activate_id().

> Another issue here is that if I disable it I can=E2=80=99t leave the rout=
ing
> control in it=E2=80=99s default value, which is =E2=80=98I2C Offset=E2=80=
=99 and makes the speaker
> amp ignore the slot mapping.

Sure, that's fine - if a control genuinely has no effect it's fine to
hide it from userspace.  The issue is where it's just that you don't see
the use, if the control demonstrably does nothing then that's fine.

--h//nqm2TleJK+t0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJiqFwACgkQJNaLcl1U
h9AV8gf9GwzHMBap1p3cUin8nTIQKJwTl9QCbOmThnWJbuYKWeALxn2lKmviBaj9
cK6oSVKCxCZlda0aKQSesJ4okIAQLbk1o4567sntkbBp6CuktSmlTOir7R6xVydZ
IP/+pe8VGfqKFgLN+IHvNPMwOOA22UfsGhAA5M3A7i4B4qApwIVJlQicJ4TwD7y1
jCZABx6q6DJoq7nclV1aSGvFZOZqGy2YxtAkHBs9vACqznwKchY7Z2lqZC7e0ys4
Yl571RGhhMUWViVPe1xg65Jg/GOWHnzggLuPEk7M7ZGnriQF5KvEVVLpAaW8Wt0c
F1qXhhnmhgJzm6oJkzV/zd7+paTaRg==
=qSEG
-----END PGP SIGNATURE-----

--h//nqm2TleJK+t0c--
