Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6053D99BA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C901F46;
	Thu, 29 Jul 2021 01:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C901F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627516156;
	bh=kcXOBQEBP/edinqXUTPcdt7gyf2Y/PBf5AnN3eQEzOQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QDvtqnhn1DF1uQH8xz4/dVsrrCXGo4myyQ1G0HSrCT26jtpe5vDf+0jp+da8BP0QM
	 gKNq9pO8CPUTsL4s1EFQgF4IB1O9tOWG5n7UlIOsVmnULeTSKu7qyQPvKcKfPV3bCD
	 /hCO19p+T+bppHbcaXveTPiX9VWqmVYTU6pa5lns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB05F8025E;
	Thu, 29 Jul 2021 01:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF2AF8025A; Thu, 29 Jul 2021 01:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CB11F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB11F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FhFL+Ac5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D89D9604DB;
 Wed, 28 Jul 2021 23:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627516061;
 bh=kcXOBQEBP/edinqXUTPcdt7gyf2Y/PBf5AnN3eQEzOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=FhFL+Ac507LVF1eP8bi9OeZHZJ1akFtxXuRV4ZIr/xeJ/sTLeTnrzzMsZraGpMnyf
 DkzQ4SyhYLTmErnkmasAuG4Vn3OXT4hIwNP9sXKAOP5qfQZsbvCqbOvuDBZlmHYDDF
 C+OyJ0ZvxEufxPshffVpSE8w2x6h8kBF2cKDjwSqS/svBZF/XgQwv8XCMUI54Db7KC
 PLo5611HPaLxEmxY4XxQBkeHqu7vD8CR6Aa8KJ36HOoYdFPFQSsxNg6tAf6pUf5NEC
 dOerIn/CAahJGk6OLvhBXD1xZ1DIrU2hLWnJCYXPJDWfkv8O/MRTIs3e4R/yMFJLwG
 paeIBWC1NWdaQ==
From: Mark Brown <broonie@kernel.org>
To: John Hsu <KCHSU0@nuvoton.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: nau8824: Fix open coded prefix handling
Date: Thu, 29 Jul 2021 00:47:29 +0100
Message-Id: <20210728234729.10135-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2922; h=from:subject;
 bh=kcXOBQEBP/edinqXUTPcdt7gyf2Y/PBf5AnN3eQEzOQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhAeuIUbf69YcxY3YI9niMzaWL6GZJUt/O+Hc9kT+j
 FLxh3NaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYQHriAAKCRAk1otyXVSH0HZbB/
 sFsxACLfab8wCI0wmNGJ1CEyyggMI/PO0CTId6pkAGhW7Q5yl4H5cp9yr8HPOIVF2SnIxASMsIravq
 Lr9dMuwu6Hetv71tsK6FQwg2DbuNRqQH1si7bURi2Id7Vx4P2Y0q59/H3Qv22Tspjyr3VNiQLg3pRH
 4x9U0Ku604ABUgr6pM39CvolzVSX2+CNrhZAbrZRbYLrjEEnFT/xgXgNAT5Wh7etal1K3IN1OvDBRs
 fSGW1BDL/vU+I5iJT874oxayuteDwFwHvIlPlKxGqRBjLUyPhw7CuiZR4Sbp/qGW24rK5T3cDfWQTu
 U2zKu9MOYkQwM6IGHFsMUvx1Q77Oyw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
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

As with the component layer code the nau8824 driver had been doing some
open coded pin manipulation which will have been broken now the core is
fixed to handle this properly, remove the open coding to avoid the issue.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/nau8824.c | 42 ++++++--------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 15bd8335f667..906cdd2fb54a 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -828,36 +828,6 @@ static void nau8824_int_status_clear_all(struct regmap *regmap)
 	}
 }
 
-static void nau8824_dapm_disable_pin(struct nau8824 *nau8824, const char *pin)
-{
-	struct snd_soc_dapm_context *dapm = nau8824->dapm;
-	const char *prefix = dapm->component->name_prefix;
-	char prefixed_pin[80];
-
-	if (prefix) {
-		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
-			 prefix, pin);
-		snd_soc_dapm_disable_pin(dapm, prefixed_pin);
-	} else {
-		snd_soc_dapm_disable_pin(dapm, pin);
-	}
-}
-
-static void nau8824_dapm_enable_pin(struct nau8824 *nau8824, const char *pin)
-{
-	struct snd_soc_dapm_context *dapm = nau8824->dapm;
-	const char *prefix = dapm->component->name_prefix;
-	char prefixed_pin[80];
-
-	if (prefix) {
-		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
-			 prefix, pin);
-		snd_soc_dapm_force_enable_pin(dapm, prefixed_pin);
-	} else {
-		snd_soc_dapm_force_enable_pin(dapm, pin);
-	}
-}
-
 static void nau8824_eject_jack(struct nau8824 *nau8824)
 {
 	struct snd_soc_dapm_context *dapm = nau8824->dapm;
@@ -866,8 +836,8 @@ static void nau8824_eject_jack(struct nau8824 *nau8824)
 	/* Clear all interruption status */
 	nau8824_int_status_clear_all(regmap);
 
-	nau8824_dapm_disable_pin(nau8824, "SAR");
-	nau8824_dapm_disable_pin(nau8824, "MICBIAS");
+	snd_soc_dapm_disable_pin(dapm, "SAR");
+	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
 	snd_soc_dapm_sync(dapm);
 
 	/* Enable the insertion interruption, disable the ejection
@@ -897,8 +867,8 @@ static void nau8824_jdet_work(struct work_struct *work)
 	struct regmap *regmap = nau8824->regmap;
 	int adc_value, event = 0, event_mask = 0;
 
-	nau8824_dapm_enable_pin(nau8824, "MICBIAS");
-	nau8824_dapm_enable_pin(nau8824, "SAR");
+	snd_soc_dapm_enable_pin(dapm. "MICBIAS");
+	snd_soc_dapm_enable_pin(dapm, "SAR");
 	snd_soc_dapm_sync(dapm);
 
 	msleep(100);
@@ -909,8 +879,8 @@ static void nau8824_jdet_work(struct work_struct *work)
 	if (adc_value < HEADSET_SARADC_THD) {
 		event |= SND_JACK_HEADPHONE;
 
-		nau8824_dapm_disable_pin(nau8824, "SAR");
-		nau8824_dapm_disable_pin(nau8824, "MICBIAS");
+		snd_soc_dapm_disable_pin(dapm, "SAR");
+		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
 		snd_soc_dapm_sync(dapm);
 	} else {
 		event |= SND_JACK_HEADSET;
-- 
2.20.1

