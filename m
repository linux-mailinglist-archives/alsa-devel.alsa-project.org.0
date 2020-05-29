Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166591E7EAA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B375B17CA;
	Fri, 29 May 2020 15:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B375B17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590758919;
	bh=exhVZOE+SYCE0xBhYCetbWSJRiYqreY3mZj5Q65i3OM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ci1ILGI3fpwFYAPUUIg2A3S8TxF2/SgjGovX0RqdTgCsxWWPOB0GYQ0c1AC5n+EjT
	 ffJ4CX/fBljXe9D4rgim5JVdRMkkXCfcl6VuH4hehWCYev2f2oZgJ1BDikLzRVj1Fv
	 GeMd1oPckAC0qEFBygS8ixCPT3zaDMlekv0OkAE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EEDF80273;
	Fri, 29 May 2020 15:26:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A4CF80273; Fri, 29 May 2020 15:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B038F800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B038F800FF
IronPort-SDR: HHaSr44u8arpAtOj30aETuNUUlukJ6a1xq9sp5CmfqPSYRB3aaNYaZyrwtALQJuR4fOZpWwxPI
 uCHG9EaoGYow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 06:25:57 -0700
IronPort-SDR: cFLmAhYExhfL5rL7428mNZGwnoNgwDC5pTM5wbCQD3UAL83xIfHgEd6L0p7YYfMK3STEM/kCAc
 oZedGd9I/zGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="311240281"
Received: from bbaum-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.67.71])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 06:25:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: byt*: simplify card names for SOF uses
Date: Fri, 29 May 2020 08:25:42 -0500
Message-Id: <20200529132544.17449-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529132544.17449-1-pierre-louis.bossart@linux.intel.com>
References: <20200529132544.17449-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Blindly adding an sof- prefix to the card name is not user friendly
and causes UCM issues with a driver name truncated to 16 characters.

Simplify to use "sof-bytcht <codec_name>" pattern for all byt* machine
drivers. The sof- prefix is added by the core. A generic "SOF" driver
name is used, and UCMv2 will detect the configuration for this driver
by testing the card name.

Legacy uses are unmodified.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_da7213.c  | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_es8316.c  | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5640.c   | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5651.c   | 12 +++++++++++-
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index fad937610494..9cb42ba40c07 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -205,9 +205,19 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht cx2072x" /* card name will be 'sof-bytcht cx2072x' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bytcht-cx2072x"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card byt_cht_cx2072x_card = {
-	.name = "bytcht-cx2072x",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_cht_cx2072x_dais,
 	.num_links = ARRAY_SIZE(byt_cht_cx2072x_dais),
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index f3791ff2bad1..17bb4ca34672 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -205,9 +205,19 @@ static struct snd_soc_dai_link dailink[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht da7213" /* card name will be 'sof-bytcht da7213' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bytcht-da7213"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card bytcht_da7213_card = {
-	.name = "bytcht-da7213",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = dailink,
 	.num_links = ARRAY_SIZE(dailink),
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 9e5fc9430628..98e47a5d3a65 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -407,8 +407,18 @@ static int byt_cht_es8316_resume(struct snd_soc_card *card)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht es8316" /* card name will be 'sof-bytcht es8316' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bytcht-es8316"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 static struct snd_soc_card byt_cht_es8316_card = {
-	.name = "bytcht-es8316",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_cht_es8316_dais,
 	.num_links = ARRAY_SIZE(byt_cht_es8316_dais),
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 30f70bbdf89c..225f062ef40b 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1115,8 +1115,18 @@ static int byt_rt5640_resume(struct snd_soc_card *card)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht rt5640" /* card name will be 'sof-bytcht rt5640' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bytcr-rt5640"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 static struct snd_soc_card byt_rt5640_card = {
-	.name = "bytcr-rt5640",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_rt5640_dais,
 	.num_links = ARRAY_SIZE(byt_rt5640_dais),
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 520e916e329c..3e5cd3a87c3d 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -827,8 +827,18 @@ static int byt_rt5651_resume(struct snd_soc_card *card)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht rt5651" /* card name will be 'sof-bytcht rt5651' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bytcr-rt5651"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 static struct snd_soc_card byt_rt5651_card = {
-	.name = "bytcr-rt5651",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_rt5651_dais,
 	.num_links = ARRAY_SIZE(byt_rt5651_dais),
-- 
2.20.1

