Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4F8B8BB0
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 16:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709DDDFA;
	Wed,  1 May 2024 16:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709DDDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714572526;
	bh=1lHhAkh2+81GNHwtJ7H8m4duLXBzlPpuTBcE0BfXUME=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GJ4dSRCivh6a3b00yLvR/8eh/12wVkgRBIGbUK2YU2IramhESUBvAdSEpUvql1YX0
	 buKP4QjtSNaeiTpqWkh2M2McbN5MUl9VsiSNr5C9OHEijw9WtSclQGlqHBK0qWYZ4k
	 s7KGNr2lNyg1eF2XCS2aeCcR/yLSsWwJQSeIdlhM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A57DF8003A; Wed,  1 May 2024 16:08:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1741F8059F;
	Wed,  1 May 2024 16:08:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01DA6F80266; Wed,  1 May 2024 16:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04C15F800E2
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 16:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C15F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BatBGdta
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 353C76179B;
	Wed,  1 May 2024 14:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA7C072AA;
	Wed,  1 May 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714572478;
	bh=1lHhAkh2+81GNHwtJ7H8m4duLXBzlPpuTBcE0BfXUME=;
	h=From:To:Cc:Subject:Date:From;
	b=BatBGdtaxTpiH28obslvYvDBqYDwJ1MMXI3DbKhqJ+G35am6/SxI7epeTy6rb276H
	 cy3YVaiQny+SgC50zeiyHxwtA7338mtCWQO365IkL2ZfUxEiKeUkyBst26SDps/u/M
	 GPQOhoBiHgVAKpCTDkJvdk0m5tohzaNC53GbBSajTZuGdL3q71I2X95z/dnODSVZIg
	 /Zagba7fxDt/EZhh/ggLNb5xhik+cwsKOf6CVmskuTYA3nr4PHQAY59TKPScN4kQlJ
	 +eh/c6vKiZXz+29O9tq0mJ5JjTGsZfL7HH6XDWPta/6zug+mdlhhLZBhOR7/9re9WV
	 nCfrsuSozOWpg==
Message-ID: <549018ebcc16eaa42ffac7fdc865feb8.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.9-rc6
Date: Wed, 01 May 2024 23:07:49 +0900
Message-ID-Hash: BM5CHTJOQACAA3TC4N4YYWFQ7N2WIYHM
X-Message-ID-Hash: BM5CHTJOQACAA3TC4N4YYWFQ7N2WIYHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BM5CHTJOQACAA3TC4N4YYWFQ7N2WIYHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-rc6

