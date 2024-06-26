Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C55918DFE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 20:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52911667;
	Wed, 26 Jun 2024 20:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52911667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719425493;
	bh=+QE+Wc/OcLxQmKcGTmXzp7LXPiIXfJsgZlgpdHqFFNY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GL8QC/2wy0slnVlrAxQjM4kjYUbm8TVe8sOyHIoHmtCimVORx+gjP5JmvIRpNvVrc
	 BJU2bxzBXVTKuQa9OK3iqHD5O58zL9QvuVJQx1sagt26U8aZsdfq9eUG9/P1jq9h12
	 cwFNn9tIIxsoxqwYUFwQ0WWShTY9KbgCaKF9+5PU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB9BF805AA; Wed, 26 Jun 2024 20:11:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3FDF800ED;
	Wed, 26 Jun 2024 20:11:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C534F80423; Wed, 26 Jun 2024 20:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8402BF800ED
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 20:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8402BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CORplcVz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EEDABCE2C32;
	Wed, 26 Jun 2024 18:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FFAC116B1;
	Wed, 26 Jun 2024 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719425441;
	bh=+QE+Wc/OcLxQmKcGTmXzp7LXPiIXfJsgZlgpdHqFFNY=;
	h=From:To:Cc:Subject:Date:From;
	b=CORplcVz6ryAE6rHLEi6SmG4aFKgV3uo/DJ7KieDv/lZjPj0Oy0w7J8UnPwvGOFAi
	 QImdFM+dYjmxbEYJVcznJsh72eqxm5aHsUrq5xkIY6MseuvOtLkePm6+tLZjY4EifI
	 kaXhcieIzo84XQANd8hgJ3ZGMDuutBJXhLW2jEVyDuZW9ou/UbCxpzfdHfgd4df6PP
	 1yD0pSXwKkSVn7bYSNQwGgesdWo7LsLRS7vOyohUr7HaBMjMODnKNhpCb4zk1qQzt9
	 IMZE/ijsnMM1CNG6kkCL6CqkglXKh19NPcCfpAbi3n5loJoMBxzw962kn07DpdGIHL
	 I80OZ8GQG6RtA==
Message-ID: <45ac83fae7eec4c6a7e297e2f27295df.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.10-rc5
Date: Wed, 26 Jun 2024 19:10:32 +0100
Message-ID-Hash: 7AIOD5FSV6WK4A2HQHPWKMLF4OZQKVF3
X-Message-ID-Hash: 7AIOD5FSV6WK4A2HQHPWKMLF4OZQKVF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AIOD5FSV6WK4A2HQHPWKMLF4OZQKVF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.10-rc5

