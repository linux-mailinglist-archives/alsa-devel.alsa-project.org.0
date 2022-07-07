Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A8E56A902
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 19:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412231652;
	Thu,  7 Jul 2022 19:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412231652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657213464;
	bh=unWT6rfv50r5RCW2IbjYv5p6GoRlJhCvBsvJT/NarOg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dza6RvdxJhgl5CQJ0s84itwqFHC6NKO1rDWz+ELQDCG2n1Rw4hnTrPmhTAW6kpXTr
	 wNWwXsTNXJJOYuMBRqt2SasdUcg4r76Hc3vKR/lqB330zdo4kNbkOf+mWIyNqxiw5f
	 Hc+QFaAvPPemlB30xD/0Ao/0puu4cUhYFMdrPEW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 987D1F8028D;
	Thu,  7 Jul 2022 19:03:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CDDAF8016A; Thu,  7 Jul 2022 19:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 025EEF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 19:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 025EEF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lkx5c99t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB24DB822A3;
 Thu,  7 Jul 2022 17:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7EAC341C0;
 Thu,  7 Jul 2022 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657213394;
 bh=unWT6rfv50r5RCW2IbjYv5p6GoRlJhCvBsvJT/NarOg=;
 h=From:To:Cc:Subject:Date:From;
 b=lkx5c99tWnaHBkUKIfSIMrIdUhxGZYu25pNZAxGzuyCm+2586Bb4RA8Ye09kwnopp
 QUkCJNSBMPEViJ8KMYcZaOB9KXCEt7AuXp6W7vYw1gQvE3vRNTlJed33r6rRe8Q5uP
 unzbAKoPV05qHtRErxqbSK4204MDsx4RCkoOOLpcFvryjXKP40/yC4lHs6ZHUTF4MI
 dg/o79gYs8ShxIbBMXiD7gS23XvCkHCpxWG8/tMr0TVfCn2Oz1MFyG/DcLs8gPPDIC
 lGZDpSktTu2xHXtyyHE4GWKDsIR469cWASmsps/CwimabybVv/fQYzBlXn2tCLaPE+
 beZj9sdTOCw1Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.19-rc4
Date: Thu, 07 Jul 2022 18:03:09 +0100
Message-Id: <20220707170314.1B7EAC341C0@smtp.kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc4

for you to fetch changes up to fc976f5629afb4160ee77798b14a693eac903ffd:

  ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array (2022-07-07 17:16:40 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.19

Quite a large batch due to things building up for a couple of weeks but
all driver specific apart from Marek's documentation fix.

----------------------------------------------------------------
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

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  8 ++--
 Documentation/sound/soc/dai.rst                    |  2 +-
 sound/soc/codecs/arizona.c                         |  4 +-
 sound/soc/codecs/cs47l92.c                         |  8 +++-
 sound/soc/codecs/max98396.c                        | 10 +++--
 sound/soc/codecs/rt5640.c                          | 30 ++++++++++----
 sound/soc/codecs/sgtl5000.c                        |  9 +++++
 sound/soc/codecs/sgtl5000.h                        |  1 +
 sound/soc/codecs/tas2764.c                         | 46 +++++++++++++---------
 sound/soc/codecs/tas2764.h                         |  6 +--
 sound/soc/codecs/tlv320adcx140.c                   | 13 +++---
 sound/soc/codecs/wcd9335.c                         | 17 +++++---
 sound/soc/codecs/wm5102.c                          | 21 ++++++++--
 sound/soc/codecs/wm8998.c                          | 21 ++++++----
 sound/soc/generic/audio-graph-card2.c              |  6 +--
 sound/soc/intel/boards/sof_rt5682.c                | 10 ++---
 sound/soc/intel/skylake/skl-nhlt.c                 | 40 +++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.c                       |  1 +
 sound/soc/ti/omap-mcbsp-priv.h                     |  2 -
 sound/soc/ti/omap-mcbsp-st.c                       | 14 +------
 sound/soc/ti/omap-mcbsp.c                          | 19 +--------
 21 files changed, 168 insertions(+), 120 deletions(-)
