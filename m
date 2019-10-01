Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BBC33CD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFDE1661;
	Tue,  1 Oct 2019 14:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFDE1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931523;
	bh=Zc7dggzRBUkCtRr4wWozah1DX6yXY/2/B715BzSbFCw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dbi4Z1nb0S+aQPhtOAGCdApdO4H8XO9iYyHHYmwZfaRYenxbpx0NPeRj8jXn47P2f
	 4teiwzgluelT5o8f2FUylh1Q9JEFrgU5KypUo366fC8Tdm/7p4rvVWJaaCjNOkJrIb
	 E22G2cIvZhpN7bRwmS9rNJTwctissAprvwTAfNsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A07F805FB;
	Tue,  1 Oct 2019 13:48:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27154F8053A; Tue,  1 Oct 2019 13:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC42EF80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC42EF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ki5GK9tQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UA6ovt4bP3x9wo+srYVbVc8BMJqwyU6Aa+PaeuHBpyM=; b=ki5GK9tQTR8e
 tNzZxGB27CqWgI9N2KDgasLA9J+HGRx9yO+iYZJHQlU38QZ2QWJeuNl7u5Ae1H3UYikCZ0whGyeax
 AVSRSECZVlLBwxiJK6Uk5GZJX/IRrWIJsaJm1HvAjSNImf5IsTZ/6fRCQV1cwSSFoJynxDZeqApju
 Yevg8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGdP-0004ca-1P; Tue, 01 Oct 2019 11:48:03 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7E01F27429C0; Tue,  1 Oct 2019 12:48:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
In-Reply-To: <1569702150-11976-1-git-send-email-sathyanarayana.nujella@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114802.7E01F27429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:48:02 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 ryans.lee@maximintegrated.com, harshapriya.n@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: max98373: check for device node before
	parsing" to the asoc tree
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

   ASoC: max98373: check for device node before parsing

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 4bb41984bf2f4cb8ed6ec1579d317790bd941788 Mon Sep 17 00:00:00 2001
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Date: Sat, 28 Sep 2019 13:22:30 -0700
Subject: [PATCH] ASoC: max98373: check for device node before parsing

Below Oops is caused in a system which uses ACPI instead of device node:

of_get_named_gpiod_flags: can't parse 'maxim,reset-gpio' property of node '(null)[0]'
BUG: kernel NULL pointer dereference, address: 0000000000000010

This patch avoids NULL pointer deferencing by adding a check before parsing
and initializes to make reset-gpio pin as invalid.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Link: https://lore.kernel.org/r/1569702150-11976-1-git-send-email-sathyanarayana.nujella@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98373.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index e609abcf3220..eb709d528259 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -901,16 +901,20 @@ static void max98373_slot_config(struct i2c_client *i2c,
 		max98373->i_slot = value & 0xF;
 	else
 		max98373->i_slot = 1;
-
-	max98373->reset_gpio = of_get_named_gpio(dev->of_node,
+	if (dev->of_node) {
+		max98373->reset_gpio = of_get_named_gpio(dev->of_node,
 						"maxim,reset-gpio", 0);
-	if (!gpio_is_valid(max98373->reset_gpio)) {
-		dev_err(dev, "Looking up %s property in node %s failed %d\n",
-			"maxim,reset-gpio", dev->of_node->full_name,
-			max98373->reset_gpio);
+		if (!gpio_is_valid(max98373->reset_gpio)) {
+			dev_err(dev, "Looking up %s property in node %s failed %d\n",
+				"maxim,reset-gpio", dev->of_node->full_name,
+				max98373->reset_gpio);
+		} else {
+			dev_dbg(dev, "maxim,reset-gpio=%d",
+				max98373->reset_gpio);
+		}
 	} else {
-		dev_dbg(dev, "maxim,reset-gpio=%d",
-			max98373->reset_gpio);
+		/* this makes reset_gpio as invalid */
+		max98373->reset_gpio = -1;
 	}
 
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
