Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E9CD07F1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Dec 2025 16:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A17B601AF;
	Fri, 19 Dec 2025 16:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A17B601AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766158036;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s5T4dvhtetXft0XOV4n0p6SyigAOZw8v5KSCioUQ12Ia5/GRr2k8vdIKvO5TqE8A0
	 pdj2blHHPqbonhUzl6wspKrondDKcEIzMKgIKk7l4OXrNy9uowtDzWuC0112yvnZuw
	 dQbTGlT8IAjKsGmQGZ/5FZ1n5wV1PlJyJVdp/TfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28FFF805E2; Fri, 19 Dec 2025 16:26:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEDCF805CB;
	Fri, 19 Dec 2025 16:26:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9680F805C2; Fri, 19 Dec 2025 16:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F614F80423
	for <alsa-devel@alsa-project.org>; Fri, 19 Dec 2025 16:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F614F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nyX7FEpw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C51B435DC;
	Fri, 19 Dec 2025 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743EC113D0;
	Fri, 19 Dec 2025 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766157931;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:From;
	b=nyX7FEpwkg7JE399N61Ilfq3PAB+7QFOoeShUwdERSdxBhVb15FaMW9sB3gSZFIJY
	 iJt9GuMPHKPLfgA09dHvDHpKzWJ9rZ7wePL2NpiuIPbbOlck8EnUcWMob4k4Afqu/p
	 zEfAKXSGNncb/EH8X1c31cvi/ri/19aNwKQIxSFypXkWfwOl47hIIyWck9C5YEGQVo
	 DPtbiIIqGOb9D7tf7gwNO0gyoLvU9RaVcHcwnLM1I17aW5Um5hS6IhejbwQnKb7N8e
	 vFyMMoBigZI/KPDgwlaa7iZWoJdc6TwTKM5gaUQF4fBCDYfkaUQ64IIr/+hN50e2aL
	 jJAmRZ3DpTEdQ==
Message-ID: <00e012c86db2f59544afb66176c25978@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc1
Date: Fri, 19 Dec 2025 15:25:22 +0000
Message-ID-Hash: NT3UCQM3TJT7WEVQOLPBHYFD6CRG4SW7
X-Message-ID-Hash: NT3UCQM3TJT7WEVQOLPBHYFD6CRG4SW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NT3UCQM3TJT7WEVQOLPBHYFD6CRG4SW7/>
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
