Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A387AE230F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 21:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3472F1662;
	Wed, 23 Oct 2019 21:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3472F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857398;
	bh=GAxETVwsYVwwWLrkOk9ORTgRBBrflsk36YdKEuQeuxA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Szm9QJOzCDWji83kiRAMs8dz68PFtuYRDI3jLh9SXmtMAOZ6teIoqSUZwoE48YI6h
	 H1dA/ApmdeFQtRTWdJWTjkkUH9cxZ8g9HZMYu2Zowri9McyizYeq1CZd01zk79L4VW
	 M51WOcqh7nDukAC8SgsXRnQDPrgin+CPJWa+Qvo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D43F80678;
	Wed, 23 Oct 2019 20:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AEBF80611; Wed, 23 Oct 2019 20:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04066F805FB
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04066F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rmUuRnN1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=k/lGzSE95qaQc9LVPN5qXwbt/UcIqtdwXTpshhYt58w=; b=rmUuRnN1eEog
 /IbKf5Uzgyosjs0QBqetAmV5uIX+mWYy6Y238FHhDe2cIEeBASvQXVB/9cXbEBvmVx484sVjOufpb
 wGOuttvp2WFb3qqQpQZGBM/yw8VH0WGJynKmdREz5nRIqjJmYN98KjQWdKJAwe/3R4TPAXcAKared
 9UijM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLni-0001Ax-PV; Wed, 23 Oct 2019 18:56:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3A39E2743293; Wed, 23 Oct 2019 19:56:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mao Wenan <maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185606.3A39E2743293@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, yuehaibing@huawei.com,
 gregkh@linuxfoundation.org, tiwai@suse.com, kernel-janitors@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC
	dependency" to the asoc tree
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

   ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From ef5dee551e3e6568fb203ea57fa24f55cb64d451 Mon Sep 17 00:00:00 2001
From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 23 Oct 2019 14:31:03 +0800
Subject: [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency

If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
below errors can be seen:
sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'

This is because it will select SND_SOC_CROS_EC_CODEC
after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
but SND_SOC_CROS_EC_CODEC depends on CROS_EC.

Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
Link: https://lore.kernel.org/r/20191023063103.44941-1-maowenan@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 8b29f3979899..a656d2014127 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -125,7 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
-	select SND_SOC_CROS_EC_CODEC
+	select SND_SOC_CROS_EC_CODEC if CROS_EC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the MT6358 TS3A227E MAX98357A audio codec.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
