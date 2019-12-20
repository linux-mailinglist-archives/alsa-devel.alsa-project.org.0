Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FB127B8A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C517167B;
	Fri, 20 Dec 2019 14:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C517167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576847465;
	bh=yMTkoitaELxO1vcwvQLk9VSVVh47uFGBQolXedfQXSY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cFfT69uzrvQ1gTasjHRDfLiyUqOXi5zJDoUrBF2a+xz0XJvR281iWZiCLBOScSP3i
	 LqP5xels4tWNwlUVhgYw+PvSzNvSZ7whZ3EqrlHXcvMVpSwk8m4JMw4Lf33RFa6ssw
	 FWfkIzrdANFu+Ksz0H8gqwE2TDfvbdYwY0nIluhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68FDF8022C;
	Fri, 20 Dec 2019 14:09:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C955F8014F; Fri, 20 Dec 2019 14:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C62DFF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62DFF800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D144430E;
 Fri, 20 Dec 2019 05:09:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EBF63F719;
 Fri, 20 Dec 2019 05:09:14 -0800 (PST)
Date: Fri, 20 Dec 2019 13:09:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20191219125140.47689-1-broonie@kernel.org>
Message-Id: <applied-20191219125140.47689-1-broonie@kernel.org>
X-Patchwork-Hint: ignore
Cc: Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] Applied "ASoC: max98090: Remove empty suspend
	function" to the asoc tree
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

   ASoC: max98090: Remove empty suspend function

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

From d24a70636b8b2b41bf983e89bbaaaf301bb80de4 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Thu, 19 Dec 2019 12:51:40 +0000
Subject: [PATCH] ASoC: max98090: Remove empty suspend function

The suspend function is empty so can be removed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191219125140.47689-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index da23810f958e..4c7b16d557e2 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2838,17 +2838,12 @@ static int max98090_resume(struct device *dev)
 
 	return 0;
 }
-
-static int max98090_suspend(struct device *dev)
-{
-	return 0;
-}
 #endif
 
 static const struct dev_pm_ops max98090_pm = {
 	SET_RUNTIME_PM_OPS(max98090_runtime_suspend,
 		max98090_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(max98090_suspend, max98090_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, max98090_resume)
 };
 
 static const struct i2c_device_id max98090_i2c_id[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
