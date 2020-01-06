Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1F13127C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 14:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73CF117FE;
	Mon,  6 Jan 2020 14:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73CF117FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578315834;
	bh=JQsX23FzCduqbTgNhniqE/PT42F00KH34hnUaeNjFV8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQM/8TpHF+z0dQKLYhD85QDgWYcyQYjQBQUPmNPlcoZ4kWaVtST0S7zlDgdAePFTx
	 GGHN9rkRaV2kxcYJg7AukdHZi4SgKLdGkNk07K80cUPfH36JK3hmu95yUzbSRWsAz+
	 rnjQ4AhB0m+Sqdmu8OyNV+3K7SjxgHsa5IPSCefE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB702F80159;
	Mon,  6 Jan 2020 14:02:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F016F80159; Mon,  6 Jan 2020 14:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0E47FF8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 14:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E47FF8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F34C2328;
 Mon,  6 Jan 2020 05:02:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784ED3F534;
 Mon,  6 Jan 2020 05:02:03 -0800 (PST)
Date: Mon, 6 Jan 2020 13:02:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200106130202.GA6448@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.5
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
Content-Type: multipart/mixed; boundary="===============5084857113339622359=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5084857113339622359==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 556672d75ff486e0b6786056da624131679e0576:

  ASoC: wm8962: fix lambda value (2019-12-16 11:47:28 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.5-rc5

for you to fetch changes up to ff3b57417012fcc963ec281f5705bed837e4b1ac:

  ASoC: Intel: boards: Fix compile-testing RT1011/RT5682 (2020-01-03 00:56:47 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.5

More fixes that have been collected, nothing super remarkable here - the
few core fixes are mainly error handling related as are many of the
driver fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: Intel: boards: Fix compile-testing RT1011/RT5682

Chuhong Yuan (1):
      ASoC: fsl_audmix: add missed pm_runtime_disable

Colin Ian King (1):
      ASoC: SOF: imx8: fix memory allocation failure check on priv->pd_dev

Daniel Baluta (2):
      ASoC: soc-core: Set dpcm_playback / dpcm_capture
      ASoC: SOF: imx8: Fix dsp_box offset

Dragos Tarcatu (1):
      ASoC: topology: Prevent use-after-free in snd_soc_get_pcm_runtime()

Kai Vehmanen (1):
      ASoC: SOF: fix fault at driver unload after failed probe

Olivier Moysan (3):
      ASoC: stm32: spdifrx: fix inconsistent lock state
      ASoC: stm32: spdifrx: fix race condition in irq handler
      ASoC: stm32: spdifrx: fix input pin state management

Pierre-Louis Bossart (1):
      ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free

Takashi Iwai (1):
      ASoC: core: Fix access to uninitialized list heads

 sound/soc/fsl/fsl_audmix.c                 |  9 ++++++-
 sound/soc/intel/boards/cml_rt1011_rt5682.c |  1 -
 sound/soc/soc-core.c                       | 14 ++++++-----
 sound/soc/soc-topology.c                   |  6 ++---
 sound/soc/sof/imx/imx8.c                   |  5 +++-
 sound/soc/sof/intel/hda-dai.c              | 11 ++++++--
 sound/soc/sof/ipc.c                        |  3 +++
 sound/soc/stm/stm32_spdifrx.c              | 40 +++++++++++++++++++-----------
 8 files changed, 61 insertions(+), 28 deletions(-)

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4TL8kACgkQJNaLcl1U
h9Dorgf+P7tk1hvYIA7ejrrUXYuu3J6jDFTlRHIWUk8CFkyHSFgm6K371YjrEZn7
aKMvn98NMjWZ5+pdsaWRcxUPHdIzrJo1xeCYu7U8CH82nNMESqswtH53L5HTYpB9
JAiRmSVWg3ZmkndBdZAWPjUjwsSYPPVERAukdtVwuNUfywR/ZsLgoLUqwa4K+HPh
0KOSPu57rp7npror0QX3Zthr43l6mQ5qFGE0fSEihPEBYcpq5kosjBZWe0aWzKcR
3pMKoqsLan6i4T75bfGO1820eOtI3X0s1eV/cKnmtvWaYAoBFbXQw+r+2bFDY2Ig
HNPjfrctaptbG/zeCg9VEez2YsRm9g==
=A9dP
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============5084857113339622359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5084857113339622359==--
