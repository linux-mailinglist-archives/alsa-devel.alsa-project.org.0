Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F85CD38A8
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Dec 2025 23:59:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B144C60206;
	Sat, 20 Dec 2025 23:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B144C60206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766271541;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sn/22K+YwLZ6VTB2KIb4B47eA5CZ8cKtJK7r0CgggPzV3gLAocFZ/wCABh9ZYnRp+
	 XsPz5+Hs67nztwgYPlD5NKmXEOsVHwAu9S9d4VHiwvfISHm+ZweWlTvJiPG3nCFfyM
	 t2szqEuCwFgr1N54KHus+bipelro+MQPrKWi5jhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65E1F80579; Sat, 20 Dec 2025 23:58:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 483A0F805D8;
	Sat, 20 Dec 2025 23:58:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEFDCF804D6; Sat, 20 Dec 2025 23:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CDE5F80171
	for <alsa-devel@alsa-project.org>; Sat, 20 Dec 2025 23:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CDE5F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Do6HH5c0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C3260053;
	Sat, 20 Dec 2025 22:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D761C4CEF5;
	Sat, 20 Dec 2025 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766271480;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:From;
	b=Do6HH5c0QWYitZLtSX3srYlmB3d0h6ClRkgb6CjTRmAg0jbJmARjOeGcAqN7OtqLa
	 OJQV0IQhBynNdV9oF1EtskzIuC/umvXRfbO/btSk59AZHGaI/GjBm/xzoM1lOsQrlC
	 FMOvC6W0u6pedDn3uS82sk08ulxhViYc4RBsd9Q04CS5Rc1+HyllqEhH0hXbPGkmEq
	 GCmJdA1Qk+s5tVSpwo05EyDOsmUOIVSzLSQrVAU8xI9zClS4374zqv8aB60WDNhfx+
	 ny3uKrN9eWsoMSgJHyTyzXhSr4uCobki+XjsKoKSLxBx9QKa46NFkkdDWXGppPA8hn
	 YAxK1xWXLSReQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D29B21AC56B2; Sun, 21 Dec 2025 07:57:55 +0900 (JST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc1
Date: Sat, 20 Dec 2025 22:57:55 +0000
Message-Id: <20251220225755.D29B21AC56B2@finisterre.sirena.org.uk>
Message-ID-Hash: 7HDPSLF6JO3O3IZIPB2ZGU5VP7635AAR
X-Message-ID-Hash: 7HDPSLF6JO3O3IZIPB2ZGU5VP7635AAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HDPSLF6JO3O3IZIPB2ZGU5VP7635AAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc1

for you to fetch changes up to 56d953a8d0da5e53c2594edde23465ec49385b1c:

  ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

We've been quite busy with fixes since the merge window, though not in
any particularly exciting ways - the standout thing is the fix for _SX
controls which were broken by a change to how we do clamping, otherwise
it's all fairly run of the mill fixes and quirks.

----------------------------------------------------------------
Alexander Stein (4):
      ASoC: fsl_easrc: fix duplicate debugfs directory error
      ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      ASoC: fsl_sai: Add missing registers to cache default
      ASoC: fsl_xcvr: provide regmap names

Andrew Elantsev (1):
      ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025

Bard Liao (2):
      ASoC: sdw_utils: subtract the endpoint that is not present
      ASoC: SOF: ipc4-topology: set playback channel mask

Chancel Liu (2):
      ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties

Mark Brown (4):
      ASoC: Intel: common / SOF: Use function topologies for
      ASoC: SOF: ipc4-topology: fixes for 'exotic' format
      ASoC: fsl_easrc: Fix duplicate debufs entries
      ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Prefer 32-bit DMIC blobs for 8-bit formats as well
      ASoC: SOF: ipc4-topology: Convert FLOAT to S32 during blob selection
      ASoC: SOF: topology: Add context when sink or source widget is missing
      ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
      ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
      ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table

Robert Oscilowski (1):
      ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format

Shengjiu Wang (1):
      ASoC: ak4458: remove the reset operation in probe and remove

Shuming Fan (1):
      ASoC: rt1320: update VC blind write settings

Stefan Binding (3):
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
      ASoC: ops: fix snd_soc_get_volsw for sx controls

sheetal (1):
      ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub

 include/sound/soc-acpi.h                           |   5 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   7 ++
 sound/soc/codecs/ak4458.c                          |   4 -
 sound/soc/codecs/rt1320-sdw.c                      |  16 ++--
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   3 +
 sound/soc/fsl/fsl_easrc.c                          |   3 +
 sound/soc/fsl/fsl_sai.c                            |  13 ++-
 sound/soc/fsl/fsl_xcvr.c                           |   3 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 104 +++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  49 ----------
 sound/soc/intel/common/sof-function-topology-lib.c |   5 +-
 sound/soc/intel/common/sof-function-topology-lib.h |   2 +-
 sound/soc/qcom/sdm845.c                            |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   8 +-
 sound/soc/soc-ops.c                                |  32 ++++---
 sound/soc/sof/intel/pci-mtl.c                      |   6 +-
 sound/soc/sof/ipc4-topology.c                      |  49 ++++++----
 sound/soc/sof/topology.c                           |  26 +++++-
 sound/soc/tegra/tegra210_ahub.c                    |   6 +-
 20 files changed, 238 insertions(+), 113 deletions(-)
