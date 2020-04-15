Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BACBD1AB43A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 01:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2890F1663;
	Thu, 16 Apr 2020 01:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2890F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586993653;
	bh=nlIoWzdqyk42cQzlK0nulsxbUgd+cIzM+bIMPUFDAlI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bumsU+taOWYWJj2DAL1Nztr4LyWWtDPAx+PG1vHIyXL0M41KxdnPiDJO2BG4uS254
	 SnKobZzOkUa2Ov08W6MKl3tQR8v4G6rkFwNGqVXjhmfdps+9vfFTCq9979EWJuJW6F
	 9bJD6BI/KBdX+N/v4ty+z5D6GgGb6tEWJNMkO0V0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A58F80245;
	Thu, 16 Apr 2020 01:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 499EEF80245; Thu, 16 Apr 2020 01:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26F1EF80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 01:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26F1EF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGqxd4fp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C30EF2076A;
 Wed, 15 Apr 2020 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586993543;
 bh=nlIoWzdqyk42cQzlK0nulsxbUgd+cIzM+bIMPUFDAlI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=WGqxd4fpo3ZsEYh6aXxSVCIdrT1K8T2znRG8hhVsfsxr9XhPD5uTNpqTRiX0NjMWU
 gp2wkjEPfL2kfMKCD0erzZgzVBlKSKP5xKrVqbYJVPMmZgCRHLgCEBA6wOW6GbprWh
 llu3dxu34Mv9J8at2M2E8C2ruA41A5STQW6x34T0=
Date: Thu, 16 Apr 2020 00:32:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Applied "ASoC: wcd9335: Fix missing regmap requirement" to the asoc
 tree
In-Reply-To: <8c0b22e2-2c67-8d45-a57d-dfc54043fbc9@free.fr>
Message-Id: <applied-8c0b22e2-2c67-8d45-a57d-dfc54043fbc9@free.fr>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

The patch

   ASoC: wcd9335: Fix missing regmap requirement

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 741bfce676b765f01396e148862740caec91338c Mon Sep 17 00:00:00 2001
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Date: Wed, 10 Apr 2019 16:23:38 +0200
Subject: [PATCH] ASoC: wcd9335: Fix missing regmap requirement

wcd9335.c: undefined reference to 'devm_regmap_add_irq_chip'

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 419114edfd57..667fc1d59e18 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1151,6 +1151,7 @@ config SND_SOC_WCD9335
 	tristate "WCD9335 Codec"
 	depends on SLIMBUS
 	select REGMAP_SLIMBUS
+	select REGMAP_IRQ
 	help
 	  The WCD9335 is a standalone Hi-Fi audio CODEC IC, supports
 	  Qualcomm Technologies, Inc. (QTI) multimedia solutions,
-- 
2.20.1

