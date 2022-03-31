Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598BE4EDD47
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 17:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0781192E;
	Thu, 31 Mar 2022 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0781192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648741105;
	bh=A3+v8YN4rZULqKlHdCnvknCSKLUBvOtgJ5S9ze+1pS4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aur7lidhSwWhqJgYcK7uZNyTuMT8fucchV8+wl0JihdtgBr39pYkdDcpGfPbXIMJO
	 puAgMQDI2LqjEUbqX2upcvOxGMqX4UOhILH32EgDMKD5nOhuusG51SftKUfxdfnLxZ
	 qJRRLng2fkGHoD5CufecUe/i7rkXp4xAC++4qZSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 467BAF8020D;
	Thu, 31 Mar 2022 17:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4769FF80227; Thu, 31 Mar 2022 17:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B4FF80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 17:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B4FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MPYVFwpr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97AC261B66;
 Thu, 31 Mar 2022 15:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFA0C340F3;
 Thu, 31 Mar 2022 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648741026;
 bh=A3+v8YN4rZULqKlHdCnvknCSKLUBvOtgJ5S9ze+1pS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPYVFwpro7nv+TrxY/Ol74fPO7Kpia4LPytfCElQLa5f+AGA1Ay4j3uZsLGsmMzHN
 vDVc7PuOwjuXTxw6vvgKnuXRpxVZu7NhcCfsrXY5tgcQdSyRzGitbd9oM2ZWatCkGe
 2pCtvn+05nk8OSk3uHZEvqcAg/SQ460mhWL94UcHDGfggJJZ/pXp4dlvbhfUKmGzE7
 b8XXVBnO2o1VMLtLOD5NYLnd3DSUjYfpEQYVxknDOp2bapAymuFpW2yRz6EIwxFqqd
 Nn47dg6HJ/RM6GvC3JnL+k08j9ZuLIO1yD8OodZNO250xNefMYKKrpy2dini9C5DRH
 4S8bqLA0G17dw==
Date: Thu, 31 Mar 2022 16:36:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <YkXKmxJ0R3qpUoH4@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X2ThHCiFHNtahL7d"
Content-Disposition: inline
In-Reply-To: <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
X-Cookie: Reunite Gondwondaland!
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


--X2ThHCiFHNtahL7d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 05:04:32PM +0200, Martin Povi=C5=A1er wrote:
> > On 31. 3. 2022, at 16:18, Mark Brown <broonie@kernel.org> wrote:

> > Yes, having two devices driving the bus at the same time wouldn't be
> > great.  How is the TDM slot selection for the signals done in the
> > hardware, I'm not seeing anything immediately obvious in the driver?
> > I'd have thought that things would be implemented such that you could
> > implement speaker protection on all speakers simultaneously but perhaps
> > not.

> I don=E2=80=99t know. I would have to go study the details of this. Shoul=
d I see
> if I can find a combination of =E2=80=98ASI1 Sel=E2=80=99 =E2=80=98VSENSE=
=E2=80=99 =E2=80=98ISENSE=E2=80=99 settings
> that would lead to driver conflict on one of the models, or is there
> a chance we could hide those controls just on the basis of =E2=80=98it do=
esn=E2=80=99t
> do anything usable and is possibly dangerous=E2=80=99?

If ISENSE and VSENSE output are controlled by the same mux as routing
then we should lock one of the controls out for at least stereo devices
(it might be a good idea to check if the output is actually high Z when
ISENSE and VSENSE are off rather than just driving zeros, if not it
definitely has to be the routing control).  My instinct is that it's
better to preserve the ability to implement speaker protection in future
since that is something that'd be broadly useful, especially if someone
comes up with a generic speaker protection implementation in which case
there should be an awful lot of systems out there which could benefit.=20

> >> That=E2=80=99s the reasoning anyway. To reiterate, seems to me the con=
trols
> >> are useless/confusing at best and dangerous at worst.

> > I'm just not seeing an issue for the slot selection.

> Yeah, agreed there=E2=80=99s no (damage) issue as we should to proper vol=
ume
> caps anyway.

Though see above about how ISENSE/VSENSE output slot is controlled I guess =
:/

--X2ThHCiFHNtahL7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFypoACgkQJNaLcl1U
h9BYrAf8C7WJfY+2miJ9ldjr+FjB/DEti4NLZQsx4VaqpU/qCJnw+5ZKmLLu00y9
4EfS72t3bFJMYm0MuqUrCnlQmZRAJIeQ3Lu2JU5fYm2AbvsSdWSv5zvXLJuWuJG5
FlRz9lUIRdLoAXWtI1QyHjG3WvW7JtGMulEVhj9AVEa+9SMpRmEmajmbxCoDyQ8i
Kr6TAeKpIvhKxty0x4n+oDQBMjs3uYxNwu28h4wqeiVwb4KSO9DAr1/zOA6R1M9C
dlLJxBBTakNkp3UnQhDPJBjhIyDy3kb1ceQAuCanMbmo+veWMTWstNmqF8FCXXLQ
d3r8Z8ZAaeSy/6DXESctad+u9DDtYA==
=SUgL
-----END PGP SIGNATURE-----

--X2ThHCiFHNtahL7d--
