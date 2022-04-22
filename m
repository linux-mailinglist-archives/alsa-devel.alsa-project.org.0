Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA950B95F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 16:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2071868;
	Fri, 22 Apr 2022 16:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2071868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650636057;
	bh=um3cX8X3FK3GmwalKpugJZTOOkvuwxWimL7NKw9nTZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xv5QhK8Ir1pw9Um9HHPN4jwSQQYUWsfBlXrmjjScQrXrzW07P2NDizgGgAktFaRsu
	 2PyS6YsMm1/Hx8ec/GvxeA+3vqFcZCS3zrYn1gY4ki4XWDpb4b3kDMoNOQwmuoJz6R
	 8/gDeYQK/r2NHiL6x7AH4qdyJ16bY8sinCNZUdhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F1AF80249;
	Fri, 22 Apr 2022 15:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 159CAF80249; Fri, 22 Apr 2022 15:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E11E9F80249
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E11E9F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PsFB4SeR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64E5EB82CE2;
 Fri, 22 Apr 2022 13:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331FFC385A0;
 Fri, 22 Apr 2022 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650635653;
 bh=um3cX8X3FK3GmwalKpugJZTOOkvuwxWimL7NKw9nTZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsFB4SeR6NUwyNxZCKT6xeFBnCzvndxX8DJ3BipNuRlPKvmQwBBKeXQUMP6kjwcKz
 aiphnnDasv9zeDMEYP4IWPxKKf4NeHIau44edFWwqsjR/S2+kjd/923dXYA597Lzka
 T6S42bHkQrSTKLRJ8ZSCG7z7UX7rd/6vy5L5XUfO+MNt/oeerYAVpojZLGW3t7af5V
 KisoI4QePyKfGiY5L8P5AeRzx69zmtC1bV8ZgobzAgDTxi7xuAqv3JqXy0rvUtsSvI
 0+2T/oYn17YWwMRyCspqIeK+jRnf7Etre06AXgUs/py/BTbSmr47tF86qq687ffWEa
 6iyZeiuoVwkqg==
Date: Fri, 22 Apr 2022 14:54:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Enable AVS driver only on x86 platforms
Message-ID: <YmKzfv61wSrutVP5@sirena.org.uk>
References: <20220422133411.169007-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MFbSE2Fy02l+QP1G"
Content-Disposition: inline
In-Reply-To: <20220422133411.169007-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Whoever dies with the most toys wins.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--MFbSE2Fy02l+QP1G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 03:34:11PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Only supported platform for AVS are x86 machines, so there is no reason
> for it to build on other architectures.

>  config SND_SOC_INTEL_AVS
>  	tristate "Intel AVS driver"
> -	depends on PCI && ACPI
> +	depends on X86 && PCI && ACPI

If it actually builds please add an || COMPILE_TEST in there so people
doing framework updates have to cover fewer build configurations for
testing (this might make sense for the PCI and ACPI bits as well if
those will compile out).

--MFbSE2Fy02l+QP1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJis34ACgkQJNaLcl1U
h9ACNAf/UyMUcfGoDkvSAdWT2hZmOa8AtjymR5Xctr33kg0ok/o21rWmD4xENFCE
eAiWNUp22NaA4dAKYR1XWEx8LMnppTPAGcFwtw5TMOkmcdy7Vm2lpslHRQgFIXsP
1deBmgcBrp1EBcVE3XAAz1z2FffbxyebXLlWFRPn51VmBZE1c24xGH8JQSM5CW66
QrdVhwBFPym1FFjleplI6jBsglWE5iM2U6ZibmF7SX1ogBICGAMZSK+ee7KUXR6K
S3iHb2cQJME5CO2gUiJ8wtoJtRLbHJGYsb1LDCBr1uPERWoYKnZZb9yHVIAaFFvW
jjEjRNXX3OrLQDNMBcrv152K0VJNNg==
=8+SN
-----END PGP SIGNATURE-----

--MFbSE2Fy02l+QP1G--
