Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2813140E51
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:51:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D3017F4;
	Fri, 17 Jan 2020 16:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D3017F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276316;
	bh=TDGeh6VVJ4emIaKHVUPr/K6S1lGNsSeIrddHWU5HwoY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WJgUbKHsUmLuVUnjE0coERwRMbx0cn1UC2HW9XkOahGiI7oJLdiD8m9p5GlzuxHDD
	 LFnREbZYXliqByerxg4dENpJ893tTbDAmRMZSN14I+tgDt6u1B3VfBg69fSJrGSqpu
	 yVro+9tAJVQcvHWSxzgcsRJN9W8ZOBZPeRSSqATM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF5A0F802A7;
	Fri, 17 Jan 2020 16:45:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C682F8014B; Fri, 17 Jan 2020 16:44:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A61AF801F8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A61AF801F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vlNXxdig"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YLlnZQ7obo9hm7ntSycOnGTHd4uSo2u5L5NqtVkSEhU=; b=vlNXxdigELV6
 g+TmlfBvaYktTTmvTvB6lO2W01Mpb4sLJoFC4eT8H1IX+DWWgMIyZYRF9NlCFLurMoewuBxZNMCZj
 ENwui7VJMvxkrKTb25IdXUylDXd9EAoxHsIFp/5e3UqL4qr8BnMVFHJ7AS8HK0m42A8LQOcPuPAEU
 r0bMo=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnA-0006s0-1O; Fri, 17 Jan 2020 15:44:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id B1237D02BD9; Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20200117024149.75515-1-weiyongjun1@huawei.com>
Message-Id: <applied-20200117024149.75515-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt715: fix return value check in
	rt715_sdw_probe()" to the asoc tree
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

   ASoC: rt715: fix return value check in rt715_sdw_probe()

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

From f9f5bbf5783cd63369d3e6c8cf27e2bd7c5ac2c3 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 17 Jan 2020 02:41:49 +0000
Subject: [PATCH] ASoC: rt715: fix return value check in rt715_sdw_probe()

In case of error, the function devm_regmap_init() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: d1ede0641b05 ("ASoC: rt715: add RT715 codec driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Link: https://lore.kernel.org/r/20200117024149.75515-1-weiyongjun1@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt715-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 18868e4ae6e8..6d892c44c522 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -535,8 +535,8 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 
 	regmap = devm_regmap_init(&slave->dev, NULL, &slave->dev,
 		&rt715_regmap);
-	if (!regmap)
-		return -EINVAL;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	rt715_init(&slave->dev, sdw_regmap, regmap, slave);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
