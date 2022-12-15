Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78964DAD1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 13:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74E5224E;
	Thu, 15 Dec 2022 13:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74E5224E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671105714;
	bh=oPpUqYlxr77fNyRzxzW8QwAyxbVGbPr6qrLHJlP9Cs0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T3ku4buWe/+0XT7MsTZfJoxEKBWIfmCFgdjKbZOfhfnzeGxA5Bb83BcrP4hAEyvtK
	 EgYFUHK+uZ8586M8FA6VYQg90HGf9MJsleWT352xIlNoOxmcpirJcSsDNIn7Uid3w1
	 VSWUKfyT0YHJSSYKTXHkQeaKKMgTUgxFny2umdlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C412F804F3;
	Thu, 15 Dec 2022 13:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5064AF804E7; Thu, 15 Dec 2022 13:00:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDFAFF801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 13:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDFAFF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YM9kX1fC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B00A9B81AAE;
 Thu, 15 Dec 2022 12:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4CEC433D2;
 Thu, 15 Dec 2022 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671105650;
 bh=oPpUqYlxr77fNyRzxzW8QwAyxbVGbPr6qrLHJlP9Cs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YM9kX1fCDfqx8+0VlEePZMWX+U72VRPacsWkztsWfeB7KsPEpPoX2+TCUrOP7nsMP
 28WvETvisFcPeGoZjHtmPw6CVgPu6n5HxGxV/fpM8hlda6gVtO/kTjIY5VYKLhP8Dm
 jcCfpKkrILJ/8UEXagGLYUcq6ON5Hjcws13AR5EkClCVRVWJNs+PK2kVagyaInqlNJ
 ZrXyWSY4VemIjWObq3KdxeAAeq13MZhhjeICiNiyeu6vEXSvKm/c8FM0mnCDQm0r3U
 d+3+FFZmZRNmXCp6nReN0ovWwErflvFvvwXloxrGtIA5DVbVXG6XlYJx89Cp3zZ1P1
 pIWRD2lZHAgtA==
Date: Thu, 15 Dec 2022 12:00:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 2/2] ASoC: max98088: fix initial dai mute state
Message-ID: <Y5sMbQZix760NH4T@sirena.org.uk>
References: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
 <20221213095328.122309-2-r.czerwinski@pengutronix.de>
 <Y5hpqWH2WuSIUHil@sirena.org.uk>
 <20221215091747.xn3f7ecrwoc7ssyo@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0PHvdl9amdw8Qwv7"
Content-Disposition: inline
In-Reply-To: <20221215091747.xn3f7ecrwoc7ssyo@pengutronix.de>
X-Cookie: Today is what happened to yesterday.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--0PHvdl9amdw8Qwv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2022 at 10:17:47AM +0100, Marco Felsch wrote:
> On 22-12-13, Mark Brown wrote:

> > > +       snd_soc_component_update_bits(component, M98088_REG_2F_LVL_DAI1_PLAY,
> > > +               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
> > > +       snd_soc_component_update_bits(component, M98088_REG_31_LVL_DAI2_PLAY,
> > > +               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
> > > +

> > Won't this be broken again after suspend?  The device gets powered off
> > over suspend, then when it powers on again with the output unmuted
> > nothing will do another write since the register is already in the state
> > in the cache.

> I didn't found any suspend logic within the driver. Is this handled
> within the ASoC core?

Register save and restore for the device won't be.

--0PHvdl9amdw8Qwv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmObDGwACgkQJNaLcl1U
h9DKQQf/YCCGtpBvt7QeiGZoRVFHxvOPm7/7+AKqoB29uFoyBgi+BsaQPu2DWs7u
wthV/jYoKl5Dqc4aTVUPEaHd+LfHrI1Z5zNk8bnsW/KTh73AYfBFelcgn78w+23n
5uMwbHBQIESsiJTAELJOiHrfG/8M2WBrNO5gskq4NRbzclI5e0hZnI0lMFr7Uega
R0nMslzE5cNiRGlbn1k33a8Rpi08T2cH1zS1cfAru4OPy4VEpgT/gyFK7dtDmH8f
hPKSc0c1wBFlRz0a0cDMkf0HyoGeKrpMAGv+OPHjIvt9lzNjDMR9ekBConrqkrdg
UXKSodtBH6MXrmjcOX3JFJwsGhCRSw==
=W9y5
-----END PGP SIGNATURE-----

--0PHvdl9amdw8Qwv7--
