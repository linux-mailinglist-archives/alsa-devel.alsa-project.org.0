Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144014D2A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 16:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF24190D;
	Mon,  6 May 2019 16:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF24190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557154264;
	bh=Wn4eYI4afaB/GdGgbc4cUu+lWGhpQCMe8JW6Fq0UYrs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv6KrCnaengyDz1f5SENxZM2TMV/TbZ/rfWPdHcElMIK4KFXX6tqBh4lbdfvbU82g
	 fshl9Sp0zeETpyc7izhiLMyFxOMhJcGvHmWF0Ob1UI59ChM60J4AKsQ3vlpbn4xrRX
	 5CE8FVbWWvissiAMS07fHFy5ZVh6dGjD3wzRokW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E847F89723;
	Mon,  6 May 2019 16:48:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54EB2F89715; Mon,  6 May 2019 16:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CFCF896F0
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CFCF896F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dkaUp3Ew"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9amx+O6XeZoVsNKhVHQ2r3llhhd8Of3dGF7f6UxURP8=; b=dkaUp3EwYeZVETXs+FCmum/Vd
 PfS33zWdx2KUbZjy8dCtWDC9kiFDnx58jsSOOnOLGOtxzHH8IAiQRFsRIXUiNGnrJfkrZw3Xs9FQ7
 iSry7HMtxlQRBXYX8pqdB2Maa/utiN/iEfD+ycHElUXauI6e9Sb6Zobflc8eZujKPyGCE=;
Received: from [2001:268:c0e6:658d:8f3d:d90b:c4e4:2fdf]
 (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNev0-0001s9-MP; Mon, 06 May 2019 14:48:39 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 2B6FC44000C; Mon,  6 May 2019 15:48:34 +0100 (BST)
Date: Mon, 6 May 2019 23:48:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190506144834.GW14916@sirena.org.uk>
References: <20190506141144.GR14916@sirena.org.uk>
 <s5hr29b4qas.wl-tiwai@suse.de>
 <20190506144000.GV14916@sirena.org.uk>
 <s5hef5b4pak.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hef5b4pak.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC updates for v5.2
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
Content-Type: multipart/mixed; boundary="===============8938960786080265670=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8938960786080265670==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwp4JDU+MaGmJm70"
Content-Disposition: inline


--pwp4JDU+MaGmJm70
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 04:42:59PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> OK, then I'll submit a few trivial fix patches for covering the random
> build warnings.

> In addition to the above, I see two others during my build tests:

> sound/soc/sof/ops.c:20:6: warning: =E2=80=98ret=E2=80=99 is used uninitia=
lized in this function [-Wuninitialized]

> sound/soc/codecs/da7219.c:2366:6: warning: unused variable =E2=80=98i=E2=
=80=99 [-Wunused-variable]

Dunno what compiler you're using but I'm not seeing those two, nor does
kernelci:

   https://storage.kernelci.org/broonie-sound/for-next/v5.1-rc7-328-g6455a8=
745ac1/arm64/allmodconfig/gcc-7/build.log

(same results there on x86, both using Debian's GCC).

--pwp4JDU+MaGmJm70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQSUEACgkQJNaLcl1U
h9DEZgf9E4Z1HuoUFnaYFrL7mCe8XJQiOdNkJW3bF9NgkDsygF2pKjuska1KAeFd
5RYvOGRDxSLEyKmWtW0M8C1Q2KQZLdoCUZ4Txe5hkLQQc4SAzHiuZjFfH5LTY7EY
jDZwh42cuQNLQnheIdfLaEqTzldJpnrpKz9PeudN519zo4Kz2CFpHUkH+vIyhpuK
F2LVEaAmC34lOQYD2YRBKzUR8lL0C2Q7FOfS4hVNODtGj6JZsAca07/xNZcDuP8b
8EIXTeD0zySXIG/dmycHPCHDWiWUMxEVTr42QVWw24IR8ZaZeDVoaN5s93EsCKyO
j2vX+Ssn4ArM7NOebfRfGRY00dSj4Q==
=tkwL
-----END PGP SIGNATURE-----

--pwp4JDU+MaGmJm70--

--===============8938960786080265670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8938960786080265670==--
