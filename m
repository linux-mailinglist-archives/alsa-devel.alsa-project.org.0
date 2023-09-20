Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659EB7A8232
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 14:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28381950;
	Wed, 20 Sep 2023 14:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28381950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695214707;
	bh=uagbmiEKwOFVN+Lp1Z/rouzREsH9IioigdQRhnwCHeI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mVyLGlEeKIrk6VxRgQYHy3hld5cKW3H5PclveSjKHZr3FyHeSTYeev8ntvogJ2jMF
	 HVO++fdVGKu1ovsRvuSfrAkaKuat8QRmUf/fX/LxafRKA5dYbdptqnY6CGl1SgPBZp
	 lGLbZtTRFXfy+7eE79kPygssvVZNmdtSkhBkn4C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58384F800F4; Wed, 20 Sep 2023 14:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E44F801F5;
	Wed, 20 Sep 2023 14:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6ECDF8025A; Wed, 20 Sep 2023 14:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F00E7F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 14:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F00E7F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FVKr7OG7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD9CB61A30;
	Wed, 20 Sep 2023 12:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FC8C433C8;
	Wed, 20 Sep 2023 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695214639;
	bh=uagbmiEKwOFVN+Lp1Z/rouzREsH9IioigdQRhnwCHeI=;
	h=From:To:Cc:Subject:Date:From;
	b=FVKr7OG7k2SSKh26CqARR+0cgjWsmHTrsauaKBwT9VgHVDQ0VGZ2c1iwBQ2RvzrTW
	 P+0gK/uG7G3cBcQDpfsKR5fsVE2MFkjcPeE1p/TGxjGqEmh0acb5Eiu6rvDIcblxwj
	 vUujuVER28/NVhhEi3YGfX1l0jDIwVs28CfoeJuAZayrxe7u2eAM+kO9jWybUNvzW9
	 4RinU2BLXBUYQLhBUoNiEOGn2L6sDMoVOCAZDUhg4fVXt4BQornsdVAhdKpf1EhEC7
	 Xd10GmrStEKimvzlOHTalnpKQ6EYzjq3Peo96m8KhFAECa+NE0TCB3BWA2AUHDcnID
	 BMdzDcDgTh7Aw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.6-rc2
Date: Wed, 20 Sep 2023 13:57:07 +0100
Message-Id: <20230920125718.B4FC8C433C8@smtp.kernel.org>
Message-ID-Hash: 2UX2MCKKTNXNUKKM6SGWDFILPV4M2FRH
X-Message-ID-Hash: 2UX2MCKKTNXNUKKM6SGWDFILPV4M2FRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UX2MCKKTNXNUKKM6SGWDFILPV4M2FRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.6-rc2

for you to fetch changes up to 31bb7bd9ffee50d09ec931998b823a86132ab807:

  ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful (2023-09-15 17:14:22 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.6

Quite a large collection of fixes, with numbers boosted by multiple
vendors sending multi-patch serieses.  Nothing super major, and also one
device quirk.

----------------------------------------------------------------
August Wikerfors (1):
      ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG

Bard Liao (1):
      ASoC: SOF: ipc4-topology: fix wrong sizeof argument

Chancel Liu (1):
      ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link

Charles Keepax (2):
      ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
      ASoC: cs42l43: Add shared IRQ flag for shutters

Chen Ni (1):
      ASoC: hdaudio.c: Add missing check for devm_kstrdup

Dan Carpenter (1):
      ASoC: codecs: aw88395: Fix some error codes

Guenter Roeck (1):
      ASoC: wm8960: Fix error handling in probe

Hans de Goede (6):
      ASoC: rt5640: Revert "Fix sleep in atomic context"
      ASoC: rt5640: Fix sleep in atomic context
      ASoC: rt5640: Do not disable/enable IRQ twice on suspend/resume
      ASoC: rt5640: Enable the IRQ on resume after configuring jack-detect
      ASoC: rt5640: Fix IRQ not being free-ed for HDA jack detect mode
      ASoC: rt5640: Only cancel jack-detect work on suspend if active

Jerome Brunet (1):
      ASoC: meson: spdifin: start hw on dai probe

Julia Lawall (1):
      ASoC: rsnd: add missing of_node_put

Mark Brown (3):
      Fix redundant PLLA update
      ASoC: rt5640: Fix various IRQ handling issues
      ASoC: cs42l42: Fix handling of hard reset

Peter Ujfalusi (2):
      ASoC: SOF: sof-audio: Fix DSP core put imbalance on widget setup failure
      ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful

Ranjani Sridharan (1):
      ASoC: SOF: Intel: MTL: Reduce the DSP init timeout

Richard Fitzgerald (7):
      ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
      ASoC: cs35l56: Disable low-power hibernation mode
      ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
      ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
      ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset
      firmware: cirrus: cs_dsp: Only log list of algorithms in debug build
      ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()

Sameer Pujar (2):
      ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
      ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates

Shengjiu Wang (2):
      ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
      ASoC: imx-audmix: Fix return error with devm_clk_get()

Walt Holman (1):
      Add DMI ID for MSI Bravo 15 B7ED

 drivers/firmware/cirrus/cs_dsp.c         | 34 +++++++++++-----------
 sound/soc/amd/yc/acp6x-mach.c            | 21 ++++++++++++++
 sound/soc/codecs/aw88395/aw88395_lib.c   |  2 ++
 sound/soc/codecs/cs35l56-i2c.c           |  1 -
 sound/soc/codecs/cs35l56.c               |  1 +
 sound/soc/codecs/cs42l42-sdw.c           | 20 +++++++++++++
 sound/soc/codecs/cs42l42.c               | 21 +++++++++++++-
 sound/soc/codecs/cs42l42.h               |  1 +
 sound/soc/codecs/cs42l43.c               | 14 +++++----
 sound/soc/codecs/rt5640.c                | 29 ++++++++-----------
 sound/soc/codecs/wm8960.c                | 19 +++++++++----
 sound/soc/codecs/wm_adsp.c               | 13 +++++++--
 sound/soc/fsl/imx-audmix.c               |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c            |  1 +
 sound/soc/fsl/imx-rpmsg.c                |  8 ++++++
 sound/soc/intel/avs/boards/hdaudio.c     |  3 ++
 sound/soc/meson/axg-spdifin.c            | 49 +++++++++++---------------------
 sound/soc/sh/rcar/core.c                 |  1 +
 sound/soc/soc-pcm.c                      | 23 +++++++--------
 sound/soc/soc-utils.c                    |  1 +
 sound/soc/sof/core.c                     |  3 +-
 sound/soc/sof/intel/mtl.c                |  2 +-
 sound/soc/sof/intel/mtl.h                |  1 -
 sound/soc/sof/ipc4-topology.c            |  2 +-
 sound/soc/sof/sof-audio.c                |  3 +-
 sound/soc/tegra/tegra_audio_graph_card.c | 30 ++++++++++---------
 26 files changed, 192 insertions(+), 113 deletions(-)
