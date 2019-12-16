Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C818F1204E9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70ED21655;
	Mon, 16 Dec 2019 13:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70ED21655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576498057;
	bh=oQPNvTCkMzZkD5IlavbLtkwygvFya8V6p170x1A3qDA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P2Kq+ROpmUej650fm8aySbXgehATKaciYuCSZpdfpi4Qyi1tABgGDfU5mXLoNgXCs
	 1QfBAAA8KCij1dbL2iZGJMFKc3c3N6Nyn13SYYOWFMsZ7130d86yZlLvOfwLdnoI7o
	 aVggeKR/mWtHjA0+kQpfvRwe5NaVP5zdXr0D+FAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1032F80266;
	Mon, 16 Dec 2019 13:05:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B299F80265; Mon, 16 Dec 2019 13:05:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A9DACF8014F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9DACF8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74BD61045;
 Mon, 16 Dec 2019 04:05:04 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E92673F719;
 Mon, 16 Dec 2019 04:05:03 -0800 (PST)
Date: Mon, 16 Dec 2019 12:05:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736dp59ih.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-8736dp59ih.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: ti: rx51: use
	snd_soc_dai_link_component for codec_conf" to the asoc tree
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

   ASoC: ti: rx51: use snd_soc_dai_link_component for codec_conf

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From e3c157c934fbb99054572a81ccc9da0a97227689 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 13 Dec 2019 09:55:50 +0900
Subject: [PATCH] ASoC: ti: rx51: use snd_soc_dai_link_component for codec_conf

We can use snd_soc_dai_link_component to specify codec_conf.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736dp59ih.wl-kuninori.morimoto.gx@renesas.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/rx51.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 588f680a9c24..fdb0dc85fe67 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -328,11 +328,11 @@ static struct snd_soc_aux_dev rx51_aux_dev[] = {
 
 static struct snd_soc_codec_conf rx51_codec_conf[] = {
 	{
-		.dev_name = "tlv320aic3x-codec.2-0019",
+		.dlc = COMP_CODEC_CONF("tlv320aic3x-codec.2-0019"),
 		.name_prefix = "b",
 	},
 	{
-		.dev_name = "tpa6130a2.2-0060",
+		.dlc = COMP_CODEC_CONF("tpa6130a2.2-0060"),
 		.name_prefix = "TPA6130A2",
 	},
 };
@@ -397,8 +397,8 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		}
 		rx51_aux_dev[0].dlc.name = NULL;
 		rx51_aux_dev[0].dlc.of_node = dai_node;
-		rx51_codec_conf[0].dev_name = NULL;
-		rx51_codec_conf[0].of_node = dai_node;
+		rx51_codec_conf[0].dlc.name = NULL;
+		rx51_codec_conf[0].dlc.of_node = dai_node;
 
 		dai_node = of_parse_phandle(np, "nokia,headphone-amplifier", 0);
 		if (!dai_node) {
@@ -407,8 +407,8 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		}
 		rx51_aux_dev[1].dlc.name = NULL;
 		rx51_aux_dev[1].dlc.of_node = dai_node;
-		rx51_codec_conf[1].dev_name = NULL;
-		rx51_codec_conf[1].of_node = dai_node;
+		rx51_codec_conf[1].dlc.name = NULL;
+		rx51_codec_conf[1].dlc.of_node = dai_node;
 	}
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
