Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2445184EF4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 19:50:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76442185F;
	Fri, 13 Mar 2020 19:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76442185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584125413;
	bh=PsXS5/ExlMT0PYKOKNebee8S0mq/uBpvRcqCZkOk2Fg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k+haBSyDOVAdWnrw41xSQlQKM91nX1vZJXpj0MtYHfFPwyXw78ynkRpaDvucGBLOn
	 at4BUhEZbUUoCp9j8GwR3jQ2wHk//28xc7WvsqMywZsM2eZCJJbOy0eKW32AljqvZL
	 pOZ454yyTxTz4k/UGMQIBOStGRu3MJ9ka43YNY5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95FE4F8013E;
	Fri, 13 Mar 2020 19:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E79FF801A3; Fri, 13 Mar 2020 19:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4631AF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 19:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4631AF80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF0C31B;
 Fri, 13 Mar 2020 11:48:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E32273F534;
 Fri, 13 Mar 2020 11:48:23 -0700 (PDT)
Date: Fri, 13 Mar 2020 18:48:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
Subject: Applied "ASoC: max98357a: Add ACPI HID MAX98360A" to the asoc tree
In-Reply-To: <1584114926-29287-1-git-send-email-yong.zhi@intel.com>
Message-Id: <applied-1584114926-29287-1-git-send-email-yong.zhi@intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Rajesh.Swaminathan@maximintegrated.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 sathyanarayana.nujella@intel.com, uday.m.bhat@intel.com
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

   ASoC: max98357a: Add ACPI HID MAX98360A

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

From 1a0f2433d7380c957d5d29e60a2eeb03ca3afe21 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Fri, 13 Mar 2020 10:55:26 -0500
Subject: [PATCH] ASoC: max98357a: Add ACPI HID MAX98360A

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A,
add ACPI ID "MAX98360A" for driver reuse.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Link: https://lore.kernel.org/r/1584114926-29287-1-git-send-email-yong.zhi@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 16313b973eaa..eb3d8255ea6c 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -135,6 +135,7 @@ MODULE_DEVICE_TABLE(of, max98357a_device_id);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id max98357a_acpi_match[] = {
 	{ "MX98357A", 0 },
+	{ "MX98360A", 0 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, max98357a_acpi_match);
-- 
2.20.1