for you to fetch changes up to 68f97fe330e01450ace63da0ce5cab676fc97f9a:

  ASoC: rt5645: fix issue of random interrupt from push-button (2024-06-26 16:34:48 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.10

A relatively large batch of updates, largely due to the long interval
since I last sent fixes due to various travel and holidays.  There's a
lot of driver specific fixes and quirks in here, none of them too major,
and also some fixes for recently introduced memory safety issues in the
topology code.

----------------------------------------------------------------
Alibek Omarov (1):
      ASoC: rockchip: i2s-tdm: Fix trcm mode by setting clock on right mclk

Amadeusz Sławiński (5):
      ASoC: topology: Fix references to freed memory
      ASoC: Intel: avs: Fix route override
      ASoC: topology: Do not assign fields that are already set
      ASoC: topology: Clean up route loading
      ASoC: topology: Fix route memory corruption

Andrei Simion (1):
      ASoC: atmel: atmel-classd: Re-add dai_link->platform to fix card init

Bard Liao (2):
      ASoC: SOF: Intel: hda-dai: skip tlv for dspless mode
      ASoC: SOF: Intel: hda-dai: remove skip_tlv label

Chen-Yu Tsai (1):
      ASoC: mediatek: mt8195: Add platform entry for ETDM1_OUT_BE dai link

Dmitry Baryshkov (1):
      MAINTAINERS: copy linux-arm-msm for sound/qcom changes

Elinor Montmasson (1):
      ASoC: fsl-asoc-card: set priv->pdev before using it

Hsin-Te Yuan (1):
      ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol name collision

Jack Yu (3):
      ASoC: rt722-sdca-sdw: add silence detection register as volatile
      ASoC: rt722-sdca-sdw: add debounce time for type detection
      ASoC: rt5645: fix issue of random interrupt from push-button

Jai Luthra (2):
      ALSA: dmaengine: Synchronize dma channel after drop()
      ASoC: ti: davinci-mcasp: Set min period size using FIFO config

Jeff Johnson (3):
      ASoC: mxs: add missing MODULE_DESCRIPTION() macro
      ASoC: fsl: add missing MODULE_DESCRIPTION() macro
      ASoC: qcom: add missing MODULE_DESCRIPTION() macro

Maciej Strozek (1):
      ASoC: cs42l43: Increase default type detect time and button delay

Mark Brown (3):
      ASoC: SOF: Intel: hda-dai: skip tlv configuration for
      ASoC: topology: Fix route memory corruption
      Fixes for McASP and dmaengine_pcm

Peter Ujfalusi (1):
      ASoC: SOF: sof-audio: Skip unprepare for in-use widgets on error rollback

Primoz Fiser (1):
      ASoC: ti: omap-hdmi: Fix too long driver name

Richard Fitzgerald (1):
      ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI is hooked up

Shuming Fan (1):
      ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell SKU 0C64

Srinivas Kandagatla (1):
      ASoC: q6apm-lpass-dai: close graph on prepare errors

Thomas GENTY (1):
      bytcr_rt5640 : inverse jack detect for Archos 101 cesium

Vijendar Mukunda (3):
      ASoC: amd: acp: add a null check for chip_pdev structure
      ASoC: amd: acp: remove i2s configuration check in acp_i2s_probe()
      ASoC: amd: acp: move chip->flag variable assignment

Vyacheslav Frantsishko (1):
      ASoC: amd: yc: Fix non-functional mic on ASUS M5602RA

Zhang Yi (1):
      ASoC: codecs: ES8326: Solve headphone detection issue

 MAINTAINERS                                        |  1 +
 include/sound/dmaengine_pcm.h                      |  1 +
 sound/core/pcm_dmaengine.c                         | 10 +++++++
 sound/soc/amd/acp/acp-i2s.c                        |  8 -----
 sound/soc/amd/acp/acp-pci.c                        | 12 ++++----
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++++
 sound/soc/atmel/atmel-classd.c                     |  7 +++--
 sound/soc/codecs/cs35l56-shared.c                  |  4 +++
 sound/soc/codecs/cs42l43-jack.c                    |  4 +--
 sound/soc/codecs/es8326.c                          |  8 +++--
 sound/soc/codecs/rt5645.c                          | 24 +++++++++++----
 sound/soc/codecs/rt5645.h                          |  6 ++++
 sound/soc/codecs/rt722-sdca-sdw.c                  |  4 ++-
 sound/soc/fsl/fsl-asoc-card.c                      |  3 +-
 sound/soc/fsl/imx-pcm-dma.c                        |  1 +
 sound/soc/intel/avs/topology.c                     | 19 +++++++++---
 sound/soc/intel/boards/bytcr_rt5640.c              | 11 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 +++----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  1 +
 sound/soc/mxs/mxs-pcm.c                            |  1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            | 32 ++++++++++++--------
 sound/soc/qcom/sdw.c                               |  1 +
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 13 ++++++--
 sound/soc/soc-generic-dmaengine-pcm.c              |  8 +++++
 sound/soc/soc-topology.c                           | 35 ++++++++++------------
 sound/soc/sof/intel/hda-dai.c                      |  6 ++--
 sound/soc/sof/sof-audio.c                          |  2 +-
 sound/soc/ti/davinci-mcasp.c                       |  9 ++++--
 sound/soc/ti/omap-hdmi.c                           |  6 +---
 30 files changed, 176 insertions(+), 80 deletions(-)
