Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681196E5A1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 00:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65BAB65;
	Fri,  6 Sep 2024 00:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65BAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725574197;
	bh=6kNlnheKdMstyM4OfoA/4QxBGUSDvvEf9bzCFXyO7Rw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DU8JnSJI2AK4fNhUdF9PP35voNOI+oAU5aKnF99z327ffS2yRXUPe9+kixmmsR68n
	 qYBkGDghmZWK5jk6DQgR87g1ZEGpBgjSqj/MqvDFeXfTTBinprEWb8wmZrAvNVn6d2
	 JTT9mwBUI5TFrSaIggmfnyvvYGJn/1aUrpCXxsDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE767F805B3; Fri,  6 Sep 2024 00:09:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F362F805AF;
	Fri,  6 Sep 2024 00:09:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151FDF8016C; Fri,  6 Sep 2024 00:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10FF7F80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 00:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10FF7F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jUqMbX7b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D82AB5C5818;
	Thu,  5 Sep 2024 22:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B1DC4CEC3;
	Thu,  5 Sep 2024 22:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725574158;
	bh=6kNlnheKdMstyM4OfoA/4QxBGUSDvvEf9bzCFXyO7Rw=;
	h=From:To:Cc:Subject:Date:From;
	b=jUqMbX7bGKKxSJa+dfiAN/dBsdgqSBXc3MkqfxMxgOMx78wd1+OpB2qlLL4BxIAqN
	 TMAY0Q9rFNiiNYvHSEd9KpgBZMgLlfKyhkvwHbuM6SeAcNs8BAJ1fZh2kZ4D7qoF1+
	 e9eppnC4vfTiGRgPLmVD/NpXHR0KGYWz1Ml6BPtDww+mCuD4OvEe6JgwwpecXpikp2
	 Vibjgbo2erp71kwupPVnHe8ZgJHQqb0TUbQUBCZDzG6QO5cg7akdwror8DT/sVUxO2
	 Is7sEuMWFhzf1smHs/8DwJ0lX6o48n8HuL8YAmT1CEaJBMeEd8Xnygk2GUyYitk6K2
	 7mqV9PCscg0hw==
Message-ID: <47c362275f856d07f7c24f59f4309399.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.11-rc6
Date: Thu, 05 Sep 2024 23:09:10 +0100
Message-ID-Hash: 5MTNSUPMD7U4FOFD42FM56NOUK2FNMHJ
X-Message-ID-Hash: 5MTNSUPMD7U4FOFD42FM56NOUK2FNMHJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MTNSUPMD7U4FOFD42FM56NOUK2FNMHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit bb4485562f5907708f1c218b5d70dce04165d1e1:

  ASoC: cs-amp-lib: Ignore empty UEFI calibration entries (2024-08-22 17:52:26 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc6

for you to fetch changes up to 77212f300bfd6fb3edaabd1daf863cabb521854a:

  ASoC: codecs: lpass-va-macro: set the default codec version for sm8250 (2024-08-30 13:54:24 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.11

A larger set of fixes than I'd like at this point, but mainly due to
people working on fixing module autoloading by adding missing exports of
ID tables rather than anything particularly concerning.  There are some
other runtime fixes and quirks, and a tweak to the ABI definition for
SOF which ensures that a struct layout doesn't vary depending on the
architecture of the host.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      ASoc: SOF: topology: Clear SOF link platform name upon unload

Hans de Goede (2):
      ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards harder
      ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Laurentiu Mihalcea (1):
      ASoC: SOF: ipc: replace "enum sof_comp_type" field with "uint32_t"

Liao Chen (4):
      ASoC: intel: fix module autoloading
      ASoC: google: fix module autoloading
      ASoC: tda7419: fix module autoloading
      ASoC: fix module autoloading

Mark Brown (1):
      ASoC: fix module autoloading

Markuss Broks (1):
      ASoC: amd: yc: Add a quirk for MSI Bravo 17 (D7VEK)

Matteo Martelli (1):
      ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode

Mohan Kumar (1):
      ASoC: tegra: Fix CBB error during probe()

Srinivas Kandagatla (1):
      ASoC: codecs: lpass-va-macro: set the default codec version for sm8250

Zhang Yi (1):
      ASoC: mediatek: mt8188-mt6359: Modify key

robelin (1):
      ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object

 include/sound/sof/topology.h                      |   2 +-
 include/uapi/sound/sof/abi.h                      |   2 +-
 sound/soc/amd/yc/acp6x-mach.c                     |   7 ++
 sound/soc/codecs/chv3-codec.c                     |   1 +
 sound/soc/codecs/lpass-va-macro.c                 |  11 +-
 sound/soc/codecs/tda7419.c                        |   1 +
 sound/soc/google/chv3-i2s.c                       |   1 +
 sound/soc/intel/boards/bxt_rt298.c                |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c           |   2 +-
 sound/soc/intel/boards/bytcht_da7213.c            |   2 +-
 sound/soc/intel/boards/bytcht_es8316.c            |   2 +-
 sound/soc/intel/boards/bytcr_rt5640.c             |   2 +-
 sound/soc/intel/boards/bytcr_rt5651.c             |   2 +-
 sound/soc/intel/boards/bytcr_wm5102.c             |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c           |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c           |   2 +-
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |   1 -
 sound/soc/intel/keembay/kmb_platform.c            |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c         |  17 ++-
 sound/soc/soc-dapm.c                              |   1 +
 sound/soc/sof/topology.c                          |   2 +
 sound/soc/sunxi/sun4i-i2s.c                       | 143 +++++++++++-----------
 sound/soc/tegra/tegra210_ahub.c                   |  10 +-
 23 files changed, 127 insertions(+), 91 deletions(-)
