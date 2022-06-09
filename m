Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A438D54501A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52CBC17F2;
	Thu,  9 Jun 2022 17:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52CBC17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654787087;
	bh=ZGSUzWDwWXAmiQOo13GFnbChwNWQBClHSdybMstPJBU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=us0rgE3txrhua4BLW+YOIrp2aimW1g7qO7Xw26s6MHR32mbsS1Z+o1cShjvnhzwm8
	 wRWa1dNyHIDgf6grwLDnwGMpY6rjvtkrFW6Lvoy9l5Oa1MJTXwxjwFJhdJ+WRDeioA
	 OL79g8gkEn5ClQvIM7rVxsKSAzbS5Cds8yASa9aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE945F80116;
	Thu,  9 Jun 2022 17:03:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CED2DF80116; Thu,  9 Jun 2022 17:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844D8F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844D8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="spG2dWJX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 653A1B82DE6;
 Thu,  9 Jun 2022 15:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D5FC34115;
 Thu,  9 Jun 2022 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654787013;
 bh=ZGSUzWDwWXAmiQOo13GFnbChwNWQBClHSdybMstPJBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=spG2dWJXt/OtibBPi8WHIfGHUXxfeyy5/Sm7zVjMItXwD0iVyfgYaWK8utduXnVFx
 7KhswRD3hP50E+mhKzh1thRj+VzxpgR4M3I7Rju85SZd9AxFEheO1CkK5J6TIy9DBK
 vtvWZvmd9pwSt/8DYskm74XRtCKyJT+cPqW2ntmMP9fbO2isWU2i4DOaQ9Q8tHyOQ9
 FjfsojDm+IPdwWfcNhhRhmMbcqerCSBQDlCMvLOxLqyQ9LndHfVbHxr4o0lf5PQUjC
 4okYtP2tiJqVIJc455B8a1DpNQmvZFlHZCgqGmozRMOjx4ehAzEpw4ZBlGGJPDMAyT
 ZCgeLLJWxS7rQ==
Date: Thu, 9 Jun 2022 16:03:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Message-ID: <YqILv21K+tZ00Qhx@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
 <YqHylN3xba9XFrF8@sirena.org.uk>
 <0E611F13-96E3-41FD-9550-F900B2EFB00A@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vbGz0wp4L4rRy+b7"
Content-Disposition: inline
In-Reply-To: <0E611F13-96E3-41FD-9550-F900B2EFB00A@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
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


--vbGz0wp4L4rRy+b7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 03:42:09PM +0200, Martin Povi=C5=A1er wrote:
> > On 9. 6. 2022, at 15:16, Mark Brown <broonie@kernel.org> wrote:

> > As far as I can tell this demux is entirely software based - why not
> > just expose the routing control to userspace and let it handle
> > switching (which I suspect may be more featureful than what's
> > implemented here)?

> Well, userspace should have the other two muxes at its disposal to
> implement any routing/switching it wishes -- but in addition we are
> also offering letting kernel take care of the switching, by pointing
> the muxes to the demux.

> I assume (but I don=E2=80=99t know the extent of what=E2=80=99s possible =
with UCM files),
> that this will be of some value to users running plain ALSA with no
> sound server.

That's basically no userspaces at this point TBH.  I'm not convinced
it's a good idea to be adding custom code for that use case.

> > This should be integrated with the core jack detection stuff in
> > soc-jack.c and/or the core stuff that's wrapping - that way you'll
> > ensure that events are generated and status readable via all the
> > interfaces userspace might be looking for.  The ASoC stuff also has some
> > DAPM integration for turning on/off outputs which might DTRT for you if
> > you do need it in kernel.

> Aren=E2=80=99t all the right events to userspace generated already by the
> codec calling snd_soc_jack_report?

I wasn't able to find any references to snd_soc_jack_report() in your
series?

> I looked at the existing DAPM integration but I couldn=E2=80=99t figure o=
ut
> how to switch the demux with it.

Yes, it won't do that.  If you can't stream the same audio to both then
you'd need something else.

--vbGz0wp4L4rRy+b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiC74ACgkQJNaLcl1U
h9CaSwf+K7qAgCHyPIBkRRBsmZJ9BXgtuDVApqNRqwM4iuIPyr9H8Ro7YZhyqNXv
iGc9p09J9KRFc8LdHqqe+WcUutRCIHrIEjkTmUlEN8I6hr2yWyVx8foGVKV9us8H
0ifiPXkXLbXph9C5KBM9ssKYB+Zcu+TnyVEQn68L6z0MRsirKK6t/aEWRgrCu9Mp
+P14CgDfGtI0WnudAYVYIbB4euQcqy/kNCPmBzCce6+0AWhRi5r84seF3pAtECkw
/aXfYtwposNztGqSsZe2ryWBdztM1VQdt6ZQ1TtPxaIllUigNTvqe0JRPkk3Ii3J
49VwyPQb1UL/MJYuO9hTxO04Iz8G9g==
=WcrN
-----END PGP SIGNATURE-----

--vbGz0wp4L4rRy+b7--
