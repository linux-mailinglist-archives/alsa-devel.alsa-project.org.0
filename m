Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A947B200
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 18:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 279B3170B;
	Mon, 20 Dec 2021 18:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 279B3170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640020768;
	bh=LSrdtoOw92liqlW+yLB1vqdkacWkJ6t5NxYfBvqc6dM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HFWgzXexzdf2yRSta6Ml2eWWr7U2PHp3z5Ji4gitZQ3zHLhNFr8NBROmTv+KOCeS8
	 bJCwVxRlM3MwmJkkQKG4OyT3q3aCtSrtODgdX/UoMSx6gkSpq9DsBdiHkztOxOOVoU
	 7d2qBxXSYGOXKzLRMRp9dEApESYhPteOMHqPpF3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85895F80117;
	Mon, 20 Dec 2021 18:18:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 601B1F8012A; Mon, 20 Dec 2021 18:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D93BDF8011F
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 18:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D93BDF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pL+0R7Ip"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FAD561264;
 Mon, 20 Dec 2021 17:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09FBC36AE7;
 Mon, 20 Dec 2021 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640020684;
 bh=LSrdtoOw92liqlW+yLB1vqdkacWkJ6t5NxYfBvqc6dM=;
 h=From:To:Cc:Subject:Date:From;
 b=pL+0R7IpQW2mOAv8ZuAQ6Wx4P0jKuXjA4wSWpOnnAdi42bRn5813UmqQoxR9vzKYs
 BZEeTUHTpfS7d5nAu+RSwOxrs9+NHCCyaKx851tZKRGAm8YPvnMWZBmmR36N9cV1Ny
 bPaSWQ0b4EOeoH92Rq8Dz/yEP+oW1O4RLITpiBUPRsAY1TMCSuWnT8Mg0c13ymUOIe
 FxPS/wbSwCN/O6fTEdFugWVXEheN6XLR2IdDKSkVme8zwCUKx3xGAJ3gu9xSy2d3DO
 qg2n1awetVpd1pegbEj7xS6dq6krJAvk7aA6Fzjyjllb3wBoMD+1wdkGIedLJ/JeEq
 Gs/IhZryrKFQg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.16-rc6
Date: Mon, 20 Dec 2021 17:17:48 +0000
Message-Id: <20211220171803.D09FBC36AE7@smtp.kernel.org>
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

The following changes since commit 3fc27e9a1f619b50700f020e6cd270c1b74755f0:

  ASoC: codecs: wsa881x: fix return values from kcontrol put (2021-12-01 14:13:53 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.16-rc6

for you to fetch changes up to ee907afb0c39a41ee74b862882cfe12820c74b98:

  ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s (2021-12-14 17:15:32 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.16

This is a relatively large set of driver specific changes so it may make
sense to hold off to v5.17, though picking some over might be good.
It's a combination of new device IDs and fixes for various driver
specific things which are all small and of the usual "really bad if
you're running into them" level, especially the Tegra ones.

----------------------------------------------------------------
Derek Fang (1):
      ASoC: rt5682: fix the wrong jack type detected

Dmitry Osipenko (2):
      ASoC: tegra: Add DAPM switches for headphones and mic jack
      ASoC: tegra: Restore headphones jack name on Nyan Big

Kai Vehmanen (2):
      ASoC: SOF: Intel: pci-tgl: add ADL-N support
      ASoC: SOF: Intel: pci-tgl: add new ADL-P variant

Martin Blumenstingl (2):
      ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
      ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s

Martin Povišer (1):
      ASoC: tas2770: Fix setting of high sample rates

 sound/soc/codecs/rt5682.c            |  4 ++++
 sound/soc/codecs/tas2770.c           |  4 ++--
 sound/soc/meson/aiu-encoder-i2s.c    | 33 ---------------------------------
 sound/soc/meson/aiu-fifo-i2s.c       | 19 +++++++++++++++++++
 sound/soc/meson/aiu-fifo.c           |  6 ++++++
 sound/soc/sof/intel/pci-tgl.c        |  4 ++++
 sound/soc/tegra/tegra_asoc_machine.c | 11 ++++++++++-
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 8 files changed, 46 insertions(+), 36 deletions(-)
