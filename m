Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE378CF5D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43328DF1;
	Wed, 30 Aug 2023 00:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43328DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693346635;
	bh=WdCCn6IEol8aJUkjka8g/S8DjEGq58vP7C1WeChmXKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J6LZA1JsuZuS3MrfOgtSSvGdfdnE3Q5Yz1hns1XU9qsF1pWnEMcgd5QVFxFN8pQQ8
	 5TkBlY3Ml699J/AZjRb7qaFutqZGCoIr92ACqonhsPuUO58Kilg5jLDqwIIgfIEWIp
	 LgKUfGr8tCN7x1eItIGyFGoB8idDE39G1AKspc/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45AAAF805A9; Wed, 30 Aug 2023 00:01:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E94ABF80236;
	Wed, 30 Aug 2023 00:01:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE2E0F80571; Wed, 30 Aug 2023 00:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B70A6F800D1
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B70A6F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=mzO8dV0X
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 63A5E16C0056;
	Wed, 30 Aug 2023 01:01:29 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNOUSkh30e1l; Wed, 30 Aug 2023 01:01:28 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693346488; bh=WdCCn6IEol8aJUkjka8g/S8DjEGq58vP7C1WeChmXKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzO8dV0XTEbnYzYfhq0XLYBpaqgk5a2qja47ZIWOAhsNeQDC8ng5FF1Q8iLYtvKa2
	 BO7fMHODtmUjmez8Q0GkalWIHab7rU9+VaPhO5uubggf50U9SnshZ7umzs9iCb6+Ji
	 xOSEd2nH69sdZTbHkqXTCD9Qr5D14p355GEO3MGY=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v3 4/5] ASoC: amd: acp: Add support for splitting the codec
 specific code from the ACP driver
Date: Wed, 30 Aug 2023 01:01:15 +0300
Message-ID: <20230829220116.1159-5-posteuca@mutex.one>
In-Reply-To: <20230829220116.1159-1-posteuca@mutex.one>
References: <20230829220116.1159-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YIPPLROY4ABRZIXPGSSDPD6MVURO2I5D
X-Message-ID-Hash: YIPPLROY4ABRZIXPGSSDPD6MVURO2I5D
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIPPLROY4ABRZIXPGSSDPD6MVURO2I5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit adds support for splitting more complicated machine
drivers, that need special handling, from the generic ACP code.

By adding support for callbacks to configure and handle codec
specific implementation details, we can split them in separate
files that don't clutter the ACP code.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 82 +++++++++++++++++++++++++----
 sound/soc/amd/acp/acp-mach.h        | 66 +++++++++++++++++++++++
 2 files changed, 137 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 6d57d17ddfd7..ba39b4dcdd6d 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -75,6 +75,33 @@ static struct acp_card_drvdata rt5682s_rt1019_rmb_data = {
 	.tdm_mode = false,
 };
 
+static bool acp_asoc_init_ops(struct acp_card_drvdata *priv)
+{
+	return false;
+}
+
+static int acp_asoc_suspend_pre(struct snd_soc_card *card)
+{
+	int ret;
+
+	ret = acp_ops_suspend_pre(card);
+	if (ret == 1)
+		return 0;
+	else
+		return ret;
+}
+
+static int acp_asoc_resume_post(struct snd_soc_card *card)
+{
+	int ret;
+
+	ret = acp_ops_resume_post(card);
+	if (ret == 1)
+		return 0;
+	else
+		return ret;
+}
+
 static int acp_asoc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
@@ -83,35 +110,68 @@ static int acp_asoc_probe(struct platform_device *pdev)
 	struct acp_card_drvdata *acp_card_drvdata;
 	int ret;
 
