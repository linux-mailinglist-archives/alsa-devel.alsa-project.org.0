Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BD1A817D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD7D16D4;
	Tue, 14 Apr 2020 17:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD7D16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876979;
	bh=Lj2yY7UEPzrUuqmj/vnCjc7eeYmjkArh33MRXNAcLtg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=r7dWDIjxBMvUOe33wHrrjmQRHp/aELKxZqdBJCmMrJvusv86mJ8HLFwexLpbSkYb/
	 Wcesc3AHSiFE04S1dPRJBDrqO1JlkaNiTjTpBonnt2/ScnDe7aorQPlAWX1anpphDQ
	 YwL6BtQjjhEYZFOK6nTkBpwZMO4IvScn6o5trG1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE73EF8043C;
	Tue, 14 Apr 2020 16:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C33F80437; Tue, 14 Apr 2020 16:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52044F8042B
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52044F8042B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ooriBqOX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DA0320578;
 Tue, 14 Apr 2020 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875749;
 bh=Lj2yY7UEPzrUuqmj/vnCjc7eeYmjkArh33MRXNAcLtg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ooriBqOXSNh6NMB+Df3+lRVU9qcS+vC7cnzLe5lAvW+ECzAglEZn3Q8hG5dBf3BTh
 SMnO+neOp9BZVME/VsC8twY+rWHuGNoje70zIFuZFXIIJA+ffVewjUaNz7zmHummuz
 E10LJTyu3zAemUui4UAOI4T9RCnKUM3R+fgtqht4=
Date: Tue, 14 Apr 2020 15:49:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: codecs: rt1308-sdw: reduce verbosity" to the asoc tree
In-Reply-To: <20200409184416.15591-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409184416.15591-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

   ASoC: codecs: rt1308-sdw: reduce verbosity

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

From 110f44c2ed1be38efff72f078134aea6678adaa8 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 9 Apr 2020 13:44:13 -0500
Subject: [PATCH] ASoC: codecs: rt1308-sdw: reduce verbosity

These messages are generated at each enumeration, this is
overkill. Move to dev_dbg

[   86.481709] rt1308 sdw:1:25d:1308:0: rt1308_io_init m_btl_l=0xffee, m_btl_r=0xffff
[   86.481714] rt1308 sdw:1:25d:1308:0: rt1308_io_init c_btl_l=0x28c, c_btl_r=0x113

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409184416.15591-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index a5a7e46de246..1502a22b0d4a 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -235,9 +235,9 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	efuse_c_btl_r = tmp;
 	regmap_read(rt1308->regmap, 0xc872, &tmp);
 	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
-	dev_info(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
+	dev_dbg(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
 		efuse_m_btl_l, efuse_m_btl_r);
-	dev_info(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
+	dev_dbg(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
 		efuse_c_btl_l, efuse_c_btl_r);
 
 	/* initial settings */
-- 
2.20.1

