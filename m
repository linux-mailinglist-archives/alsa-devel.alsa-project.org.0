Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECA162600
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 13:22:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12611682;
	Tue, 18 Feb 2020 13:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12611682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582028521;
	bh=F1shE2kklo3tuGNaPgMN8WmUNOyxrhOkJkouPtr15i0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oyLAjngflp+N3KBTh0Rih5tNA9k19ElhR+RrKr4BjbA+IbSivXJtcxJV6KTHPL1w9
	 kB+h2b1NMwa01OSWt4yx3qvMBqzAMAc7Qaj2jaxdrB2TZ6vmPp/D7w3uYozGJl6MXa
	 GeeI2Hlcd40RAZbLLjoff0eifEOpi+Pu9lsiOkCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC8AF80137;
	Tue, 18 Feb 2020 13:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A958F80148; Tue, 18 Feb 2020 13:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1C705F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 13:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C705F80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570AD1FB;
 Tue, 18 Feb 2020 04:20:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0C53F6CF;
 Tue, 18 Feb 2020 04:20:14 -0800 (PST)
Date: Tue, 18 Feb 2020 12:20:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.6
Message-ID: <20200218122013.GC4232@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 13426feaf46c48fcddb591e89d35120fcc90527f:

  ASoC: wcd934x: Add missing COMMON_CLK dependency to SND_SOC_ALL_CODECS (2020-02-05 10:05:19 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.6-rc2

for you to fetch changes up to 96781fd941b39e1f78098009344ebcd7af861c67:

  ASoC: sun8i-codec: Fix setting DAI data format (2020-02-17 21:58:41 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.6

A few fixes sent in since the merge window, none of them with global
impact but all important for the users they affect.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: atmel: fix atmel_ssc_set_audio link failure

Kai Vehmanen (3):
      ALSA: hda: do not override bus codec_mask in link_get()
      ASoC: SOF: Intel: hda: fix ordering bug in resume flow
      ASoC: SOF: Intel: hda: move i915 init earlier

Oleksandr Suvorov (1):
      ASoC: fsl_sai: Fix exiting path on probing failure

Ravulapati Vishnu vardhan rao (2):
      ASoC: amd: Buffer Size instead of MAX Buffer
      ASoC: amd: ACP needs to be powered off in BIOS.

Samuel Holland (2):
      ASoC: codec2codec: avoid invalid/double-free of pcm runtime
      ASoC: sun8i-codec: Fix setting DAI data format

Tzung-Bi Shih (3):
      ASoC: max98090: revert invalid fix for handling SHDN
      ASoC: dapm: remove snd_soc_dapm_put_enum_double_locked
      ASoC: hdmi-codec: set plugged_cb to NULL when component removing

 include/sound/soc-dapm.h            |   2 -
 sound/hda/ext/hdac_ext_controller.c |   9 +-
 sound/soc/amd/raven/acp3x-i2s.c     |   8 +
 sound/soc/amd/raven/acp3x-pcm-dma.c |   7 +-
 sound/soc/amd/raven/pci-acp3x.c     |  23 --
 sound/soc/atmel/Kconfig             |   4 +-
 sound/soc/atmel/Makefile            |  10 +-
 sound/soc/codecs/hdmi-codec.c       |  10 +
 sound/soc/codecs/max98090.c         | 434 ++++++++++--------------------------
 sound/soc/codecs/max98090.h         |   3 +-
 sound/soc/fsl/fsl_sai.c             |  22 +-
 sound/soc/soc-dapm.c                |  57 ++---
 sound/soc/sof/intel/hda-codec.c     |  12 +-
 sound/soc/sof/intel/hda-dsp.c       |  11 +
 sound/soc/sof/intel/hda.c           |  19 +-
 sound/soc/sunxi/sun8i-codec.c       |   3 +-
 16 files changed, 219 insertions(+), 415 deletions(-)

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5L1nwACgkQJNaLcl1U
h9AAqAf+MN04rKGqYFKczlOXThCUVG9sbLMwG+cavlxSzT+dKlHNN2VPBwsZnYlp
iRUpE+AfFcdnZTKMLW/vD1tIEaL82YL0ZAmQBdkHyhiWdwhiVv4szswtxFu//87R
tfqspV0QguO5qkg1deZ3Fhpeo1vsS1yd1LJVqHea4ro3rfmCs9smfcXgTq6vnboQ
JsLsjm9a0m5V9rAp2P97+3twLRundf/3IwSxeDhdqaoGGXtps3P6wGv2hMEw772U
wc8qgVktsG2fqUe9zrGVcvln+1rNyQoPLBZFLX9I+L8YFepdaZQuMq19YSImyqIm
VA0tUsHymQ1H86vsvfwh9wZnyZWqNg==
=ADyp
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
