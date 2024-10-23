Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 495319AD6DC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 23:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3736820C;
	Wed, 23 Oct 2024 23:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3736820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729719934;
	bh=jCxl+vaSl5BXgkqNMrgWEQXHW5E34c9hjVFyNbFoIpw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WzaRe5Yvm+3sG7ub6+bCOhojdJIHYxIBKHillmqgLcikq1xvY0pFTh6opRMCfl1/Z
	 xanILeDuv0NrrZzxcuY4OO8H1mH8OT6qYMO6OP5qoKD3AesYMdX2obg/AdnMdS2gRk
	 CmPUE+7+fmYBP3aO6JwrUafrhmKjD5GeNBQH3yyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A95CDF805B6; Wed, 23 Oct 2024 23:45:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D73F80588;
	Wed, 23 Oct 2024 23:45:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48A61F8016C; Wed, 23 Oct 2024 23:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C897F8014C
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 23:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C897F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BTHJ4UQ7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3129A444DE;
	Wed, 23 Oct 2024 21:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1FFC4CEC6;
	Wed, 23 Oct 2024 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729719888;
	bh=jCxl+vaSl5BXgkqNMrgWEQXHW5E34c9hjVFyNbFoIpw=;
	h=From:To:Cc:Subject:Date:From;
	b=BTHJ4UQ7BfQL8ZvboyObimgW3ccG561gpqdpa2Uzch8CCVpQfKDZPAaF4SOJljnIC
	 A6xDUZS3PjWnA9Oy5sR/aM5oeO1QM4RKI7EpyYAe8poT+v4eAMVEOeIhFiT27/BDdI
	 qe1nbTgavM5pKjyfanJ6E9kme3N6kSCdv8aaxzuEqs8Guf/OiIbo6gaC/KDB2i84Xl
	 ZsVsldlMBcMm+VZG5p4pWTLAG1K9Ha1Ty1LiqZSX+CpRRgppob+MqcoHIxRNO7DHi7
	 yYfA1G+Kk3CtPzGTUfmyqc6tmQ7807TpLb0Bb3q+h5Bn/mgC4NMC5LmBLcN7hM7/XO
	 +9vWfTwqDOJNg==
Message-ID: <0db698090dd7ea59422ec8f778d20dba.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.12-rc4
Date: Wed, 23 Oct 2024 22:44:38 +0100
Message-ID-Hash: IZQV7GLFYDB6WSRRUST4VJNP7WA5VXMA
X-Message-ID-Hash: IZQV7GLFYDB6WSRRUST4VJNP7WA5VXMA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZQV7GLFYDB6WSRRUST4VJNP7WA5VXMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc4

