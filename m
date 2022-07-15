Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA03575E37
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 11:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CB418B9;
	Fri, 15 Jul 2022 11:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CB418B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657876113;
	bh=xt3Cr4DjUR6uWFdmfg6tQgONs9dbD7Y0B6+swnrcj5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h83UuwLQ81jR779BvLp05BZdMSxlgIO1zdl3WWKQjowY5idyfgp53i92R3X6hFCic
	 5E2TAtLc8Thju2gbNfkOnEbQeeAiilQjuk9cwy9nIwAE2fcHC/vsKdK02jXzGBTsC8
	 HQ0TdAare37ZRyW3skyC4wJs9UMJSIoik3O1Qo/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8E6F800AA;
	Fri, 15 Jul 2022 11:07:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 901AEF8015B; Fri, 15 Jul 2022 11:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78133F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 11:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78133F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Xq+Lck3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657876044; x=1689412044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xt3Cr4DjUR6uWFdmfg6tQgONs9dbD7Y0B6+swnrcj5A=;
 b=Xq+Lck3OurGspStNylUw93tH9o8G2xT+DK1JN/OuRkr+QngHx48ZMJU3
 7whZzS7vRQg1DaTNENud2GvTYKjMH+oiqFBlqQTToUtjAkmIkeRUA7wn7
 dVjZlGV3ESpLsCv8fhT3HM1PwDEkGc5klDupiozwsVmt6JWnztHh0uGYC
 Y6vrcwqfGo+xu4F7Fuv/8Cre8vekxC9a1db+Umwft4pGnPAsafhBsNtJ9
 OoC/lbabvUi5iQH+pZ+JZUf6hgcJDZlEDPq7ojdA+/Hbgzrb36hH0vaAf
 wf6ghdISJNlm7DW6hUDUaM/cm33XrVGk75n+SqBI7djmiOh3FaKIF/tsG w==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="104601118"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Jul 2022 02:07:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 02:07:15 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 02:07:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH] ASoC: atmel_ssc_dai: remove #ifdef CONFIG_PM
Date: Fri, 15 Jul 2022 12:09:39 +0300
Message-ID: <20220715090939.1679963-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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

Remove #ifdef CONFIG_PM and use pm_ptr() instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/atmel_ssc_dai.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 8aae0beadcfe..e868b7e028d6 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -762,7 +762,6 @@ static int atmel_ssc_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int atmel_ssc_suspend(struct snd_soc_component *component)
 {
 	struct atmel_ssc_info *ssc_p;
@@ -821,10 +820,6 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 
 	return 0;
 }
-#else /* CONFIG_PM */
-#  define atmel_ssc_suspend	NULL
-#  define atmel_ssc_resume	NULL
-#endif /* CONFIG_PM */
 
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
 			  SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
@@ -859,8 +854,8 @@ static struct snd_soc_dai_driver atmel_ssc_dai = {
 
 static const struct snd_soc_component_driver atmel_ssc_component = {
 	.name			= "atmel-ssc",
-	.suspend		= atmel_ssc_suspend,
-	.resume			= atmel_ssc_resume,
+	.suspend		= pm_ptr(atmel_ssc_suspend),
+	.resume			= pm_ptr(atmel_ssc_resume),
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.34.1

