Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B38625B15
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 14:17:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4501670;
	Fri, 11 Nov 2022 14:16:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4501670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668172636;
	bh=T/UAyKC8Q41A88jI4T9rNcCXeri2BNDewB+KQKwtLV4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c+btQ9i8Hn9G1IZzuPUo2M2BA5WIpWn1bLC9Ol2isgIc8vVY24D7UJAeWqkQdSiBZ
	 T9Kfg5yikdJwGicSEU9+Od/juu3H3l7HgBO29nafZHJwRSPTJhDbtAzbIjMCAtdzqd
	 FYbFmR/Wzif9s+uMWlZ2g4GiDImHo3osVE0q8yak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CC6F804AB;
	Fri, 11 Nov 2022 14:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B184AF800F8; Fri, 11 Nov 2022 14:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A11F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 14:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A11F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="up0knkg5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E03A7B825FE;
 Fri, 11 Nov 2022 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E02C433C1;
 Fri, 11 Nov 2022 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668172570;
 bh=T/UAyKC8Q41A88jI4T9rNcCXeri2BNDewB+KQKwtLV4=;
 h=From:To:Cc:Subject:Date:From;
 b=up0knkg5r1HS/+z9JgIjgcGDp5Bu9emV7ggHA9nAXZj+3U/3kIgepSV38beu4w/e/
 EQoPiiWShxp5rfpLYRgp+P66ScPESvUgNUAZgScCNiAebXtzu7VhZnvjp/rKGxtWRO
 4nWpVWjr9AZaEskrPrWFeX7wEhGyKRu7TIoV3NOpQKViZlfT094BYBTELZgx7J6Msp
 6MUoaOgc0x2egYmXXMUvXwhx9k4haMrj4c/8YIkkhWYOqsT88zqA2YCPwdoJyvg9Eo
 MFsTywLrdUJDPX6xItVHD8xVrSShGIsS9p6bfVOckp+u/rj4w2gd7+bQLPISmLQxr+
 inZrhrdi3IfKw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.2-rc4
Date: Fri, 11 Nov 2022 13:15:53 +0000
Message-Id: <20221111131610.17E02C433C1@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit e9441675edc1bb8dbfadacf68aafacca60d65a25:

  ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init() (2022-10-21 13:04:14 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.2-rc4

for you to fetch changes up to 7d945b046be3d2605dbb1806e73095aadd7ae129:

  ASoC: stm32: dfsdm: manage cb buffers cleanup (2022-11-09 17:56:37 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.1

A relatively large collection of fixes and new platform quirks here,
they're all fairly minor though - the widest possible impact is the fix
to the use of prefixes on regulator names which would have broken any
device that integrates regulators with DAPM and was used in a system
where it had a name prefix assigning to it.

----------------------------------------------------------------
Brent Mendelsohn (1):
      ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table

Chen Zhongjin (2):
      ASoC: core: Fix use-after-free in snd_soc_exit()
      ASoC: soc-utils: Remove __exit for snd_soc_util_exit()

Hans de Goede (1):
      ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01

Jason Montleon (2):
      ASoC: rt5514: fix legacy dai naming
      ASoC: rt5677: fix legacy dai naming

Kai Vehmanen (1):
      ASoC: SOF: ipc3-topology: use old pipeline teardown flow with SOF2.1 and older

Maarten Zanders (1):
      ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N

Martin Povišer (3):
      ASoC: tas2770: Fix set_tdm_slot in case of single slot
      ASoC: tas2764: Fix set_tdm_slot in case of single slot
      ASoC: tas2780: Fix set_tdm_slot in case of single slot

Olivier Moysan (1):
      ASoC: stm32: dfsdm: manage cb buffers cleanup

Paul Cercueil (1):
      ASoC: dapm: Don't use prefix for regulator name

Peter Ujfalusi (1):
      ASoC: SOF: topology: No need to assign core ID if token parsing failed

Pierre-Louis Bossart (2):
      ASoC: Intel: soc-acpi: add ES83x6 support to IceLake
      ASoC: hda: intel-dsp-config: add ES83x6 quirk for IceLake

Tzung-Bi Shih (1):
      MAINTAINERS: update Tzung-Bi's email address

Zhu Ning (1):
      ASoC: sof_es8336: reduce pop noise on speaker

 .mailmap                                           |  1 +
 .../bindings/sound/google,cros-ec-codec.yaml       |  2 +-
 .../devicetree/bindings/sound/realtek,rt1015p.yaml |  2 +-
 MAINTAINERS                                        |  2 +-
 include/sound/sof/info.h                           |  4 ++
 sound/hda/intel-dsp-config.c                       |  5 ++
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++
 sound/soc/codecs/rt5514-spi.c                      | 15 +++---
 sound/soc/codecs/rt5677-spi.c                      | 19 +++----
 sound/soc/codecs/tas2764.c                         | 19 +++----
 sound/soc/codecs/tas2770.c                         | 20 +++-----
 sound/soc/codecs/tas2780.c                         | 19 +++----
 sound/soc/fsl/fsl_asrc.c                           |  2 +-
 sound/soc/fsl/fsl_esai.c                           |  2 +-
 sound/soc/fsl/fsl_sai.c                            |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c             |  7 +++
 sound/soc/intel/boards/sof_es8336.c                | 60 +++++++++++++++++-----
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  | 13 +++++
 sound/soc/soc-core.c                               | 17 +++++-
 sound/soc/soc-dapm.c                               |  2 +-
 sound/soc/soc-utils.c                              |  2 +-
 sound/soc/sof/ipc3-topology.c                      | 15 ++++--
 sound/soc/sof/topology.c                           | 20 ++++----
 sound/soc/stm/stm32_adfsdm.c                       | 11 ++++
 24 files changed, 173 insertions(+), 95 deletions(-)
