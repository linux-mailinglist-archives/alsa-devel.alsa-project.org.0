Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F3FDDDE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A09166A;
	Fri, 15 Nov 2019 13:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A09166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573821011;
	bh=6SuF/FA17TJlyDvAbecLLxTeNtS9iqdg09YC6sr4fko=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pMY3i2XYEH2Jn7g733uJdbGDhCb+LJwZqkIYzhbaEk9mXjWsijbkHLyBKmdgvap9W
	 FVMIjOBmWudtg0+058a8uAbBdIB8ayPdH3U5OxcqCb0yYWBlKBEa/Yu4OFJ+XUiFww
	 gnSyenoX+zdinybWY1GYhYagKTfMcN++wjYNO6BU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AAEF8012F;
	Fri, 15 Nov 2019 13:25:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B643F8010C; Fri, 15 Nov 2019 13:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B19F80107
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B19F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mnFynAlT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qICwKqMRm4yg2Mobp12iIzV+VQB/juSAmGwdio0/GME=; b=mnFynAlTrYRB
 cytoaSOKA8ZeJoWK3vvwmFvrKNUY9ZiWEnWS+UayPDKvWfadrWpSR/5gxz7RrzJylzOLbiiUNMG6A
 PZHb7dQEb6MO9D74N1r9Ye8sbV06EnROVXHdxr1ipo1K5uzrYW10wCccsPRWl64JPnYbgbnUABYdQ
 eqKSw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaer-0000Jv-Ld; Fri, 15 Nov 2019 12:25:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 23ADF27415A7; Fri, 15 Nov 2019 12:25:01 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
In-Reply-To: <20191112190218.282337-1-colin.king@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122501.23ADF27415A7@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:01 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tas2770: clean up an indentation issue"
	to the asoc tree
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

   ASoC: tas2770: clean up an indentation issue

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

From b26eb5173c85082eec7d6e18369f6f9d96bf0b21 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 12 Nov 2019 19:02:18 +0000
Subject: [PATCH] ASoC: tas2770: clean up an indentation issue

There is a block that is indented too deeply, remove
the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20191112190218.282337-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index ad76f22fcfac..54c8135fe43c 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -761,12 +761,12 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
 							  "reset-gpio",
 						      GPIOD_OUT_HIGH);
-		if (IS_ERR(tas2770->reset_gpio)) {
-			if (PTR_ERR(tas2770->reset_gpio) == -EPROBE_DEFER) {
-				tas2770->reset_gpio = NULL;
-				return -EPROBE_DEFER;
-			}
+	if (IS_ERR(tas2770->reset_gpio)) {
+		if (PTR_ERR(tas2770->reset_gpio) == -EPROBE_DEFER) {
+			tas2770->reset_gpio = NULL;
+			return -EPROBE_DEFER;
 		}
+	}
 
 	tas2770->channel_size = 0;
 	tas2770->slot_width = 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
