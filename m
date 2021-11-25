Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464C45DB1D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E90D187A;
	Thu, 25 Nov 2021 14:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E90D187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637846992;
	bh=1f6683xa8qHkE3G5TVSQPN8coGt8FCpLAbglzym7Yv0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MJ9EiGmGu6IavNc9oNGirCqwNe9dPLccTbHKKE1X96H59WWz96425aQTKtSwYVCww
	 7SsDML74DQItPq0bOtIsSRU5vlezIA9nlUIJCSVZYxxYCH032bdzWESCfI41amXnXa
	 QEXyFk4NxoWkxgYgZ014KRE37oixfLc9eGbCxKWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8502BF804AB;
	Thu, 25 Nov 2021 14:28:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 167F4F8049E; Thu, 25 Nov 2021 14:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9E1FF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E1FF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H9i3Tavc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 111ED60273;
 Thu, 25 Nov 2021 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637846902;
 bh=1f6683xa8qHkE3G5TVSQPN8coGt8FCpLAbglzym7Yv0=;
 h=From:To:Cc:Subject:Date:From;
 b=H9i3Tavc+ax4fJty7/veyTCDpmfgnJADoPVNpRn9eINGcvTzgjD9MWxKlnndbhifL
 ricCu6n4OtY/BgQn9s4MCAvyFH3Vh76/3dWgmi+R56M49VvvxR7eW8GJgdYixd5hup
 Na/r4OfBTxG0LD5ufH6h+R5q5/ZH2wCTIoGMCWndFDh5muQha3Wr9FiocSkC91TwVi
 WuPYldGLRxflOlPtDOtczRuPKs/OP0t6KRsS+lIBcwOUxjGA7grT+u1kz9Ex2YcP+Y
 COOo9GZ4FD4lq9L8WpV8ZmiguBldeeJWLw5sBpPDGzkb5HrvyVMJMzMwnfUrSjrFTx
 Zxoi/LzknZeyg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.16-rc3
Date: Thu, 25 Nov 2021 13:28:05 +0000
Message-Id: <20211125132822.111ED60273@mail.kernel.org>
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

The following changes since commit 424fe7edbed18d47f7b97f7e1322a6f8969b77ae:

  ASoC: stm32: i2s: fix 32 bits channel length without mclk (2021-11-17 13:04:38 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.16-rc3

for you to fetch changes up to 86f74ba3fef56dd1cee19b7a15ae27fc0da5bb61:

  ASoC: SOF: hda: reset DAI widget before reconfiguring it (2021-11-24 12:57:11 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.16

There's a large but repetitive set of fixes here for issues with the
Tegra kcontrols not correctly reporting changes to userspace, a fix for
some issues with matching on older x86 platforms introduced during the
merge window together with a set of smaller fixes and one new system
quirk.

----------------------------------------------------------------
Hans de Goede (1):
      ASoC: soc-acpi: Set mach->id field on comp_ids matches

Lucas Tanure (1):
      ASoC: cs35l41: Set the max SPI speed for the whole device

Nicolas Frattaroli (1):
      ASoC: rk817: Add module alias for rk817-codec

Pierre-Louis Bossart (1):
      ASoC: Intel: soc-acpi: add entry for ESSX8336 on CML

Ranjani Sridharan (1):
      ASoC: SOF: hda: reset DAI widget before reconfiguring it

Sameer Pujar (16):
      ASoC: tegra: Fix wrong value type in ADMAIF
      ASoC: tegra: Fix wrong value type in I2S
      ASoC: tegra: Fix wrong value type in DMIC
      ASoC: tegra: Fix wrong value type in DSPK
      ASoC: tegra: Fix wrong value type in SFC
      ASoC: tegra: Fix wrong value type in MVC
      ASoC: tegra: Fix kcontrol put callback in ADMAIF
      ASoC: tegra: Fix kcontrol put callback in I2S
      ASoC: tegra: Fix kcontrol put callback in DMIC
      ASoC: tegra: Fix kcontrol put callback in DSPK
      ASoC: tegra: Fix kcontrol put callback in AHUB
      ASoC: tegra: Fix kcontrol put callback in MVC
      ASoC: tegra: Fix kcontrol put callback in SFC
      ASoC: tegra: Fix kcontrol put callback in AMX
      ASoC: tegra: Fix kcontrol put callback in ADX
      ASoC: tegra: Fix kcontrol put callback in Mixer

 include/sound/soc-acpi.h                          |   2 +-
 sound/soc/codecs/cs35l41-spi.c                    |  32 +--
 sound/soc/codecs/cs35l41.c                        |   7 -
 sound/soc/codecs/cs35l41.h                        |   4 +-
 sound/soc/codecs/rk817_codec.c                    |   1 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c |   6 +
 sound/soc/soc-acpi.c                              |   4 +-
 sound/soc/sof/intel/hda.c                         |   7 +
 sound/soc/tegra/tegra186_dspk.c                   | 181 ++++++++++---
 sound/soc/tegra/tegra210_admaif.c                 | 140 +++++++---
 sound/soc/tegra/tegra210_adx.c                    |   3 +
 sound/soc/tegra/tegra210_ahub.c                   |  11 +-
 sound/soc/tegra/tegra210_amx.c                    |   3 +
 sound/soc/tegra/tegra210_dmic.c                   | 184 +++++++++++---
 sound/soc/tegra/tegra210_i2s.c                    | 296 +++++++++++++++++-----
 sound/soc/tegra/tegra210_mixer.c                  |  26 +-
 sound/soc/tegra/tegra210_mvc.c                    |  30 ++-
 sound/soc/tegra/tegra210_sfc.c                    | 123 ++++++---
 18 files changed, 802 insertions(+), 258 deletions(-)