for you to fetch changes up to db7e59e6a39a4d3d54ca8197c796557e6d480b0d:

  ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc (2024-10-22 21:00:38 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.12

An uncomfortably large set of fixes due to me not getting round to
sending them for longer than I should due to travel and illness.  This
is mostly smaller driver specific changes, but there are a couple of
generic changes:

 - Bumping the minimal topology ABI we check for during validation, the
   code had support for v4 removed previously but the update of the
   define used for initial validation was missed.
 - Fix the assumption that DAPM structs will be embedded in a component
   which isn't true for card widgets when doing name comparisons, though
   fortunately this is rarely triggered.

We've pulled in one Soundwire fix which was part of a larger series
fixing cleanup issues in on Intel Soundwire systems.

----------------------------------------------------------------
Alexey Klimov (2):
      ASoC: qcom: sdm845: add missing soundwire runtime stream alloc
      ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for DSM_CTL and SEC7 regs

Amadeusz Sławiński (2):
      ASoC: Intel: avs: Update stream status in a separate thread
      ASoC: topology: Bump minimal topology ABI version

Andrei Simion (1):
      MAINTAINERS: Update maintainer list for MICROCHIP ASOC, SSC and MCP16502 drivers

Benjamin Bara (1):
      ASoC: dapm: avoid container_of() to get component

Binbin Zhou (1):
      ASoC: loongson: Fix component check failed on FDT systems

Chancel Liu (1):
      ASoC: fsl_micfil: Add a flag to distinguish with different volume control types

Christian Heusel (1):
      ASoC: amd: yc: Add quirk for ASUS Vivobook S15 M3502RA

Colin Ian King (1):
      ASoC: max98388: Fix missing increment of variable slot_found

Derek Fang (1):
      ASoC: Intel: soc-acpi: lnl: Add match entry for TM2 laptops

Ilya Dudikov (1):
      ASoC: amd: yc: Fix non-functional mic on ASUS E1404FA

Jack Yu (1):
      ASoC: rt722-sdca: increase clk_stop_timeout to fix clock stop issue

Kai Vehmanen (1):
      ASoC: SOF: Intel: hda-loader: do not wait for HDaudio IOC

Kirill Marinushkin (1):
      ASoC: Change my e-mail to gmail

Krzysztof Kozlowski (2):
      ASoC: qcom: Select missing common Soundwire module code on SDM845
      ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc

Lad Prabhakar (1):
      ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing

Mark Brown (1):
      ASoC/SoundWire: clean up link DMA during stop for IPC4

Miquel Raynal (1):
      ASoC: dt-bindings: davinci-mcasp: Fix interrupt properties

Ranjani Sridharan (4):
      ASoC: SOF: ipc4-topology: Do not set ALH node_id for aggregated DAIs
      ASoC: SOF: Intel: hda: Handle prepare without close for non-HDA DAI's
      soundwire: intel_ace2x: Send PDI stream number during prepare
      ASoC: SOF: Intel: hda: Always clean up link DMA during stop

Shengjiu Wang (2):
      ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
      ASoC: fsl_micfil: Add sample rate constraint

Venkata Prasad Potturu (2):
      ASoC: SOF: amd: Add error log for DSP firmware validation failure
      ASoC: SOF: amd: Fix for ACP SRAM addr for acp7.0 platform

Zhu Jun (1):
      ASoC: codecs: Fix error handling in aw_dev_get_dsp_status function

Zichen Xie (1):
      ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()

 .../bindings/sound/davinci-mcasp-audio.yaml        | 18 ++---
 MAINTAINERS                                        |  5 +-
 drivers/soundwire/intel_ace2x.c                    | 19 ++---
 include/uapi/sound/asoc.h                          |  2 +-
 sound/soc/amd/yc/acp6x-mach.c                      | 14 ++++
 sound/soc/codecs/aw88399.c                         |  2 +-
 sound/soc/codecs/lpass-rx-macro.c                  | 15 ++--
 sound/soc/codecs/max98388.c                        |  1 +
 sound/soc/codecs/pcm3060-i2c.c                     |  4 +-
 sound/soc/codecs/pcm3060-spi.c                     |  4 +-
 sound/soc/codecs/pcm3060.c                         |  4 +-
 sound/soc/codecs/pcm3060.h                         |  2 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |  2 +-
 sound/soc/fsl/fsl_esai.c                           |  4 +-
 sound/soc/fsl/fsl_micfil.c                         | 81 +++++++++++++++++++++-
 sound/soc/intel/avs/core.c                         |  3 +-
 sound/soc/intel/avs/pcm.c                          | 19 +++++
 sound/soc/intel/avs/pcm.h                          | 16 +++++
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  | 38 ++++++++++
 sound/soc/loongson/loongson_card.c                 |  1 +
 sound/soc/qcom/Kconfig                             |  2 +
 sound/soc/qcom/lpass-cpu.c                         |  2 +
 sound/soc/qcom/sc7280.c                            | 10 ++-
 sound/soc/qcom/sdm845.c                            |  7 +-
 sound/soc/sh/rcar/core.c                           |  7 +-
 sound/soc/soc-dapm.c                               |  4 +-
 sound/soc/sof/amd/acp-loader.c                     |  5 +-
 sound/soc/sof/amd/acp.c                            |  4 +-
 sound/soc/sof/intel/hda-dai-ops.c                  | 23 +++---
 sound/soc/sof/intel/hda-dai.c                      | 37 ++++++++--
 sound/soc/sof/intel/hda-loader.c                   | 17 -----
 sound/soc/sof/ipc4-topology.c                      | 15 +++-
 32 files changed, 298 insertions(+), 89 deletions(-)
 create mode 100644 sound/soc/intel/avs/pcm.h
