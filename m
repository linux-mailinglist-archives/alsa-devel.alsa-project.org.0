Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B660A5923F7
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6522E1614;
	Sun, 14 Aug 2022 18:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6522E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494431;
	bh=5l5V9Grk51FTQ9f0kCCkBO1vSt+OBwU5YNq0pBwO10w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5RDmndMOah/pNXplYQ5UHtdM3+car2LWw5REEsDFgdVZGgv+85RmfgV/LkdiHcWj
	 RKEZmJnAs1deGpslM8SnByoZunmQPvTF0MIEbbuixHe9FN/o0eKuCi25ygXYsGtV01
	 QRAQGNtCe+KTIQ3cGht2A+vcgU9rEtcZjvSludeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D70DF8059F;
	Sun, 14 Aug 2022 18:24:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDDD2F8059F; Sun, 14 Aug 2022 18:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2658F80588
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2658F80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fclcJGxF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB4A3B80B3F;
 Sun, 14 Aug 2022 16:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C1FC433D7;
 Sun, 14 Aug 2022 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494277;
 bh=5l5V9Grk51FTQ9f0kCCkBO1vSt+OBwU5YNq0pBwO10w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fclcJGxFAPtSRZ9CmYIMLMjvmTzv+mR1eXDTs150BpLCleyvVAUAe7sFgJRlFG+6s
 /yC2buZfWYy5M9uuI1/bvVImDQ70wJPYL1GJIFsBm6HZp0Z96MspY2TwHXCaL07aXf
 UixblrjoV9n3PNUYeNM/sdK99jsy5//GJip1NjKqI5JVxJ0hcqG/bE2q+dBCddueu0
 6PdhahiOZBllJRoNNzyDdh/+E6PWe+xIW/eo0bvEiX3R9yIUcPxgNhfrDA0LUzfRhH
 UUBSFqrFd55d+LSRZhoQabo4hEpq6tZLcp+cjaHiv/MtfWggXJYAOjh7t/YW0StMnj
 Bw2vw14Nqd/tQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 18/39] ASoC: Intel: sof_es8336: Fix GPIO quirks
 set via module option
Date: Sun, 14 Aug 2022 12:23:07 -0400
Message-Id: <20220814162332.2396012-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 mchehab@kernel.org, Andrey Turkin <andrey.turkin@gmail.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 akihiko.odaki@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 peter.ujfalusi@linux.intel.com
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

From: Andrey Turkin <andrey.turkin@gmail.com>

[ Upstream commit 5e60f1cfb830342304200437121f440b72b54f54 ]

The two GPIO quirk bits only affected actual GPIO selection
when set by the quirks table. They were reported as being
in effect when set via module options but actually did nothing.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andrey Turkin <andrey.turkin@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220725194909.145418-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 9d617831dd20..81e12f03ec97 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -77,8 +77,6 @@ static const struct acpi_gpio_mapping acpi_enable_both_gpios_rev_order[] = {
 	{ }
 };
 
-static const struct acpi_gpio_mapping *gpio_mapping = acpi_speakers_enable_gpio0;
-
 static void log_quirks(struct device *dev)
 {
 	dev_info(dev, "quirk mask %#lx\n", quirk);
@@ -272,15 +270,6 @@ static int sof_es8336_quirk_cb(const struct dmi_system_id *id)
 {
 	quirk = (unsigned long)id->driver_data;
 
-	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
-		if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
-			gpio_mapping = acpi_enable_both_gpios;
-		else
-			gpio_mapping = acpi_enable_both_gpios_rev_order;
-	} else if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK) {
-		gpio_mapping = acpi_speakers_enable_gpio1;
-	}
-
 	return 1;
 }
 
@@ -529,6 +518,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	struct snd_soc_dai_link *dai_links;
 	struct device *codec_dev;
+	const struct acpi_gpio_mapping *gpio_mapping;
 	unsigned int cnt = 0;
 	int dmic_be_num = 0;
 	int hdmi_num = 3;
@@ -635,6 +625,17 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 
 	/* get speaker enable GPIO */
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
+		if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
+			gpio_mapping = acpi_enable_both_gpios;
+		else
+			gpio_mapping = acpi_enable_both_gpios_rev_order;
+	} else if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK) {
+		gpio_mapping = acpi_speakers_enable_gpio1;
+	} else {
+		gpio_mapping = acpi_speakers_enable_gpio0;
+	}
+
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, gpio_mapping);
 	if (ret)
 		dev_warn(codec_dev, "unable to add GPIO mapping table\n");
-- 
2.35.1

