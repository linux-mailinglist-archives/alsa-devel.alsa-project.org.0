Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A01346FA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 17:00:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8741743;
	Wed,  8 Jan 2020 16:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8741743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578499228;
	bh=KphLR58stO7PqadEmNg6GbFEZvaO3fA8iNaPVxGpDsQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Q4w9L1wGj2aOKcqOVnkN2KXtrBZGaChjw+uUB0Veg5bm0Pq0RmChelmkhFYaMq4JZ
	 +jpdV5fVySWSdK4QQHWJ16QpB1vDhfHQl3lI5yT8UBsWNqsQ4XXESQSqMoJPbOlzaW
	 TFzEgAKCXAjfRS8KEosHzEfb5LDfV1a8/o93Vl0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BECF801ED;
	Wed,  8 Jan 2020 16:58:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4EFFF80161; Wed,  8 Jan 2020 16:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B7DB1F8010A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 16:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DB1F8010A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4192F31B;
 Wed,  8 Jan 2020 07:58:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C11DB3F534;
 Wed,  8 Jan 2020 07:58:37 -0800 (PST)
Date: Wed, 08 Jan 2020 15:58:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20200107214846.1284981-1-arnd@arndb.de>
Message-Id: <applied-20200107214846.1284981-1-arnd@arndb.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Enrico Weigelt <info@metux.net>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] Applied "ASoC: gtm601: fix build warning" to the asoc
	tree
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

   ASoC: gtm601: fix build warning

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

From 599b10193c77e4b8a68192b3b277a01e8b467043 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 22:48:35 +0100
Subject: [PATCH] ASoC: gtm601: fix build warning

The driver produces warnings without CONFIG_OF, and makes
no sense without it either:

sound/soc/codecs/gtm601.c:50:34: error: 'bm818_dai' defined but not used [-Werror=unused-variable]
 static struct snd_soc_dai_driver bm818_dai = {
                                  ^~~~~~~~~
sound/soc/codecs/gtm601.c:32:34: error: 'gtm601_dai' defined but not used [-Werror=unused-variable]
 static struct snd_soc_dai_driver gtm601_dai = {
                                  ^~~~~~~~~~

Remove the #ifdef check to avoid the warning.

Fixes: 057a317a8d94 ("ASoC: gtm601: add Broadmobi bm818 sound profile")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20200107214846.1284981-1-arnd@arndb.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/gtm601.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index 7f05ebcb88d1..ae9e1c70ca57 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -87,14 +87,12 @@ static int gtm601_platform_probe(struct platform_device *pdev)
 			(struct snd_soc_dai_driver *)dai_driver, 1);
 }
 
-#if defined(CONFIG_OF)
 static const struct of_device_id gtm601_codec_of_match[] = {
 	{ .compatible = "option,gtm601", .data = (void *)&gtm601_dai },
 	{ .compatible = "broadmobi,bm818", .data = (void *)&bm818_dai },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gtm601_codec_of_match);
-#endif
 
 static struct platform_driver gtm601_codec_driver = {
 	.driver = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
