Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA91840B89
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:32:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4415385D;
	Mon, 29 Jan 2024 17:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4415385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545979;
	bh=h0rgb6aZm4gwgUniAiZJ+bxuduUl6CsjAiO7cHkbWBM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCm1mDJM6F/lM/B1thVD6nZJ8slJyzXxjhmOoCaRFeYQhm11BAPnI6mHACXKLZhL/
	 eKP3ZYhu58Pc1yEDwrMWr7JYhvjmfkLip1ATy3VXUydNFI6Hdrs6IvzXzVil7p6EiU
	 xWPko77N80lc0ZISM11tHoVqND38I5w2KFFhN/eE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 691C9F808E7; Mon, 29 Jan 2024 17:29:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF5BF80BF3;
	Mon, 29 Jan 2024 17:29:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C677AF806C7; Mon, 29 Jan 2024 17:28:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D14E4F8057B
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D14E4F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=C1FsGSbj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0P006968;
	Mon, 29 Jan 2024 10:27:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=w4CGZbUCOC1yLU5NKzT5GdiUkJej28e0tOzXCRok5ms=; b=
	C1FsGSbjVsmQ7qt3rNFc5xvBEqxwaL5P1J2VMOsZGKUICcUuIa5mkFYux2xzCFyi
	N10PxZlSVZx55HFREquwZAFeMl0Ia2ACLNkgSf9tm9BI6+foKsaAQd5kzkwe8F65
	urbgaSxTYazMeMC+a1aChBnGcLa8N4rYuxAiv8q6H6iLXxB19mYNSnNCmo6YIjUp
	BSTsRLDl18c96sI2kG0AOdWTY3L0aHqhw0a0cfApZFC6y6Yhfd3Xef5I/7qCRkr7
	JSzFHNkbKCP3cLprQI7Or4pZ2b2rOkjd9/2/0uRaPPSFu0OEycGTtWN9u6XVXasM
	vhMjHgFz9O6hMicydxG+kg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:58 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:46 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E03C7820247;
	Mon, 29 Jan 2024 16:27:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 13/18] ASoC: cs35l56: Load tunings for the correct speaker
 models
Date: Mon, 29 Jan 2024 16:27:32 +0000
Message-ID: <20240129162737.497-14-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mws68Ze2d3ptg8Hci6V7kFmy9aJMOmA4
X-Proofpoint-GUID: mws68Ze2d3ptg8Hci6V7kFmy9aJMOmA4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3PNQGPY453HEGICX4XBHSFZJBMH7RJLM
X-Message-ID-Hash: 3PNQGPY453HEGICX4XBHSFZJBMH7RJLM
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PNQGPY453HEGICX4XBHSFZJBMH7RJLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the "spk-id-gpios" property is present it points to GPIOs whose
value must be used to select the correct bin file to match the
speakers.

Some manufacturers use multiple sources of speakers, which need
different tunings for best performance. On these models the type of
speaker fitted is indicated by the values of one or more GPIOs. The
number formed by the GPIOs identifies the tuning required.

The speaker ID must be used in combination with the subsystem ID
(either from PCI SSID or cirrus,firmware-uid property), because the
GPIOs can only indicate variants of a specific model.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 1a1c3d794ef6 ("ASoC: cs35l56: Use PCI SSID as the firmware UID")
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 36 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 32 ++++++++++++++++++++++-----
 sound/soc/codecs/cs35l56.h        |  1 +
 4 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 5d6aefc41e64..23da6298ab37 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -289,6 +289,7 @@ void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_ds
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
+int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 33835535ef84..02fba4bc0a14 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
@@ -736,6 +737,41 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_hw_init, SND_SOC_CS35L56_SHARED);
 
+int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base)
+{
+	struct gpio_descs *descs;
+	int speaker_id;
+	int i, ret;
+
+	/* Read the speaker type qualifier from the motherboard GPIOs */
+	descs = gpiod_get_array_optional(cs35l56_base->dev, "spk-id", GPIOD_IN);
+	if (!descs) {
+		return -ENOENT;
+	} else if (IS_ERR(descs)) {
+		ret = PTR_ERR(descs);
+		return dev_err_probe(cs35l56_base->dev, ret, "Failed to get spk-id-gpios\n");
+	}
+
+	speaker_id = 0;
+	for (i = 0; i < descs->ndescs; i++) {
+		ret = gpiod_get_value_cansleep(descs->desc[i]);
+		if (ret < 0) {
+			dev_err_probe(cs35l56_base->dev, ret, "Failed to read spk-id[%d]\n", i);
+			goto err;
+		}
+
+		speaker_id |= (ret << i);
+	}
+
+	dev_dbg(cs35l56_base->dev, "Speaker ID = %d\n", speaker_id);
+	ret = speaker_id;
+err:
+	gpiod_put_array(descs);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_get_speaker_id, SND_SOC_CS35L56_SHARED);
+
 static const u32 cs35l56_bclk_valid_for_pll_freq_table[] = {
 	[0x0C] = 128000,
 	[0x0F] = 256000,
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 597677422547..c23e29da4cfb 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -959,10 +959,19 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 
 	if (!cs35l56->dsp.system_name &&
 	    (snd_soc_card_get_pci_ssid(component->card, &vendor, &device) == 0)) {
-		cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
-							  GFP_KERNEL,
-							  "%04x%04x",
-							  vendor, device);
+		/* Append a speaker qualifier if there is a speaker ID */
+		if (cs35l56->speaker_id >= 0) {
+			cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
+								  GFP_KERNEL,
+								  "%04x%04x-spkid%d",
+								  vendor, device,
+								  cs35l56->speaker_id);
+		} else {
+			cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
+								  GFP_KERNEL,
+								  "%04x%04x",
+								  vendor, device);
+		}
 		if (!cs35l56->dsp.system_name)
 			return -ENOMEM;
 	}
@@ -1245,7 +1254,13 @@ static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 	if (ret < 0)
 		return 0;
 
-	cs35l56->dsp.system_name = devm_kstrdup(dev, prop, GFP_KERNEL);
+	/* Append a speaker qualifier if there is a speaker ID */
+	if (cs35l56->speaker_id >= 0)
+		cs35l56->dsp.system_name = devm_kasprintf(dev, GFP_KERNEL, "%s-spkid%d",
+							  prop, cs35l56->speaker_id);
+	else
+		cs35l56->dsp.system_name = devm_kstrdup(dev, prop, GFP_KERNEL);
+
 	if (cs35l56->dsp.system_name == NULL)
 		return -ENOMEM;
 
@@ -1260,6 +1275,7 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 
 	init_completion(&cs35l56->init_completion);
 	mutex_init(&cs35l56->base.irq_lock);
+	cs35l56->speaker_id = -ENOENT;
 
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
@@ -1296,6 +1312,12 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 1);
 	}
 
+	ret = cs35l56_get_speaker_id(&cs35l56->base);
+	if ((ret < 0) && (ret != -ENOENT))
+		goto err;
+
+	cs35l56->speaker_id = ret;
+
 	ret = cs35l56_get_firmware_uid(cs35l56);
 	if (ret != 0)
 		goto err;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index dc2fe4c91e67..596b141e3f96 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -45,6 +45,7 @@ struct cs35l56_private {
 	bool sdw_attached;
 	struct completion init_completion;
 
+	int speaker_id;
 	u32 rx_mask;
 	u32 tx_mask;
 	u8 asp_slot_width;
-- 
2.39.2

