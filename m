Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5FB1CA70
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Aug 2025 19:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4EA601BC;
	Wed,  6 Aug 2025 19:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4EA601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754500546;
	bh=72AVAJ87rVtXseew9hAgk98phf0ztd1QJ80ILDYTB4Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uB30wgUy1BCJhoKnY6blgGqAaXWttLKYpq2IA7eiThcRzfd71jNz6ckApe2LG0aMO
	 yQjPXg9D5Zc76rSKdBtXfog0Oi/635uujl4ofMyeFFX4DiDaCHs8TaO+G2Rgc/KXTW
	 NDuZuKyQY1xVR+WSqprY9THNNoZXYdVucTsyNTXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 064CBF805C3; Wed,  6 Aug 2025 19:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 595FDF805CA;
	Wed,  6 Aug 2025 19:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B38F80423; Wed,  6 Aug 2025 19:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E36F80134
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 19:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E36F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AE5iPxkS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88BC9601DC;
	Wed,  6 Aug 2025 17:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36C1C4CEE7;
	Wed,  6 Aug 2025 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500490;
	bh=72AVAJ87rVtXseew9hAgk98phf0ztd1QJ80ILDYTB4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=AE5iPxkSwCPkPGCYLseEkh5RJxNxyCZAi6wt+xx6hyF1wiGFUK/4meiOCBeRzV3Yh
	 oYzQevZcR8KwT7rOtU2PzigMsZnr9oFaa8cHv8NSRj+B4r36qmw1rdNDIykOt4v4E0
	 L8yDEyxAvNTCnMufgXat9vjGs/cWAT1AFSRrrM2xhnqypYlGuXindiXk/W31owl0ri
	 CIUWui+cgtfw5l8Ij0mCHxl/d8Uhjr69Zfxe2XF305IJZ8fxNk+Psm30v6TUm8JgX5
	 SCrsOCWY/sZdyQyufktVRMZpAqhRhgb/o+9jkk+UCZiYcnoq93ssk/OornPwUBVOkm
	 zunjuiiRIj+jA==
Message-ID: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-merge-window
Date: Wed, 06 Aug 2025 18:14:43 +0100
Message-ID-Hash: DK4R77SBY52525PNK466DORDUN53XHXR
X-Message-ID-Hash: DK4R77SBY52525PNK466DORDUN53XHXR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DK4R77SBY52525PNK466DORDUN53XHXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit e95122a32e777309412e30dc638dbc88b9036811:

  ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-merge-window

for you to fetch changes up to 614d416dd8aee2675fb591c598308a901a660db8:

  ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies (2025-08-06 12:02:32 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

This is a relatively small set of fixes and device quirks that came in
during the merge window, the AMD changes adding support for ACP 7.2
systems are all just adding IDs for the devices rather than any
substantial code - the actual code is the same as for prior versions of
the platform.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies

Baojun Xu (1):
      ASoC: tas2781: Fix the wrong step for TLV on tas2781

Cezary Rojewski (1):
      ASoC: Intel: avs: Fix uninitialized pointer error in probe()

Mark Brown (1):
      Add audio support for acp7.2 platform

Muhammad Usama Anjum (1):
      ASoC: SOF: amd: acp-loader: Use GFP_KERNEL for DMA allocations in resume context

Peter Jakubek (1):
      ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCC SKU

Shengjiu Wang (1):
      ASoC: wm8962: Clear master mode when enter runtime suspend

Venkata Prasad Potturu (4):
      ASoC: SOF: amd: Add sof audio support for acp7.2 platform
      ASoC: amd: ps: Add SoundWire pci and dma driver support for acp7.2 platform
      ASoC: amd: acp: Add SoundWire legacy machine driver support for acp7.2 platform
      ASoC: amd: acp: Add SoundWire SOF machine driver support for acp7.2 platform

 include/sound/tas2781-tlv.h             |  2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  3 +++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  1 +
 sound/soc/amd/acp/soc_amd_sdw_common.h  |  2 ++
 sound/soc/amd/ps/acp63.h                |  1 +
 sound/soc/amd/ps/pci-ps.c               |  4 ++++
 sound/soc/amd/ps/ps-sdw-dma.c           |  5 +++++
 sound/soc/codecs/wm8962.c               | 11 +++++++++++
 sound/soc/intel/avs/core.c              |  3 ++-
 sound/soc/intel/boards/sof_sdw.c        |  8 ++++++++
 sound/soc/sof/amd/acp-loader.c          |  6 +++---
 sound/soc/sof/amd/acp.c                 |  8 ++++++++
 sound/soc/sof/amd/acp.h                 |  1 +
 sound/soc/sof/amd/pci-acp70.c           |  1 +
 sound/soc/sof/intel/Kconfig             |  3 ++-
 15 files changed, 53 insertions(+), 6 deletions(-)
