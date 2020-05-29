Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B821E7EB4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C70017B4;
	Fri, 29 May 2020 15:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C70017B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590758977;
	bh=nTWKLXePxuFQCT04f+nUMkXEFZW8IInEpurq6mBb21Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcokRLKMNa9PK2gZEUS3/0384RYGXmYU6G0hKMaGSMmNVI1T1ASjT5xAhztMzebn+
	 XKpA/N8nxyEkh0yUYL22tKmeYOdf6x0hCwoLIDMIMtbPSOhkWzm7NccAHaRg/u8VbX
	 NyDusJtVcq8w9gzuWEWQXrDXWXGHbTWMIh/lPbsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F54F802A1;
	Fri, 29 May 2020 15:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4E8BF802A0; Fri, 29 May 2020 15:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F60EF8014E
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F60EF8014E
IronPort-SDR: pMpFAam1PHIyo4n2Mm8LebKjGTrsj0b9Qd/x5GtOJnNBC9uzOG141WskIDWw2WWNH6t4QeRE+j
 yy6CS2gRRA1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 06:25:58 -0700
IronPort-SDR: 01IN8b3XjTe2ez0J4K9jikvYoYsSfnaBjl+4THn6VG2AgePtmWCATG/wSBXuZhNVdvLdCxJsHf
 Ft0rmiqNaN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="311240283"
Received: from bbaum-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.67.71])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 06:25:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: cht*: simplify card names for SOF uses
Date: Fri, 29 May 2020 08:25:43 -0500
Message-Id: <20200529132544.17449-3-pierre-louis.bossart@linux.intel.com>
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

Simplify to use "sof-bytcht <codec_name>" pattern for all cht* machine
drivers. The sof- prefix is added by the core. A generic "SOF" driver
name is used, and UCMv2 will detect the configuration for this driver
by testing the card name.

Legacy uses are unmodified.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 17 +++++++++++++++--
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 12 +++++++++++-
 4 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 767ac2ae03e2..3b0a8aad7ad5 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -382,9 +382,19 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht max98090" /* card name will be 'sof-bytcht max98090 */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "chtmax98090"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = "chtmax98090",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 2f7c94d335c1..31e9c77ef3d3 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -231,9 +231,19 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht nau8824" /* card name will be 'sof-bytcht nau8824 */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "chtnau8824"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = "chtnau8824",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 22de138ffa33..27379b75674c 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -479,9 +479,21 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_RT5645_NAME "bytcht rt5645" /* card name 'sof-bytcht rt5645' */
+#define CARD_RT5650_NAME "bytcht rt5650" /* card name 'sof-bytcht rt5650' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_RT5645_NAME "chtrt5645"
+#define CARD_RT5650_NAME "chtrt5650"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card snd_soc_card_chtrt5645 = {
-	.name = "chtrt5645",
+	.name = CARD_RT5645_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -494,7 +506,8 @@ static struct snd_soc_card snd_soc_card_chtrt5645 = {
 };
 
 static struct snd_soc_card snd_soc_card_chtrt5650 = {
-	.name = "chtrt5650",
+	.name = CARD_RT5650_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 7a43c70a1378..73ef709bdb48 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -379,9 +379,19 @@ static int cht_resume_post(struct snd_soc_card *card)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bytcht rt5672" /* card name will be 'sof-bytcht rt5672' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "cht-bsw-rt5672"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = "cht-bsw-rt5672",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
-- 
2.20.1

