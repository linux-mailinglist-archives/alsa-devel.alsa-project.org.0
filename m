Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C305899106
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 00:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E0B2CEA;
	Fri,  5 Apr 2024 00:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E0B2CEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712268578;
	bh=KIPXXQnRcEH3SLDhnU5Lo93GXULzI86V1PpY8NSofag=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o+5JUcBped6yh7IRNow6sLE4YGPK3iLRzqb5ftpgAbnXK7vdL69ArMz89foHAPVrC
	 nctH1qVt1E5M5Uh0Z3HH64ScMbtif/rzPYuP4eT1+RCNmDhJsN63u50emR7FAeavKO
	 b2Vc8xxYecWf8egtCYqp4bBVp8qnSlyfN0GFNGhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 182B5F805A1; Fri,  5 Apr 2024 00:09:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE03BF805A1;
	Fri,  5 Apr 2024 00:09:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A6FF8020D; Fri,  5 Apr 2024 00:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03B3DF80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 00:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B3DF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lIzx7ssL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 485F3616FE;
	Thu,  4 Apr 2024 22:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95599C433C7;
	Thu,  4 Apr 2024 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712268444;
	bh=KIPXXQnRcEH3SLDhnU5Lo93GXULzI86V1PpY8NSofag=;
	h=From:To:Cc:Subject:Date:From;
	b=lIzx7ssLWiJ9jU04nM0zaoDx+Rz+y1vHPjP3BiG+PsFWxTx7mQhYSt23YC5ikGgx/
	 4PgShO0MnBaxNdVvIh8UI2XrDIrAjvOzup84YqmPmfo00FBqFc5rC/UwJi9IrI6aJ0
	 4H8LZIg+gvbFr46JmpLGDd7mr4TCLunf//y4bJk5ItRY7zrfxELonXVJHkVDpjQWSQ
	 +BuilQqj3NgW3l93X0v8LgNgNEDxHqh3izHVle1LhGjYClV6y3PAN9fTgK8R+OLrmB
	 XAgBL9qd7kfzBYexoKFT1eyEWuCEGjzNR4ahtfpIz0ebhwBJD9OyVs3uSN05K/+eB4
	 Cm8BFd3bXnnfQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.9-rc2
Date: Thu, 04 Apr 2024 23:07:13 +0100
Message-Id: <20240404220723.95599C433C7@smtp.kernel.org>
Message-ID-Hash: MGJYE5MYDR4V3RDZWRDVSKYYAHAPFM5E
X-Message-ID-Hash: MGJYE5MYDR4V3RDZWRDVSKYYAHAPFM5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGJYE5MYDR4V3RDZWRDVSKYYAHAPFM5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc2

