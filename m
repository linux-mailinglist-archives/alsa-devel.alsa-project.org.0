Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC51FD301
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A9E165E;
	Wed, 17 Jun 2020 18:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A9E165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592413195;
	bh=08vleDmGKitimHUfeJEA0yenOeoXiDoIOL1bJ1otk5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkQ/UI/abmBs3necMijI9u7E6G21YHloFJeYoAblq8krRQeZTRMoVfbkfX4pILHyu
	 gqxoLiVsPytnsvXdI4UlhrcIt/Rpuf9Cf3o0x5tlhJg7m6BLB5AcvupyOngjYxeGSn
	 BXgQ8sCnnd7e/vH7gn35BSNBqeLLD0WQY1aLZnYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FA3F802A7;
	Wed, 17 Jun 2020 18:56:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 441EBF8028F; Wed, 17 Jun 2020 18:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46B2EF80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B2EF80116
IronPort-SDR: 2Jc02iXalaSzKCFTB7DB5jA43z2Bd53rBlS8T0U17w71/MpWB2Qosj+YV3wvfjVNhB2kDEtYbU
 YDP4pc79XGgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:56:24 -0700
IronPort-SDR: qXzYVUJAy6/N517PmHE5GrF9A1VB227t44oDZFCeWO7QT3/d09EdTg6NY5Ze1x+sdKFYiv9HMe
 vDSPu+E+D/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="277339146"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by orsmga006.jf.intel.com with ESMTP; 17 Jun 2020 09:56:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND 3/3] ASoC: Intel: broadwell: simplify card names for
 SOF uses
Date: Wed, 17 Jun 2020 11:56:16 -0500
Message-Id: <20200617165616.18511-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617165616.18511-1-pierre-louis.bossart@linux.intel.com>
References: <20200617165616.18511-1-pierre-louis.bossart@linux.intel.com>
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

Simplify to use "sof-bdw <codec_name>" pattern for all Broadwell
machine drivers. The sof- prefix is added by the core. A generic "SOF"
driver name is used, and UCMv2 will detect the configuration for this
driver by testing the card name.

Legacy uses are unmodified.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c | 12 +++++++++++-
 sound/soc/intel/boards/bdw-rt5677.c | 12 +++++++++++-
 sound/soc/intel/boards/broadwell.c  | 12 +++++++++++-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index a97e912adf4b..482d501b2f43 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -297,9 +297,19 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 	},
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bdw rt5650" /* card name will be 'sof-bdw rt5650' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bdw-rt5650"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* ASoC machine driver for Broadwell DSP + RT5650 */
 static struct snd_soc_card bdw_rt5650_card = {
-	.name = "bdw-rt5650",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = bdw_rt5650_dais,
 	.num_links = ARRAY_SIZE(bdw_rt5650_dais),
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 5f96d7ac0a22..34a3abb5991f 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -404,9 +404,19 @@ static int bdw_rt5677_resume_post(struct snd_soc_card *card)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bdw rt5677" /* card name will be 'sof-bdw rt5677' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "bdw-rt5677"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* ASoC machine driver for Broadwell DSP + RT5677 */
 static struct snd_soc_card bdw_rt5677_card = {
-	.name = "bdw-rt5677",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = bdw_rt5677_dais,
 	.num_links = ARRAY_SIZE(bdw_rt5677_dais),
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 42f8723beef2..c8fd4f7b1c0a 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -291,9 +291,19 @@ static int broadwell_resume(struct snd_soc_card *card){
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+/* use space before codec name to simplify card ID, and simplify driver name */
+#define CARD_NAME "bdw rt286" /* card name will be 'sof-bdw rt286' */
+#define DRIVER_NAME "SOF"
+#else
+#define CARD_NAME "broadwell-rt286"
+#define DRIVER_NAME NULL /* card name will be used for driver name */
+#endif
+
 /* broadwell audio machine driver for WPT + RT286S */
 static struct snd_soc_card broadwell_rt286 = {
-	.name = "broadwell-rt286",
+	.name = CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = broadwell_rt286_dais,
 	.num_links = ARRAY_SIZE(broadwell_rt286_dais),
-- 
2.20.1

