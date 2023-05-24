Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091370F3DA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 12:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2112206;
	Wed, 24 May 2023 12:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2112206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684923231;
	bh=O8UrvfhF05oMP4rTCxwswVceXQtIlEgkHc/gyTVe/yI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gpYpEvo+wMqNRJ3YTAcpM2hTqmKMkqmz2UZJMGaf8/A86GYaIdRprV+LAktYyyA7/
	 wX2fpd5OY8EqqzhnOoEznr/ZkFLMGSBkQrYwifXIaAsyjagcC88/U/DgljFHwc2PJL
	 6FouuWAHsz0HFUhP2mbB/L9Z2o/9NbTA70ijH+zA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5CFF80544; Wed, 24 May 2023 12:13:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2701EF80249;
	Wed, 24 May 2023 12:13:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20AD0F8024E; Wed, 24 May 2023 12:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDF19F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 12:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF19F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YW8+9DAp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CD5E60AE3;
	Wed, 24 May 2023 10:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8EBC433EF;
	Wed, 24 May 2023 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684923170;
	bh=O8UrvfhF05oMP4rTCxwswVceXQtIlEgkHc/gyTVe/yI=;
	h=From:To:Cc:Subject:Date:From;
	b=YW8+9DApVyjdNuGSSQvKyN8T778wRmNjxqq5M/WHUzrv6DUTDfMiR9+1FvXM8yBxA
	 u9OLuDIBON0FUQI1b3UdaVdsXYJlmkjslTNzVVdvGFozE4fX5df3600MxKBJIDJz39
	 SINU6WFKFggjD2JY6t0YdQGFHG2zIAmWOV65FLfFEhzBHE7GIB2aKRObOse0Zp6L8I
	 iWd3Sw3bGX3MXR08A8UlunivRc6sieITOcp5+6/Y+8EgXvDfVz38QZ8w3jYa23Hbsg
	 MH20YwMxOPUzvmkMSsntOFXZGp1leLM3blVP50wMlwT4KwW48n7KVLbNnrC46EfLaE
	 mjHIwEnCpizyg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.4-rc3
Date: Wed, 24 May 2023 11:12:40 +0100
Message-Id: <20230524101250.1D8EBC433EF@smtp.kernel.org>
Message-ID-Hash: 3PJSNQ5ZMABJBASNAXRDXB33SASW45FI
X-Message-ID-Hash: 3PJSNQ5ZMABJBASNAXRDXB33SASW45FI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PJSNQ5ZMABJBASNAXRDXB33SASW45FI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 9be0b3a0074a61df1c94c37faea35ec8b9ea130b:

  ASoC: SOF: Intel: hda-mlink: fixes and extensions (2023-05-16 00:13:09 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.4-rc3

for you to fetch changes up to 011a8719d6105dcb48077ea7a6a88ac019d4aa50:

  ASoC: dwc: move DMA init to snd_soc_dai_driver probe() (2023-05-23 21:39:30 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.4

A collection of fixes for v6.4, mostly driver specific but there's also
one fix for DPCM to avoid incorrectly repeated calls to prepare() which
can trigger issues on some systems.

----------------------------------------------------------------
Amadeusz Sławiński (4):
      ASoC: Intel: avs: Fix module lookup
      ASoC: Intel: avs: Access path components under lock
      ASoC: Intel: avs: Fix avs_path_module::instance_id size
      ASoC: Intel: avs: Add missing checks on FE startup

Cezary Rojewski (3):
      ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
      ASoC: Intel: avs: Fix declaration of enum avs_channel_config
      ASoC: Intel: avs: Account for UID of ACPI device

David Epping (1):
      ASoC: dt-bindings: tlv320aic32x4: Fix supply names

Mark Brown (1):
      ASoC: Intel: Fixes

Matthias Kaehlcke (1):
      ASoC: rt5682: Disable jack detection interrupt during suspend

Maxim Kochetkov (1):
      ASoC: dwc: move DMA init to snd_soc_dai_driver probe()

Ranjani Sridharan (1):
      ASoC: soc-pcm: test if a BE can be prepared

Ravulapati Vishnu Vardhan Rao (1):
      ASoC: lpass: Fix for KASAN use_after_free out of bounds

Stefan Binding (1):
      ASoC: cs35l41: Fix default regmap values for some registers

 .../devicetree/bindings/sound/tlv320aic32x4.txt    |  2 +-
 include/sound/soc-acpi.h                           |  1 +
 include/sound/soc-dpcm.h                           |  4 +++
 include/uapi/sound/skl-tplg-interface.h            |  3 +-
 sound/soc/codecs/cs35l41-lib.c                     |  6 ++--
 sound/soc/codecs/lpass-tx-macro.c                  |  5 +++
 sound/soc/codecs/rt5682-i2c.c                      |  4 ++-
 sound/soc/codecs/rt5682.c                          |  6 ++++
 sound/soc/codecs/rt5682.h                          |  1 +
 sound/soc/dwc/dwc-i2s.c                            | 41 +++++-----------------
 sound/soc/intel/avs/apl.c                          |  6 +++-
 sound/soc/intel/avs/avs.h                          |  4 +--
 sound/soc/intel/avs/board_selection.c              |  2 +-
 sound/soc/intel/avs/control.c                      | 22 ++++++++----
 sound/soc/intel/avs/dsp.c                          |  4 +--
 sound/soc/intel/avs/messages.h                     |  2 +-
 sound/soc/intel/avs/path.h                         |  2 +-
 sound/soc/intel/avs/pcm.c                          | 23 +++++++++---
 sound/soc/intel/avs/probes.c                       |  2 +-
 sound/soc/soc-pcm.c                                | 20 +++++++++++
 20 files changed, 101 insertions(+), 59 deletions(-)