-	if (!pdev->id_entry)
-		return -EINVAL;
+	if (!pdev->id_entry) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
-	if (!card)
-		return -ENOMEM;
+	if (!card) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
+	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
+	acp_card_drvdata = card->drvdata;
+	acp_card_drvdata->acpi_mach = (struct snd_soc_acpi_mach *)pdev->dev.platform_data;
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->name = pdev->id_entry->name;
-	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
-	/* Widgets and controls added per-codec in acp-mach-common.c */
 
-	acp_card_drvdata = card->drvdata;
+	acp_asoc_init_ops(card->drvdata);
+
+	/* If widgets and controls are not set in specific callback,
+	 * they will be added per-codec in acp-mach-common.c
+	 */
+	ret = acp_ops_configure_widgets(card);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Cannot configure widgets for card (%s): %d\n",
+			card->name, ret);
+		goto out;
+	}
+	card->suspend_pre = acp_asoc_suspend_pre;
+	card->resume_post = acp_asoc_resume_post;
+
+	ret = acp_ops_probe(card);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Cannot probe card (%s): %d\n",
+			card->name, ret);
+		goto out;
+	}
+
 	dmi_id = dmi_first_match(acp_quirk_table);
 	if (dmi_id && dmi_id->driver_data)
 		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
 
-	acp_legacy_dai_links_create(card);
+	ret = acp_legacy_dai_links_create(card);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Cannot create dai links for card (%s): %d\n",
+			card->name, ret);
+		goto out;
+	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				card->name, ret);
-		return ret;
+		goto out;
 	}
-
-	return 0;
+out:
+	return ret;
 }
 
 static const struct platform_device_id board_ids[] = {
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 2b3ec6594023..8cc33926e66b 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -20,6 +20,10 @@
 
 #define TDM_CHANNELS	8
 
+#define ACP_OPS(priv, cb)	((priv)->ops.cb)
+
+#define acp_get_drvdata(card) ((struct acp_card_drvdata *)(card)->drvdata)
+
 enum be_id {
 	HEADSET_BE_ID = 0,
 	AMP_BE_ID,
@@ -50,6 +54,14 @@ enum platform_end_point {
 	REMBRANDT,
 };
 
+struct acp_mach_ops {
+	int (*probe)(struct snd_soc_card *card);
+	int (*configure_link)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+	int (*configure_widgets)(struct snd_soc_card *card);
+	int (*suspend_pre)(struct snd_soc_card *card);
+	int (*resume_post)(struct snd_soc_card *card);
+};
+
 struct acp_card_drvdata {
 	unsigned int hs_cpu_id;
 	unsigned int amp_cpu_id;
@@ -61,6 +73,9 @@ struct acp_card_drvdata {
 	unsigned int platform;
 	struct clk *wclk;
 	struct clk *bclk;
+	struct acp_mach_ops ops;
+	struct snd_soc_acpi_mach *acpi_mach;
+	void *mach_priv;
 	bool soc_mclk;
 	bool tdm_mode;
 };
@@ -69,4 +84,55 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
 int acp_legacy_dai_links_create(struct snd_soc_card *card);
 extern const struct dmi_system_id acp_quirk_table[];
 
+static inline int acp_ops_probe(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, probe))
+		ret = ACP_OPS(priv, probe)(card);
+	return ret;
+}
+
+static inline int acp_ops_configure_link(struct snd_soc_card *card,
+					 struct snd_soc_dai_link *dai_link)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, configure_link))
+		ret = ACP_OPS(priv, configure_link)(card, dai_link);
+	return ret;
+}
+
+static inline int acp_ops_configure_widgets(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, configure_widgets))
+		ret = ACP_OPS(priv, configure_widgets)(card);
+	return ret;
+}
+
+static inline int acp_ops_suspend_pre(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, suspend_pre))
+		ret = ACP_OPS(priv, suspend_pre)(card);
+	return ret;
+}
+
+static inline int acp_ops_resume_post(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, resume_post))
+		ret = ACP_OPS(priv, resume_post)(card);
+	return ret;
+}
+
 #endif
-- 
2.41.0

