Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5275AF20
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 181D6F0;
	Thu, 20 Jul 2023 15:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 181D6F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689858386;
	bh=aNMIGdOe1k512UTb7SbluPDFmTmm1LOCZcH1N2jQXY8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IskaEgHY6TTAO5s8PvtVuP9ZoCTFCphUNNuwns6qbAYaTLZ70wMdJLjIByKE61MqK
	 6jyYp/mojnbmv+Vub/bQQn4tYwi4GraWAa6pZFF2l7kO0sZ5u3N8TVr1lAuQ61zkQl
	 Bwdn1x+qd3IZN1fBx5ys9XLd7aGprQk0xr/3PDsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81FE2F804DA; Thu, 20 Jul 2023 15:05:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A78F8032D;
	Thu, 20 Jul 2023 15:05:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85325F8047D; Thu, 20 Jul 2023 15:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE327F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE327F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bTslEEpM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2351F61A7C;
	Thu, 20 Jul 2023 13:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DFEC433C7;
	Thu, 20 Jul 2023 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689858320;
	bh=aNMIGdOe1k512UTb7SbluPDFmTmm1LOCZcH1N2jQXY8=;
	h=From:To:Cc:Subject:Date:From;
	b=bTslEEpM6V+zJJW5iigyf0HpTCIoJu/lOva1NNAV0pGhs1Gq8yCf6zrcy2iMw+4PQ
	 zTdgGl4YPSUGJkLXdRp0h+AjbRi9X5HUhq2hjvQ5/T/U8f/4sPIDNIaP4tJ3s/c6Jc
	 P1LLy5HoFugjBLMWKXQdF9+ut1lKxI7rnKaC9kDGaeBefyGujP+WyqoP6SFwxyIQR7
	 WoeKDcqS3w9YqRki0GuXViL9tfSWofePk0WC7gERIsVXpgfhtkswnXZOxMWTFFuMUZ
	 0OpaJJCpw2iZa5bUJlmK+VT7Afnt9d1y1TO0oM449ZEuYMylFs3cD6F8t1PDPWk4X6
	 5cpT4dpy3OkMw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc1-2
