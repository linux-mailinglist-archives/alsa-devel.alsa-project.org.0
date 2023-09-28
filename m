Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D17B1E12
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 15:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D1EDF3;
	Thu, 28 Sep 2023 15:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D1EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695907416;
	bh=7+U9RPh4/2aJTevbvyq1l+9yFq3+VAEfrkvWMH8+KUg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ADwaXGxa/I1QmNMbtbmkOJW/5VEV59dwaDrt5J1ng7Lp44j3AhPXZTlftvDjOvozu
	 dCfljOsS6v1DCCSZdIcoRNuJzlB5eOSfdjHnSkSoW1JrB36XzIMxrqadxvQeuDoFAO
	 88R0KfAenm7ntaaHvEcT0F7qGZ4/Oz/IiUTMC+Z0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3F70F80130; Thu, 28 Sep 2023 15:22:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68FD7F80552;
	Thu, 28 Sep 2023 15:22:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A277F80553; Thu, 28 Sep 2023 15:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A4C6F80551
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 15:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4C6F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QPYoE1EO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63FEDCE1F43;
	Thu, 28 Sep 2023 13:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C7FC433C9;
	Thu, 28 Sep 2023 13:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907352;
	bh=7+U9RPh4/2aJTevbvyq1l+9yFq3+VAEfrkvWMH8+KUg=;
	h=From:To:Cc:Subject:Date:From;
	b=QPYoE1EOVj9zGvXE4rPZihqysnSaqNWKLTOO6vaqv6eOMG1yZNOjTnHh8FNonQSS3
	 54FkKEsP4as4ez7nzvbOf9aWNar63l0n5HTJp2Zkpyd2kK64Jjv58xvF52BjmngavR
	 Dkj9KKPlK8TUDb9xXcA0VGu1Ggl9id7oOhqAi3H/pPq5SxiCpLHnnfjHl1IQiWFw+u
	 MC/Y2WkAUBZdp3+XxEMeGiFZNxcb63Nt3s5iH9oS5v/lCElLRFOiQsnziar1WcgXhZ
	 d2DdPzyGu/bVfer14QcyGUJEuGnMqc6s+WqDFgEogRcPrPPi+VsiQe8JGAKZVTvUwC
	 n8ELJWmg9f/4g==
Message-ID: <1f6247152e1aadc016657d6836ef03c8.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.6-rc4
Date: Thu, 28 Sep 2023 15:22:25 +0200
Message-ID-Hash: UPDE6TQ2NB27OZB2LSBSYNPZATR4AXED
X-Message-ID-Hash: UPDE6TQ2NB27OZB2LSBSYNPZATR4AXED
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPDE6TQ2NB27OZB2LSBSYNPZATR4AXED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 31bb7bd9ffee50d09ec931998b823a86132ab807:

  ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful (2023-09-15 17:14:22 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.6-rc4

for you to fetch changes up to 7e1fe5d9e7eae67e218f878195d1d348d01f9af7:

  ASoC: SOF: amd: fix for firmware reload failure after playback (2023-09-27 11:08:05 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.6

There's quite a lot of changes here, but a lot of them are simple quirks
or device IDs rather than actual fixes.  The fixes that are here are all
quite device specific and relatively minor.

----------------------------------------------------------------
Alex Bee (1):
      dt-bindings: ASoC: rockchip: Add compatible for RK3128 spdif

Balamurugan C (2):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL match table

Kuninori Morimoto (2):
      ASoC: simple-card-utils: fixup simple_util_startup() error handling
      ASoC: simple-card: fixup asoc_simple_probe() error handling

Mark Brown (1):
      ASoC: Intel: soc-acpi: Adding Es83x6 codec entry and

Miquel Raynal (1):
      ASoC: soc-generic-dmaengine-pcm: Fix function name in comment

Pierre-Louis Bossart (2):
      ASoC: Intel: soc-acpi: fix Dell SKU 0B34
      ASoC: Intel: sof_sdw: add support for SKU 0B14

Shengjiu Wang (2):
      ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
      ASoC: fsl-asoc-card: use integer type for fll_id and pll_id

Vijendar Mukunda (1):
      ASoC: SOF: amd: fix for firmware reload failure after playback

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 sound/soc/fsl/fsl-asoc-card.c                      | 12 +++++++----
 sound/soc/fsl/fsl_sai.c                            |  9 ++++++--
 sound/soc/generic/simple-card-utils.c              |  3 ++-
 sound/soc/generic/simple-card.c                    |  6 ++++--
 sound/soc/intel/boards/sof_es8336.c                | 10 +++++++++
 sound/soc/intel/boards/sof_sdw.c                   | 10 +++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c  | 12 +++++------
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 25 ++++++++++++++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c              |  4 ++--
 sound/soc/sof/amd/pci-rmb.c                        |  1 -
 11 files changed, 75 insertions(+), 18 deletions(-)
