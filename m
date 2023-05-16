Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A68705235
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 17:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C00DE;
	Tue, 16 May 2023 17:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C00DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684251229;
	bh=SPTHn/ZIIZ0xtewm2qUIoasBystqloZAo25JO0GySXc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ESoeTMx7Fwq7KX1um9XQUtCu5wo3HpyiA8gIfT+oem3YKdXYzmRTC2m13v4so9bdj
	 HSbife2Asw69j6ZwitR9DExUXn+eMkXmui3kIlOIP72rCjoD3htTdTOv5PrbmmP+9Q
	 dP5fBhJn0wCxa/HfdICtat67kYXTx5/4gT6UT2Jc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE44CF80431; Tue, 16 May 2023 17:32:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A989F8016A;
	Tue, 16 May 2023 17:32:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D48F80272; Tue, 16 May 2023 17:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 965F8F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 17:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 965F8F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L5kIyVgl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DCF763B55;
	Tue, 16 May 2023 15:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B966EC433D2;
	Tue, 16 May 2023 15:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251160;
	bh=SPTHn/ZIIZ0xtewm2qUIoasBystqloZAo25JO0GySXc=;
	h=From:To:Cc:Subject:Date:From;
	b=L5kIyVglGLYhgBV1eodNabw+sDAvdEu+S+iPmAZzioSGzO7WLW/+j2H4SHARMF/Uw
	 E6VFLMBTMairSp0Ba735seWSqayEEVKUVv7mx43uwBLL8asOXzF12yruc3qbNxTbzS
	 v8RcCUllZz+3uZu7gDnyNzxUy7GNn2qUdImJnHEkE5Qs9nLqmHnPImh1RPUKPyvQqh
	 N4jTc7I3+g+47H7JTme0II9VdXoIO25KWMqoYD8xTCPngaj+NFf2AwyE5v0dlFDffl
	 HJMYUPqpKgMiyDfMtVGpRxPfZKJ0Rt3EfbI8quMXbyS0MOx3HJC+LF0w7Bzs1+CU+E
	 GJ0KmZI40VQBQ==
Message-ID: <af194d981f16fa3d7507d8285056c692.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.4-rc2
Date: Wed, 17 May 2023 00:32:29 +0900
Message-ID-Hash: UHPJXR3SGFAO6GDIR7OQEABBYT6TA5QS
X-Message-ID-Hash: UHPJXR3SGFAO6GDIR7OQEABBYT6TA5QS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHPJXR3SGFAO6GDIR7OQEABBYT6TA5QS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.4-rc2

for you to fetch changes up to 9be0b3a0074a61df1c94c37faea35ec8b9ea130b:

  ASoC: SOF: Intel: hda-mlink: fixes and extensions (2023-05-16 00:13:09 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.4

More fixes that came in since the merge window, the bulk of which are
for the SOF code, I suspect as a result of the wide usage, active
development and large code size rather than huge quality problems.

There's also a couple of MAINTAINERS updates and some new device quirks.

----------------------------------------------------------------
Aidan MacDonald (1):
      ASoC: jz4740-i2s: Make I2S divider calculations more robust

Douglas Anderson (1):
      ASoC: mediatek: mt8186: Fix use-after-free in driver remove path

Jeremy Soller (1):
      ASoC: amd: yc: Add DMI entry to support System76 Pangolin 12

Kai Vehmanen (1):
      ASoC: SOF: pm: save io region state in case of errors in resume

Krzysztof Kozlowski (1):
      ASoC: MAINTAINERS: drop Krzysztof Kozlowski from Samsung audio

Lucas Tanure (1):
      MAINTAINERS: Remove self from Cirrus Codec drivers

Mark Brown (2):
      ASoC: SOF: Various runtime pm fixes, improvements
      ASoC: SOF: Intel: hda-mlink: fixes and extensions

Martin Povišer (1):
      ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs

Maxim Kochetkov (1):
      ASoC: dwc: limit the number of overrun messages

Paweł Anikiel (1):
      ASoC: ssm2602: Add workaround for playback distortions

Peter Ujfalusi (1):
      ASoC: SOF: ipc3-topology: Make sure that only one cmd is sent in dai_config

Pierre-Louis Bossart (9):
      ASoC: SOF: Intel: hda-mlink: fix sublink refcounting
      ASoC: SOF: Intel: hda-mlink: add helper to get SoundWire hlink
      ASoC: SOF: Intel: hda-mlink: fix base_ptr computation
      ASoC: SOF: Intel: hda-mlink: use 'ml_addr' parameter consistently
      ASoC: SOF: Intel: hda-mlink: initialize instance_offset member
      ASoC: SOF: Intel: hda-mlink: add helper to program SoundWire PCMSyCM registers
      ASoC: SOF: debug: conditionally bump runtime_pm counter on exceptions
      ASoC: SOF: pcm: fix pm_runtime imbalance in error handling
      ASoC: SOF: sof-client-probes: fix pm_runtime imbalance in error handling

Ranjani Sridharan (3):
      ASoC: SOF: topology: Fix logic for copying tuples
      ASoC: SOF: Separate the tokens for input and output pin index
      ASoC: SOF: topology: Fix tuples array allocation

Shengjiu Wang (1):
      ASoC: fsl_micfil: Fix error handler with pm_runtime_enable

Simon Trimmer (1):
      ASoC: cs35l56: Prevent unbalanced pm_runtime in dsp_work() on SoundWire

V sujith kumar Reddy (1):
      ASoC: SOF: amd: Fix NULL pointer crash in acp_sof_ipc_msg_data function

 .../devicetree/bindings/sound/tas2562.yaml         |  6 +-
 .../devicetree/bindings/sound/tas2770.yaml         |  6 +-
 .../devicetree/bindings/sound/tas27xx.yaml         |  6 +-
 MAINTAINERS                                        |  4 +-
 include/sound/hda-mlink.h                          | 14 ++++
 include/uapi/sound/sof/tokens.h                    |  3 +-
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++
 sound/soc/codecs/cs35l56.c                         |  3 +-
 sound/soc/codecs/ssm2602.c                         | 15 ++++
 sound/soc/dwc/dwc-i2s.c                            |  4 +-
 sound/soc/fsl/fsl_micfil.c                         | 14 +++-
 sound/soc/jz4740/jz4740-i2s.c                      | 54 +++++++++++-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c         |  6 --
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h         |  1 -
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |  4 -
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c      | 46 ++++++-----
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h      |  1 -
 sound/soc/sof/amd/acp-ipc.c                        |  7 +-
 sound/soc/sof/debug.c                              |  4 +-
 sound/soc/sof/intel/hda-mlink.c                    | 96 ++++++++++++++++++++--
 sound/soc/sof/ipc3-topology.c                      |  7 +-
 sound/soc/sof/ipc4-topology.c                      |  4 +-
 sound/soc/sof/pcm.c                                | 11 +--
 sound/soc/sof/pm.c                                 | 14 +++-
 sound/soc/sof/sof-client-probes.c                  | 14 ++--
 sound/soc/sof/topology.c                           |  6 +-
 26 files changed, 276 insertions(+), 81 deletions(-)
