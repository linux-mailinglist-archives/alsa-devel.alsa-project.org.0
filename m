Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25832172C6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965B518DC;
	Wed,  8 May 2019 09:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965B518DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557301456;
	bh=SW+z+tiN2+du1+z8VuP07cf1hDDMbnVpR/ivBCKc+a4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m5IvmHGPmJlb9Yf3pQ3559peOcnVRGRDwJqyMCWQBxLnTb/pgnaaYmXB3PgdHiJZ0
	 EtmS13DWAfiW7+t+ZR9975x1PhLPG/FuPJ5nEuTx8Ev2/cfw/yChZN6uyUDG3GXbhL
	 Z0GkPodOZ89aZCIepP4axWpFv0mqLOVVQa6tPGMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C588F896F0;
	Wed,  8 May 2019 09:42:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37A5F896F0; Wed,  8 May 2019 09:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4455F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4455F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZxA8hVsf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HDw2kuO3LSTp+2eMKdYCmKC1s2F32Q67SXcrNjoGjJM=; b=ZxA8hVsfdGb1C4yFZwH0O/Mtd
 h6RDnnZLVCvEQYKCnFaIH/6uXYZxAFtBk8NPltLUI9kCXriYhI8m8STO6miraPhgKah6vLNXgse14
 IbsEDFUj7xH3ClGZ9LpT5IurbAdbhL3XU1w1oojvLFqflnPvhOclnBWvHC2Jt9D455Q8U=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHDc-0007M8-3w; Wed, 08 May 2019 07:42:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7B840440017; Wed,  8 May 2019 08:42:18 +0100 (BST)
Date: Wed, 8 May 2019 16:42:18 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508074218.GU14916@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.2
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
Content-Type: multipart/mixed; boundary="===============2960650980195246025=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2960650980195246025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TIr7t44h4GvinQKN"
Content-Disposition: inline


--TIr7t44h4GvinQKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1587a061ef562de0d97c82a95863e191bcd69d63:

  ASoC: sprd: Add reserved DMA memory support (2019-05-06 22:48:03 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.2-2

for you to fetch changes up to ce38a75089f70f6380fc63a5478a7659b4eb3f47:

  ASoC: SOF: core: fix undefined nocodec reference (2019-05-08 15:42:00 +0900)

----------------------------------------------------------------
ASoC: Fixes for v5.2

A bunch of driver specific fixes that came in since the initial pull
request for v5.2, mainly warning fixes for the newly added Sound Open
Firmware code which people appeared to only start looking at after I'd
sent the pull request.

----------------------------------------------------------------
Curtis Malainey (1):
      ASoC: RT5677-SPI: Disable 16Bit SPI Transfers

Jon Hunter (1):
      ASoC: max98090: Fix restore of DAPM Muxes

Olivier Moysan (2):
      ASoC: stm32: spdifrx: update pcm hardware constraints
      ASoC: stm32: spdifrx: change trace level on iec control

Pierre-Louis Bossart (2):
      ASoC: SOF: xtensa: fix undefined references
      ASoC: SOF: core: fix undefined nocodec reference

Randy Dunlap (1):
      ASoC: sound/soc/sof/: fix kconfig dependency warning

Takashi Iwai (4):
      ASoC: da7219: Fix a compile warning at CONFIG_COMMON_CLK=n
      ASoC: SOF: Fix a compile warning with CONFIG_PCI=n
      ASoC: rockchip: Fix an uninitialized variable compile warning
      ASoC: SOF: Propagate sof_get_ctrl_copy_params() error properly

 sound/soc/codecs/da7219.c         |  2 ++
 sound/soc/codecs/max98090.c       | 12 ++++++------
 sound/soc/codecs/rt5677-spi.c     | 35 ++++++++++++++++-------------------
 sound/soc/rockchip/rockchip_pdm.c |  2 +-
 sound/soc/sof/Kconfig             |  2 +-
 sound/soc/sof/core.c              | 10 +++++-----
 sound/soc/sof/intel/Kconfig       |  2 +-
 sound/soc/sof/ipc.c               | 10 +++++++---
 sound/soc/sof/ops.c               |  2 +-
 sound/soc/stm/stm32_spdifrx.c     |  5 +++--
 10 files changed, 43 insertions(+), 39 deletions(-)

--TIr7t44h4GvinQKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSiFkACgkQJNaLcl1U
h9ADzgf/YywBjk4cXfFUzyQy9XFAQ0MdzX0H0G6egowYaMvOXhBZ0NKX9twzC8fL
XsmwKKWeWi3hJ348GDhjvPjJCWyGjeWdqbuExUSP8Wnq2bhut6oUOjbgZyXCxlSb
3IfDAzpQfOqBwHKPKTB6nRKFRxZCrKq3RxrH3RX7mwKDm7zR981ReCEr7+6Fe5w4
LGmtnHJmaIT8u+M9d0WmclLvMieDuJssEAEScFiPxhGEINVSNoIXn3lTOHDYDgqK
Br4DvK3n42U7JDEWpQRWDG0xGCmEvf9C0+ROKeXzLtoM8D+/Cm80J2qVtOPtDqh9
6ImdxnKRvnky+1sQLyBOeS1N38O6FQ==
=aIqx
-----END PGP SIGNATURE-----

--TIr7t44h4GvinQKN--

--===============2960650980195246025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2960650980195246025==--
