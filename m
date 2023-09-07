Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723B79796B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBCFDF9;
	Thu,  7 Sep 2023 19:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBCFDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106834;
	bh=cWhyxr36AR1ENWdvICbtj9KTZjepyfpK32OIZ3BkWNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hxq2X+d7XDgKrKKfTGVXDLiv1cg5NY8f5PRumzzFT+ibNd0aJh98+dYz7OwsXT6vH
	 3HdMzv1rWKqGxWHZ+Sd+lUiRyPJOFoAP7GvTAY6rS7qSbPHA4pycklm4755uE3afJi
	 8Kyl3lCpe1kANQRBQwtSmkcfqPJFzAiFS02WGltE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8B61F805E7; Thu,  7 Sep 2023 19:10:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96804F805D8;
	Thu,  7 Sep 2023 19:10:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AA9FF805D5; Thu,  7 Sep 2023 19:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAA77F805BA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA77F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WtPR6rLo
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 108A766072F2;
	Thu,  7 Sep 2023 18:10:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106639;
	bh=cWhyxr36AR1ENWdvICbtj9KTZjepyfpK32OIZ3BkWNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtPR6rLopKNclAGAVCXqFCW9nGaB3Xb/6gDidhUwHzU52KEBQGLdxxAI5kHDAzSBU
	 /x603gTM7glnFUTXtS7wKnDTYlfX6YSpXlNm5/CxueuRjXmnRtFhc2D+2dP+P37WTA
	 +NsYeSpoIeBDrYsAJk9yQvZteniuRxdu7B1sY9YrDjEvX/5qKHMJBUicucpHMjoZmz
	 IkXbwnExBOKQT3ZAkYF211ybeixARg5n7B8bHPdncgobgU7l5KoC2ATgTam9X/LHO3
	 +CBOOCtOq9N9jg94LIKO+fdLAigcEFKwUYNiohNIPSQ8l91pXYI/jQD91zoTZVqp3m
	 cg0v7ncMNUO/Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 08/11] ASoC: cs35l41: Use modern pm_ops
Date: Thu,  7 Sep 2023 20:10:07 +0300
Message-ID: <20230907171010.1447274-9-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4YYNJJYSDYD7BMSTEJ7MWEI6SLME2OS6
X-Message-ID-Hash: 4YYNJJYSDYD7BMSTEJ7MWEI6SLME2OS6
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YYNJJYSDYD7BMSTEJ7MWEI6SLME2OS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make use of the recently introduced EXPORT_GPL_DEV_PM_OPS() macro, to
conditionally export the runtime/system PM functions.

Replace the old SET_{RUNTIME,SYSTEM_SLEEP,NOIRQ_SYSTEM_SLEEP}_PM_OPS()
helpers with their modern alternatives and get rid of the now
unnecessary '__maybe_unused' annotations on all PM functions.

Additionally, use the pm_ptr() macro to fix the following errors when
building with CONFIG_PM disabled:

ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-i2c.ko] undefined!

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-i2c.c |  2 +-
 sound/soc/codecs/cs35l41-spi.c |  2 +-
 sound/soc/codecs/cs35l41.c     | 21 ++++++++++-----------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index 9109203a7f25..96414ee35285 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -80,7 +80,7 @@ MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
 static struct i2c_driver cs35l41_i2c_driver = {
 	.driver = {
 		.name		= "cs35l41",
-		.pm		= &cs35l41_pm_ops,
+		.pm		= pm_ptr(&cs35l41_pm_ops),
 		.of_match_table = of_match_ptr(cs35l41_of_match),
 		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
 	},
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 28e9c9473e60..a6db44520c06 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -80,7 +80,7 @@ MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
 static struct spi_driver cs35l41_spi_driver = {
 	.driver = {
 		.name		= "cs35l41",
-		.pm		= &cs35l41_pm_ops,
+		.pm		= pm_ptr(&cs35l41_pm_ops),
 		.of_match_table = of_match_ptr(cs35l41_of_match),
 		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
 	},
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 7ddaa9bd8911..4bc64ba71cd6 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1368,7 +1368,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 }
 EXPORT_SYMBOL_GPL(cs35l41_remove);
 
-static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
+static int cs35l41_runtime_suspend(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
@@ -1385,7 +1385,7 @@ static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
+static int cs35l41_runtime_resume(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 	int ret;
@@ -1414,7 +1414,7 @@ static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l41_sys_suspend(struct device *dev)
+static int cs35l41_sys_suspend(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
@@ -1424,7 +1424,7 @@ static int __maybe_unused cs35l41_sys_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l41_sys_suspend_noirq(struct device *dev)
+static int cs35l41_sys_suspend_noirq(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
@@ -1434,7 +1434,7 @@ static int __maybe_unused cs35l41_sys_suspend_noirq(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l41_sys_resume_noirq(struct device *dev)
+static int cs35l41_sys_resume_noirq(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
@@ -1444,7 +1444,7 @@ static int __maybe_unused cs35l41_sys_resume_noirq(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l41_sys_resume(struct device *dev)
+static int cs35l41_sys_resume(struct device *dev)
 {
 	struct cs35l41_private *cs35l41 = dev_get_drvdata(dev);
 
@@ -1454,13 +1454,12 @@ static int __maybe_unused cs35l41_sys_resume(struct device *dev)
 	return 0;
 }
 
-const struct dev_pm_ops cs35l41_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(cs35l41_pm_ops) = {
+	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
 
-	SET_SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend_noirq, cs35l41_sys_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend_noirq, cs35l41_sys_resume_noirq)
 };
-EXPORT_SYMBOL_GPL(cs35l41_pm_ops);
 
 MODULE_DESCRIPTION("ASoC CS35L41 driver");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
-- 
2.41.0

