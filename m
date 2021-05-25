Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF7390CEC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 01:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 060421761;
	Wed, 26 May 2021 01:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 060421761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621984891;
	bh=fDxVSrqomJWAVBn7fgZxPZ9HMa4l9fa6hzzIiSZNA7Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZgY1VEoqELZKHSD8lov95rbXxZznyO7jidci9hPWOxK79jX8xGozmgMX0X31aG2q
	 15EOaZG/ln1G3f2746Mp5V1z/CHz1RyWIFG1Rig1USD7SxdXRvPo9SwXTKBFmw/BjX
	 grtM6bayJnS3PwlJdjwx+7s1nC3EeSDC1oTRkSxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEFAF800CB;
	Wed, 26 May 2021 01:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45991F800CB; Wed, 26 May 2021 01:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CAEF800AC
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 01:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CAEF800AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X9emq20n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ylk5lLyghAG9NP9if5NiYktBJgY9Xer4d+sbwFFxb+o=; b=X9emq20nHYoSy7FAU1iynLpPWs
 EyaDQJ/DpkCwbM1hngwupMTwaUmm2nxexUvtcovRT/sV53NGhIwtglJcwu0YqQmA3tfLVAewOn3P4
 wGNHmRTseO4xCSIio9psc/4crC65XLxTMoxG4nbVINJXufh3e1O8PhlJFMm8ve5fvZZI=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llgL2-005ra6-Dk; Tue, 25 May 2021 23:19:52 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7CD37D0E9A7; Wed, 26 May 2021 00:20:25 +0100 (BST)
Date: Wed, 26 May 2021 00:20:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 2/7] ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
Message-ID: <YK2GOSIgiz2EmpUe@sirena.org.uk>
References: <871racbx0w.wl-kuninori.morimoto.gx@renesas.com>
 <87y2ckaifm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aASJbErhrel/vaof"
Content-Disposition: inline
In-Reply-To: <87y2ckaifm.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--aASJbErhrel/vaof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 09:45:33AM +0900, Kuninori Morimoto wrote:

Hi Morimoto-san,

First up sorry it's taken me a while to respond to this - I
wanted to get it clear in my head what I thought the best
approach is here.  I think your code here is good with a couple
of documentation tweaks:

> For example, some driver want to select format "automatically",
> but want to select other fields "manually", because of complex limitation.
> Or other example, in case of both CPU and Codec are possible to be
> clock provider, but the quality was different.
> In these case, user need/want to *manually* select each fields
> from Sound Card driver.
>=20
> It uses Sound Card specified fields preferentially, and try to select
> non-specific fields from CPU and Codec driver settings if driver had
> callbacks.
> In other words, we can select all dai_fmt via Sound Card driver
> same as before.

I mentioned last time around the idea of having first and second
preferences for the DAIs, for things like "this will work but
only if you get the configuration exactly right".  These patches
don't support that, they just treat everything the DAI reports as
being equally valid.  I've actually come round to thinking that
might be OK for now but...

> +/**
> + * snd_soc_dai_get_fmt - get enable DAI hardware audio format.

s/get enable DAI hardware/get supported/

> + * @dai: DAI
> + * @fmt: SND_SOC_POSSIBLE_DAIFMT_* format value.
> + *
> + * Configures the DAI hardware format and clocking.

=2E..I think here we should say something like

	This should return only formats implemented with high
	quality by the DAI so that the core can configure a
	format which will work well with other devices.  For
	example devices which don't support both edges of the
	LRCLK signal in I2S style formats should only list DSP
	modes.  This will mean that sometimes fewer formats
	are reported here than are supported by set_fmt().

so that instead of worrying about formats that aren't quite
supported properly we just tell drivers not to list them for now
so if the system is relying on the framework to pick the DAI
format then we know it's one that's robust, we're not going to
choose one that the hardware in one of the devices isn't very
good at.  Does that make sense to you?

If we did do first and second choices we'd get an algorithm like:

  1. Try to match both DAI's 1st choice, if match use that.
  2. Pick one DAI A, try it's 2nd choice with the other DAI B's 1st
     choice.
  3. Swap and try 1st choice of A and 2nd choice of B.
  4. Try 2nd choices of both DAIs.

but I think that might get too complicated and we'd end up stuck
if we ever wanted to change the algorithm since DTs that don't
specify a format may break if a different format is picked.  If
we go with ranking every format individually it gets even more
complicated for both driver authors and the core.

I think with the documentation tweak above your idea is a better
one for now, we can always go back later with more experience.

--aASJbErhrel/vaof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCthjgACgkQJNaLcl1U
h9AVXQf/csJewCGqKSkmcpHtFhfnyKGGlvQRj22C0kVOYQDuAPOO6ap7WSifEliT
17RUKqj103V5LUWSLXsCjpqPppKiiFUTNCONuRtORSaxpmfobGC7uvoRi+XNB6L4
md71mo2fp/Kw30wTSgb+N7VCy71lFIHDFKt4UdaVYaXpBUoenI6Y0Rm7anQsSRUn
pspN8V4KWaMauzBDfFpXryo3cgiA4n/gqbHFNIVuagtxfBeHa9TL08jk6tkVOlaj
PBxbZ1s/BOqdk6FY1kTOk2NXis1N82e44w5KhylnDLOLcdM8BS9FW2BmtyEh+Dj+
hQkf3vvffRkPHt7oxF5ZdeRP2GArIA==
=zG7u
-----END PGP SIGNATURE-----

--aASJbErhrel/vaof--
