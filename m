Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8F84600F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 19:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6F6C7F8;
	Thu,  1 Feb 2024 19:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6F6C7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706812611;
	bh=C0yNRGIp1otmg9jJOWV9de74Al2ZwJuL3xZnKTS9vR8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NXaUD/qxdQKo+Urg8kQaWUmJQ8iQWMpADGJfRbJOkgt+LsgI4a9lA4s+G5i+p9NVZ
	 wFtubmaXM1Mnn/6vQl0CUu973XtBDnCsnf3qL8pt1x3IA9wFRDdCfyNbLSDtH8JYsk
	 vS06RJI8f0bWrBbKK9rpp+Mzv9d4wOSagPuTgOxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 363A4F80564; Thu,  1 Feb 2024 19:36:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C181F805A1;
	Thu,  1 Feb 2024 19:36:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE83F8055C; Thu,  1 Feb 2024 19:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF06CF804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 19:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF06CF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lhSWNtjH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C479620A0;
	Thu,  1 Feb 2024 18:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66010C433C7;
	Thu,  1 Feb 2024 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706812548;
	bh=C0yNRGIp1otmg9jJOWV9de74Al2ZwJuL3xZnKTS9vR8=;
	h=From:To:Cc:Subject:Date:From;
	b=lhSWNtjHFBFqkGJ3jVUcqLzq/YvPK+/+m1UBkmDd/hqS3hVByDI+s68WJvnMxeIaH
	 R+1LQBgQIaR4ePl61prsdCagu2+cQQIoj0G/Cz2JvAbWEWTb/oZzcWPE8sCR1T/xMt
	 msHI9IsFpjnHyUnuO3pEngpXY7I9+KDTh4/CV+v5hluddK0dGiVLnDtkbjBV8rRX57
	 Z+cPVd0zHJ9Q5AZ3EtJ+uF2w8U/eG/b9gAyfh3Z7r4BDhYYjurNwCCUomFqQW8lJ2N
	 TIm/EGuOXFiCzaNoTNvsfs0OnBUt/8MHs/41vSmLVlIkC1qeQeXYBs38ip/7x+l8wF
	 N9KYoDEfDYHzA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-rc2-2
Date: Thu, 01 Feb 2024 18:35:41 +0000
Message-Id: <20240201183548.66010C433C7@smtp.kernel.org>
Message-ID-Hash: NNVH36APT3AUY36B66DAA4LMLIIH77KN
X-Message-ID-Hash: NNVH36APT3AUY36B66DAA4LMLIIH77KN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNVH36APT3AUY36B66DAA4LMLIIH77KN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc2-2

for you to fetch changes up to e81fdba0208666b65bafeaba814874b4d6e5edde:

  ALSA: Various fixes for Cirrus Logic CS35L56 support (2024-02-01 17:45:32 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

This pull request adds Richard Fitzgerald's series with extensive fixes
for the CS35L56, he said:

    These patches fix various things that were undocumented, unknown or
    uncertain when the original driver code was written. And also a few
    things that were just bugs.

----------------------------------------------------------------
Chen-Yu Tsai (3):
      ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
      ASoC: sun4i-spdif: Fix requirements for H6
      ASoC: sun4i-spdif: Add Allwinner H616 compatible

Fei Shao (1):
      ASoC: codecs: ES8326: Remove executable bit

Johan Hovold (5):
      ASoC: codecs: wsa883x: fix PA volume control
      ASoC: codecs: lpass-wsa-macro: fix compander volume hack
      ASoC: codecs: wcd9335: drop unused gain hack remnant
      ASoC: codecs: wcd938x: fix headphones volume controls
      ASoC: qcom: sc8280xp: limit speaker volumes

Krzysztof Kozlowski (4):
      ASoC: codecs: wcd938x: handle deferred probe
      ASoC: codecs: wcd938x: skip printing deferred probe failuers
      ASoC: codecs: wcd934x: drop unneeded regulator include
      ASoC: allow up to eight CPU/codec DAIs

Marian Postevca (1):
      ASoC: amd: acp: Fix support for a Huawei Matebook laptop

Mark Brown (4):
      ASoC: codecs: fix ES8326 performance and pop noise
      ASoC: qcom: volume fixes and codec cleanups
      arm64: sun50i-h616: Add DMA and SPDIF controllers
      ALSA: Various fixes for Cirrus Logic CS35L56 support

Richard Fitzgerald (18):
      ASoC: wm_adsp: Fix firmware file search order
      ASoC: wm_adsp: Don't overwrite fwf_name with the default
      ASoC: cs35l56: cs35l56_component_remove() must clear cs35l56->component
      ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
      ASoC: cs35l56: Don't add the same register patch multiple times
      ASoC: cs35l56: Remove buggy checks from cs35l56_is_fw_reload_needed()
      ASoC: cs35l56: Fix to ensure ASP1 registers match cache
      ASoC: cs35l56: Fix default SDW TX mixer registers
      ALSA: hda: cs35l56: Initialize all ASP1 registers
      ASoC: cs35l56: Fix for initializing ASP1 mixer registers
      ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon revision
      ASoC: cs35l56: Firmware file must match the version of preloaded firmware
      ASoC: cs35l56: Load tunings for the correct speaker models
      ASoC: cs35l56: Allow more time for firmware to boot
      ALSA: hda: cs35l56: Fix order of searching for firmware files
      ALSA: hda: cs35l56: Fix filename string field layout
      ALSA: hda: cs35l56: Firmware file must match the version of preloaded firmware
      ALSA: hda: cs35l56: Remove unused test stub function

Techno Mooney (1):
      ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VF

Venkata Prasad Potturu (3):
      ASoC: amd: acp: Enable rt5682s clocks in acp slave mode
      ASoC: amd: acp: Update platform name for different boards
      ASoC: amd: acp: Add check for cpu dai link initialization

Zhu Ning (4):
      ASoC: codecs: ES8326: improving crosstalk performance
      ASoC: codecs: ES8326: Improving the THD+N performance
      ASoC: codecs: ES8326: Minimize the pop noise on headphone
      ASoC: codecs: ES8326: fix the capture noise issue

 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |   5 +-
 include/sound/cs35l56.h                            |   7 +-
 sound/pci/hda/cs35l56_hda.c                        | 136 ++++++----
 sound/soc/amd/acp/acp-mach-common.c                |  16 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   4 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   8 +
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/cs35l56-shared.c                  | 140 ++++++++--
 sound/soc/codecs/cs35l56.c                         | 301 ++++++++++++++++++---
 sound/soc/codecs/cs35l56.h                         |   2 +
 sound/soc/codecs/es8326.c                          | 186 +++++++++----
 sound/soc/codecs/es8326.h                          |   3 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   7 -
 sound/soc/codecs/wcd9335.c                         |   4 -
 sound/soc/codecs/wcd934x.c                         |   1 -
 sound/soc/codecs/wcd938x.c                         |   8 +-
 sound/soc/codecs/wm_adsp.c                         |  73 +++--
 sound/soc/codecs/wsa883x.c                         |   6 +-
 sound/soc/qcom/sc8280xp.c                          |  12 +-
 sound/soc/soc-core.c                               |   5 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   5 +
 21 files changed, 696 insertions(+), 240 deletions(-)
 mode change 100755 => 100644 sound/soc/codecs/es8326.c