for you to fetch changes up to 90f8917e7a15f6dd508779048bdf00ce119b6ca0:

  ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path (2024-04-04 19:51:51 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.9

A relatively large set of fixes here, the biggest piece of it is a
series correcting some problems with the delay reporting for Intel SOF
cards but there's a bunch of other things.  Everything here is driver
specific except for a fix in the core for an issue with sign extension
handling volume controls.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: boards: Add modules description

Chaitanya Kumar Borah (1):
      ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path

Charles Keepax (1):
      ASoC: cs42l43: Correct extraction of data pointer in suspend/resume

Mark Brown (4):
      ASoC: SOF: ipc4/Intel: Fix delay reporting
      ASoC: rt-sdw: fix locking and improve error logs
      ASoC: codecs: ES8326: solve some hp issues and
      ASoC: Merge up left over v6.8 fix

Peter Ujfalusi (19):
      ASoC: SOF: Add dsp_max_burst_size_in_ms member to snd_sof_pcm_stream
      ASoC: SOF: ipc4-topology: Save the DMA maximum burst size for PCMs
      ASoC: SOF: Intel: hda-pcm: Use dsp_max_burst_size_in_ms to place constraint
      ASoC: SOF: Intel: hda: Implement get_stream_position (Linear Link Position)
      ASoC: SOF: Intel: mtl/lnl: Use the generic get_stream_position callback
      ASoC: SOF: Introduce a new callback pair to be used for PCM delay reporting
      ASoC: SOF: Intel: Set the dai/host get frame/byte counter callbacks
      ASoC: SOF: ipc4-pcm: Use the snd_sof_pcm_get_dai_frame_counter() for pcm_delay
      ASoC: SOF: Intel: hda-common-ops: Do not set the get_stream_position callback
      ASoC: SOF: Remove the get_stream_position callback
      ASoC: SOF: ipc4-pcm: Move struct sof_ipc4_timestamp_info definition locally
      ASoC: SOF: ipc4-pcm: Combine the SOF_IPC4_PIPE_PAUSED cases in pcm_trigger
      ASoC: SOF: ipc4-pcm: Invalidate the stream_start_offset in PAUSED state
      ASoC: SOF: sof-pcm: Add pointer callback to sof_ipc_pcm_ops
      ASoC: SOF: ipc4-pcm: Correct the delay calculation
      ALSA: hda: Add pplcllpl/u members to hdac_ext_stream
      ASoC: SOF: Intel: hda: Compensate LLP in case it is not reset
      ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE platforms in case of S3 suspend
      ASoC: SOF: Intel: lnl: Disable DMIC/SSP offload on remove

Pierre-Louis Bossart (6):
      ASoC: rt5682-sdw: fix locking sequence
      ASoC: rt711-sdca: fix locking sequence
      ASoC: rt711-sdw: fix locking sequence
      ASoC: rt712-sdca-sdw: fix locking sequence
      ASoC: rt722-sdca-sdw: fix locking sequence
      ASoC: rt-sdw*: add __func__ to all error logs

Rander Wang (1):
      ASoC: SOF: mtrace: rework mtrace timestamp setting

Richard Fitzgerald (1):
      ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()

Simon Trimmer (1):
      ASoC: cs-amp-lib: Check for no firmware controls when writing calibration

Stephen Lee (1):
      ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw

Vijendar Mukunda (3):
      ASoC: amd: acp: fix for acp pdm configuration check
      ASoC: amd: acp: fix for acp_init function error handling
      ASoC: SOF: amd: fix for false dsp interrupts

Zhang Yi (4):
      ASoC: codecs: ES8326: Solve error interruption issue
      ASoC: codecs: ES8326: modify clock table
      ASoC: codecs: ES8326: Solve a headphone detection issue after suspend and resume
      ASoC: codecs: ES8326: Removing the control of ADC_SCALE

 include/sound/hdaudio_ext.h            |   3 +
 sound/soc/amd/acp/acp-pci.c            |  13 +--
 sound/soc/codecs/cs-amp-lib.c          |   5 +
 sound/soc/codecs/cs42l43.c             |  12 ++-
 sound/soc/codecs/es8326.c              |  37 ++++---
 sound/soc/codecs/es8326.h              |   2 +-
 sound/soc/codecs/rt1316-sdw.c          |   8 +-
 sound/soc/codecs/rt1318-sdw.c          |   8 +-
 sound/soc/codecs/rt5682-sdw.c          |  16 +--
 sound/soc/codecs/rt700.c               |  16 +--
 sound/soc/codecs/rt711-sdca-sdw.c      |   6 +-
 sound/soc/codecs/rt711-sdca.c          |  18 ++--
 sound/soc/codecs/rt711-sdw.c           |   8 +-
 sound/soc/codecs/rt711.c               |  16 +--
 sound/soc/codecs/rt712-sdca-dmic.c     |  24 +++--
 sound/soc/codecs/rt712-sdca-sdw.c      |   7 +-
 sound/soc/codecs/rt712-sdca.c          |  20 ++--
 sound/soc/codecs/rt715-sdca-sdw.c      |   2 +-
 sound/soc/codecs/rt715-sdca.c          |  46 ++++----
 sound/soc/codecs/rt715-sdw.c           |   4 +-
 sound/soc/codecs/rt715.c               |  24 ++---
 sound/soc/codecs/rt722-sdca-sdw.c      |   4 +-
 sound/soc/codecs/rt722-sdca.c          |  21 ++--
 sound/soc/codecs/wm_adsp.c             |   3 +-
 sound/soc/intel/avs/boards/da7219.c    |   1 +
 sound/soc/intel/avs/boards/dmic.c      |   1 +
 sound/soc/intel/avs/boards/es8336.c    |   1 +
 sound/soc/intel/avs/boards/i2s_test.c  |   1 +
 sound/soc/intel/avs/boards/max98357a.c |   1 +
 sound/soc/intel/avs/boards/max98373.c  |   1 +
 sound/soc/intel/avs/boards/max98927.c  |   1 +
 sound/soc/intel/avs/boards/nau8825.c   |   1 +
 sound/soc/intel/avs/boards/probe.c     |   1 +
 sound/soc/intel/avs/boards/rt274.c     |   1 +
 sound/soc/intel/avs/boards/rt286.c     |   1 +
 sound/soc/intel/avs/boards/rt298.c     |   1 +
 sound/soc/intel/avs/boards/rt5514.c    |   1 +
 sound/soc/intel/avs/boards/rt5663.c    |   1 +
 sound/soc/intel/avs/boards/rt5682.c    |   1 +
 sound/soc/intel/avs/boards/ssm4567.c   |   1 +
 sound/soc/soc-ops.c                    |   2 +-
 sound/soc/sof/amd/acp.c                |   8 +-
 sound/soc/sof/core.c                   |  14 +--
 sound/soc/sof/intel/hda-common-ops.c   |   3 +
 sound/soc/sof/intel/hda-dai-ops.c      |  11 ++
 sound/soc/sof/intel/hda-dsp.c          |  20 +++-
 sound/soc/sof/intel/hda-pcm.c          |  29 +++++
 sound/soc/sof/intel/hda-stream.c       |  70 ++++++++++++
 sound/soc/sof/intel/hda.h              |   6 ++
 sound/soc/sof/intel/lnl.c              |  34 ++++--
 sound/soc/sof/intel/mtl.c              |  14 ---
 sound/soc/sof/intel/mtl.h              |  10 --
 sound/soc/sof/ipc4-mtrace.c            |  11 +-
 sound/soc/sof/ipc4-pcm.c               | 191 ++++++++++++++++++++++++++-------
 sound/soc/sof/ipc4-priv.h              |  14 ---
 sound/soc/sof/ipc4-topology.c          |  22 +++-
 sound/soc/sof/ops.h                    |  24 ++++-
 sound/soc/sof/pcm.c                    |   8 ++
 sound/soc/sof/sof-audio.h              |   9 +-
 sound/soc/sof/sof-priv.h               |  24 +++--
 60 files changed, 596 insertions(+), 267 deletions(-)
