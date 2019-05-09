Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E203183B6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 04:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5DB1831;
	Thu,  9 May 2019 04:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5DB1831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557368737;
	bh=r3htsOcm+Nofblk4CY8wAYDzhUUmrcLwdJ34H4TebIc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVJp26ej71BNoMxtZ5Jkhz8tPLVs02+udYYDcLH035WqMDXdvJP2rphNAl9B8JKXj
	 tErmsT8Oxia/+Ekpe2QtQIYAmwkXChrZDn+JZE0PvKTo+xjmxlYZnlFx3tDqQjHf82
	 bj30A1oNE1lR1LQqHTNvzNsOrYOe3K6qBgkF44Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17711F89673;
	Thu,  9 May 2019 04:23:53 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACE1F89674; Thu,  9 May 2019 04:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDD67F807B5
 for <alsa-devel@Alsa-project.org>; Thu,  9 May 2019 04:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDD67F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ANBZEFAx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zanGE15x4lJBoZyTy0mDMfP/BdxrRUrg0s9NVGyLsM4=; b=ANBZEFAxJTtSmr8Bb4CYJv7Y9
 OSTQArBKloD2QfCfnql9KSZ2D1Hn/KGDsZQm9KTfArJ5XzPay+CX8wRoNPo+CkZqEy8+TVoxi959v
 oJ1gCH/lmMRWrKHIfHJT7IT5+gXMMcG/a+3wo5x32nPZZcP0zo6Gv2FAmFRyuj2LM4/ic=;
Received: from [2001:268:c0e3:9e6d:fb20:4124:5afd:9c02]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOYio-0001Q7-06; Thu, 09 May 2019 02:23:46 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7761B44000C; Thu,  9 May 2019 03:23:41 +0100 (BST)
Date: Thu, 9 May 2019 11:23:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190509022341.GR14916@sirena.org.uk>
References: <20190508094554.GK14916@sirena.org.uk>
 <s5h4l65s0kr.wl-tiwai@suse.de>
 <20190508103150.GP14916@sirena.org.uk>
 <s5h1s19s06b.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h1s19s06b.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@Alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC fix for v5.2
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
Content-Type: multipart/mixed; boundary="===============2365650838745988301=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2365650838745988301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FmkfFOZZ61l6O/yn"
Content-Disposition: inline


--FmkfFOZZ61l6O/yn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 12:36:12PM +0200, Takashi Iwai wrote:

> OK, I can reset the repo and re-pull if you want...

The following changes since commit ce38a75089f70f6380fc63a5478a7659b4eb3f47:

  ASoC: SOF: core: fix undefined nocodec reference (2019-05-08 15:42:00 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.2-5

for you to fetch changes up to 7f6647ced298d56027218e47619b7f0d925fc83e:

  ASoC: SOF: Fix unused variable warnings (2019-05-09 11:18:57 +0900)

----------------------------------------------------------------
ASoC: Updates for v5.2

Redone to remove the misfiled SPI commit

----------------------------------------------------------------
Libin Yang (1):
      ASoC: codec: hdac_hdmi: no checking monitor in hw_params

Olivier Moysan (1):
      ASoC: stm32: i2s: update pcm hardware constraints

Takashi Iwai (1):
      ASoC: SOF: Fix unused variable warnings

Tzung-Bi Shih (3):
      ASoC: mediatek: mt6358: initialize setting when ramping volume
      ASoC: mediatek: mt6358: save output volume for mixer controls
      ASoC: mediatek: mt6358: save PGA for mixer control

 sound/soc/codecs/hdac_hdmi.c |  13 -----
 sound/soc/codecs/mt6358.c    | 131 +++++++++++++++++++++++++++----------------
 sound/soc/sof/core.c         |   2 +
 sound/soc/stm/stm32_i2s.c    |   3 +-
 4 files changed, 87 insertions(+), 62 deletions(-)

--FmkfFOZZ61l6O/yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzTjywACgkQJNaLcl1U
h9D0OQf/Wa1L+SEqVhURUB8LiiNkewc4IL5lo2grIL0ZcElC4DSq09uFnvRPDdDY
HQ2Uoo/m6GB4hVvZmaSBroPbj8J67zHS216O46HBD0z818Pr/ZmFNzQq/MSRLHT1
FYcfHpwJ/s4Qv2zB610AUDPFa863E4uGGAHJB15jkLugDebZl6kxs9HJhEuHkl/G
VYPND/JjkNe7a0+CFdPrFAWsGWcd+C2tqqx1uzERzy+HqMoK1zH7jmwna8d1cnXo
dIThfQj8azp0GxLtcaoRKtSjkWC6r0qU7buMf1xCUB9KvNouijEIGkwVraDrjCuD
qfmdv8VbxArEAxwH3AJlQEIX1MyPag==
=gZOj
-----END PGP SIGNATURE-----

--FmkfFOZZ61l6O/yn--

--===============2365650838745988301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2365650838745988301==--
