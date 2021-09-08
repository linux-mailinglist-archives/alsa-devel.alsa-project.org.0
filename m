Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02A403CBB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7D416BE;
	Wed,  8 Sep 2021 17:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7D416BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631115882;
	bh=V2jc5OP5Ia+haBeNIWe3g7GBCyiqbHMnHXzCna/S1a8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pCsbPC9HQiJMCzIwUpcrPWv98BseKoIZQ84peAto6a+50kBpIUbW6GaJLJ1QjmRr5
	 oLZF5n4XKv7B+Zr0893hzLo7OpzHewSgH/UjDZL22pnDO+qrejoJ86cpgvx4dYElMR
	 5yUchbiBFIKitU7a2lejyZmTL5mgwako1gcEY7sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B786F8049C;
	Wed,  8 Sep 2021 17:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E2E2F802E7; Wed,  8 Sep 2021 17:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB0B3F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0B3F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VcycVSJ0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A8C961132;
 Wed,  8 Sep 2021 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631115793;
 bh=V2jc5OP5Ia+haBeNIWe3g7GBCyiqbHMnHXzCna/S1a8=;
 h=From:To:Cc:Subject:Date:From;
 b=VcycVSJ04MeMXsAOk48H5IOqk+pIm0Z8BIU6iWj+B4q+irMkihIFXullq+n84Y/XH
 dqp59b9k9cGq03rdkfoqJTBvXp2pm4nBibGoV5aO5eZTwU42420GGm9Qp2Zi1PmGev
 ukUcmJOqsbIxzU6LhKLMkWfm7kOepanOvrgSxjV94SkQp+hezNgOKCbOJ6SdHKvJyB
 HIgo6Yvd4C9it1SRQPJfxfthnCrnNHvgz5aXum06CZAv3CgGrGz0ucWu+U3maPJsEO
 248Zgeu2V5q7Oo02eGTGxdZgn5aR/OrcnpiMff9roQru+h6P/fWo3qe3hIbme/cCJ4
 9D2ob670xlICw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.15-rc1
Date: Wed, 08 Sep 2021 16:42:25 +0100
Message-Id: <20210908154313.1A8C961132@mail.kernel.org>
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

The following changes since commit 38b7673000949ca784fcb8a9feb70d2a802befa6:

  Merge remote-tracking branch 'asoc/for-5.15' into asoc-linus (2021-08-30 12:30:33 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.15-rc1

for you to fetch changes up to fcb958ee8e832e9cdf43408535207e15f14af755:

  ASoC: rockchip: i2s: Fix concurrency between tx/rx (2021-09-03 16:19:01 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.15

A collection of fixes that came in during the merge window, nothing too
remarkable but a reasonably large number of fixes.

----------------------------------------------------------------
Colin Ian King (1):
      ASoC: samsung: s3c24xx_simtec: fix spelling mistake "devicec" -> "device"

Geert Uytterhoeven (1):
      ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK

Kuninori Morimoto (1):
      ASoC: audio-graph: respawn Platform Support

Mark Brown (1):
      Merge tag 'asoc-v5.15' into asoc-5.15

Nathan Chancellor (1):
      ASoC: Intel: boards: Fix CONFIG_SND_SOC_SDW_MOCKUP select

Shengjiu Wang (1):
      ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX8ULP

Shuming Fan (1):
      ASoC: rt5682: fix headset background noise when S3 state

Sugar Zhang (1):
      ASoC: rockchip: i2s: Fix concurrency between tx/rx

Trevor Wu (3):
      ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
      ASoC: dt-bindings: mt8195: remove dependent headers in the example
      ASoC: mt8195: correct the dts parsing logic about DPTX and HDMITX

 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |  1 +
 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml  | 40 ++++++++++------------
 sound/soc/codecs/rt5682.c                          |  3 --
 sound/soc/generic/audio-graph-card.c               |  6 ++++
 sound/soc/intel/boards/Kconfig                     |  2 +-
 sound/soc/mediatek/Kconfig                         |  3 +-
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  | 22 ++++++------
 sound/soc/rockchip/rockchip_i2s.c                  |  7 ++++
 sound/soc/samsung/s3c24xx_simtec.c                 |  2 +-
 9 files changed, 47 insertions(+), 39 deletions(-)
