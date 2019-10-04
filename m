Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF0CC245
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 20:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4241683;
	Fri,  4 Oct 2019 20:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4241683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570212146;
	bh=BJSYgLdkyVVx6mQ+PjlBXihcdDmwHcdzFzfyMlA08xc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P9NPghEfCc/2HRPMN9eas10N27oRpx2eKlLRfLen5RokkTLztIaPIZddys4aPdTAh
	 QPmtOJrWoY7WJ/L3mkUcUswA4foKEkbf0r/Oz/9feCSiBWayZfilnxgPO9NLngilkD
	 E31PZjzrpaaDx/CgtiAUuyh8Tu0C0p+Tv7Vw1lck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B77F80716;
	Fri,  4 Oct 2019 19:53:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F3FAF80612; Fri,  4 Oct 2019 19:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8637F805FD
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8637F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DGL87zhY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9rMD/iIRt+AstMhHvit3hB7IN7ex8Ugxf6OLt9MXTjw=; b=DGL87zhYsfQq
 Q6fWG2jJZXD8hMQtWWddWRzLFW2gdL8ciheUJKNIb09GW5eDofezelfeLSj5rvsdlhSOQsVyVYlaI
 mwGdxG2YpnKu8rup3WlrOgGYyf9Bea8/TiFfC5LkDYc5tYd11TuarP1rA9saitkF+d0O9G5opUCVs
 mdc2k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRkq-0003v7-5d; Fri, 04 Oct 2019 17:52:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A47FE2741EF2; Fri,  4 Oct 2019 18:52:35 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: kbuild test robot <lkp@intel.com>
In-Reply-To: <20191001175504.ufhyxh66psrht42k@332d0cec05f4>
X-Patchwork-Hint: ignore
Message-Id: <20191004175235.A47FE2741EF2@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:35 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Frank Shi <shifu0704@thundersoft.com>,
 kbuild-all@01.org
Subject: [alsa-devel] Applied "tas2770: fix platform_no_drv_owner.cocci
	warnings" to the asoc tree
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

   tas2770: fix platform_no_drv_owner.cocci warnings

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

From 5a7423993007d08bfc7b982451eca0526f51744d Mon Sep 17 00:00:00 2001
From: kbuild test robot <lkp@intel.com>
Date: Wed, 2 Oct 2019 01:55:04 +0800
Subject: [PATCH] tas2770: fix platform_no_drv_owner.cocci warnings

sound/soc/codecs/tas2770.c:796:3-8: No need to set .owner here. The core will do it.

 Remove .owner field if calls are used which set it automatically

Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
CC: Frank Shi <shifu0704@thundersoft.com>
Signed-off-by: kbuild test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/20191001175504.ufhyxh66psrht42k@332d0cec05f4
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 9da88ccb1d51..dbbb21fe0548 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -793,7 +793,6 @@ MODULE_DEVICE_TABLE(of, tas2770_of_match);
 static struct i2c_driver tas2770_i2c_driver = {
 	.driver = {
 		.name   = "tas2770",
-		.owner  = THIS_MODULE,
 		.of_match_table = of_match_ptr(tas2770_of_match),
 	},
 	.probe      = tas2770_i2c_probe,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
