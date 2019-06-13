Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FF43A85
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 17:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0C21827;
	Thu, 13 Jun 2019 17:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0C21827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560439320;
	bh=VVSRDqr2LHVjFIw+GeWZoAn9ZzD7OfCdvH3XnrppabA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oKfshATZz7kpnXhxWfs/Ca0/xXqz6CZXPI02sM4sbdCHA/jyyQddL64ujDCg2Ssh+
	 RpkBBG3e8WZkK7t0Qf9N2hXchA/pg/uwhCrYcvxlnzMNm6xvaoS00/stwbCmkoe7fq
	 vukZbzsqjpv6d43xzFgROzWEl5m6Q+Sbgh8w+aMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DD1F80794;
	Thu, 13 Jun 2019 17:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE40F89703; Thu, 13 Jun 2019 17:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13A9F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 17:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13A9F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uQsSOWiK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AD5SI86u+mBcjSG9HoX4Y3UDPRGFfr6le8Thidn0MkY=; b=uQsSOWiKJjpwlZdSYE3vUZgxD
 o9yuYzC4OUWx2lcYPrBq4x+Au1Jf3tICse4Qk+stjlhesPLJSwdVdkve/8OaGCYg8HP1HTzKmLVWZ
 cTZGeAEZQmtE90i5e402eL2poJlfIw0GxUzob+G/MReFqmhgKw9ZbFABgwwnu6YrpU3SA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbRW9-0005Bx-5z; Thu, 13 Jun 2019 15:19:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 58F62440046; Thu, 13 Jun 2019 16:19:56 +0100 (BST)
Date: Thu, 13 Jun 2019 16:19:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190613151956.GK5316@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Editing is a rewording activity.
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
Content-Type: multipart/mixed; boundary="===============6890968901394297083=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6890968901394297083==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z9t8O/5YJLB6LEUl"
Content-Disposition: inline


