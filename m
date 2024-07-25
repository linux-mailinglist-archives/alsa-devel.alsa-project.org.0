Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D093C6DB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 17:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14398E94;
	Thu, 25 Jul 2024 17:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14398E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721922938;
	bh=CEFS3y2ARfoljBxSEWUakvIAtqfu4sOEJCS8rv3g30Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ElnVBsv0tVyckqilmbbMKZG65g9eKY8XUeBZXWKP7tKXXuvuVoYuyMv+KEZaWLDJQ
	 95QW2EMn+LRH+vC/RoTRfmNaAnfqrxZGz5mmpTEDxh4GqiwCqvFhV4gjU0KtBJDOfK
	 VlbxaOKRHWFeGKuqMkELThttoiLYidQApY5kuLLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C636F805AA; Thu, 25 Jul 2024 17:55:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C18FDF805B1;
	Thu, 25 Jul 2024 17:55:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE5AF8026D; Thu, 25 Jul 2024 17:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67061F800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 17:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67061F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stOv/rEQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A8A45CE0AFD;
	Thu, 25 Jul 2024 15:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368ECC116B1;
	Thu, 25 Jul 2024 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721922893;
	bh=CEFS3y2ARfoljBxSEWUakvIAtqfu4sOEJCS8rv3g30Y=;
	h=From:To:Cc:Subject:Date:From;
	b=stOv/rEQaWkDQHsTaS208xhG28+vNoKH8gnGBrMB8Vlmr0uS5eCH0f0oqRXiIlGSr
	 Vq45DNfZjfA/9X1AkK5+quyASM6F0YodIW7u1D7oPhEUZO6V1Il9HQ1zCg7hMGo45Q
	 zxAnQEKVcL/CavYuNYKI+BInAi/KPfiZUL0RjFlnCQ8IwojU+ixSu4GdQFXrjMmlWw
	 P4JMSqfgGzSl6d7IRlop/0sBvmSCq8wECu5zmA2Li0qSgP8xddAlImk8MaBMXR6Cmx
	 FknV+vVdmYTOBrum0RrI7hZkyMdlHOVSY66glJOWlJBGwpKMflG7N6/HW8dnSXKtWX
	 FwQJA/vPfHNYg==
Message-ID: <5a2e9c948bd527794d6e05160e201744.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.11-merge-window
Date: Thu, 25 Jul 2024 16:54:44 +0100
Message-ID-Hash: DOUP3QO65RD74MCDFRPMY3O4ZH3KVB3S
X-Message-ID-Hash: DOUP3QO65RD74MCDFRPMY3O4ZH3KVB3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOUP3QO65RD74MCDFRPMY3O4ZH3KVB3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c51cba4755609ad97ba97713210c16f043c73224:

  Fix the unbalanced pm_runtime_enable in wcd937x-sdw (2024-07-12 17:38:18 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-merge-window

for you to fetch changes up to ab53dfdcdd1ec8df8729890aefa5b0e3c900afbb:

  ASoC: fsl-asoc-card: Dynamically allocate memory for snd_soc_dai_link_components (2024-07-25 14:20:30 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.11

A selection of routine fixes and quirks that came in since the merge
window.  The fsl-asoc-card change is a fix for systems with multiple
cards where updating templates in place leaks data from one card to
another.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: tegra: select CONFIG_SND_SIMPLE_CARD_UTILS

Curtis Malainey (1):
      ASoC: Intel: Fix RT5650 SSP lookup

Dan Carpenter (1):
      ASoC: TAS2781: Fix tasdev_load_calibrated_data()

Daniel Baluta (1):
      ASoC: SOF: imx8m: Fix DSP control regmap retrieval

Peter Ujfalusi (2):
      ASoC: SOF: ipc4-topology: Only handle dai_config with HW_PARAMS for ChainDMA
      ASoC: SOF: ipc4-topology: Preserve the DMA Link ID for ChainDMA on unprepare

Pierre-Louis Bossart (2):
      ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for IPC4 devices
      ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable

Shengjiu Wang (1):
      ASoC: fsl-asoc-card: Dynamically allocate memory for snd_soc_dai_link_components

Takashi Iwai (1):
      ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen 2

Venkata Prasad Potturu (1):
      ASoC: sof: amd: fix for firmware reload failure in Vangogh platform

 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++
 sound/soc/codecs/tas2781-fmwlib.c                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c                      | 46 ++++++++++++++--------
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c |  9 +++++
 sound/soc/intel/common/soc-intel-quirks.h          |  2 +-
 sound/soc/sof/amd/pci-vangogh.c                    |  1 -
 sound/soc/sof/imx/imx8m.c                          |  2 +-
 sound/soc/sof/intel/hda-loader.c                   | 20 ++++++----
 sound/soc/sof/intel/hda.c                          | 17 ++++----
 sound/soc/sof/ipc4-topology.c                      | 18 +++++++--
 sound/soc/tegra/Kconfig                            |  1 +
 11 files changed, 85 insertions(+), 40 deletions(-)
