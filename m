Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4D172C9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC1218CD;
	Wed,  8 May 2019 09:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC1218CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557301553;
	bh=hbgPporkpYsDECGSLl3Z3V0qpx/FQfyQU922YSNjtj4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hEiF1WhnqrK2/Q7R6n60xlpHbQwmEPuSg/tGVNdb9mhUQAnCfBVZzoPcUAZljy8/r
	 bxk038e7Auc6WnnGCWWeWPdH3xTSXVl86zj4J0DH/M8LkLGtHPv6QoHg72m/1H1mCP
	 zjkzEcOB+q6qMY9SNsZSzEJHdGlnUqENvUNfSvsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE058F896FD;
	Wed,  8 May 2019 09:44:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AAB2F89715; Wed,  8 May 2019 09:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E6AF80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E6AF80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RPXeoPJf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mn8/YVmhv6n+nb+0sPu4Dm+F/v67f4rcaKccH6WIaB4=; b=RPXeoPJffh9h
 h+AdFRwuRyot7dbMU8JOMth28EwRCceoox3ybwpP5ic3sBvOAAa8fEwJxIcZypFkoSnfSj6DR2ChV
 4oCAb0ItiCqjHVD5SYqJbUtm1J/5nRr4FaqjlzIHRkCLDZ2+FNHBM02CR4qnW8RWIiuFFnpWYcdcW
 P2yZI=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHFD-0007MT-Pp; Wed, 08 May 2019 07:44:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1090544000C; Wed,  8 May 2019 07:47:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190507233213.53036-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190508064707.1090544000C@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 07:47:06 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677: Add component driver name" to
	the asoc tree
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

   ASoC: rt5677: Add component driver name

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 893d1a9c5c1c246eb756c828a12b5966d2ed9a17 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Tue, 7 May 2019 16:32:13 -0700
Subject: [PATCH] ASoC: rt5677: Add component driver name

Add name to component driver so it is possible to lookup the component
when needed.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 7 ++++---
 sound/soc/codecs/rt5677.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 907c957b614d..c49b5c218666 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4650,7 +4650,7 @@ static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 }
 
 static const struct gpio_chip rt5677_template_chip = {
-	.label			= "rt5677",
+	.label			= RT5677_DRV_NAME,
 	.owner			= THIS_MODULE,
 	.direction_output	= rt5677_gpio_direction_out,
 	.set			= rt5677_gpio_set,
@@ -4958,6 +4958,7 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt5677 = {
+	.name			= RT5677_DRV_NAME,
 	.probe			= rt5677_probe,
 	.remove			= rt5677_remove,
 	.suspend		= rt5677_suspend,
@@ -5079,7 +5080,7 @@ static struct regmap_irq rt5677_irqs[] = {
 };
 
 static struct regmap_irq_chip rt5677_irq_chip = {
-	.name = "rt5677",
+	.name = RT5677_DRV_NAME,
 	.irqs = rt5677_irqs,
 	.num_irqs = ARRAY_SIZE(rt5677_irqs),
 
@@ -5267,7 +5268,7 @@ static int rt5677_i2c_remove(struct i2c_client *i2c)
 
 static struct i2c_driver rt5677_i2c_driver = {
 	.driver = {
-		.name = "rt5677",
+		.name = RT5677_DRV_NAME,
 		.of_match_table = rt5677_of_match,
 		.acpi_match_table = ACPI_PTR(rt5677_acpi_match),
 	},
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 183d92b03045..11a2ffceec3b 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1674,6 +1674,8 @@
 #define RT5677_FIRMWARE1	"rt5677_dsp_fw1.bin"
 #define RT5677_FIRMWARE2	"rt5677_dsp_fw2.bin"
 
+#define RT5677_DRV_NAME		"rt5677"
+
 /* System Clock Source */
 enum {
 	RT5677_SCLK_S_MCLK,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
