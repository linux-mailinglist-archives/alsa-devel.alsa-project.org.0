Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B701A2666
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 17:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2066166D;
	Wed,  8 Apr 2020 17:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2066166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586361284;
	bh=7LVhVLMwrBvg9yF9WgVsro5qvchVbyMHzCD0DhYgP9Q=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ue3Ccsa4IOUSYXemQMFoiPlh9B3b4//pDA+tXsJOE4h3tUSeAfJJhXmR0ExxPBpVG
	 kQ7JET5qYG3ytIu1extzFB1GkZs8bwA3hd3Wj5/coC15eurMfMCHhgqxIHoQ9zXokZ
	 E6eJ6cLnH2v2higi+0QMhrjzOMrFimGbhyP/G29E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB141F80105;
	Wed,  8 Apr 2020 17:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2BACF80143; Wed,  8 Apr 2020 17:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42FB4F80107
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 17:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42FB4F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fPbgox7o"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A20F720730;
 Wed,  8 Apr 2020 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586361174;
 bh=7LVhVLMwrBvg9yF9WgVsro5qvchVbyMHzCD0DhYgP9Q=;
 h=Date:From:To:Cc:Subject:From;
 b=fPbgox7oFRTEO80PWneuzfpqISNqt/B7iYIVuicw2qRGpf1Y5HtK4JP1v1KS4+1jK
 5bcuqvKxzTDf0n79lLcTGn3TcXewvqX4OKhMRUAhEkxWrrnh3PNmttRpSvhKfFlSXp
 tMaAYTJN2qf/UD385y5Vs1PRvVWkS0eGhvBesIw4=
Date: Wed, 8 Apr 2020 16:52:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.7
Message-ID: <20200408155251.GB5177@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
X-Cookie: Sank heaven for leetle curls.
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


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 3d2cdb854659851d991f5b8e97e847e3fd240625:

  Merge series "ASoC: Intel: add SoundWire machine driver" from Pierre-Loui=
s Bossart <pierre-louis.bossart@linux.intel.com>: (2020-03-27 17:28:36 +000=
0)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-fix-v5.7

for you to fetch changes up to ccfc531695f3a4aada042f6bdb33ac6be24e1aec:

  ASoC: cs4270: pull reset GPIO low then high (2020-04-07 15:29:54 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.7

A collection of fixes that have been accumilated since the merge window,
mainly relating to x86 platform support.

----------------------------------------------------------------
Akshu Agrawal (1):
      ASoC: AMD: Clear format bits before setting them

Cezary Rojewski (4):
      ASoC: Intel: broadwell: Remove ignore_suspend flag from SSP0 dai link
      ASoC: Intel: haswell: Remove ignore_suspend flag from SSP0 dai link
      ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from SSP0 dai link
      ASoC: Intel: bdw-rt5650: Remove ignore_suspend flag from SSP0 dai link

Fabio Estevam (1):
      dt-bindings: sound: cs42l51: Remove unneeded I2C unit name

Hans de Goede (6):
      ASoC: SOF: Turn "firmware boot complete" message into a dbg message
      ASoC: Intel: atom: Take the drv->lock mutex before calling sst_send_s=
lot_map()
      ASoC: Intel: atom: Check drv->lock is locked in sst_fill_and_send_cmd=
_unlocked
      ASoC: Intel: atom: Fix uninitialized variable compiler warning
      ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN MPWIN895CL tablet
      ASoC: rt5645: Add platform-data for Medion E1239T

Julia Lawall (1):
      ASoC: stm32: sai: Add missing cleanup

Mark Brown (1):
      Merge series "ASoC: Intel: boards: Remove ignore_suspend flag from SS=
P0 dai link" from Cezary Rojewski <cezary.rojewski@intel.com>:

Mike Willard (1):
      ASoC: cs4270: pull reset GPIO low then high

Pierre-Louis Bossart (1):
      ASoC: soc-dai: fix DAI startup/shutdown sequence

Stephan Gerhold (1):
      ASoC: qcom: q6asm-dai: Add SNDRV_PCM_INFO_BATCH flag

Takashi Iwai (1):
      ASoC: bcm: Fix pointer cast warning

YueHaibing (1):
      ASoC: rt5682: Fix build error without CONFIG_I2C

=EC=9D=B4=EA=B2=BD=ED=83=9D (4):
      ASoC: fix regwmask
      ASoC: dapm: connect virtual mux with default value
      ASoC: dpcm: allow start or stop during pause for backend
      ASoC: topology: use name_prefix for new kcontrol

 .../devicetree/bindings/sound/cirrus,cs42l51.yaml  |  2 +-
 include/sound/soc-dai.h                            |  2 +-
 sound/soc/amd/raven/acp3x-i2s.c                    |  1 +
 sound/soc/amd/raven/acp3x.h                        |  2 ++
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  2 +-
 sound/soc/codecs/cs4270.c                          | 40 ++++++++++++++++++=
+---
 sound/soc/codecs/rt5645.c                          |  8 +++++
 sound/soc/codecs/rt5682.c                          |  5 ++-
 sound/soc/intel/atom/sst-atom-controls.c           |  4 +++
 sound/soc/intel/atom/sst/sst_pvt.c                 |  2 +-
 sound/soc/intel/boards/bdw-rt5650.c                |  1 -
 sound/soc/intel/boards/bdw-rt5677.c                |  1 -
 sound/soc/intel/boards/broadwell.c                 |  1 -
 sound/soc/intel/boards/bytcr_rt5640.c              | 11 ++++++
 sound/soc/intel/boards/haswell.c                   |  1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  4 +--
 sound/soc/soc-dai.c                                |  8 ++---
 sound/soc/soc-dapm.c                               |  8 ++++-
 sound/soc/soc-ops.c                                |  4 +--
 sound/soc/soc-pcm.c                                |  6 ++--
 sound/soc/soc-topology.c                           |  2 +-
 sound/soc/sof/loader.c                             |  2 +-
 sound/soc/stm/stm32_sai_sub.c                      |  4 ++-
 23 files changed, 93 insertions(+), 28 deletions(-)

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6N81IACgkQJNaLcl1U
h9BlEggAhkDb9eJcpQMVJ4285zBCdGMwaH/ED14yUCnJU2YjmNPZ6Wlj/4vuMm9t
ihcxU18TAssaTbhavc3FCdn/q8qQyrZfs0rkTG2k4UKKO03gxl5/62u0np/lac9C
F/FsfjCgfojFTnFTDYHob3cFKs2map6Orc1XN39bXn5vyuKqj+1H50i3AgmH1F5i
/D03N61r39YaZ6wofuQzKePuALaTfGIHSoXplUUAiYY92zkP3AWG6YDMr2ViWCIx
tXeZc2q+csxIQcSWP//KgayELMMsUGqvAgJtrCpU6V1TK5S06f73T8jrUNOZbJAk
2WQ3zPot8poxgwDcVUC52QnzO6AIdg==
=sTZo
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
