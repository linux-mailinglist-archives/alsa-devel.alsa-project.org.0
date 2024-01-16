Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 863EF82F119
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 16:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105CB207;
	Tue, 16 Jan 2024 16:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105CB207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705417894;
	bh=wKEJhNmI8fq0x2IBGNlhpVkpjq4ObQF+n+0VFjQth4U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SBDaUgKmNNtaCNaKhBbvlIYbq7UBSW8Mbgv3XmC3r4JTY2jCVpkpivClrdwJilGG2
	 zQ8dOWxHcdYpAc5TOlSnbjInhz2mtZVC7P2CKf7kbw7ZO57dPYsSB8F8l/j4up0rpW
	 bOyPeQk9JUg5DisxB/BP5MT0b+fLgNSzUCUgImf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC44F80587; Tue, 16 Jan 2024 16:11:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1357F80578;
	Tue, 16 Jan 2024 16:11:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B901F801F5; Tue, 16 Jan 2024 16:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8507F80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 16:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8507F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X/V5zol7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76DB3CE18C5;
	Tue, 16 Jan 2024 15:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BE4C433F1;
	Tue, 16 Jan 2024 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705417833;
	bh=wKEJhNmI8fq0x2IBGNlhpVkpjq4ObQF+n+0VFjQth4U=;
	h=From:To:Cc:Subject:Date:From;
	b=X/V5zol73lRaPvL8ilWQ/PIowD9wKIw8cKL73u9+qj85tflmJSszusWJI9XV8BLzZ
	 qTFz2efjtrq63KkLbsFStLoYXxQx+rTKJvd90KyPRsdtyxXsZNadQt4aJPC1D5M1sU
	 sUfFPc+Yz1S60ra9CwJGbLhvw25Wjvfozptuv+bYS0c64a/dWK+1rCcwCIjY1ZZc73
	 v2l5eWxK5d9kMKcEQ1TqZVGyNZxwk10aQt+73Uip7o9BU0SD82ZQXGgcyEHoJnhCYm
	 lmWA4oFfpSpeP+KVKfFUv64TI0xY+Fmqy1WLjpWkGfcTmCFaqyJFKckUoULnVU8JbE
	 W/uEg0ROSQN6w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-merge-window
Date: Tue, 16 Jan 2024 15:10:24 +0000
Message-Id: <20240116151032.B3BE4C433F1@smtp.kernel.org>
Message-ID-Hash: ZY4GXLSBPSOBKWE6HUXNLYKNXT6P3F2X
X-Message-ID-Hash: ZY4GXLSBPSOBKWE6HUXNLYKNXT6P3F2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZY4GXLSBPSOBKWE6HUXNLYKNXT6P3F2X/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 67508b874844b80ac49f70b78d67036c28b9fe7e:

  ASoC: pxa: sspa: Don't select SND_ARM (2023-12-29 17:41:15 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-merge-window

for you to fetch changes up to ab09fb9c629ed3aaea6a82467f08595dbc549726:

  ASoC: SOF: ipc4-loader: remove the CPC check warnings (2024-01-15 14:04:52 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

A bunch of small fixes that come in during the merge window, mainly
fixing issues from some core refactoring around dummy components that
weren't detected until things reached mainline.

The TAS driver changes are a little larger than normal for a device ID
addition due to some shuffling around of where things are registered and
DT updates but aren't really any more substantial than normal.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link
      ASoC: mediatek: sof-common: Add NULL check for normal_link string

ChiYuan Huang (2):
      ASoC: codecs: rtq9128: Fix PM_RUNTIME usage
      ASoC: codecs: rtq9128: Fix TDM enable and DAI format control flow

Kai Vehmanen (1):
      ASoC: SOF: ipc4-loader: remove the CPC check warnings

Kuninori Morimoto (1):
      ASoC: audio-graph-card2: fix index check on graph_parse_node_multi_nm()

Mark Brown (1):
      rtq9128: Fix pm runtime and TDM usage

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8192: Check existence of dai_name before dereferencing

Peter Ujfalusi (3):
      ASoC: Intel: bxt_da7219_max98357a: Fix kernel ops due to COMP_DUMMY change
      ASoC: Intel: bxt_rt298: Fix kernel ops due to COMP_DUMMY change
      ASoC: SOF: icp3-dtrace: Revert "Fix wrong kfree() usage"

Rander Wang (1):
      ASoC: SOF: ipc4-pcm: remove log message for LLP

Shenghao Ding (4):
      ASoC: dt-bindings: move tas2563 from tas2562.yaml to tas2781.yaml
      ASoC: tas2562: move tas2563 from tas2562 driver to tas2781 driver
      ASoC: tas2781: Add tas2563 into header file for DSP mode
      ASoC: tas2781: Add tas2563 into driver

 .../devicetree/bindings/sound/tas2562.yaml         |  2 -
 .../devicetree/bindings/sound/ti,tas2781.yaml      | 78 +++++++++++++++++-----
 include/sound/tas2781.h                            |  9 +--
 sound/soc/codecs/rtq9128.c                         | 73 +++++++++++---------
 sound/soc/codecs/tas2562.c                         |  3 -
 sound/soc/codecs/tas2781-i2c.c                     |  8 ++-
 sound/soc/generic/audio-graph-card2.c              |  2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |  6 ++
 sound/soc/intel/boards/bxt_rt298.c                 |  3 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     |  2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  3 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         | 33 +--------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          | 41 ++++++++----
 sound/soc/sof/ipc3-dtrace.c                        |  3 +-
 sound/soc/sof/ipc4-loader.c                        | 11 ++-
 sound/soc/sof/ipc4-pcm.c                           |  4 +-
 16 files changed, 161 insertions(+), 120 deletions(-)
