Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CEA63B29F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 20:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 994831677;
	Mon, 28 Nov 2022 20:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 994831677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669665413;
	bh=qZ1IQ3U4ZCrq5eEf41uqkt6GYyTSdxfsBahp+Jz89kQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1K3eKa7nUi/Djb8hDpR+rW/SApUrdst/ARc4ooXUDc5fFht8JtJcdz3VFJrQZgGJ
	 OZXs3dtYnEJqgIgjJbLR/wnxgJkp3jXVRDSk8Gj9fdUibD9Q+b8RlDLnIp+MQvDaXp
	 YNvWZzxT+VSpUkXUSN7f0k0+0mrmtGnui9N+Zub4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CB38F8024C;
	Mon, 28 Nov 2022 20:55:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F6D3F8016E; Mon, 28 Nov 2022 20:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0DD8F8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 20:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0DD8F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HsUvfMby"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45053613E9;
 Mon, 28 Nov 2022 19:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3DCC433D6;
 Mon, 28 Nov 2022 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669665346;
 bh=qZ1IQ3U4ZCrq5eEf41uqkt6GYyTSdxfsBahp+Jz89kQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HsUvfMby5m7bZ3qjq+pWTA8Mkh+VFXbSoe022GLeNFbdOmvMyMEgJlR7owyoZ3e+o
 AtB1d5EImNizo30LkvHPP569gw7EFJY8TAAVR0ckSGT9q9AsIltFq+YH6LBvH6KrMJ
 r9976Rjq24afGDEtPi/W+JICmKLbSlpSsVrjA3LISFdVrH69O0Tma9Y2F9xDBhplkK
 SGO+xYQOoFhXRaKgFMNmDyfRUDjnc0bWiKU4WW0OjEPE2f/81tP+7oX3L9xirRz8+Y
 icAcLW3zgSiYTQCx89tOQLoLW8l4tpkJJW5/74MM4DmGFUEN5Dw/laAUboKiQNGRi+
 XK6ioRhfcaaEg==
Date: Mon, 28 Nov 2022 19:55:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] [RFC] selftests: alsa - add PCM test
Message-ID: <Y4USPRrDqIfu50hh@sirena.org.uk>
References: <20221108115914.3751090-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YnK9Z0wiixaw+rvK"
Content-Disposition: inline
In-Reply-To: <20221108115914.3751090-1-perex@perex.cz>
X-Cookie: In the next world, you're on your own.
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.de>,
 Brian Norris <briannorris@chromium.org>,
 Curtis Malainey <cujomalainey@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, Jesse Barnes <jsbarnes@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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


--YnK9Z0wiixaw+rvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 12:59:14PM +0100, Jaroslav Kysela wrote:

> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -7,6 +7,8 @@ ifeq ($(LDLIBS),)
>  LDLIBS +=3D -lasound
>  endif
> =20
> -TEST_GEN_PROGS :=3D mixer-test
> +TEST_GEN_PROGS :=3D mixer-test pcm-test
> +
> +pcm-test: pcm-test.c conf.c
> =20
>  include ../lib.mk

This breaks out of tree kselftest builds - if you specify an output
directory with O=3D (as all the main automated test systems do) then any
target specific rules need to prepend $(OUTPUT)/ to specify the right
location for the output (this also works fine with in tree builds, a
default OUTPUT is generated).  Unfortunately looking at this just now
simply fixing that is causing only pcm-test to be built and not the
existing mixer-test, and explicitly specifying commands for mixer-test
causes that to be built and not pcm-test even explicitly asking to build
"all" as the target for reasons I'm not yet clear on.

You can see an example failure in:

   https://storage.kernelci.org/next/master/next-20221128/arm64/defconfig/g=
cc-10/logs/kselftest.log

The whole kselftest build setup is rather fragile and frustrating to
work with unfortunately, especially with tests built from multiple
objects.  The only fix I've come up with thus far is to inline conf.c
into pcm-test.c (a #include will do the trick) which isn't great.

--YnK9Z0wiixaw+rvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOFEjwACgkQJNaLcl1U
h9DHcwf/ZD7Yk5dhFIIIYqvCOLV7K8mc1DAI2RcnVM7hF4lx7iR+Tv5UhoUeP/ZW
DD59t3PzXmxxC1b2NfEvb1GiWg5Tulk4leQS/fhGCSUU9e772jf76i7jhHCyMn2u
ofecvdCVpYDR+0ABk7jyH2Du+Gq5QZYMlD3dnZzAiKYkG7NDlP1tVh/992m4ZLMS
AvEDOR2uqcfinxKtZ9vZNY9UJnS0EqE6f1QNpBeTy6i6QctGUY4VlQBatgxZHdD7
DijleAyMbyRJ/PvBXvtigGFl/4QWUvrVKpKCgJKHk1bHq+BN7i3pog1XZNHOXZ8u
pzi99bplrsBcEfB0h8QI1t1U5JWJ7Q==
=FcIY
-----END PGP SIGNATURE-----

--YnK9Z0wiixaw+rvK--
