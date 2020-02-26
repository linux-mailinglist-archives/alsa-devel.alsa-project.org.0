Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F5170800
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 19:48:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8253B1699;
	Wed, 26 Feb 2020 19:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8253B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582742938;
	bh=ygKXUP/zlNrD1JP9tprOUPDs+qn0SEaRxxiS+kQqvV8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lNVcTXcpQKRfZSNY1Y538UAMzqiKW1i0gs6OmgDSY+Isj+cfqqofoKpy7vIl53Zft
	 W7Pon6J0YKm4A1LA2tyHPc57EXZxGY4OV4fNw2CEvDRIm3Crq0i6gQ0qg/bDAdCrlm
	 kFi8dBj3kJR43SdgT2Uc6mRBUDcY2pGEo57S1jR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4992EF80171;
	Wed, 26 Feb 2020 19:47:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 993C2F8014E; Wed, 26 Feb 2020 19:47:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C9C35F80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 19:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C35F80089
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C96930E;
 Wed, 26 Feb 2020 10:47:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023F43F881;
 Wed, 26 Feb 2020 10:47:08 -0800 (PST)
Date: Wed, 26 Feb 2020 18:47:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tas2562: Add entries for the TAS2563 audio amplifier"
 to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: tas2562: Add entries for the TAS2563 audio amplifier

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

From 14f8c8d8fd62207f081549d45099a90dd3717696 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Wed, 26 Feb 2020 07:03:04 -0600
Subject: [PATCH] ASoC: tas2562: Add entries for the TAS2563 audio amplifier

The TAS2563 is register compatible with the TAS2562.  The main
difference is the TAS2563 has a programmable DSP to manage different
audio profiles.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200226130305.12043-2-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index d5e04030a0c1..79c3c3d79766 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -55,6 +55,11 @@ struct tas2562_data {
 	int volume_lvl;
 };
 
+enum tas256x_model {
+	TAS2562,
+	TAS2563,
+};
+
 static int tas2562_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
@@ -664,13 +669,15 @@ static int tas2562_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id tas2562_id[] = {
-	{ "tas2562", 0 },
+	{ "tas2562", TAS2562 },
+	{ "tas2563", TAS2563 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2562_id);
 
 static const struct of_device_id tas2562_of_match[] = {
 	{ .compatible = "ti,tas2562", },
+	{ .compatible = "ti,tas2563", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas2562_of_match);
-- 
2.20.1

