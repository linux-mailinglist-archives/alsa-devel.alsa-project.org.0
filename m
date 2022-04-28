Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304C513251
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 13:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB271630;
	Thu, 28 Apr 2022 13:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB271630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651144774;
	bh=YV8ophdEpyxSpl0PF6YucXJa2fw4Wagyk0TMapaOqdo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X5PwLFoe+fFQ/dgaapYXklzFiP8uDoe7OvaRfPGNvAvf+VAu5/go3R7fYDALCLEMf
	 K5pZmeMrfzqGadpUDMqkp0g5gUidgwDkS5NTRGN+TCm8TGnaF1iHJb+XbLrShTKO8+
	 6vwuhIzMUNv9S5O9L8YLBf0mwoHU9mHseBgN6Ep0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3A7F80311;
	Thu, 28 Apr 2022 13:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82418F800AE; Thu, 28 Apr 2022 13:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D05BFF800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 13:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05BFF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FK5rG6YK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAD4361F37;
 Thu, 28 Apr 2022 11:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F52C385A0;
 Thu, 28 Apr 2022 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651144704;
 bh=YV8ophdEpyxSpl0PF6YucXJa2fw4Wagyk0TMapaOqdo=;
 h=From:To:Cc:Subject:Date:From;
 b=FK5rG6YKjfXto7mi7SQOTCW2GaJttfEsIrVPSyIkRB9d4fsXwrbAwnkVM7TTWLx6o
 MBKIsWUfVXb0U/RwUQeR9kkUhDulF0J24sDlDNdLI0uvRFXBJHv8JVMIr9vL25opQl
 GT0JI9SyhCl7mjebR95e1B4vi781WTwWiUN0rVjjwXj5qmSAHll05JSFPYDMpEC8rB
 ycqcLnCjl6KQxfa/ixR+0qX6k49dRiaL/Wpp2OZwRApE3SbDgn1j0C2CQsJWAz+nzX
 Z3Kfqe9stA4cHRtT1rQvCcxTAGzByn0edLFWzZ9Kn23yEuCJXIwbhZvsPb5QaNitl4
 VHyFPVzKhqC4Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.18-rc4
Date: Thu, 28 Apr 2022 12:18:13 +0100
Message-Id: <20220428111823.D6F52C385A0@smtp.kernel.org>
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

The following changes since commit 5b933c7262c5b0ea11ea3c3b3ea81add04895954:

  firmware: cs_dsp: Fix overrun of unterminated control name string (2022-04-12 17:57:04 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.18-rc4

for you to fetch changes up to c61711c1c95791850be48dd65a1d72eb34ba719f:

  ASoC: SOF: Fix NULL pointer exception in sof_pci_probe callback (2022-04-27 14:15:21 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.18

A larger collection of fixes than I'd like, mainly because mixer-test
is making it's way into the CI systems and turning up issues on a wider
range of systems.  The most substantial thing though is a revert and an
alternative fix for a dmaengine issue where the fix caused disruption
for some other configurations, the core fix is backed out an a driver
specific thing done instead.

----------------------------------------------------------------
Ajit Kumar Pandey (1):
      ASoC: SOF: Fix NULL pointer exception in sof_pci_probe callback

ChiYuan Huang (1):
      ASoC: rt9120: Correct the reg 0x09 size to one byte

Codrin Ciubotariu (2):
      ASoC: atmel: mchp-pdmc: set prepare_slave_config
      ASoC: dmaengine: Restore NULL prepare_slave_config() callback

Mark Brown (8):
      ASoC: wm8958: Fix change notifications for DSP controls
      ASoC: da7219: Fix change notifications for tone generator frequency
      ASoC: meson: Fix event generation for AUI ACODEC mux
      ASoC: meson: Fix event generation for AUI CODEC mux
      ASoC: meson: Fix event generation for G12A tohdmi mux
      ASoC: max98090: Reject invalid values in custom control put()
      ASoC: max98090: Generate notifications on changes for custom control
      ASoC: ops: Validate input values in snd_soc_put_volsw_range()

Neil Armstrong (2):
      ASoC: meson: axg-tdm-interface: Fix formatters in trigger"
      ASoC: meson: axg-card: Fix nonatomic links

Olivier Moysan (1):
      ASoC: simple-card-utils: fix sysclk shutdown

Pierre-Louis Bossart (1):
      ASoC: soc-ops: fix error handling

 sound/soc/atmel/mchp-pdmc.c           |  1 +
 sound/soc/codecs/da7219.c             | 14 ++++++++++----
 sound/soc/codecs/max98090.c           |  5 ++++-
 sound/soc/codecs/rt9120.c             |  1 -
 sound/soc/codecs/wm8958-dsp2.c        |  8 ++++----
 sound/soc/generic/simple-card-utils.c |  2 +-
 sound/soc/meson/aiu-acodec-ctrl.c     |  2 +-
 sound/soc/meson/aiu-codec-ctrl.c      |  2 +-
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/axg-tdm-interface.c   | 26 +++++---------------------
 sound/soc/meson/g12a-tohdmitx.c       |  2 +-
 sound/soc/soc-generic-dmaengine-pcm.c |  6 +++---
 sound/soc/soc-ops.c                   | 20 ++++++++++++++++++--
 sound/soc/sof/sof-pci-dev.c           |  5 +++++
 14 files changed, 54 insertions(+), 41 deletions(-)