--Z9t8O/5YJLB6LEUl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 7f6647ced298d56027218e47619b7f0d925fc83e:

  ASoC: SOF: Fix unused variable warnings (2019-05-09 11:18:57 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-fix-v5.2-rc4

for you to fetch changes up to 3da428ff2aa5a5191ba2f1630eea75f03242f3f2:

  ASoC: Intel: sst: fix kmalloc call with wrong flags (2019-06-10 15:37:17 =
+0100)

----------------------------------------------------------------
ASoC: Fixes for v5.2

There's an awful lot of fixes here, almost all for the newly introduced
SoF DSP drivers (including a few things it turned up in shared code).
This is a large and complex piece of code so it's not surprising that
there have been quite a few issues here, fortunately things seem to have
mostly calmed down now.  Otherwise there's just a smattering of small fixes.

----------------------------------------------------------------
Alex Levin (1):
      ASoC: Intel: sst: fix kmalloc call with wrong flags

Amadeusz S=C5=82awi=C5=84ski (2):
      ALSA: hdac: fix memory release for SST and SOF drivers
      SoC: rt274: Fix internal jack assignment in set_jack callback

Curtis Malainey (1):
      ASoC: rt5677-spi: Handle over reading when flipping bytes

Georgii Staroselskii (1):
      ASoC: sun4i-codec: fix first delay on Speaker

Guennadi Liakhovetski (1):
      ASoC: SOF: ipc: fix a race, leading to IPC timeouts

Jon Hunter (2):
      ASoC: simple-card: Fix configuration of DAI format
      ASoC: simple-card: Restore original configuration of DAI format

Kai Vehmanen (2):
      ASoC: SOF: fix race in FW boot timeout handling
      ASoC: SOF: fix DSP oops definitions in FW ABI

Keyon Jie (1):
      ASoC: SOF: control: correct the copy size for bytes kcontrol put

Kov=C3=A1cs Tam=C3=A1s (1):
      ASoC: Intel: Baytrail: add quirk for Aegex 10 (RU2) tablet

Kuninori Morimoto (2):
      ASoC: soc-dpm: fixup DAI active unbalance
      ASoC: soc-core: fixup references at soc_cleanup_card_resources()

Libin Yang (2):
      ASoC: soc-pcm: BE dai needs prepare when pause release after resume
      ASoC: SOF: pcm: clear hw_params_upon_resume flag correctly

Marcus Cooper (2):
      ASoC: sun4i-i2s: Fix sun8i tx channel offset mask
      ASoC: sun4i-i2s: Add offset to RX channel select

Matt Flax (1):
      ASoC : cs4265 : readable register too low

Pan Xiuli (1):
      ASoC: SOF: soundwire: add initial soundwire support

Pierre-Louis Bossart (9):
      ASoC: SOF: nocodec: fix undefined reference
      ASoC: SOF: core: fix error handling with the probe workqueue
      ASoC: SOF: pcm: remove warning - initialize workqueue on open
      ASoC: SOF: uapi: mirror firmware changes
      ASoC: SOF: bump to ABI 3.6
      ASoC: Intel: cht_bsw_max98090: fix kernel oops with platform_name ove=
rride
      ASoC: Intel: bytcht_es8316: fix kernel oops with platform_name overri=
de
      ASoC: Intel: cht_bsw_nau8824: fix kernel oops with platform_name over=
ride
      ASoC: Intel: cht_bsw_rt5672: fix kernel oops with platform_name overr=
ide

Ranjani Sridharan (6):
      ASoC: SOF: fix error in verbose ipc command parsing
      ASoC: core: lock client_mutex while removing link components
      ASoC: SOF: core: remove DSP after unregistering machine driver
      ASoC: SOF: core: remove snd_soc_unregister_component in case of error
      ASoC: hda: fix unbalanced codec dev refcount for HDA_DEV_ASOC
      ASoC: core: Fix deadlock in snd_soc_instantiate_card()

S.j. Wang (2):
      ASoC: fsl_asrc: Fix the issue about unsupported rate
      ASoC: cs42xx8: Add regcache mask dirty

Sathya Prakash M R (3):
      ASoC: Intel: soc-acpi: Fix machine selection order
      ASoC: Intel: sof-rt5682: fix for codec button mapping
      ASoC: Intel: sof-rt5682: fix AMP quirk support

Slawomir Blauciak (1):
      ASoC: SOF: ipc: replace fw ready bitfield with explicit bit ordering

Tzung-Bi Shih (1):
      ASoC: core: move DAI pre-links initiation to snd_soc_instantiate_card

Viorel Suman (2):
      ASoC: ak4458: add return value for ak4458_probe
      ASoC: ak4458: rstn_control - return a non-zero on error only

Yu-Hsuan Hsu (1):
      ASoC: max98090: remove 24-bit format support if RJ is 0

YueHaibing (2):
      ASoC: SOF: Intel: hda: Fix COMPILE_TEST build error
      ASoC: da7219: Fix build error without CONFIG_I2C

Zhu Yingjiang (2):
      ASoC: SOF: Intel: hda: fix the hda init chip
      ASoC: SOF: Intel: hda: use the defined ppcap functions

 include/sound/sof/dai.h                           |   1 +
 include/sound/sof/header.h                        |  23 ++++
 include/sound/sof/info.h                          |  20 ++--
 include/sound/sof/xtensa.h                        |   9 +-
 include/uapi/sound/sof/abi.h                      |   2 +-
 sound/hda/ext/hdac_ext_bus.c                      |   1 -
 sound/pci/hda/hda_codec.c                         |   9 +-
 sound/soc/codecs/ak4458.c                         |  18 +--
 sound/soc/codecs/cs4265.c                         |   2 +-
 sound/soc/codecs/cs42xx8.c                        |   1 +
 sound/soc/codecs/max98090.c                       |  16 +++
 sound/soc/codecs/rt274.c                          |   3 +-
 sound/soc/codecs/rt5670.c                         |  12 ++
 sound/soc/codecs/rt5677-spi.c                     |   5 +-
 sound/soc/fsl/fsl_asrc.c                          |   4 +-
 sound/soc/intel/atom/sst/sst_pvt.c                |   4 +-
 sound/soc/intel/boards/bytcht_es8316.c            |   2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c      |   2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c          |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c           |   2 +-
 sound/soc/intel/boards/sof_rt5682.c               |  11 +-
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |  17 +++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |  10 +-
 sound/soc/mediatek/Kconfig                        |   2 +-
 sound/soc/soc-core.c                              |  36 +++---
 sound/soc/soc-dapm.c                              |   7 +-
 sound/soc/soc-pcm.c                               |   3 +-
 sound/soc/sof/Kconfig                             |   8 +-
 sound/soc/sof/control.c                           |   9 +-
 sound/soc/sof/core.c                              |  29 ++++-
 sound/soc/sof/intel/bdw.c                         |  26 +++--
 sound/soc/sof/intel/byt.c                         |  25 +++--
 sound/soc/sof/intel/cnl.c                         |   4 +
 sound/soc/sof/intel/hda-ctrl.c                    | 102 +++++++++++++++--
 sound/soc/sof/intel/hda-ipc.c                     |  17 ++-
 sound/soc/sof/intel/hda.c                         | 129 ++++++------------=
----
 sound/soc/sof/ipc.c                               |  26 ++---
 sound/soc/sof/loader.c                            |   2 +
 sound/soc/sof/pcm.c                               |   8 +-
 sound/soc/sof/xtensa/core.c                       |   2 +-
 sound/soc/sunxi/sun4i-codec.c                     |   9 ++
 sound/soc/sunxi/sun4i-i2s.c                       |   6 +-
 42 files changed, 398 insertions(+), 228 deletions(-)

--Z9t8O/5YJLB6LEUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CaZsACgkQJNaLcl1U
h9AlaAgAgNRx800F60Ap1gNJeSqm9QDKq9DZReQHg9q/GTv7AoWi+kpWvTYFiqSO
8OQymP9cExmemjDRv4b2bAQZghdYp9I9lCyHJo3vlzbansNmDywe7FgAuWgEHCJ4
jL5SHK93566LPeArKwy2gntQJTr+GAPmoNvNvXGWLr664N7VU0zotjccgX8LSRla
G5WUQnj5WqV1mEuQ8Xv535UypY5gOTzr5eUrMR6QDaTdJpkSe4R1zK3WQU6JVwcB
zXOZf1IMIrooNKFo0LgtlYtJZ+TckRElXueG/Z82byz3A0PJtTypjXH/FZEKb2+b
fjbFdBJKJwXTTr1Ff0gIMOwd3bezZg==
=Fuzv
-----END PGP SIGNATURE-----

--Z9t8O/5YJLB6LEUl--

--===============6890968901394297083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6890968901394297083==--
