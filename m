Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE674575453
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 20:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0CD188A;
	Thu, 14 Jul 2022 20:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0CD188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657821680;
	bh=C5dWnHBzyr1D76M7yuVUTgy9PvQ8QI2yjs3wV97RWVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UQz9VB828YBH8yLLyJJ+oPUequAFTDVonif38UdXRmwvXxeGTMl+l7574dOd4rsRo
	 BHMbC7sETvM9sjjZQttqt1THTC7DBBwMlb3RIrclQNKR5Dtdy3wo20rkKGeQ4+o/EM
	 Y1HI9qxyRNOevte29vCqLDVT7oFE4qNBaRVq/Ics=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD5AF8016E;
	Thu, 14 Jul 2022 20:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FEC9F80165; Thu, 14 Jul 2022 20:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10EABF800B0
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 20:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10EABF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t0cxPI2Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B3F2B82863;
 Thu, 14 Jul 2022 18:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9835C34114;
 Thu, 14 Jul 2022 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657821608;
 bh=C5dWnHBzyr1D76M7yuVUTgy9PvQ8QI2yjs3wV97RWVc=;
 h=From:To:Cc:Subject:Date:From;
 b=t0cxPI2Yk1/Mr/hH3W+a0Jg2mbnCo/lsb9yuHBBTAohHK53jLMXlI3cTKj7rIeTmr
 0cl3hgeqqSVoQuzBG4EJ45k7VimIiXsJBLxxFArtnuEckWATRkYLfMs5NN4Ev9005j
 tuPYzACeNv5kBH3Yiq/0L/PScVhGRqTN0pg2s9F+Lus8xQd9cY/2xqeeWeoCZvoVwZ
 cnwAJPtkSK9tZisAkGY912jO70LgO/ysGNhmN6HMXkXJH2xdh5sLc1WSFdO+DOeQfx
 vA1/Asnq+/XJmHBf4RRSuVWPmxnjDpX0VHK52VvNjmBOqOJ4ECKLEN+sASaRhYr5G+
 sgZFKRQAM8Inw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.19-rc4-2
Date: Thu, 14 Jul 2022 18:59:58 +0100
Message-Id: <20220714180007.C9835C34114@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following changes since commit 980555e95f7cabdc9c80a07107622b097ba23703:

  ASoC: madera: Fix event generation for rate controls (2022-06-24 16:22:01 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc4-2

for you to fetch changes up to 1e347f861da8ddb17e1d1b3113cb6c188e0de3e5:

  ASoC: rockchip-i2s: Undo BCLK pinctrl changes (2022-07-14 13:25:52 +0100)

----------------------------------------------------------------
ASoC: Drop Rockchip BCLK management for v5.19

As covered in the second revert commit in this pull request the version
of the BCLK muxing that's in v5.19 is causing issues, let's just revert
it and wait for the more complete support in v5.20 instead.

----------------------------------------------------------------
Alexandru Elisei (1):
      ASoC: rockchip: i2s: Fix NULL pointer dereference when pinctrl is not found

Brent Lu (1):
      ASoC: Intel: sof_rt5682: fix out-of-bounds array access

Bryan O'Donoghue (1):
      ASoC: dt-bindings: Fix description for msm8916

Charles Keepax (4):
      ASoC: wm5102: Fix event generation for output compensation
      ASoC: wm8998: Fix event generation for input mux
      ASoC: cs47l92: Fix event generation for OUT1 demux
      ASoC: arizona: Update arizona_aif_cfg_changed to use RX_BCLK_RATE

Daniel Mack (1):
      ASoC: max98396: Fix register access for PCM format settings

David Owens (1):
      ASoC: ti: omap-mcbsp: duplicate sysfs error

Francesco Dolcini (1):
      ASoC: sgtl5000: Fix noise on shutdown/remove

Hector Martin (2):
      ASoC: tas2764: Correct playback volume range
      ASoC: tas2764: Fix amp gain register offset & default

Jianglei Nie (1):
      ASoC: qdsp6: fix potential memory leak in q6apm_get_audioreach_graph()

Marek Vasut (1):
      ASoC: doc: Capitalize RESET line name

Mark Brown (1):
      ASoC: rockchip-i2s: Undo BCLK pinctrl changes

Martin Povišer (2):
      ASoC: tas2764: Add post reset delays
      ASoC: tas2764: Fix and extend FSYNC polarity handling

Oder Chiou (1):
      ASoC: rt5640: Fix the wrong state of JD1 and JD2

Peter Ujfalusi (2):
      ASoC: Intel: Skylake: Correct the ssp rate discovery in skl_get_ssp_clks()
      ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array

Sascha Hauer (2):
      ASoC: audio_graph_card2: Fix port numbers in example
      ASoC: tlv320adcx140: Fix tx_mask check

Yassine Oudjana (1):
      ASoC: wcd9335: Use int array instead of bitmask for TX mixers

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |   8 +-
 Documentation/sound/soc/dai.rst                    |   2 +-
 sound/soc/codecs/arizona.c                         |   4 +-
 sound/soc/codecs/cs47l92.c                         |   8 +-
 sound/soc/codecs/max98396.c                        |  10 +-
 sound/soc/codecs/rt5640.c                          |  30 ++--
 sound/soc/codecs/sgtl5000.c                        |   9 ++
 sound/soc/codecs/sgtl5000.h                        |   1 +
 sound/soc/codecs/tas2764.c                         |  46 +++---
 sound/soc/codecs/tas2764.h                         |   6 +-
 sound/soc/codecs/tlv320adcx140.c                   |  13 +-
 sound/soc/codecs/wcd9335.c                         |  17 ++-
 sound/soc/codecs/wm5102.c                          |  21 ++-
 sound/soc/codecs/wm8998.c                          |  21 ++-
 sound/soc/generic/audio-graph-card2.c              |   6 +-
 sound/soc/intel/boards/sof_rt5682.c                |  10 +-
 sound/soc/intel/skylake/skl-nhlt.c                 |  40 ++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   1 +
 sound/soc/rockchip/rockchip_i2s.c                  | 160 ++++-----------------
 sound/soc/ti/omap-mcbsp-priv.h                     |   2 -
 sound/soc/ti/omap-mcbsp-st.c                       |  14 +-
 sound/soc/ti/omap-mcbsp.c                          |  19 +--
 22 files changed, 199 insertions(+), 249 deletions(-)
