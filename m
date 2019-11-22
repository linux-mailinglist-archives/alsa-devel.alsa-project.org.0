Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C292010791D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 20:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564291857;
	Fri, 22 Nov 2019 20:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564291857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574452680;
	bh=KDKqvJL/U2ExVmMnY51KcsdKDWCPEJiGVeMi+vlk8gs=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vR4PxnxRTeQcW4o38UIPjB6+SzhlnaDmrmicyT/fmpG765hNCRDUedg8AyasbCEIo
	 oVvONjFlhVdNjJrRYGbYJXosCIFxhn8jn6XMnHpL0/7TfqMqGA28vuRyPWqh6+Riut
	 J5RAotAaVpZp+tQKHjvmx8Gedh7vpTv4n62okhGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FF6F8015B;
	Fri, 22 Nov 2019 20:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8D0F8015A; Fri, 22 Nov 2019 20:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B3A1F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 20:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B3A1F800EF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEAF4FEC;
 Fri, 22 Nov 2019 11:55:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D5E63F6C4;
 Fri, 22 Nov 2019 11:55:25 -0800 (PST)
Date: Fri, 22 Nov 2019 19:55:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191120174435.30920-1-perex@perex.cz>
Message-Id: <applied-20191120174435.30920-1-perex@perex.cz>
X-Patchwork-Hint: ignore
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: improve the DMI long card code in
	asoc-core" to the asoc tree
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

   ASoC: improve the DMI long card code in asoc-core

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

From 4e01e5dbba96f731119f3f1a6bf51b54c98c5940 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Wed, 20 Nov 2019 18:44:34 +0100
Subject: [PATCH] ASoC: improve the DMI long card code in asoc-core

Add append_dmi_string() function and make the code more readable.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191120174435.30920-1-perex@perex.cz
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 66 +++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 41 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cc0ef0fcc005..a1f4d64a0a18 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1718,6 +1718,23 @@ static int is_dmi_valid(const char *field)
 	return 1;
 }
 
+/*
+ * Append a string to card->dmi_longname with character cleanups.
+ */
+static void append_dmi_string(struct snd_soc_card *card, const char *str)
+{
+	char *dst = card->dmi_longname;
+	size_t dst_len = sizeof(card->dmi_longname);
+	size_t len;
+
+	len = strlen(dst);
+	snprintf(dst + len, dst_len - len, "-%s", str);
+
+	len++;	/* skip the separator "-" */
+	if (len < dst_len)
+		cleanup_dmi_name(dst + len);
+}
+
 /**
  * snd_soc_set_dmi_name() - Register DMI names to card
  * @card: The card to register DMI names
@@ -1752,61 +1769,36 @@ static int is_dmi_valid(const char *field)
 int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 {
 	const char *vendor, *product, *product_version, *board;
-	size_t longname_buf_size = sizeof(card->snd_card->longname);
-	size_t len;
 
 	if (card->long_name)
 		return 0; /* long name already set by driver or from DMI */
 
-	/* make up dmi long name as: vendor.product.version.board */
+	/* make up dmi long name as: vendor-product-version-board */
 	vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
 	if (!vendor || !is_dmi_valid(vendor)) {
 		dev_warn(card->dev, "ASoC: no DMI vendor name!\n");
 		return 0;
 	}
 
-	snprintf(card->dmi_longname, sizeof(card->snd_card->longname),
-			 "%s", vendor);
+	snprintf(card->dmi_longname, sizeof(card->dmi_longname), "%s", vendor);
 	cleanup_dmi_name(card->dmi_longname);
 
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
 	if (product && is_dmi_valid(product)) {
-		len = strlen(card->dmi_longname);
-		snprintf(card->dmi_longname + len,
-			 longname_buf_size - len,
-			 "-%s", product);
-
-		len++;	/* skip the separator "-" */
-		if (len < longname_buf_size)
-			cleanup_dmi_name(card->dmi_longname + len);
+		append_dmi_string(card, product);
 
 		/*
 		 * some vendors like Lenovo may only put a self-explanatory
 		 * name in the product version field
 		 */
 		product_version = dmi_get_system_info(DMI_PRODUCT_VERSION);
-		if (product_version && is_dmi_valid(product_version)) {
-			len = strlen(card->dmi_longname);
-			snprintf(card->dmi_longname + len,
-				 longname_buf_size - len,
-				 "-%s", product_version);
-
-			len++;
-			if (len < longname_buf_size)
-				cleanup_dmi_name(card->dmi_longname + len);
-		}
+		if (product_version && is_dmi_valid(product_version))
+			append_dmi_string(card, product_version);
 	}
 
 	board = dmi_get_system_info(DMI_BOARD_NAME);
 	if (board && is_dmi_valid(board)) {
-		len = strlen(card->dmi_longname);
-		snprintf(card->dmi_longname + len,
-			 longname_buf_size - len,
-			 "-%s", board);
-
-		len++;
-		if (len < longname_buf_size)
-			cleanup_dmi_name(card->dmi_longname + len);
+		append_dmi_string(card, board);
 	} else if (!product) {
 		/* fall back to using legacy name */
 		dev_warn(card->dev, "ASoC: no DMI board/product name!\n");
@@ -1814,16 +1806,8 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 	}
 
 	/* Add flavour to dmi long name */
-	if (flavour) {
-		len = strlen(card->dmi_longname);
-		snprintf(card->dmi_longname + len,
-			 longname_buf_size - len,
-			 "-%s", flavour);
-
-		len++;
-		if (len < longname_buf_size)
-			cleanup_dmi_name(card->dmi_longname + len);
-	}
+	if (flavour)
+		append_dmi_string(card, flavour);
 
 	/* set the card long name */
 	card->long_name = card->dmi_longname;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
