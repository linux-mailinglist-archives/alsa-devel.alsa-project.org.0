Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3417C23B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:52:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F0F1661;
	Fri,  6 Mar 2020 16:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F0F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583509948;
	bh=0gPAyKzA3Du6cO7P+Pk28G5fPpL01sEW95ybQ0wcL/Y=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XNiBfvqjx1a1EGYn2QyikxdCyn57dVTkS8wyfktNIeNcGzpi4jz/hFX4D3jsZYjAJ
	 y5Ou/jnaXU2isVrUeKgXfvmMjUiGdWzlc7p86ontdSadNOiJK2YefFVDUksiupOpaW
	 sWiVIiw42ie5ioDQKBtP711PB0dD5XdMPrFIVMtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A74F80125;
	Fri,  6 Mar 2020 16:51:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1120F801F9; Fri,  6 Mar 2020 16:51:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E2404F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2404F80125
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A28B30E;
 Fri,  6 Mar 2020 07:51:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0C1C3F237;
 Fri,  6 Mar 2020 07:51:08 -0800 (PST)
Date: Fri, 06 Mar 2020 15:51:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: wcd9335: fix address map representation" to the asoc
 tree
In-Reply-To: <20200306152633.25836-1-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200306152633.25836-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

   ASoC: wcd9335: fix address map representation

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

From d902e7856d2a3b5da7acab90e5faec22e395e57a Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 6 Mar 2020 15:26:33 +0000
Subject: [PATCH] ASoC: wcd9335: fix address map representation

slimbus addresses are 16 bit wide, masking page numbers
to wcd register at offset of 12 will limit the number for pages.
So it becomes impossible to write to page 0x10 registers.
Remove masking 0x800 (slimbus address range) from register address
and making use of window parameters in regmap config should fix it
and also will represent the registers exactly inline with Datasheet.

Remove this unnessary masking and make the registers be inline
with datasheet.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200306152633.25836-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 18 +++++++++---------
 sound/soc/codecs/wcd9335.h |  7 ++++---
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index f11ffa28683b..700cc1212770 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4926,11 +4926,11 @@ static const struct regmap_range_cfg wcd9335_ranges[] = {
 		.name = "WCD9335",
 		.range_min =  0x0,
 		.range_max =  WCD9335_MAX_REGISTER,
-		.selector_reg = WCD9335_REG(0x0, 0),
+		.selector_reg = WCD9335_SEL_REGISTER,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
-		.window_start = 0x0,
-		.window_len = 0x1000,
+		.window_start = 0x800,
+		.window_len = 0x100,
 	},
 };
 
@@ -4968,12 +4968,12 @@ static const struct regmap_range_cfg wcd9335_ifc_ranges[] = {
 	{
 		.name = "WCD9335-IFC-DEV",
 		.range_min =  0x0,
-		.range_max = WCD9335_REG(0, 0x7ff),
-		.selector_reg = WCD9335_REG(0, 0x0),
-		.selector_mask = 0xff,
+		.range_max = WCD9335_MAX_REGISTER,
+		.selector_reg = WCD9335_SEL_REGISTER,
+		.selector_mask = 0xfff,
 		.selector_shift = 0,
-		.window_start = 0x0,
-		.window_len = 0x1000,
+		.window_start = 0x800,
+		.window_len = 0x400,
 	},
 };
 
@@ -4981,7 +4981,7 @@ static struct regmap_config wcd9335_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.can_multi_write = true,
-	.max_register = WCD9335_REG(0, 0x7FF),
+	.max_register = WCD9335_MAX_REGISTER,
 	.ranges = wcd9335_ifc_ranges,
 	.num_ranges = ARRAY_SIZE(wcd9335_ifc_ranges),
 };
diff --git a/sound/soc/codecs/wcd9335.h b/sound/soc/codecs/wcd9335.h
index 4d9be2496c30..72060824c743 100644
--- a/sound/soc/codecs/wcd9335.h
+++ b/sound/soc/codecs/wcd9335.h
@@ -8,9 +8,9 @@
  * in slimbus mode the reg base starts from 0x800
  * in i2s/i2c mode the reg base is 0x0
  */
-#define WCD9335_REG(pg, r)	((pg << 12) | (r) | 0x800)
+#define WCD9335_REG(pg, r)	((pg << 8) | (r))
 #define WCD9335_REG_OFFSET(r)	(r & 0xFF)
-#define WCD9335_PAGE_OFFSET(r)	((r >> 12) & 0xFF)
+#define WCD9335_PAGE_OFFSET(r)	((r >> 8) & 0xFF)
 
 /* Page-0 Registers */
 #define WCD9335_PAGE0_PAGE_REGISTER		WCD9335_REG(0x00, 0x000)
@@ -600,7 +600,8 @@
 #define WCD9335_CDC_CLK_RST_CTRL_FS_CNT_ENABLE	BIT(0)
 #define WCD9335_CDC_CLK_RST_CTRL_FS_CNT_DISABLE	0
 #define WCD9335_CDC_TOP_TOP_CFG1	WCD9335_REG(0x0d, 0x082)
-#define WCD9335_MAX_REGISTER	WCD9335_REG(0x80, 0x0FF)
+#define WCD9335_MAX_REGISTER	0xffff
+#define WCD9335_SEL_REGISTER	0x800
 
 /* SLIMBUS Slave Registers */
 #define WCD9335_SLIM_PGD_PORT_INT_EN0	WCD9335_REG(0, 0x30)
-- 
2.20.1