Date: Thu, 20 Jul 2023 14:05:08 +0100
Message-Id: <20230720130519.D1DFEC433C7@smtp.kernel.org>
Message-ID-Hash: HRJIT654DE2HTXUBSLNPMSER5CCAVLNW
X-Message-ID-Hash: HRJIT654DE2HTXUBSLNPMSER5CCAVLNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRJIT654DE2HTXUBSLNPMSER5CCAVLNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit fdf0eaf11452d72945af31804e2a1048ee1b574c:

  Linux 6.5-rc2 (2023-07-16 15:10:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc1-2

for you to fetch changes up to 269f399dc19f0e5c51711c3ba3bd06e0ef6ef403:

  ASoC: fsl_sai: Disable bit clock with transmitter (2023-07-17 19:15:07 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.5

A few more fixes for v6.5, just small driver specific ones.

----------------------------------------------------------------
Dan Carpenter (1):
      ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()

Derek Fang (1):
      ASoC: rt5640: Fix the issue of speaker noise

Fabio Estevam (1):
      ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode"

Geert Uytterhoeven (1):
      ASoC: codecs: SND_SOC_WCD934X should select REGMAP_IRQ

Johan Hovold (15):
      ASoC: codecs: wcd938x: fix codec initialisation race
      ASoC: codecs: wcd938x: fix mbhc impedance loglevel
      ASoC: codecs: wcd938x: drop inline keywords
      ASoC: codecs: wcd938x: use dev_printk() for impedance logging
      ASoC: codecs: wcd934x: demote impedance printk
      ASoC: codecs: wcd934x: drop inline keywords
      ASoC: codecs: wcd938x: fix soundwire initialisation race
      ASoC: codecs: wcd938x: fix missing mbhc init error handling
      ASoC: qdsp6: audioreach: fix topology probe deferral
      ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
      ASoC: codecs: wcd938x: fix resource leaks on component remove
      ASoC: codecs: wcd934x: fix resource leaks on component remove
      ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
      ASoC: topology: suppress probe deferral errors
      ASoC: core: suppress probe deferral errors

Mario Limonciello (1):
      ASoC: amd: ps: Fix extraneous error messages

Mark Brown (3):
      ASoC: codecs: wcd938x/wcd934x: loglevel fix and
      ASoC/soundwire/qdsp6/wcd: fix leaks and probe deferral
      ASoC: Merge v6.5-rc2

Martin Povišer (1):
      MAINTAINERS: Redo addition of ssm3515 to APPLE SOUND

Mastan Katragadda (1):
      ASoC: SOF: amd: add revision check for sending sha dma completion command

Matthias Reichl (1):
      ASoC: hdmi-codec: fix channel info for compressed formats

Matus Gajdos (1):
      ASoC: fsl_sai: Disable bit clock with transmitter

Nathan Chancellor (1):
      ASoC: cs35l45: Select REGMAP_IRQ

Rob Herring (1):
      ASoC: dt-bindings: audio-graph-card2: Drop incomplete example

Rohit kumar (1):
      ASoC: dt-bindings: Update maintainer email id

Sameer Pujar (1):
      ASoC: rt5640: Fix sleep in atomic context

Sheetal (2):
      ASoC: tegra: Fix AMX byte map
      ASoC: tegra: Fix ADX byte map

Shuming Fan (1):
      ASoC: rt5645: check return value after reading device id

Srinivas Kandagatla (4):
      ASoC: qdsp6: q6apm: use dai link pcm id as pcm device number
      ASoC: qcom: q6afe-dai: fix Display Port Playback stream name
      ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
      ASoC: qcom: q6apm: do not close GPR port before closing graph

Thomas Petazzoni (1):
      ASoC: cs42l51: fix driver to properly autoload with automatic module loading

Vijendar Mukunda (6):
      ASoC: amd: ps: add comments for DMA irq bits mapping
      ASoC: amd: ps: add fix for dma irq mask for rx streams for SDW0 instance
      ASoC: amd: ps: fix for position register set for AUDIO0 RX stream
      ASoC: amd: ps: add comments for DMA register mapping
      ASoC: amd: ps: fix byte count return value for invalid SoundWire manager instance
      ASoC: amd: acp: fix for invalid dai id handling in acp_get_byte_count()

 .../bindings/sound/audio-graph-card2.yaml          | 20 +----
 .../bindings/sound/google,sc7180-trogdor.yaml      |  2 +-
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  2 +-
 MAINTAINERS                                        |  2 +
 sound/soc/amd/acp/amd.h                            |  7 +-
 sound/soc/amd/ps/acp63.h                           | 22 ++++-
 sound/soc/amd/ps/pci-ps.c                          |  4 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      | 16 +++-
 sound/soc/codecs/Kconfig                           |  2 +
 sound/soc/codecs/cs42l51-i2c.c                     |  6 ++
 sound/soc/codecs/cs42l51.c                         |  7 --
 sound/soc/codecs/cs42l51.h                         |  1 -
 sound/soc/codecs/rt5640.c                          | 13 +--
 sound/soc/codecs/rt5645.c                          |  6 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     | 57 +++++++++----
 sound/soc/codecs/wcd934x.c                         | 20 ++++-
 sound/soc/codecs/wcd938x.c                         | 99 ++++++++++++++++++----
 sound/soc/fsl/fsl_sai.c                            |  8 +-
 sound/soc/fsl/fsl_sai.h                            |  1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  1 +
 sound/soc/qcom/qdsp6/q6apm.c                       |  7 +-
 sound/soc/qcom/qdsp6/topology.c                    |  4 +-
 sound/soc/soc-core.c                               |  6 +-
 sound/soc/soc-topology.c                           | 10 ++-
 sound/soc/sof/amd/acp.c                            | 10 ++-
 sound/soc/sof/ipc3-dtrace.c                        |  9 +-
 sound/soc/tegra/tegra210_adx.c                     | 34 +++++---
 sound/soc/tegra/tegra210_amx.c                     | 40 +++++----
 29 files changed, 282 insertions(+), 136 deletions(-)
