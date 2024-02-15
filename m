Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C829485649A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 14:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291BC850;
	Thu, 15 Feb 2024 14:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291BC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708004431;
	bh=DBLsYvdUpy2/UUySYt+iVDyrlzNMREyPwYPrhtdJi/A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ru8Q7n+gH4KbP2ftMfWc3nShGprd5zHpaXqcCiySPrenDYGrRaC+jiPwk2/fK7DY4
	 1/KwIXv4wf6GqcITLbP/MX0ncqzhF7k8tYvJfN/hpKl2of13xZjLtQcxZmZYD4mZ6i
	 meHNesZVNE1pfgTYM7TworhP6zOZPAihxy7V1zl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 139A0F80568; Thu, 15 Feb 2024 14:39:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C2DF80579;
	Thu, 15 Feb 2024 14:39:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8E3F80238; Thu, 15 Feb 2024 14:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D734F800EE
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 14:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D734F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=URzjFqyg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 910C2CE268C;
	Thu, 15 Feb 2024 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766F5C433C7;
	Thu, 15 Feb 2024 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708004318;
	bh=DBLsYvdUpy2/UUySYt+iVDyrlzNMREyPwYPrhtdJi/A=;
	h=From:To:Cc:Subject:Date:From;
	b=URzjFqygPLP3AiAkUWbHHb35292NN92bfeD9pExlcSNhlcXykTY+Fsdw1n42xTOKb
	 jJoPkGxWJKtKZfIoWSXkZCCVAjJGo3LO/oncWlYu/7TTmdM64Ox6c77Ha6q3PmjKgA
	 WCciUsOSFgrdnIbrt59wIqxNjZqEj0kv8dVzWNzEANdv9NOZP8kUzEkXEi+LU5CypV
	 BZIiquaphX/TORUJEiabAbIV4AC7R6l538VuR1lEPUuYqj8Largo8dByRrkD+3OUIr
	 IgHof7C5wWit2Lq6b2MkW+exkvpGJ2jSwUhIpRCDOMXVhCFwS8j0/ZcF9jqelcalsB
	 ZLruc6B0WBW3A==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-rc4
Date: Thu, 15 Feb 2024 13:38:29 +0000
Message-Id: <20240215133838.766F5C433C7@smtp.kernel.org>
Message-ID-Hash: QVEJSAHACHKVQ563DEPM6VGRRHWNOOHZ
X-Message-ID-Hash: QVEJSAHACHKVQ563DEPM6VGRRHWNOOHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVEJSAHACHKVQ563DEPM6VGRRHWNOOHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit e81fdba0208666b65bafeaba814874b4d6e5edde:

  ALSA: Various fixes for Cirrus Logic CS35L56 support (2024-02-01 17:45:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc4

for you to fetch changes up to 0db0c1770834f39e11a2902e20e1f11a482f4465:

  ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property (2024-02-13 19:37:25 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

A relatively large set of fixes and quirk additions here but they're all
driver specific, people seem to be back into the swing of things after
the holidays.  This is all driver specific and much of it fairly minor.

----------------------------------------------------------------
Alexey Khoroshilov (1):
      ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Fix dynamic port assignment when TDM is set

Arnd Bergmann (1):
      ASoC: q6dsp: fix event handler prototype

Attila Tőkés (1):
      ASoC: amd: yc: Fix non-functional mic on Lenovo 82UU

Cezary Rojewski (1):
      ASoC: Intel: avs: Fix pci_probe() error path

Charles Keepax (2):
      ASoC: cs42l43: Handle error from devm_pm_runtime_enable
      ASoC: cs42l43: Add system suspend ops to disable IRQ

Cristian Ciocaltea (1):
      ASoC: SOF: amd: Fix locking in ACP IRQ handler

Curtis Malainey (1):
      ASoC: SOF: IPC3: fix message bounds on ipc ops

Dan Carpenter (1):
      ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()

Gergo Koteles (1):
      ASoC: tas2781: add module parameter to tascodec_init()

Hans de Goede (4):
      ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards
      ASoC: Intel: cht_bsw_rt5645: Cleanup codec_name handling
      ASoC: rt5645: Make LattePanda board DMI match more precise
      ASoC: rt5645: Add DMI quirk for inverted jack-detect on MeeGoPad T8

Jeffrey Hugo (1):
      ASoC: dt-bindings: google,sc7280-herobrine: Drop bouncing @codeaurora

Mario Limonciello (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo Ideapad Pro 5 16ARP8

Mark Brown (2):
      ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT
      ASoC: SOF: Intel: pci-tgl/lnl: Change default paths

Peter Ujfalusi (3):
      ASoC: SOF: Intel: pci-tgl: Change the default paths and firmware names
      ASoC: SOF: Intel: pci-lnl: Change the topology path to intel/sof-ipc4-tplg
      ASoC: SOF: ipc4-pcm: Workaround for crashed firmware on system suspend

Ranjani Sridharan (1):
      ASoC: SOF: ipc3-topology: Fix pipeline tear down logic

Richard Fitzgerald (3):
      ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization
      ASoC: cs35l56: Remove default from IRQ1_CFG register
      ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property

 .../bindings/sound/google,sc7280-herobrine.yaml    |   1 -
 include/sound/tas2781.h                            |   1 +
 sound/pci/hda/tas2781_hda_i2c.c                    |   2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |  14 ++
 sound/soc/codecs/cs35l56-shared.c                  |   1 -
 sound/soc/codecs/cs35l56.c                         | 246 ++++++++++++++-------
 sound/soc/codecs/cs35l56.h                         |   2 +-
 sound/soc/codecs/cs42l43.c                         |  48 +++-
 sound/soc/codecs/rt5645.c                          |  26 +++
 sound/soc/codecs/tas2781-comlib.c                  |   3 +-
 sound/soc/codecs/tas2781-i2c.c                     |   2 +-
 sound/soc/intel/avs/core.c                         |   3 +
 sound/soc/intel/avs/topology.c                     |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c            |   3 +-
 sound/soc/intel/boards/bytcht_da7213.c             |   3 +-
 sound/soc/intel/boards/bytcht_es8316.c             |   3 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |   3 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |   3 +-
 sound/soc/intel/boards/bytcr_wm5102.c              |   3 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   7 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   8 +-
 sound/soc/sof/amd/acp-ipc.c                        |   2 +
 sound/soc/sof/amd/acp.c                            |  17 +-
 sound/soc/sof/intel/pci-lnl.c                      |   2 +-
 sound/soc/sof/intel/pci-tgl.c                      |  64 +++---
 sound/soc/sof/ipc3-topology.c                      |  55 +++--
 sound/soc/sof/ipc3.c                               |   2 +-
 sound/soc/sof/ipc4-pcm.c                           |  13 +-
 29 files changed, 378 insertions(+), 164 deletions(-)
