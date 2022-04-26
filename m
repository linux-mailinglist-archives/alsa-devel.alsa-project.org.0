Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF475104F2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB9D1863;
	Tue, 26 Apr 2022 19:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB9D1863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993027;
	bh=sRC3kHarVWSDdySC4waYtizt8h7NpqOtylmmmXgk/fA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bn0r7f+SVlJOf6Jbekxb7ntv5RfK8u3SNRW4zv1XPx9Unu469ifctfojGwLPVoRjR
	 iIGZV2vioDtWGIzstFOaXEWNOVVKwekuYf3CJmf6RIM0mGvuIuEjA6bUJMt4ZklAjN
	 ayF/Twa9FXZK1tjBJ8+ezUmfls0DejKMF3ejfyYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C32F8025C;
	Tue, 26 Apr 2022 19:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1DCF800FA; Tue, 26 Apr 2022 19:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21A83F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A83F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zaku8Lgi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93CA461372;
 Tue, 26 Apr 2022 17:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391E8C385A4;
 Tue, 26 Apr 2022 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650992921;
 bh=sRC3kHarVWSDdySC4waYtizt8h7NpqOtylmmmXgk/fA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zaku8LgiNBdPBUrepDUviotybjI5K1GtcTKtibYWDeZNpIqJoZa76COt3rrWJv45V
 lsBUavONRqTdgnhvKXwCWBXc007yOzUQga25spIMZZgQJV6IPmtepJT1PafJEwyCr5
 4lkXTjTMX/x/yURWhGVYa7oDlENTKHrik1lx8M9kLTDRTtkX0AYJqagQJovRd5suGS
 vqSwh9lFYYvJAkJ9gbRVMCziPiG2LWOfGeLbA5ybUwskDUYW5HcDbi3sUQuWFdndRr
 1SxRPM31jEKQwPiZhrKfGkQ9gxZPYehCskPT461Pyxl3hwdXGLZwXxWnoodUQXTln0
 9E+zCAxLSTKAA==
Date: Tue, 26 Apr 2022 18:08:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Message-ID: <YmgnE/HKNmI+agNs@sirena.org.uk>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X92sW5LjGepWlM5S"
Content-Disposition: inline
In-Reply-To: <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
X-Cookie: I'm a Lisp variable -- bind me!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--X92sW5LjGepWlM5S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 08:33:57AM -0500, Pierre-Louis Bossart wrote:
> On 4/26/22 06:54, Amadeusz S=C5=82awi=C5=84ski wrote:

> > -	depends on (X86 && ACPI) || COMPILE_TEST
> > -	depends on PCI
> > +	depends on X86 || COMPILE_TEST
> > +	depends on PCI && ACPI
> >  	depends on COMMON_CLK
> >  	select SND_SOC_ACPI

> select SND_SOC_ACPI if ACPI should work, that's what we do for SOF.

That also looks sensible - it's probably good if both users do the same
thing here so can someone send a patch for that please?  Sorry for not
noticing that earlier Amadeusz.

--X92sW5LjGepWlM5S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJoJxMACgkQJNaLcl1U
h9BXrQf9HFXGjnIpbtQHE4n+zHDFuoknMAO34BXv0ioS8sXqjnic07HbyqcJBQO0
fNVanKXMfFtAKCOqWg4Zzyl7h57xHXWL74snc5HxKAgB6nJ26tTDTnPIxKbANNNc
JS0/SPiYBZa1bnflshcCnT9TIR9viPTyvdF3gXshP5cnDsB6CwmgWm2u0libIysY
WsfDB+YblnkwCWTytKGn5xNNNzedvG7Chz7wVVjH6YgtJyGVs6QjEbfFEjf2OeWX
/wywECZx3AugeoMBFaHPvl4WBPQyBmyLd+QpHpuQbyNszw+KD6oVCMpgEz6TSMRA
FCFQwUcWnLrU1Q6BUUtmo/uvydkcJQ==
=Ejb6
-----END PGP SIGNATURE-----

--X92sW5LjGepWlM5S--
