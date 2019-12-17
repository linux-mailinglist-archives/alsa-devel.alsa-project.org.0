Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5F122AE6
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:06:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8851616;
	Tue, 17 Dec 2019 13:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8851616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576584383;
	bh=nFXs6Mc9gDAKK4uiRdh/i549qjTBoWrZyxruqedMhU0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s/urnPAgiY6BRhPqEARa6MvSNQrf8VkSfdf6JdEsa5MqKCBkKiaSxSmJ+rGyv6gx8
	 YSPEEpMbVwl9CWDjVz/osPM0EmjmQG2Pntlg5IF/OuinhFhZY2t57cFUWyRFhH/2ln
	 h8Zww+Fxfmdm7toJEp6cn7OmofmW1zEMyC0zkrnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED17BF8020B;
	Tue, 17 Dec 2019 13:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E9EF80234; Tue, 17 Dec 2019 13:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 77FC2F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77FC2F80100
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA2931B;
 Tue, 17 Dec 2019 04:04:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491973F6CF;
 Tue, 17 Dec 2019 04:04:30 -0800 (PST)
Date: Tue, 17 Dec 2019 12:04:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191217120428.GB4755@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Thufir's a Harkonnen now.
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
Content-Type: multipart/mixed; boundary="===============0284935209800855056=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0284935209800855056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 39870b0dec68ed7dd814beb697e541670975c7d8:

  ASoC: DMI long name - avoid to add board name if matches with product name (2019-11-22 19:54:50 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.5-rc2

for you to fetch changes up to 556672d75ff486e0b6786056da624131679e0576:

  ASoC: wm8962: fix lambda value (2019-12-16 11:47:28 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.5

A collection of fixes since the merge window, mostly driver specific but
there's a few in the core that clean up fallout from the refactorings
done in the last cycle.

----------------------------------------------------------------
Amery Song (1):
      ASoC: Intel: common: work-around incorrect ACPI HID for CML boards

Curtis Malainey (3):
      ASoC: core: Init pcm runtime work early to avoid warnings
      ASoC: core: only flush inited work during free
      ASoC: SOF: Intel: split cht and byt debug window sizes

Daniel Baluta (2):
      ASoC: SOF: topology: Fix unload for SAI/ESAI
      ASoC: simple-card: Don't create separate link when platform is present

Dragos Tarcatu (2):
      ASoC: topology: Check return value for snd_soc_add_dai_link()
      ASoC: topology: Check return value for soc_tplg_pcm_create()

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Update quirk for Teclast X89

Karol Trzcinski (2):
      ASoC: SOF: loader: snd_sof_fw_parse_ext_data log warning on unknown header
      ASoC: SOF: loader: fix snd_sof_fw_parse_ext_data

Keyon Jie (1):
      ASoC: SOF: Intel: BYT: fix a copy/paste mistake in byt_dump()

Michael Walle (1):
      ASoC: wm8904: fix automatic sysclk configuration

Shengjiu Wang (1):
      ASoC: wm8962: fix lambda value

Shuming Fan (1):
      ASoC: rt5682: fix i2c arbitration lost issue

Tzung-Bi Shih (3):
      ASoC: max98090: remove msleep in PLL unlocked workaround
      ASoC: max98090: exit workaround earlier if PLL is locked
      ASoC: max98090: fix possible race conditions

Yu-Hsuan Hsu (1):
      ASoC: AMD: Enable clk in startup intead of hw_params

YueHaibing (2):
      ASoC: rt5677: Fix build error without CONFIG_SPI
      ASoC: Intel: sst: Add missing include <linux/io.h>

 include/sound/soc.h                               |  1 +
 sound/soc/amd/acp-da7219-max98357a.c              | 46 +++++++----------------
 sound/soc/codecs/max98090.c                       | 30 ++++++++++-----
 sound/soc/codecs/max98090.h                       |  1 -
 sound/soc/codecs/rt5677-spi.h                     | 16 ++++++++
 sound/soc/codecs/rt5682.c                         |  2 +
 sound/soc/codecs/wm8904.c                         |  6 +++
 sound/soc/codecs/wm8962.c                         |  4 +-
 sound/soc/generic/simple-card.c                   |  6 +++
 sound/soc/intel/atom/sst/sst.c                    |  1 +
 sound/soc/intel/boards/bytcr_rt5640.c             |  8 +++-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 41 +++++++++++---------
 sound/soc/soc-compress.c                          |  6 +--
 sound/soc/soc-core.c                              | 13 ++++++-
 sound/soc/soc-pcm.c                               | 11 ++----
 sound/soc/soc-topology.c                          | 27 +++++++++----
 sound/soc/sof/intel/byt.c                         | 25 ++++++------
 sound/soc/sof/loader.c                            |  7 +++-
 sound/soc/sof/topology.c                          |  4 +-
 19 files changed, 158 insertions(+), 97 deletions(-)

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl34xEsACgkQJNaLcl1U
h9Bn+gf+I3pXl/BSINgmKoXSzf52xvHxryo9+Ej8yCkOOjOwM0gUJCUB3q6x6VPa
Ue5Fqtbc/MQ3PQeVqqvw9S1gB/g0lD4cuHdlslwJSRMemIfNQkf0dzUoNsd0CObZ
ZtV8Tzr9l/wffBWSNQFM1EFV20oKKIG5e567QBVZo0/M0oYCsshAo3jPsHFUCezk
xIK0r9MRnZ9qBQAHDADP3Y3ACIVcisa4LXn923jqZUV2IwUEhHHyBDqWm8y6xgpA
/FEEK8NGneoWmFIv4roUQ9xVMq5+wb9DkZfgREn5ymKuLzaNf6Yy9SBGqRA7jIDb
I9Kt5WOtKQc7f510Zo0OkDVCYK6fMQ==
=jAy6
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============0284935209800855056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0284935209800855056==--
