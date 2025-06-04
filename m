Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D3ACDC91
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 13:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DAE601E5;
	Wed,  4 Jun 2025 13:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DAE601E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749036722;
	bh=ZX0ItmnNbojzBHBC/dcRzu7609Te3f708c0QQ3pKAfI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i6ikwVnz1PKK/7HneD24Wf4Xzk94tkWvp3W1UtWv7gx29umTDVcygotvwQT67qY1d
	 h5iK6AtCsCS/Y5X2f4atbq5LaLI8+vq4YQdZ7rkdTB9ez6zl5ve6UI3jo1BLA2gHhv
	 026mtpHKRSnu3NyGuY1D73ZwWlpr3Df6yRk35dCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20F65F805B3; Wed,  4 Jun 2025 13:31:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14567F804F3;
	Wed,  4 Jun 2025 13:31:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA0DF8028B; Wed,  4 Jun 2025 13:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39BB3F800FA
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 13:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BB3F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r9E3WoDp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C879D614AE;
	Wed,  4 Jun 2025 11:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2424FC4CEE7;
	Wed,  4 Jun 2025 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036679;
	bh=ZX0ItmnNbojzBHBC/dcRzu7609Te3f708c0QQ3pKAfI=;
	h=From:To:Cc:Subject:Date:From;
	b=r9E3WoDp2CmCGjuSRqydrA1olIUkEOXP1FHFYujZXfDuZjFd7MfQP18sPaM5dCieo
	 u5DnE1ew8CuxGHG2fKvW/SjZ6yJWlikphZmkh29HCk011ZDR9TSDW5m+BXrUgL2u8C
	 oVhGAWSFEuqgBUbCuzQoZLVzjVyYetpkzzJij+qXMc0o6zMISxkTWZ0zXTmyzD3CF7
	 8D5vR4u0fW5rd8Yuc5bdapqwElp+mU2oXAYt9rmogTo4xCivsbqaEbyZccLDOno9/l
	 mnATWBH7OwFoV4Qn8gAAblDCJWvl4bhjNcxmcWyHyYcSPPuqT+qXwUzTWzMQ3f+hEK
	 j5ZBB4Dg5QILg==
Message-ID: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-merge-window
Date: Wed, 04 Jun 2025 12:31:09 +0100
Message-ID-Hash: MOAIFBX6O5SKTOXMDXUF47QJFHQJFMLI
X-Message-ID-Hash: MOAIFBX6O5SKTOXMDXUF47QJFHQJFMLI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOAIFBX6O5SKTOXMDXUF47QJFHQJFMLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 43a38a0ff8c63ee156d997cd13063c63cd55d812:

  ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-merge-window

for you to fetch changes up to b7188a1c0d2d7b04f4558e10293651d49fcb2398:

  ASoC: Intel: avs: boards: Fix rt5663 front end name (2025-06-03 17:04:32 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A bunch of fixes, including a big batch for the Intel AVS driver, and
one new device ID.  It's all device specific.

----------------------------------------------------------------
Amadeusz Sławiński (2):
      ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
      ASoC: Intel: avs: boards: Fix rt5663 front end name

Bram Vlerick (2):
      ASoC: tas571x: add separate tas5733 controls
      ASoC: tas571x: fix tas5733 num_controls

Cezary Rojewski (9):
      ASoC: codecs: hda: Fix RPM usage count underflow
      ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
      ASoC: Intel: avs: Fix PPLCxFMT calculation
      ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
      ASoC: Intel: avs: Verify kcalloc() status when setting constraints
      ASoC: Intel: avs: Verify content returned by parse_int_array()
      ASoC: Intel: avs: Include missing string.h
      ASoC: pcm: Do not open FEs with no BEs connected
      ASoC: Intel: avs: Simplify verification of parse_int_array() result

Jaroslav Kysela (2):
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (wmfw info)
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (ctl cache)

Krzysztof Kozlowski (3):
      ASoC: codecs: wcd9335: Fix missing free of regulator supplies
      ASoC: codecs: wcd937x: Drop unused buck_supply
      ASoC: codecs: wcd9375: Fix double free of regulator supplies

Mark Brown (2):
      ASoC: codecs: wcd93xx: Few regulator supplies fixes
      ASoC: Intel: avs: Set of functional fixes

Qasim Ijaz (1):
      ASoC: codecs: fix out-of-bounds access on invalid clock config

Shuming Fan (1):
      ASoC: rt1320: fix speaker noise when volume bar is 100%

Yuuki NAGAO (1):
      ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init

meowmeowbeanz (1):
      ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8

 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |  3 +-
 .../cirrus/test/cs_dsp_test_control_cache.c        |  1 -
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++
 sound/soc/codecs/es8375.c                          |  1 +
 sound/soc/codecs/hda.c                             |  4 +-
 sound/soc/codecs/rt1320-sdw.c                      | 17 +++++-
 sound/soc/codecs/tas571x.c                         | 67 +++++++++++++++++++++-
 sound/soc/codecs/tas571x.h                         | 34 +++++++++++
 sound/soc/codecs/wcd9335.c                         | 25 +++-----
 sound/soc/codecs/wcd937x.c                         |  7 +--
 sound/soc/intel/avs/board_selection.c              |  2 +-
 sound/soc/intel/avs/boards/rt5663.c                |  2 +-
 sound/soc/intel/avs/core.c                         | 20 +++----
 sound/soc/intel/avs/debugfs.c                      | 12 ++--
 sound/soc/intel/avs/ipc.c                          |  4 +-
 sound/soc/intel/avs/loader.c                       |  1 +
 sound/soc/intel/avs/path.c                         |  2 +
 sound/soc/intel/avs/pcm.c                          | 13 ++---
 sound/soc/soc-pcm.c                                | 23 ++++----
 sound/soc/ti/omap-hdmi.c                           |  7 ++-
 20 files changed, 184 insertions(+), 68 deletions(-)
