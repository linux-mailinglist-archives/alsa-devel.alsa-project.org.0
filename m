Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8807551DC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 22:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC190A4D;
	Sun, 16 Jul 2023 22:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC190A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689537662;
	bh=eaNUoDwZ6iBZFvxf1d4N49taGj/Kytxfi6GFZisrmjY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wg7JclQ75fQvaFkKKq++/DObsT8d8U5vb2dDS+uH2O6+XkjeZCGDw0I/IvOgEdmPK
	 HphY4kcGZbgeQ62v4ENkhsHSdmxfUZFa0rythFu+5w4wUN1UhkCqypjgrGF4oqIkPO
	 DAlhYRParCvavSSOc7I2FTUgHUxy8mIxIM0Isldo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE64F80494; Sun, 16 Jul 2023 22:00:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F01F8032D;
	Sun, 16 Jul 2023 22:00:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3D3EF8047D; Sun, 16 Jul 2023 22:00:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A2D7F800D2
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 21:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2D7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c/3ieDGj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5551160E88;
	Sun, 16 Jul 2023 19:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32C2C433C9;
	Sun, 16 Jul 2023 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689537593;
	bh=eaNUoDwZ6iBZFvxf1d4N49taGj/Kytxfi6GFZisrmjY=;
	h=From:To:Cc:Subject:Date:From;
	b=c/3ieDGjhl+RtVQDhULg93CxdfqMTtgjgpZ4+Z/faZkNkUN5UH/tASZJybCe+MjRv
	 rLu7BjyYSWXLyjJoRvYnULbWq1byn2POhUXA2tt8ooXljHHGFEUdlPKwllshRrzcSG
	 YnwyU+nnFFnjxuurW2dhLbRK62aTKsVY5D1jjdnrTpK9jB2PMIguH8oOA9/vcuYsLk
	 +AIxbxTu/WCZzktIsLmkwWUkN3eZ8Yf8b+D7aYpXfFOHGornpkhYBek9Z2hiQI6Ahu
	 JAxqdv+hmr75+MbQrzwpAGOZlrOzxBQGx70B9IRVFspl5U7ag/8kZST4xcsMKklkDJ
	 3kRcLDez8azjg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc1
Date: Sun, 16 Jul 2023 20:59:45 +0100
Message-Id: <20230716195952.C32C2C433C9@smtp.kernel.org>
Message-ID-Hash: HA5LHXQ5M4TBJMDQ7BGEYIE4VK2TROXO
X-Message-ID-Hash: HA5LHXQ5M4TBJMDQ7BGEYIE4VK2TROXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HA5LHXQ5M4TBJMDQ7BGEYIE4VK2TROXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 2d0cad0473bd1ffbc5842be0b9f2546265acb011:

  ASoC: core: Always store of_node when getting DAI link component (2023-06-23 22:09:00 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc1

for you to fetch changes up to e8bf1741c14eb8e4a4e1364d45aeeab66660ab9b:

  MAINTAINERS: Redo addition of ssm3515 to APPLE SOUND (2023-07-15 13:07:32 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.5

A lot of fixes here for the Qualcomm CODEC drivers, there was quite a
bit of fragility with the SoundWire probe due to the combined DT and
hotplug approach that the bus has which Johan Hovold fixed along with a
bunch of other issues that came up in the process.  Srivinvas Kandagatla
also fixed some separate issues that have been lurking for a while in
the Qualcomm AP side, and there's a good set of AMD fixes from Vijendar
Mukunda too.

----------------------------------------------------------------
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

Mark Brown (2):
      ASoC: codecs: wcd938x/wcd934x: loglevel fix and
      ASoC/soundwire/qdsp6/wcd: fix leaks and probe deferral

Martin Povišer (1):
      MAINTAINERS: Redo addition of ssm3515 to APPLE SOUND

Mastan Katragadda (1):
      ASoC: SOF: amd: add revision check for sending sha dma completion command

Matthias Reichl (1):
      ASoC: hdmi-codec: fix channel info for compressed formats

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
 sound/soc/codecs/hdmi-codec.c                      | 36 +++++---
 sound/soc/codecs/rt5640.c                          | 13 +--
 sound/soc/codecs/rt5645.c                          |  6 +-
 sound/soc/codecs/wcd-mbhc-v2.c                     | 57 +++++++++----
 sound/soc/codecs/wcd934x.c                         | 20 ++++-
 sound/soc/codecs/wcd938x.c                         | 99 ++++++++++++++++++----
 sound/soc/fsl/fsl_sai.c                            |  6 --
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  1 +
 sound/soc/qcom/qdsp6/q6apm.c                       |  7 +-
 sound/soc/qcom/qdsp6/topology.c                    |  4 +-
 sound/soc/soc-core.c                               |  6 +-
 sound/soc/soc-topology.c                           | 10 ++-
 sound/soc/sof/amd/acp.c                            | 10 ++-
 sound/soc/tegra/tegra210_adx.c                     | 34 +++++---
 sound/soc/tegra/tegra210_amx.c                     | 40 +++++----
 25 files changed, 294 insertions(+), 134 deletions(-)
