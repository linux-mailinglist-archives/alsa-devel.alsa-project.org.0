Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DB11B9B1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAAE71693;
	Wed, 11 Dec 2019 18:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAAE71693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084233;
	bh=EzyGjws0tcO9UUOUKd692njy7MJD8WXmbqAoSbex3ZM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FdRz4/gaTLPa3dpoHesaLALunUJVwCjwkfKv3xICuQXf7IsHRCbR7ocYh32vhwgA2
	 UN2Zezr08PxtxzRwIdIJzr6FryOimcBl1a6Lq1cazVrIy69MhxO0NkR0v4WzSqB+Ac
	 NefC1lakcexl2q6a50kGqK3NoKgV0ffeAL3OOT3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01416F8036E;
	Wed, 11 Dec 2019 17:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91588F80349; Wed, 11 Dec 2019 17:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AF307F80343
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF307F80343
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B7131B;
 Wed, 11 Dec 2019 08:54:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3049A3F52E;
 Wed, 11 Dec 2019 08:54:03 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eexbbhyy.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87eexbbhyy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup for CONFIG_DMI" to the
	asoc tree
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

   ASoC: soc-core: tidyup for CONFIG_DMI

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

From 8a6a6a38f86885982891197840e7b8eccad5ef50 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 11 Dec 2019 13:32:05 +0900
Subject: [PATCH] ASoC: soc-core: tidyup for CONFIG_DMI

soc-core.c has 2 #ifdef CONFIG_DMI, but we can merge these.
OTOH, soc.h has dmi_longname, but it is needed if CONFIG_DMI was defined.
In other words, It is not needed if CONFIG_DMI was not defined.
This patch tidyup these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87eexbbhyy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  2 ++
 sound/soc/soc-core.c | 32 +++++++++++++++-----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index c920f17a5647..a6a3a7d54c70 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -986,7 +986,9 @@ struct snd_soc_card {
 	const char *long_name;
 	const char *driver_name;
 	const char *components;
+#ifdef CONFIG_DMI
 	char dmi_longname[80];
+#endif /* CONFIG_DMI */
 	char topology_shortname[32];
 
 	struct device *dev;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f8090bd2cf73..51a404fb89e2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -73,23 +73,6 @@ static int pmdown_time = 5000;
 module_param(pmdown_time, int, 0);
 MODULE_PARM_DESC(pmdown_time, "DAPM stream powerdown time (msecs)");
 
-#ifdef CONFIG_DMI
-/*
- * If a DMI filed contain strings in this blacklist (e.g.
- * "Type2 - Board Manufacturer" or "Type1 - TBD by OEM"), it will be taken
- * as invalid and dropped when setting the card long name from DMI info.
- */
-static const char * const dmi_blacklist[] = {
-	"To be filled by OEM",
-	"TBD by OEM",
-	"Default String",
-	"Board Manufacturer",
-	"Board Vendor Name",
-	"Board Product Name",
-	NULL,	/* terminator */
-};
-#endif
-
 static ssize_t pmdown_time_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -1607,6 +1590,21 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
 #ifdef CONFIG_DMI
+/*
+ * If a DMI filed contain strings in this blacklist (e.g.
+ * "Type2 - Board Manufacturer" or "Type1 - TBD by OEM"), it will be taken
+ * as invalid and dropped when setting the card long name from DMI info.
+ */
+static const char * const dmi_blacklist[] = {
+	"To be filled by OEM",
+	"TBD by OEM",
+	"Default String",
+	"Board Manufacturer",
+	"Board Vendor Name",
+	"Board Product Name",
+	NULL,	/* terminator */
+};
+
 /*
  * Trim special characters, and replace '-' with '_' since '-' is used to
  * separate different DMI fields in the card long name. Only number and
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
