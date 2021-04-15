Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591EB36111C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78031671;
	Thu, 15 Apr 2021 19:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78031671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618507716;
	bh=7ft7XWhcl8j51azotCTdt9feNmJzjvydryFigI2I6+E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fkz1GoQocvyTUxtYe0lGEYDYwVA+f0+YgqRKYP4n8cV1VTzPXTmGTqADmTLeG0XOM
	 qqYvot5HUfDibXmRy0Zl9X2z1NI/8pxM/183TQ26Q4OuQXfkRuQ+64pHaORwsNMZPs
	 08aEfX0cepZxsbGdBVhw9meooGaAr3jtWGZVuC+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDF1F8022D;
	Thu, 15 Apr 2021 19:27:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11CAF8022B; Thu, 15 Apr 2021 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_SHORTFWD_URISHRT_QP,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4014F800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4014F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pWTvHfzU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA067610F7;
 Thu, 15 Apr 2021 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618507578;
 bh=7ft7XWhcl8j51azotCTdt9feNmJzjvydryFigI2I6+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pWTvHfzUTUJYubbnG/ta4Lbv0YUF5evDnjUD71U7a4kLtl6NXu75oiJNiOMo4ZECJ
 Mh6O8PycQMLofh4xP6oq9NT0ax2ob/80HMjxtLUAzVvY+oFGYf1yvdxPILW9p3jXoz
 eNwcnXYlwIWoGTGEDlJRqdMuLdVLawYLH5KxI184fvp4mIJx+gxpOsQZCMUutyYes4
 rr1GPHRDso2E+KyO9ZZJPcLXxuuAYRpCVhalb8wDcDLnGfTWWNF/wIUqSToA2tNxgY
 MAUOCvzGnzYmSpgsAWakpEo2pp2mN3TvmneDsmpwDF1gpLXR3IJRznkNTvKisVjRqj
 x51WVS7eCuIqQ==
Date: Thu, 15 Apr 2021 18:25:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Message-ID: <20210415172554.GI5514@sirena.org.uk>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline
In-Reply-To: <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, gustavoars@kernel.org,
 mirq-linux@rere.qmqm.pl
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


--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:56:00PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:

> Are there any plans for refactoring DPCM? any ideas ongoing? I also have=
=20
> some changes for PCM dmaengine, in the same 'style', similar to what I=20
> sent some time ago...
> I can adjust to different ideas, if there are any, but, for a start, can=
=20
> anyone confirm that the problem I am trying to fix is real?

Lars-Peter's presentation from ELC in 2016 (!) is probably the clearest
summary of the ideas:

   https://elinux.org/images/e/e7/Audio_on_Linux.pdf
   https://youtu.be/6oQF2TzCYtQ

Essentially the idea is to represent everything, including the DSPs, as
ASoC components and be able to represent the digital links between
components in the DAPM graph in the same way we currently represent
analogue links.  This means we need a way to propagate digital
configuration along the DAPM graph (or a parallel, cross linked digital
one).  Sadly I'm not really aware of anyone actively working on the
actual conversion at the minute, Morimoto-san has done a lot of great
preparatory work to make everything a component which makes the whole
thing more tractable.

--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4dyEACgkQJNaLcl1U
h9DSfQf+JkppA2jscPzzjdd9boS9MvB4K13ujfyH4R0ulhxBTuJgb5iVHE1G0aHM
NG4GVpP9IexvwP9c0AK8jcMy+4iz/ZphMvC2ha14jHPMrPI3887OBshaI11RXSf+
7LvmQ3AIubqZhuC2rVjmatelfl3QCkfNFeR7m1SKmvfb8OFMeyksluYPVRUEZnHF
0IWCeL7GElwgOk+xgDM79QvtCZurdG7GOmzGfqWMbY7nd0tVA4Vv26NGjKsvYlmt
li6SA9vaXO3Z7D3jKSXTk6m7TY+p6wCTPy2D1J+ICjMFyWuG0eLYwKW2+uH1OTAk
q+77EZoayqpTnS5rgA01jqbIY+dK9w==
=0V65
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--
