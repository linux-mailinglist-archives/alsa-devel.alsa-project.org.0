Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A0600DE2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 13:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1152E6B6E;
	Mon, 17 Oct 2022 13:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1152E6B6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666006646;
	bh=8qGy9UfVwi4BhKxbhVxrqPML0YObZ5NNiu0yo8NG8iA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0/G4Cp4NPag3wXy5R9FLvQRndVAml/lFPNKF2zy0Kud7+aBdwS5zGlj0oecBtvdu
	 IH7LKtWD2NmAVkRU5ZVlQt+JUO14yIGwAyPghbwGOzJRdfInVeFAMDUBTQ9C3G4lbA
	 U7vPAqU6rmfbo+zwc1v6vGhllTBcr61tZvrS3JVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73395F8025A;
	Mon, 17 Oct 2022 13:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB9CFF8025E; Mon, 17 Oct 2022 13:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ECF7F800AA
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 13:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ECF7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KfR1JbTk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6D826103E;
 Mon, 17 Oct 2022 11:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CDBC433D6;
 Mon, 17 Oct 2022 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666006588;
 bh=8qGy9UfVwi4BhKxbhVxrqPML0YObZ5NNiu0yo8NG8iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfR1JbTkeX+yFPO+3/KOVmhKlJAqNah/g+zi5StYrh+90OMUSeISy19ox87NhSkVD
 LRozXuXBeb9wwXYVIPLbBhUNuRj4JzJgvgs1B9B8yNoe8fpdKAW0md9Uy+oHWNCGn0
 S0i1S2IZd1vbji2fnebbPa1rDixJwvnaX2Lui6WGLaXgwW3NUiwz9FZbn6TYHMOG73
 SQioiTm+rVKflpC2zKitC68TXEQKoI05abR/axcoKXPaqi7+hbS5+Hu50vaI6VxUK1
 yyzaR+75xU733modJ4RmiChaPrP40bqqRsNYCCH7dwvOYEkGU8s/Y3TC+cWd2lkD7D
 HzYcKp3mJTwog==
Date: Mon, 17 Oct 2022 12:36:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove()
 in __exit_p()
Message-ID: <Y00+N/2eE+GSrQqh@sirena.org.uk>
References: <3225ba4cfe558d9380155e75385954dd21d4e7eb.1665909132.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oFfgUlb/hNvOP2FO"
Content-Disposition: inline
In-Reply-To: <3225ba4cfe558d9380155e75385954dd21d4e7eb.1665909132.git.geert@linux-m68k.org>
X-Cookie: Real Users hate Real Programmers.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ricard Wanderlof <ricardw@axis.com>
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


--oFfgUlb/hNvOP2FO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2022 at 10:33:50AM +0200, Geert Uytterhoeven wrote:
> If CONFIG_SND_SOC_TLV320ADC3XXX=3Dy:
>=20
>     `.exit.text' referenced in section `.data' of sound/soc/codecs/tlv320=
adc3xxx.o: defined in discarded section `.exit.text' of sound/soc/codecs/tl=
v320adc3xxx.o
>=20
> Fix this by wrapping the adc3xxx_i2c_remove() pointer in __exit_p().

Why does this driver need this but most others don't?

--oFfgUlb/hNvOP2FO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNNPjYACgkQJNaLcl1U
h9DgUAf+OQ10eMrPjpgDk+H4uChrDC0hCUqAaTVFpeQkCkoqUOG/rXgnChAYLYN6
oUFMN7WVbH/j33JxbrirLs+LMh6U4d4JjX7qnvsuM55X5f7XadjhJzunnGQfXLCh
n45s3BcNpHRBPVGW+NUI5fe7vk8qqnEVT9FaxI0dT4gSwIpT1QkY0D5G3LtxEl+p
BvEfxBg2BeGnUYlSoFvWnoELxxG3zg41Mspz58Hjr5ImHG6Rn16vUXLoGXEbnEtC
saNpIRQNwRS4DFTT7bIHSnFCWn49ij7VYk6dDkuwsQQNP2HA87nXzVCbacUEAQvI
mNrBpZyX2T2cV85b2IQYLAlK5xM34g==
=cGIX
-----END PGP SIGNATURE-----

--oFfgUlb/hNvOP2FO--
