Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C737FD72D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:54:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A085DEB;
	Wed, 29 Nov 2023 13:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A085DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262452;
	bh=L9bbJWoQMIIHaeUsfS4fLqEci5gtCPfK3LJW90mngWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JNxv3zmqh6vuJlt9CutlRNpLngHVecc3LdpAmEBiIaZPsMphi1Yd5ky48Rh16uzSY
	 uE0Enq6aDc7cYrXkuGaNqZ1Dm6t1U04+YKOqGfDK2wFhT54OXS9WtbCMuPQy9vTFeQ
	 6g/+b4lTbsM1lk27ZhvRmO577rMCbz8yQ0chnZ9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF225F805E7; Wed, 29 Nov 2023 13:53:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 997E1F805E9;
	Wed, 29 Nov 2023 13:53:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5EFF8057F; Wed, 29 Nov 2023 13:53:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EB9CF8016E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB9CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ahg5/zBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262379; x=1732798379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L9bbJWoQMIIHaeUsfS4fLqEci5gtCPfK3LJW90mngWs=;
  b=Ahg5/zBDIOyujqlTk36bJ6ddvTUl7arTwfL6mzv06sEW5GTxpSE+VCx7
   LeahG1H7LXIbU4XP7Ybc6dxJ6vfpChyo+DdciMPbJh4LgT0Csvs8UJGAG
   W8QrXyXYNQdnpI8R0GEJ5KYR6u2vVNHBn+WyDAT+gMGrBHo+B234aAkto
   dtxfeQAyUsWv0ADtSDf7FfExnClwHd04svyMp48/1pCAJg3p3ldhnUkiC
   Tw/I0ljjvHAeMmg3n1ZdPWc2C22eYUcAtmzYOQzM97V5w9Pruef8Ay/NA
   XseakieR5mpq9yZ5v2uGJtS46O4I30Csheeak10+zXecg1WLDecWDhKBO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022874"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174592"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:54 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 01/13] ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c
 from sof-audio.c
Date: Wed, 29 Nov 2023 14:53:15 +0200
Message-ID: <20231129125327.23708-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I5HAV7OQP6CV4IRKLNWA3R54AV4XLTFB
X-Message-ID-Hash: I5HAV7OQP6CV4IRKLNWA3R54AV4XLTFB
X-MailFrom: peter.ujfalusi@linux.intel.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the sof_of_machine_select() function to sof-of-dev.c file and provide
an inline stub in case of non OF builds.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c  | 22 ----------------------
 sound/soc/sof/sof-of-dev.c | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h |  9 +++++++++
 3 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 77cc64ac7113..4972a66c6007 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1007,28 +1007,6 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
-static struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pdata *sof_pdata = sdev->pdata;
-	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_sof_of_mach *mach = desc->of_machines;
-
-	if (!mach)
-		return NULL;
-
-	for (; mach->compatible; mach++) {
-		if (of_machine_is_compatible(mach->compatible)) {
-			sof_pdata->tplg_filename = mach->sof_tplg_filename;
-			if (mach->fw_filename)
-				sof_pdata->fw_filename = mach->fw_filename;
-
-			return mach;
-		}
-	}
-
-	return NULL;
-}
-
 /*
  * SOF Driver enumeration.
  */
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index c6be8a91e74b..432b511bf8c4 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -41,6 +41,29 @@ static void sof_of_probe_complete(struct device *dev)
 	pm_runtime_enable(dev);
 }
 
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(sof_of_machine_select);
+
 int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index b6cc70595f3b..547e358a37e3 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -16,6 +16,15 @@ struct snd_sof_of_mach {
 	const char *sof_tplg_filename;
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_OF_DEV)
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev);
+#else
+static inline struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	return NULL;
+}
+#endif
+
 extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
-- 
2.43.0

