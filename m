Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3523D1528
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 711FA16E8;
	Wed, 21 Jul 2021 19:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 711FA16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626888902;
	bh=9Q3z39/f+olMlFJh4OasylYhGdTP8ZpspcUOZ+zErL4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y89aTB6rFTGOf9d8pNVRORu5HNKaJRmlH3nO5+1yPit2FcioZcIbx6nqe8UW6KlGG
	 tyqbNhv/R+jdI18Allr1UwHGTYxdrb40SJf1uEbpih2Nsxb7uh2BpbxuanMkYMRUWs
	 gG8tUOLgaZBD7rbJwc4gLo4U4uRUCQKYhzcQ5HmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D45DAF804AD;
	Wed, 21 Jul 2021 19:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F59FF804AC; Wed, 21 Jul 2021 19:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFF0F800FD
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFF0F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UyW39+9Q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 447D06023B;
 Wed, 21 Jul 2021 17:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626888798;
 bh=9Q3z39/f+olMlFJh4OasylYhGdTP8ZpspcUOZ+zErL4=;
 h=From:To:Cc:Subject:Date:From;
 b=UyW39+9Qz0gmd1EtIBELQoI52WHS4Us1kE7tfVlB7SF2b8coODBfV2qYZ7W/yDYn6
 ojJ0qVkuNr9ztYexUw06e3pVXiK+MXzrIrBCJMPPTzKbkVFKgwkMBpxDaEwEC+LRId
 s8NECyH8pmZ9KB5l0sxdyYxTTvUCb18PA6stv1IckwcVHvdlA5MbYaGYroLCzL9jda
 6/7Y87Fpmxi1Aggayt7HSBLUFZZHdxVPaOI58UIf0d3MltZ+ZuEeseV4LlnxiO5Hu2
 wLXNa+n1mzBRz6pkGsYV1jckbb5uwsUps4Nup/DKg8kBSvUQWe1KbNibRAPPVsREmm
 IG2PLXN8S304A==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.14-rc2
Date: Wed, 21 Jul 2021 18:32:57 +0100
Message-Id: <20210721173318.447D06023B@mail.kernel.org>
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

The following changes since commit 6a7f5bd6185e1c86256d5e52c3bb7a4d390d6e19:

  ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as volatile and readable (2021-06-24 19:29:53 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.14-rc2

for you to fetch changes up to 82d28b67f780910f816fe1cfb0f676fc38c4cbb3:

  ASoC: ti: j721e-evm: Check for not initialized parent_clk_id (2021-07-19 12:58:42 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.14

A collection of fixes for ASoC that have come in since the merge window,
all driver specific.  There is a new core feature added for reversing
the order of operations when shutting down, this is needed to fix a bug
with the AMD Stonyridge platform, and we also tweak the Kconfig to make
the SSM2518 driver user selectable so it can be used with generic cards
but that requires no actual code changes.

----------------------------------------------------------------
Charles Keepax (2):
      ASoC: wm_adsp: Correct wm_coeff_tlv_get handling
      ASoC: wm_adsp: Add CCM_CORE_RESET to Halo start core

Kyle Russell (1):
      ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits

Lucas Stach (1):
      ASoC: codecs: allow SSM2518 to be selected by the user

Marek Vasut (1):
      ASoC: tlv320aic32x4: Fix TAS2505 volume controls

Mark Brown (3):
      Merge series "ASoC: Intel: machine driver corrections" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
      ASoC: tlv320aic31xx: Make regmap cache only on probe()
      Merge series "arm64: tegra: Enable audio IOMMU support on Tegra194" from Thierry Reding <thierry.reding@gmail.com> Thierry Reding <treding@nvidia.com>:

Maxim Schwalm (1):
      ASoC: rt5631: Fix regcache sync errors on resume

Oder Chiou (1):
      ASoC: rt5682: Fix the issue of garbled recording after powerd_dbus_suspend

Peter Robinson (1):
      ASoC: remove zte zx dangling kconfig

Peter Ujfalusi (2):
      ASoC: ti: j721e-evm: Fix unbalanced domain activity tracking during startup
      ASoC: ti: j721e-evm: Check for not initialized parent_clk_id

Rander Wang (1):
      ASoC: Intel: boards: fix xrun issue on platform with max98373

Rob Herring (1):
      ASoC: dt-bindings: renesas: rsnd: Fix incorrect 'port' regex schema

Sathya Prakash M R (1):
      ASoC: SOF: Intel: Update ADL descriptor to use ACPI power states

Srinivas Kandagatla (2):
      ASoC: codecs: wcd938x: make sdw dependency explicit in Kconfig
      ASoC: codecs: wcd938x: setup irq during component bind

Thierry Reding (1):
      ASoC: tegra: Use ADMAIF component for DMA allocations

Vijendar Mukunda (2):
      ASoC: soc-pcm: add a flag to reverse the stop sequence
      ASoC: amd: reverse stop sequence for stoneyridge platform

 .../devicetree/bindings/sound/renesas,rsnd.yaml    |  2 +-
 include/sound/soc.h                                |  6 ++
 sound/soc/amd/acp-da7219-max98357a.c               |  5 ++
 sound/soc/codecs/Kconfig                           |  8 +--
 sound/soc/codecs/rt5631.c                          |  2 +
 sound/soc/codecs/rt5682.c                          |  8 ++-
 sound/soc/codecs/tlv320aic31xx.c                   |  2 +
 sound/soc/codecs/tlv320aic31xx.h                   |  4 +-
 sound/soc/codecs/tlv320aic32x4.c                   | 27 ++++----
 sound/soc/codecs/wcd938x.c                         | 18 ++---
 sound/soc/codecs/wm_adsp.c                         |  6 +-
 sound/soc/intel/boards/sof_sdw_max98373.c          | 81 ++++++++++++++--------
 sound/soc/soc-pcm.c                                | 22 ++++--
 sound/soc/sof/intel/pci-tgl.c                      |  1 +
 sound/soc/tegra/tegra_pcm.c                        | 30 ++++----
 sound/soc/ti/j721e-evm.c                           | 18 +++--
 16 files changed, 152 insertions(+), 88 deletions(-)