for you to fetch changes up to c5782bb5468acf86d8ca8e161267e8d055fb4161:

  ASoC: meson: tdm fixes (2024-04-30 23:36:23 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.9

This is much larger than is ideal, partly due to your holiday but also
due to several vendors having come in with relatively large fixes at
similar times.  It's all driver specific stuff.

The meson fixes from Jerome fix some rare timing issues with blocking
operations happening in triggers, plus the continuous clock support
which fixes clocking for some platforms.  The SOF series from Peter
builds to the fix to avoid spurious resets of ChainDMA which triggered
errors in cleanup paths with both PulseAudio and PipeWire, and there's
also some simple new debugfs files from Pierre which make support a lot
eaiser.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: Set name of control as in topology

Cezary Rojewski (1):
      ASoC: Intel: avs: Fix debug window description

Derek Fang (2):
      ASoC: rt5645: Fix the electric noise due to the CBJ contacts floating
      ASoC: dt-bindings: rt5645: add cbj sleeve gpio property

Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to Asus T100TAM too

Jack Yu (4):
      ASoC: rt722-sdca: modify channel number to support 4 channels
      ASoC: rt722-sdca: add headset microphone vrefo setting
      ASoC: rt715: add vendor clear control register
      ASoC: rt715-sdca: volume step modification

Jerome Brunet (5):
      ASoC: meson: axg-fifo: use threaded irq to check periods
      ASoC: meson: axg-card: make links nonatomic
      ASoC: meson: axg-tdm-interface: manage formatters in trigger
      ASoC: meson: axg-tdm: add continuous clock support
      ASoC: meson: cards: select SND_DYNAMIC_MINORS

Joao Paulo Goncalves (1):
      ASoC: ti: davinci-mcasp: Fix race condition during probe

Mark Brown (4):
      ASoC: SOF: misc fixes
      ASoC: SOF: ipc4-pcm: Do not reset ChainDMA if it is
      ASoC: cs35l56: Fixes to handling of ASP1 config
      ASoC: meson: tdm fixes

Peter Ujfalusi (5):
      ASoC: SOF: ipc4-pcm: Use consistent name for snd_sof_pcm_stream pointer
      ASoC: SOF: ipc4-pcm: Use consistent name for sof_ipc4_timestamp_info pointer
      ASoC: SOF: ipc4-pcm: Introduce generic sof_ipc4_pcm_stream_priv
      ASoC: SOF: ipc4-pcm: Do not reset the ChainDMA if it has not been allocated
      ASoC: SOF: Core: Handle error returned by sof_select_ipc_and_paths

Pierre-Louis Bossart (4):
      ASoC: SOF: Intel: add default firmware library path for LNL
      ASoC: SOF: debug: show firmware/topology prefix/names
      ASoC: da7219-aad: fix usage of device_get_named_child_node()
      ASoC: cs35l56: fix usages of device_get_named_child_node()

Ranjani Sridharan (1):
      ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3

Richard Fitzgerald (4):
      regmap: Add regmap_read_bypassed()
      ALSA: hda: cs35l56: Exit cache-only after cs35l56_wait_for_firmware_boot()
      ASoC: cs35l56: Fix unintended bus access while resetting amp
      ASoC: cs35l56: Prevent overwriting firmware ASP config

Sameer Pujar (1):
      ASoC: tegra: Fix DSPK 16-bit playback

Simon Trimmer (1):
      ASoC: cs35l56: Avoid static analysis warning of uninitialised variable

Srinivas Kandagatla (1):
      ASoC: codecs: wsa881x: set clk_stop_mode1 flag

Stefan Binding (1):
      ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config

end.to.start (1):
      ASoC: acp: Support microphone from device Acer 315-24p

 Documentation/devicetree/bindings/sound/rt5645.txt |   6 ++
 drivers/base/regmap/regmap.c                       |  37 +++++++
 include/linux/regmap.h                             |   8 ++
 include/sound/cs35l56.h                            |   2 +
 sound/pci/hda/cs35l56_hda.c                        |   4 +
 sound/soc/amd/yc/acp6x-mach.c                      |   7 ++
 sound/soc/codecs/cs35l41.c                         |  26 +++--
 sound/soc/codecs/cs35l56-sdw.c                     |   2 -
 sound/soc/codecs/cs35l56-shared.c                  |  85 +++++++++------
 sound/soc/codecs/cs35l56.c                         |  39 ++++++-
 sound/soc/codecs/da7219-aad.c                      |   6 +-
 sound/soc/codecs/rt5645.c                          |  25 +++++
 sound/soc/codecs/rt715-sdca.c                      |   8 +-
 sound/soc/codecs/rt715-sdw.c                       |   1 +
 sound/soc/codecs/rt722-sdca.c                      |  27 +++--
 sound/soc/codecs/rt722-sdca.h                      |   3 +
 sound/soc/codecs/wsa881x.c                         |   1 +
 sound/soc/intel/avs/icl.c                          |   2 +-
 sound/soc/intel/avs/topology.c                     |   2 +
 sound/soc/intel/boards/bytcr_rt5640.c              |  14 +--
 sound/soc/meson/Kconfig                            |   1 +
 sound/soc/meson/axg-card.c                         |   1 +
 sound/soc/meson/axg-fifo.c                         |  29 ++++--
 sound/soc/meson/axg-tdm-formatter.c                |  40 +++++++
 sound/soc/meson/axg-tdm-interface.c                |  38 +++++--
 sound/soc/meson/axg-tdm.h                          |   5 +
 sound/soc/sof/core.c                               |   4 +-
 sound/soc/sof/debug.c                              |  18 ++++
 sound/soc/sof/intel/pci-lnl.c                      |   3 +
 sound/soc/sof/ipc3-pcm.c                           |   1 +
 sound/soc/sof/ipc4-pcm.c                           | 115 ++++++++++++++-------
 sound/soc/sof/pcm.c                                |  13 ++-
 sound/soc/sof/sof-audio.h                          |   2 +
 sound/soc/tegra/tegra186_dspk.c                    |   7 +-
 sound/soc/ti/davinci-mcasp.c                       |  12 +--
 35 files changed, 460 insertions(+), 134 deletions(-)
