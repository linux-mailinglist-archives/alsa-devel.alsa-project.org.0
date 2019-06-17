Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B9486F6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FBAC1715;
	Mon, 17 Jun 2019 17:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FBAC1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785166;
	bh=UbHee77tRmjuD6fJHOB/EC86OmNlDuiyehfIB9XweSE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h0sNSDhjNtyOHK8X3Y7VzGYszt7tK+sLK/kO7hl9J+YA1Uz69fU06QFi7vkB70M4S
	 La0IQtM956R8979pzHVBO92rQwXM/PDT0qzW8LgU3skJCbZ29Skx6YSStD4yQylRy/
	 DtyURf4g7afyklY40OaKfjro3Wda/eqT/bPG0cgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D47D8F89733;
	Mon, 17 Jun 2019 17:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0454EF896DA; Mon, 17 Jun 2019 17:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F5E9F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5E9F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jtD/gwDG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=it1kr7G1wlh1P22+SaO0uRfhU0JKkzwSA2wuovs4jF0=; b=jtD/gwDGkvm6
 R6q64Us9xmw21xC57TOxF42gxJkYUXBIC4wudEgmZFXBjePk9E1sWv2dyJvLsPslx7MWstlHX31oy
 eDD0eQQjGXR1JABfOt5TmO4Mvo4Oxa1/bk0EQA0ypCPfzLe12aY+567WK+kbb/DCcVHuU4PHGh6Us
 NOPRQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUV-0001wj-KA; Mon, 17 Jun 2019 15:24:15 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2AD7D440046; Mon, 17 Jun 2019 16:24:15 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20190617144048.5450-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190617152415.2AD7D440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:15 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: Add missing newline at end of file" to
	the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Add missing newline at end of file

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 501e94b52aeda5841a60ceead5984ff575aeefa0 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 17 Jun 2019 16:40:48 +0200
Subject: [PATCH] ASoC: Add missing newline at end of file

"git diff" says:

    \ No newline at end of file

after modifying the files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/Makefile | 2 +-
 sound/soc/tegra/Makefile           | 2 +-
 sound/usb/bcd2000/Makefile         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
index 9ab90433a8d7..acbe01e9e928 100644
--- a/sound/soc/mediatek/common/Makefile
+++ b/sound/soc/mediatek/common/Makefile
@@ -3,4 +3,4 @@
 snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o
 obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
 
-obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
\ No newline at end of file
+obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 2329b72c93e3..c84f183919f2 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -37,4 +37,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_WM9712) += snd-soc-tegra-wm9712.o
 obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
 obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
-obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
\ No newline at end of file
+obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
diff --git a/sound/usb/bcd2000/Makefile b/sound/usb/bcd2000/Makefile
index f09ccc0af6ff..0a100310a671 100644
--- a/sound/usb/bcd2000/Makefile
+++ b/sound/usb/bcd2000/Makefile
@@ -1,3 +1,3 @@
 snd-bcd2000-y := bcd2000.o
 
-obj-$(CONFIG_SND_BCD2000) += snd-bcd2000.o
\ No newline at end of file
+obj-$(CONFIG_SND_BCD2000) += snd-bcd2000.o
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
